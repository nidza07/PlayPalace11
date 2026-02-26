"""Extract manual text artifacts from board-linked Monopoly PDF manuals."""

from __future__ import annotations

import argparse
import hashlib
import io
import json
from pathlib import Path
import sys
from typing import Any
from urllib.request import Request, urlopen


# Allow direct script execution: python server/scripts/monopoly/extract_manual_text.py
if __package__ is None or __package__ == "":
    sys.path.insert(0, str(Path(__file__).resolve().parents[3]))

try:
    from pypdf import PdfReader
    import pypdf.filters as pypdf_filters
except ModuleNotFoundError as error:  # pragma: no cover - runtime dependency guard
    raise SystemExit(
        "Missing optional dependency 'pypdf'. Install with: "
        "./.venv/bin/python -m pip install pypdf"
    ) from error


def _stable_dump(path: Path, data: Any) -> None:
    tmp_path = path.with_suffix(path.suffix + ".tmp")
    tmp_path.write_text(
        json.dumps(data, indent=2, sort_keys=True, ensure_ascii=False),
        encoding="utf-8",
    )
    tmp_path.replace(path)


def _fetch_pdf_bytes(url: str, timeout: float) -> bytes:
    request = Request(
        url,
        headers={"User-Agent": "PlayPalace-Monopoly-ManualExtract/1.0"},
    )
    with urlopen(request, timeout=timeout) as response:
        return response.read()


def _extract_pages(pdf_bytes: bytes) -> list[str]:
    reader = PdfReader(io.BytesIO(pdf_bytes))
    pages: list[str] = []
    for page in reader.pages:
        text = page.extract_text() or ""
        pages.append(text.strip())
    return pages


def _load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def _select_targets(
    anchor_rows: list[dict[str, Any]],
    families: set[str],
    board_ids: set[str],
) -> list[dict[str, Any]]:
    selected: list[dict[str, Any]] = []
    for row in anchor_rows:
        board_id = str(row.get("board_id", ""))
        family = str(row.get("family", ""))
        if board_ids and board_id in board_ids:
            selected.append(row)
            continue
        if families and family in families:
            selected.append(row)
    selected.sort(key=lambda row: str(row.get("board_id", "")))
    return selected


def run_extraction(
    *,
    families: set[str],
    board_ids: set[str],
    anchor_index_path: Path,
    manual_rules_dir: Path,
    output_dir: Path,
    timeout: float,
    zlib_max_output_length: int,
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    # Some modern instruction PDFs use large compressed streams.
    # Inputs are trusted official manual URLs resolved from catalog metadata.
    pypdf_filters.ZLIB_MAX_OUTPUT_LENGTH = zlib_max_output_length
    anchor_rows = _load_json(anchor_index_path)
    targets = _select_targets(anchor_rows, families=families, board_ids=board_ids)
    if not targets:
        raise SystemExit("No matching boards selected.")

    manifest_rows: list[dict[str, Any]] = []
    for row in targets:
        board_id = str(row["board_id"])
        family = str(row.get("family", ""))
        anchor_edition_id = str(row.get("anchor_edition_id", ""))
        rule_path = manual_rules_dir / f"{board_id}.json"
        if not rule_path.exists():
            manifest_rows.append(
                {
                    "board_id": board_id,
                    "family": family,
                    "anchor_edition_id": anchor_edition_id,
                    "status": "missing_manual_rule_file",
                }
            )
            continue

        rule_payload = _load_json(rule_path)
        manual_source = (
            rule_payload.get("mechanics", {}).get("manual_source", {})
            if isinstance(rule_payload.get("mechanics"), dict)
            else {}
        )
        pdf_url = str(manual_source.get("pdf_url", "")).strip()
        if not pdf_url:
            manifest_rows.append(
                {
                    "board_id": board_id,
                    "family": family,
                    "anchor_edition_id": anchor_edition_id,
                    "status": "missing_pdf_url",
                }
            )
            continue

        try:
            pdf_bytes = _fetch_pdf_bytes(pdf_url, timeout=timeout)
            pages = _extract_pages(pdf_bytes)
        except Exception as error:  # pragma: no cover - network/runtime failure path
            print(f"[fail] {board_id}: {error}")
            manifest_rows.append(
                {
                    "board_id": board_id,
                    "family": family,
                    "anchor_edition_id": anchor_edition_id,
                    "pdf_url": pdf_url,
                    "status": "failed",
                    "error": str(error),
                }
            )
            continue

        text_path = output_dir / f"{board_id}.txt"
        text_chunks: list[str] = []
        for idx, text in enumerate(pages, start=1):
            text_chunks.append(f"=== Page {idx} ===\n{text}\n")
        full_text = "\n".join(text_chunks).strip() + "\n"
        text_path.write_text(full_text, encoding="utf-8")

        text_sha256 = hashlib.sha256(full_text.encode("utf-8")).hexdigest()
        pdf_sha256 = hashlib.sha256(pdf_bytes).hexdigest()
        text_char_count = len(full_text)
        meta = {
            "board_id": board_id,
            "family": family,
            "anchor_edition_id": anchor_edition_id,
            "status": "ok",
            "pdf_url": pdf_url,
            "instruction_url": manual_source.get("instruction_url"),
            "filename": manual_source.get("filename"),
            "pdf_sha256": pdf_sha256,
            "pdf_size_bytes": len(pdf_bytes),
            "page_count": len(pages),
            "text_char_count": text_char_count,
            "text_sha256": text_sha256,
            "text_path": str(text_path),
        }
        _stable_dump(output_dir / f"{board_id}.json", meta)
        manifest_rows.append(meta)
        print(f"[ok] {board_id}: pages={len(pages)} chars={text_char_count}")

    manifest_rows.sort(key=lambda item: str(item.get("board_id", "")))
    _stable_dump(output_dir / "manifest.json", manifest_rows)

    ok_count = sum(1 for row in manifest_rows if row.get("status") == "ok")
    print(
        f"Wrote extraction artifacts for {ok_count}/{len(manifest_rows)} "
        f"selected boards into {output_dir}"
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract text from Monopoly board manual PDFs into local artifacts."
    )
    parser.add_argument(
        "--family",
        action="append",
        default=[],
        help="Family id from special_board_anchor_index.json (repeatable).",
    )
    parser.add_argument(
        "--board-id",
        action="append",
        default=[],
        help="Explicit board id (repeatable).",
    )
    parser.add_argument(
        "--anchor-index",
        type=Path,
        default=Path("server/games/monopoly/catalog/special_board_anchor_index.json"),
        help="Path to special board anchor index JSON.",
    )
    parser.add_argument(
        "--manual-rules-dir",
        type=Path,
        default=Path("server/games/monopoly/manual_rules/data"),
        help="Directory containing board manual rule JSON files.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path("server/games/monopoly/manual_rules/extracted"),
        help="Directory where extracted text/metadata artifacts are written.",
    )
    parser.add_argument(
        "--timeout",
        type=float,
        default=45.0,
        help="Download timeout in seconds for each manual PDF.",
    )
    parser.add_argument(
        "--zlib-max-output-length",
        type=int,
        default=120_000_000,
        help=(
            "pypdf decompression output limit for trusted large manual PDFs "
            "(0 disables limit)."
        ),
    )
    args = parser.parse_args()

    families = {value.strip() for value in args.family if value.strip()}
    board_ids = {value.strip() for value in args.board_id if value.strip()}
    if not families and not board_ids:
        raise SystemExit("Provide at least one --family or --board-id selection.")

    run_extraction(
        families=families,
        board_ids=board_ids,
        anchor_index_path=args.anchor_index,
        manual_rules_dir=args.manual_rules_dir,
        output_dir=args.output_dir,
        timeout=args.timeout,
        zlib_max_output_length=args.zlib_max_output_length,
    )


if __name__ == "__main__":
    main()
