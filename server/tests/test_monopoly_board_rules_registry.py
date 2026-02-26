"""Tests for Monopoly board rules registry."""

from server.games.monopoly.board_rules_registry import (
    get_card_cash_override,
    get_card_id_remap,
    get_rule_pack,
    supports_capability,
)


def test_wave1_mario_packs_are_registered():
    assert get_rule_pack("mario_kart") is not None
    assert get_rule_pack("mario_movie") is not None


def test_capability_lookup_handles_missing_pack():
    assert supports_capability("missing", "pass_go_credit") is False


def test_mario_kart_card_id_remap_contract():
    assert get_card_id_remap("mario_kart", "chance", "bank_dividend_50") == "advance_to_go"


def test_card_id_remap_falls_back_to_original_card():
    assert get_card_id_remap("mario_kart", "chance", "does_not_exist") == "does_not_exist"


def test_mario_movie_card_cash_override_contract():
    assert get_card_cash_override("mario_movie", "bank_dividend_50") == 120


def test_card_cash_override_returns_none_when_missing():
    assert get_card_cash_override("mario_movie", "advance_to_go") is None


def test_mario_collectors_card_id_remap_contract():
    assert get_card_id_remap("mario_collectors", "chance", "go_back_three") == "bank_dividend_50"


def test_mario_collectors_card_cash_override_contract():
    assert get_card_cash_override("mario_collectors", "bank_error_collect_200") == 250


def test_mario_celebration_card_id_remap_contract():
    assert get_card_id_remap("mario_celebration", "chance", "poor_tax_15") == "bank_dividend_50"


def test_mario_celebration_card_cash_override_contract():
    assert get_card_cash_override("mario_celebration", "income_tax_refund_20") == 60


def test_junior_super_mario_manual_core_capability_contract():
    assert supports_capability("junior_super_mario", "junior_manual_core") is True


def test_junior_super_mario_sound_ready_capability_contract():
    assert supports_capability("junior_super_mario", "junior_powerup_sound_ready") is True


def test_star_wars_mandalorian_card_id_remap_contract():
    assert (
        get_card_id_remap("star_wars_mandalorian", "chance", "bank_dividend_50")
        == "go_back_three"
    )


def test_star_wars_complete_saga_card_id_remap_contract():
    assert (
        get_card_id_remap("star_wars_complete_saga", "community_chest", "bank_error_collect_200")
        == "income_tax_refund_20"
    )


def test_star_wars_complete_saga_card_cash_override_contract():
    assert get_card_cash_override("star_wars_complete_saga", "income_tax_refund_20") == 80


def test_star_wars_mandalorian_audio_capability_contract():
    assert supports_capability("star_wars_mandalorian", "audio_theme_event") is True


def test_disney_princesses_card_id_remap_contract():
    assert get_card_id_remap("disney_princesses", "chance", "poor_tax_15") == "bank_dividend_50"


def test_disney_princesses_card_cash_override_contract():
    assert get_card_cash_override("disney_princesses", "bank_dividend_50") == 90


def test_marvel_avengers_card_id_remap_contract():
    assert (
        get_card_id_remap("marvel_avengers", "community_chest", "doctor_fee_pay_50")
        == "bank_error_collect_200"
    )


def test_marvel_avengers_card_cash_override_contract():
    assert get_card_cash_override("marvel_avengers", "bank_error_collect_200") == 220
