"""Tests for the DocumentManager class."""

from __future__ import annotations

import json
import time
import zipfile

import pytest

from server.core.documents.manager import (
    DocumentManager,
    SCOPE_INDEPENDENT,
    SCOPE_SHARED,
)


@pytest.fixture
def docs_dir(tmp_path):
    """Return a clean temporary documents directory."""
    d = tmp_path / "documents"
    d.mkdir()
    return d


@pytest.fixture
def manager(docs_dir):
    return DocumentManager(docs_dir)


# ------------------------------------------------------------------
# Helper to create documents in shared/ or independent/
# ------------------------------------------------------------------


def _create_doc_on_disk(
    docs_dir,
    folder_name,
    content="Hello",
    locale="en",
    scope="shared",
    categories=None,
    meta_override=None,
):
    """Create a document directly on disk in the given scope directory."""
    scope_dir = docs_dir / scope
    scope_dir.mkdir(exist_ok=True)
    doc_dir = scope_dir / folder_name
    doc_dir.mkdir(parents=True, exist_ok=True)
    (doc_dir / f"{locale}.md").write_text(content, encoding="utf-8")

    if meta_override:
        meta = meta_override
    else:
        meta = {
            "categories": categories or [],
            "source_locale": locale,
            "titles": {locale: folder_name.replace("_", " ").title()},
            "locales": {
                locale: {
                    "created": "2026-01-01T00:00:00Z",
                    "modified_contents": "2026-01-01T00:00:00Z",
                    "public": True,
                }
            },
        }
    with open(doc_dir / "_metadata.json", "w", encoding="utf-8") as f:
        json.dump(meta, f)
    return doc_dir


# ------------------------------------------------------------------
# load()
# ------------------------------------------------------------------


class TestLoad:
    def test_load_empty_directory(self, manager, docs_dir):
        count = manager.load()
        assert count == 0
        # Root _metadata.json should be created
        assert (docs_dir / "_metadata.json").exists()
        # Subdirectories should be created
        assert (docs_dir / "shared").is_dir()
        assert (docs_dir / "independent").is_dir()
        assert (docs_dir / "_pending").is_dir()

    def test_load_creates_root_metadata_if_missing(self, manager, docs_dir):
        assert not (docs_dir / "_metadata.json").exists()
        manager.load()
        with open(docs_dir / "_metadata.json", encoding="utf-8") as f:
            data = json.load(f)
        assert data == {"categories": {}}

    def test_load_with_existing_root_metadata(self, manager, docs_dir):
        root_meta = {
            "categories": {"rules": {"sort": "alphabetical", "name": {"en": "Game Rules"}}}
        }
        with open(docs_dir / "_metadata.json", "w", encoding="utf-8") as f:
            json.dump(root_meta, f)

        manager.load()
        cats = manager.get_categories("en")
        assert len(cats) == 1
        assert cats[0]["slug"] == "rules"
        assert cats[0]["name"] == "Game Rules"

    def test_load_shared_documents(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "my_doc", scope="shared")
        count = manager.load()
        assert count == 1
        assert manager.get_document_scope("my_doc") == SCOPE_SHARED

    def test_load_independent_documents(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "local_doc", scope="independent")
        count = manager.load()
        assert count == 1
        assert manager.get_document_scope("local_doc") == SCOPE_INDEPENDENT

    def test_load_both_scopes(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "shared_doc", scope="shared")
        _create_doc_on_disk(docs_dir, "local_doc", scope="independent")
        count = manager.load()
        assert count == 2
        assert manager.get_document_scope("shared_doc") == SCOPE_SHARED
        assert manager.get_document_scope("local_doc") == SCOPE_INDEPENDENT

    def test_load_existing_documents_auto_generates_metadata(self, manager, docs_dir):
        shared_dir = docs_dir / "shared"
        shared_dir.mkdir(exist_ok=True)
        doc_dir = shared_dir / "my_doc"
        doc_dir.mkdir()
        (doc_dir / "en.md").write_text("Hello", encoding="utf-8")

        count = manager.load()
        assert count == 1
        assert (doc_dir / "_metadata.json").exists()
        with open(doc_dir / "_metadata.json", encoding="utf-8") as f:
            meta = json.load(f)
        assert "en" in meta["locales"]
        assert meta["titles"]["en"] == "My Doc"
        assert meta["source_locale"] == "en"

    def test_load_skips_underscore_dirs(self, manager, docs_dir):
        shared_dir = docs_dir / "shared"
        shared_dir.mkdir(exist_ok=True)
        hidden = shared_dir / "_internal"
        hidden.mkdir()
        (hidden / "en.md").write_text("hidden", encoding="utf-8")

        count = manager.load()
        assert count == 0

    def test_load_multiple_locales_detected(self, manager, docs_dir):
        shared_dir = docs_dir / "shared"
        shared_dir.mkdir(exist_ok=True)
        doc_dir = shared_dir / "multi_lang"
        doc_dir.mkdir()
        (doc_dir / "en.md").write_text("English", encoding="utf-8")
        (doc_dir / "es.md").write_text("Spanish", encoding="utf-8")

        manager.load()
        meta_path = doc_dir / "_metadata.json"
        with open(meta_path, encoding="utf-8") as f:
            meta = json.load(f)
        assert "en" in meta["locales"]
        assert "es" in meta["locales"]


# ------------------------------------------------------------------
# Legacy migration
# ------------------------------------------------------------------


class TestLegacyMigration:
    def test_migrates_flat_documents_to_shared(self, manager, docs_dir):
        """Documents in the root should be moved to shared/."""
        doc_dir = docs_dir / "old_doc"
        doc_dir.mkdir()
        (doc_dir / "en.md").write_text("legacy content", encoding="utf-8")
        meta = {
            "categories": [],
            "source_locale": "en",
            "titles": {"en": "Old Doc"},
            "locales": {
                "en": {
                    "created": "2026-01-01T00:00:00Z",
                    "modified_contents": "2026-01-01T00:00:00Z",
                    "public": True,
                }
            },
        }
        with open(doc_dir / "_metadata.json", "w", encoding="utf-8") as f:
            json.dump(meta, f)

        count = manager.load()
        assert count == 1
        # Should now be in shared/
        assert not (docs_dir / "old_doc").exists()
        assert (docs_dir / "shared" / "old_doc" / "en.md").exists()
        assert manager.get_document_scope("old_doc") == SCOPE_SHARED

    def test_migration_skips_existing_in_shared(self, manager, docs_dir):
        """If a doc already exists in shared/, don't overwrite it."""
        # Create in root (legacy)
        doc_dir = docs_dir / "conflict_doc"
        doc_dir.mkdir()
        (doc_dir / "en.md").write_text("legacy", encoding="utf-8")

        # Also in shared/
        shared_dir = docs_dir / "shared"
        shared_dir.mkdir(exist_ok=True)
        shared_doc = shared_dir / "conflict_doc"
        shared_doc.mkdir()
        (shared_doc / "en.md").write_text("canonical", encoding="utf-8")

        manager.load()
        # shared/ version should be untouched
        assert (shared_doc / "en.md").read_text(encoding="utf-8") == "canonical"


# ------------------------------------------------------------------
# get_categories
# ------------------------------------------------------------------


class TestGetCategories:
    def test_locale_fallback_to_english(self, manager, docs_dir):
        root_meta = {
            "categories": {
                "news": {
                    "sort": "alphabetical",
                    "name": {"en": "News", "es": "Noticias"},
                }
            }
        }
        with open(docs_dir / "_metadata.json", "w", encoding="utf-8") as f:
            json.dump(root_meta, f)
        manager.load()

        cats_fr = manager.get_categories("fr")
        assert cats_fr[0]["name"] == "News"  # falls back to en

        cats_es = manager.get_categories("es")
        assert cats_es[0]["name"] == "Noticias"

    def test_fallback_to_slug(self, manager, docs_dir):
        root_meta = {"categories": {"misc": {"sort": "alphabetical", "name": {}}}}
        with open(docs_dir / "_metadata.json", "w", encoding="utf-8") as f:
            json.dump(root_meta, f)
        manager.load()

        cats = manager.get_categories("en")
        assert cats[0]["name"] == "misc"


# ------------------------------------------------------------------
# get_documents_in_category
# ------------------------------------------------------------------


class TestGetDocumentsInCategory:
    def _setup_docs(self, docs_dir):
        """Create two docs, one categorized and one not."""
        root_meta = {"categories": {"rules": {"sort": "alphabetical", "name": {"en": "Rules"}}}}
        with open(docs_dir / "_metadata.json", "w", encoding="utf-8") as f:
            json.dump(root_meta, f)

        _create_doc_on_disk(docs_dir, "doc_a", categories=["rules"])
        _create_doc_on_disk(docs_dir, "doc_b", categories=[])

    def test_filter_by_category(self, manager, docs_dir):
        self._setup_docs(docs_dir)
        manager.load()
        docs = manager.get_documents_in_category("rules", "en")
        assert len(docs) == 1
        assert docs[0]["folder_name"] == "doc_a"

    def test_uncategorized(self, manager, docs_dir):
        self._setup_docs(docs_dir)
        manager.load()
        docs = manager.get_documents_in_category("", "en")
        assert len(docs) == 1
        assert docs[0]["folder_name"] == "doc_b"

    def test_all_documents(self, manager, docs_dir):
        self._setup_docs(docs_dir)
        manager.load()
        docs = manager.get_documents_in_category(None, "en")
        assert len(docs) == 2

    def test_mixed_scopes_all_visible(self, manager, docs_dir):
        """Both shared and independent docs should appear in listings."""
        _create_doc_on_disk(docs_dir, "shared_doc", scope="shared")
        _create_doc_on_disk(docs_dir, "indie_doc", scope="independent")
        manager.load()
        docs = manager.get_documents_in_category(None, "en")
        names = {d["folder_name"] for d in docs}
        assert names == {"shared_doc", "indie_doc"}


# ------------------------------------------------------------------
# get_document_content
# ------------------------------------------------------------------


class TestGetDocumentContent:
    def test_reads_md_on_demand(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "hello", content="# Hello World")
        manager.load()

        content = manager.get_document_content("hello", "en")
        assert content == "# Hello World"

    def test_returns_none_for_missing_locale(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "hello", content="hi")
        manager.load()

        assert manager.get_document_content("hello", "fr") is None

    def test_returns_none_for_missing_document(self, manager):
        manager.load()
        assert manager.get_document_content("nonexistent", "en") is None


# ------------------------------------------------------------------
# get_document_scope
# ------------------------------------------------------------------


class TestGetDocumentScope:
    def test_shared_scope(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "s_doc", scope="shared")
        manager.load()
        assert manager.get_document_scope("s_doc") == SCOPE_SHARED

    def test_independent_scope(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "i_doc", scope="independent")
        manager.load()
        assert manager.get_document_scope("i_doc") == SCOPE_INDEPENDENT

    def test_unknown_document_returns_none(self, manager):
        manager.load()
        assert manager.get_document_scope("nope") is None


# ------------------------------------------------------------------
# save_document_content
# ------------------------------------------------------------------


class TestSaveDocumentContent:
    def test_writes_file_and_updates_timestamp(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "editable", content="original")
        manager.load()

        original_ts = manager._documents["editable"]["locales"]["en"]["modified_contents"]
        result = manager.save_document_content("editable", "en", "updated", "alice")
        assert result is True
        assert (docs_dir / "shared" / "editable" / "en.md").read_text(encoding="utf-8") == "updated"
        new_ts = manager._documents["editable"]["locales"]["en"]["modified_contents"]
        assert new_ts != original_ts

    def test_creates_new_locale_entry_on_save(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "editable", content="english")
        manager.load()

        result = manager.save_document_content("editable", "fr", "français", "bob")
        assert result is True
        assert "fr" in manager._documents["editable"]["locales"]

    def test_returns_false_for_unknown_document(self, manager):
        manager.load()
        assert manager.save_document_content("nope", "en", "x", "alice") is False

    def test_shared_edit_records_pending_change(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "shared_doc", scope="shared")
        manager.load()

        manager.save_document_content("shared_doc", "en", "updated content", "alice")
        pending = manager.get_pending_changes()
        assert len(pending) == 1
        assert pending[0]["folder_name"] == "shared_doc"
        assert pending[0]["editor"] == "alice"
        assert pending[0]["change_type"] == "edit"

    def test_independent_edit_does_not_record_pending(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "indie_doc", scope="independent")
        manager.load()

        manager.save_document_content("indie_doc", "en", "updated", "bob")
        assert manager.get_pending_change_count() == 0


# ------------------------------------------------------------------
# Version history
# ------------------------------------------------------------------


class TestVersionHistory:
    def test_backup_created_on_save(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "versioned", content="v1")
        manager.load()

        manager.save_document_content("versioned", "en", "v2", "alice")
        history = list((docs_dir / "shared" / "versioned" / "_history").glob("en_*.md"))
        assert len(history) == 1
        assert history[0].read_text(encoding="utf-8") == "v1"

    def test_version_cap_enforced(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "capped", content="v0")
        manager.load()

        # Pre-create 6 backup files to test the cap without timestamp collisions
        history_dir = docs_dir / "shared" / "capped" / "_history"
        history_dir.mkdir()
        for i in range(6):
            (history_dir / f"en_20260101T0000{i:02d}Z.md").write_text(f"old_v{i}", encoding="utf-8")
        assert len(list(history_dir.glob("en_*.md"))) == 6

        # One more save triggers backup + prune
        manager.save_document_content("capped", "en", "v_new", "alice")

        history = list(history_dir.glob("en_*.md"))
        assert len(history) == 5  # cap


# ------------------------------------------------------------------
# Edit locks
# ------------------------------------------------------------------


class TestEditLocks:
    def test_acquire_and_release(self, manager):
        manager.load()
        result = manager.acquire_edit_lock("doc", "en", "alice")
        assert result is None  # success
        manager.release_edit_lock("doc", "en", "alice")

    def test_conflict_detection(self, manager):
        manager.load()
        manager.acquire_edit_lock("doc", "en", "alice")
        result = manager.acquire_edit_lock("doc", "en", "bob")
        assert result == "alice"

    def test_same_user_reacquires(self, manager):
        manager.load()
        manager.acquire_edit_lock("doc", "en", "alice")
        result = manager.acquire_edit_lock("doc", "en", "alice")
        assert result is None

    def test_stale_lock_cleanup(self, manager):
        manager.load()
        manager.acquire_edit_lock("doc", "en", "alice")
        # Manually age the lock
        manager._edit_locks[("doc", "en")]["timestamp"] = time.time() - 3600

        manager.cleanup_stale_locks(timeout_seconds=1800)
        # Lock should be cleaned up, so bob can acquire
        result = manager.acquire_edit_lock("doc", "en", "bob")
        assert result is None

    def test_save_releases_lock(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "locked", content="text")
        manager.load()

        manager.acquire_edit_lock("locked", "en", "alice")
        manager.save_document_content("locked", "en", "new text", "alice")
        # Lock should be released
        assert ("locked", "en") not in manager._edit_locks


# ------------------------------------------------------------------
# create_document / create_category
# ------------------------------------------------------------------


class TestCreateOperations:
    def test_create_document_defaults_to_independent(self, manager, docs_dir):
        manager.load()
        result = manager.create_document("new_doc", ["rules"], "en", "New Doc", "# New")
        assert result is True
        assert (docs_dir / "independent" / "new_doc" / "en.md").exists()
        assert (docs_dir / "independent" / "new_doc" / "_metadata.json").exists()
        assert manager.get_document_content("new_doc", "en") == "# New"
        assert manager.get_document_scope("new_doc") == SCOPE_INDEPENDENT

    def test_create_document_shared(self, manager, docs_dir):
        manager.load()
        result = manager.create_document(
            "shared_new",
            [],
            "en",
            "Shared",
            "content",
            scope=SCOPE_SHARED,
        )
        assert result is True
        assert (docs_dir / "shared" / "shared_new" / "en.md").exists()
        assert manager.get_document_scope("shared_new") == SCOPE_SHARED

    def test_create_duplicate_document_fails(self, manager, docs_dir):
        manager.load()
        manager.create_document("dup", [], "en", "Dup", "content")
        result = manager.create_document("dup", [], "en", "Dup", "content2")
        assert result is False

    def test_create_category(self, manager, docs_dir):
        manager.load()
        result = manager.create_category("faq", "FAQ", "en")
        assert result is True
        cats = manager.get_categories("en")
        assert any(c["slug"] == "faq" for c in cats)

    def test_create_duplicate_category_fails(self, manager, docs_dir):
        manager.load()
        manager.create_category("faq", "FAQ", "en")
        result = manager.create_category("faq", "FAQ 2", "en")
        assert result is False


# ------------------------------------------------------------------
# slugify
# ------------------------------------------------------------------


class TestSlugify:
    def test_basic_title(self):
        assert DocumentManager.slugify("Uno Rules") == "uno_rules"

    def test_special_characters(self):
        assert DocumentManager.slugify("FAQ & Tips!") == "faq_tips"

    def test_hyphens_become_underscores(self):
        assert DocumentManager.slugify("how-to-play") == "how_to_play"

    def test_multiple_spaces_collapse(self):
        assert DocumentManager.slugify("Game   Rules   2") == "game_rules_2"

    def test_leading_trailing_stripped(self):
        assert DocumentManager.slugify("  Hello World  ") == "hello_world"

    def test_empty_string(self):
        assert DocumentManager.slugify("") == ""

    def test_only_special_chars(self):
        assert DocumentManager.slugify("!!!") == ""

    def test_unicode_stripped(self):
        assert DocumentManager.slugify("Café Rules") == "cafe_rules"

    def test_numbers_preserved(self):
        assert DocumentManager.slugify("Chapter 3") == "chapter_3"


# ------------------------------------------------------------------
# delete_category
# ------------------------------------------------------------------


class TestDeleteCategory:
    def test_delete_existing_category(self, manager, docs_dir):
        manager.load()
        manager.create_category("news", "News", "en")
        result = manager.delete_category("news")
        assert result is True
        cats = manager.get_categories("en")
        assert not any(c["slug"] == "news" for c in cats)

    def test_delete_nonexistent_category(self, manager):
        manager.load()
        assert manager.delete_category("nope") is False

    def test_delete_category_removes_from_documents(self, manager, docs_dir):
        manager.load()
        manager.create_category("rules", "Rules", "en")
        manager.create_document("doc1", ["rules"], "en", "Doc", "content")
        manager.delete_category("rules")
        meta = manager.get_document_metadata("doc1")
        assert "rules" not in meta["categories"]

    def test_delete_category_persists(self, manager, docs_dir):
        manager.load()
        manager.create_category("temp", "Temp", "en")
        manager.delete_category("temp")
        # Reload from disk
        manager2 = DocumentManager(docs_dir)
        manager2.load()
        cats = manager2.get_categories("en")
        assert not any(c["slug"] == "temp" for c in cats)


# ------------------------------------------------------------------
# rename_category
# ------------------------------------------------------------------


class TestRenameCategory:
    def test_rename_category(self, manager, docs_dir):
        manager.load()
        manager.create_category("faq", "FAQ", "en")
        result = manager.rename_category("faq", "Frequently Asked Questions", "en")
        assert result is True
        cats = manager.get_categories("en")
        faq = next(c for c in cats if c["slug"] == "faq")
        assert faq["name"] == "Frequently Asked Questions"

    def test_rename_adds_locale(self, manager, docs_dir):
        manager.load()
        manager.create_category("news", "News", "en")
        manager.rename_category("news", "Noticias", "es")
        cats = manager.get_categories("es")
        news = next(c for c in cats if c["slug"] == "news")
        assert news["name"] == "Noticias"

    def test_rename_nonexistent(self, manager):
        manager.load()
        assert manager.rename_category("nope", "Name", "en") is False


# ------------------------------------------------------------------
# set_category_sort / get_category_sort
# ------------------------------------------------------------------


class TestCategorySort:
    def test_default_sort(self, manager, docs_dir):
        manager.load()
        manager.create_category("rules", "Rules", "en")
        assert manager.get_category_sort("rules") == "alphabetical"

    def test_set_sort_method(self, manager, docs_dir):
        manager.load()
        manager.create_category("rules", "Rules", "en")
        result = manager.set_category_sort("rules", "date_modified")
        assert result is True
        assert manager.get_category_sort("rules") == "date_modified"

    def test_set_sort_nonexistent(self, manager):
        manager.load()
        assert manager.set_category_sort("nope", "alphabetical") is False

    def test_get_sort_nonexistent_returns_default(self, manager):
        manager.load()
        assert manager.get_category_sort("nope") == "alphabetical"

    def test_sort_by_date_created(self, manager, docs_dir):
        manager.load()
        manager.create_category("rules", "Rules", "en")
        manager.set_category_sort("rules", "date_created")
        manager.create_document(
            "old_doc",
            ["rules"],
            "en",
            "Old Doc",
            "old",
        )
        # Manually set timestamps to control ordering
        meta = manager.get_document_metadata("old_doc")
        meta["locales"]["en"]["created"] = "2026-01-01T00:00:00Z"
        manager.create_document(
            "new_doc",
            ["rules"],
            "en",
            "New Doc",
            "new",
        )
        meta2 = manager.get_document_metadata("new_doc")
        meta2["locales"]["en"]["created"] = "2026-06-01T00:00:00Z"

        docs = manager.get_documents_in_category("rules", "en")
        # date_created sorts newest first
        assert docs[0]["folder_name"] == "new_doc"
        assert docs[1]["folder_name"] == "old_doc"


# ------------------------------------------------------------------
# Changeset tracking
# ------------------------------------------------------------------


class TestChangesetTracking:
    def test_pending_changes_initially_empty(self, manager):
        manager.load()
        assert manager.get_pending_changes() == []
        assert manager.get_pending_change_count() == 0

    def test_edit_shared_records_change(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "tracked", scope="shared")
        manager.load()

        manager.save_document_content("tracked", "en", "new content", "alice")
        changes = manager.get_pending_changes()
        assert len(changes) == 1
        assert changes[0]["folder_name"] == "tracked"
        assert changes[0]["locale"] == "en"
        assert changes[0]["editor"] == "alice"
        assert changes[0]["change_type"] == "edit"
        assert "timestamp" in changes[0]

    def test_pending_content_copy_exists(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "tracked", scope="shared")
        manager.load()

        manager.save_document_content("tracked", "en", "changed text", "bob")
        pending_file = docs_dir / "_pending" / "changes" / "tracked" / "en.md"
        assert pending_file.exists()
        assert pending_file.read_text(encoding="utf-8") == "changed text"

    def test_multiple_edits_same_file_latest_wins(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "multi_edit", scope="shared")
        manager.load()

        manager.save_document_content("multi_edit", "en", "v1", "alice")
        manager.save_document_content("multi_edit", "en", "v2", "bob")
        changes = manager.get_pending_changes()
        # Only one entry for same folder+locale (latest wins)
        assert len(changes) == 1
        assert changes[0]["editor"] == "bob"

    def test_clear_pending_changes(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "clear_test", scope="shared")
        manager.load()

        manager.save_document_content("clear_test", "en", "changed", "alice")
        assert manager.get_pending_change_count() == 1

        manager.clear_pending_changes()
        assert manager.get_pending_change_count() == 0
        assert not (docs_dir / "_pending" / "changes").exists()

    def test_add_translation_records_pending(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "translatable", scope="shared")
        manager.load()

        manager.add_document_translation("translatable", "fr", "Mon Doc", "contenu")
        changes = manager.get_pending_changes()
        assert len(changes) == 1
        assert changes[0]["change_type"] == "translation_add"
        assert changes[0]["locale"] == "fr"


# ------------------------------------------------------------------
# Export
# ------------------------------------------------------------------


class TestExport:
    def test_export_creates_zip(self, manager, docs_dir, tmp_path):
        _create_doc_on_disk(docs_dir, "exportable", scope="shared")
        manager.load()
        manager.save_document_content("exportable", "en", "exported text", "alice")

        output = tmp_path / "export.zip"
        count = manager.export_pending_changes(output)
        assert count == 1
        assert output.exists()

        with zipfile.ZipFile(output, "r") as zf:
            names = zf.namelist()
            assert "shared/exportable/en.md" in names
            assert "attribution.json" in names

            content = zf.read("shared/exportable/en.md").decode("utf-8")
            assert content == "exported text"

            attr = json.loads(zf.read("attribution.json"))
            assert len(attr["changes"]) == 1
            assert attr["changes"][0]["editor"] == "alice"

    def test_export_empty_returns_zero(self, manager, tmp_path):
        manager.load()
        output = tmp_path / "empty.zip"
        count = manager.export_pending_changes(output)
        assert count == 0
        assert not output.exists()

    def test_export_multiple_changes(self, manager, docs_dir, tmp_path):
        _create_doc_on_disk(docs_dir, "doc_a", scope="shared")
        _create_doc_on_disk(docs_dir, "doc_b", scope="shared")
        manager.load()

        manager.save_document_content("doc_a", "en", "a content", "alice")
        manager.save_document_content("doc_b", "en", "b content", "bob")

        output = tmp_path / "multi.zip"
        count = manager.export_pending_changes(output)
        assert count == 2

        with zipfile.ZipFile(output, "r") as zf:
            assert "shared/doc_a/en.md" in zf.namelist()
            assert "shared/doc_b/en.md" in zf.namelist()


# ------------------------------------------------------------------
# Promote (independent -> shared)
# ------------------------------------------------------------------


class TestPromote:
    def test_promote_independent_to_shared(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "promotable", scope="independent")
        manager.load()
        assert manager.get_document_scope("promotable") == SCOPE_INDEPENDENT

        result = manager.promote_to_shared("promotable")
        assert result is True
        assert manager.get_document_scope("promotable") == SCOPE_SHARED
        assert (docs_dir / "shared" / "promotable" / "en.md").exists()
        assert not (docs_dir / "independent" / "promotable").exists()

    def test_promote_already_shared_fails(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "shared_doc", scope="shared")
        manager.load()
        assert manager.promote_to_shared("shared_doc") is False

    def test_promote_nonexistent_fails(self, manager):
        manager.load()
        assert manager.promote_to_shared("nope") is False

    def test_promote_conflict_fails(self, manager, docs_dir):
        """Cannot promote if a doc with the same name exists in shared."""
        _create_doc_on_disk(docs_dir, "conflict", scope="independent", content="indie")
        _create_doc_on_disk(docs_dir, "conflict", scope="shared", content="shared")
        manager.load()
        # The independent version won't load because shared has the same name,
        # but test the safety check in promote_to_shared directly
        # (Only the first one loaded wins in the dict, but let's test the method)
        # Force both scopes to test the safeguard
        manager._scopes["conflict"] = SCOPE_INDEPENDENT
        result = manager.promote_to_shared("conflict")
        assert result is False  # dest already exists


# ------------------------------------------------------------------
# Based-on tracking
# ------------------------------------------------------------------


class TestBasedOn:
    def test_set_based_on(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "source_doc", scope="shared", content="original")
        _create_doc_on_disk(docs_dir, "derived_doc", scope="independent", content="my version")
        manager.load()

        result = manager.set_based_on("derived_doc", "source_doc", "en")
        assert result is True

        meta = manager.get_document_metadata("derived_doc")
        assert "based_on" in meta
        assert meta["based_on"]["slug"] == "source_doc"
        assert meta["based_on"]["content_hash"] == DocumentManager.content_hash("original")

    def test_based_on_not_stale(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "source", scope="shared", content="original")
        _create_doc_on_disk(docs_dir, "derived", scope="independent")
        manager.load()

        manager.set_based_on("derived", "source", "en")
        assert manager.check_based_on_stale("derived") is False

    def test_based_on_stale_after_source_edit(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "source", scope="shared", content="original")
        _create_doc_on_disk(docs_dir, "derived", scope="independent")
        manager.load()

        manager.set_based_on("derived", "source", "en")
        # Edit the source
        manager.save_document_content("source", "en", "updated content", "admin")
        assert manager.check_based_on_stale("derived") is True

    def test_based_on_no_field_returns_none(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "standalone", scope="independent")
        manager.load()
        assert manager.check_based_on_stale("standalone") is None

    def test_set_based_on_shared_doc_fails(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "source", scope="shared")
        _create_doc_on_disk(docs_dir, "also_shared", scope="shared")
        manager.load()
        # Can only set based_on for independent docs
        # Force scope for testing
        result = manager.set_based_on("also_shared", "source", "en")
        assert result is False

    def test_set_based_on_missing_source_fails(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "derived", scope="independent")
        manager.load()
        result = manager.set_based_on("derived", "nonexistent", "en")
        assert result is False


# ------------------------------------------------------------------
# Delete document
# ------------------------------------------------------------------


class TestDeleteDocument:
    def test_delete_shared_document(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "del_doc", scope="shared")
        manager.load()
        result = manager.delete_document("del_doc")
        assert result is True
        assert not (docs_dir / "shared" / "del_doc").exists()
        assert manager.get_document_metadata("del_doc") is None
        assert manager.get_document_scope("del_doc") is None

    def test_delete_independent_document(self, manager, docs_dir):
        _create_doc_on_disk(docs_dir, "indie_del", scope="independent")
        manager.load()
        result = manager.delete_document("indie_del")
        assert result is True
        assert not (docs_dir / "independent" / "indie_del").exists()

    def test_delete_nonexistent_fails(self, manager):
        manager.load()
        assert manager.delete_document("nope") is False
