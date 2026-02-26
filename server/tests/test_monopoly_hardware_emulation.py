"""Tests for Monopoly hardware/sound emulation framework."""

from server.games.monopoly.hardware_emulation import (
    HardwareEvent,
    resolve_hardware_event,
)


def test_hardware_event_is_inert_when_sound_mode_none():
    event = HardwareEvent(
        board_id="star_wars_mandalorian",
        event_id="play_theme",
        payload={},
    )

    result = resolve_hardware_event(event, sound_mode="none")

    assert result.status == "ignored"


def test_hardware_event_is_emulatable_when_sound_mode_emulated():
    event = HardwareEvent(
        board_id="star_wars_mandalorian",
        event_id="play_theme",
        payload={},
    )

    result = resolve_hardware_event(event, sound_mode="emulated")

    assert result.status == "emulated"


def test_hardware_event_excludes_pacman_game_unit_emulation():
    event = HardwareEvent(
        board_id="pacman",
        event_id="unit_signal",
        payload={},
    )

    result = resolve_hardware_event(event, sound_mode="emulated")

    assert result.status == "ignored"
