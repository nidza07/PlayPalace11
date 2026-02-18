"""Tests for Farkle game options and hot-dice behavior."""

import random

from server.core.users.test_user import MockUser
from server.games.farkle.game import FarkleGame, FarkleOptions


def _setup_game(options: FarkleOptions | None = None):
    game = FarkleGame(options=options or FarkleOptions())
    user1 = MockUser("Alice")
    user2 = MockUser("Bob")
    player1 = game.add_player("Alice", user1)
    game.add_player("Bob", user2)
    game.on_start()
    game.reset_turn_order()
    return game, user1, player1


def test_farkle_options_defaults():
    game = FarkleGame()
    assert game.options.target_score == 500
    assert game.options.initial_bank_score == 0
    assert game.options.hot_dice_multiplier is False


def test_initial_bank_score_required_for_first_bank_only():
    game, user1, player1 = _setup_game(FarkleOptions(initial_bank_score=100))

    player1.turn_score = 90
    player1.current_roll = []
    player1.banked_dice = [1]
    current_before = game.current_player

    game.execute_action(player1, "bank")

    assert game.current_player == current_before
    assert player1.score == 0
    assert player1.turn_score == 90
    assert any(
        "Minimum initial bank score is 100." in msg
        for msg in user1.get_spoken_messages()
    )

    player1.turn_score = 100
    game.execute_action(player1, "bank")
    assert player1.score == 100

    # After first successful bank, the initial minimum no longer applies.
    player1.score = 100
    player1.turn_score = 5
    player1.current_roll = []
    player1.banked_dice = [5]
    game._action_bank(player1, "bank")
    assert player1.score == 105


def test_hot_dice_multiplier_progression_and_pitch():
    game, user1, player1 = _setup_game(FarkleOptions(hot_dice_multiplier=True))

    player1.current_roll = [1, 2, 3, 4, 5, 6]
    player1.banked_dice = []
    player1.turn_score = 0
    game.update_scoring_actions(player1)
    game.execute_action(player1, "score_large_straight_0")

    assert player1.turn_score == 200
    assert player1.hot_dice_multiplier == 2
    assert player1.hot_dice_chain == 1

    # Set up one die left so taking single 1 triggers hot dice again.
    player1.current_roll = [1]
    player1.banked_dice = [2, 2, 2, 2, 2]
    game.update_scoring_actions(player1)
    game.execute_action(player1, "score_single_1_1")

    assert player1.turn_score == 220  # 200 + (10 * x2)
    assert player1.hot_dice_multiplier == 3
    assert player1.hot_dice_chain == 2

    hot_dice_events = [
        m.data
        for m in user1.messages
        if m.type == "play_sound" and m.data["name"] == "game_farkle/hotdice.ogg"
    ]
    assert len(hot_dice_events) >= 2
    assert hot_dice_events[0]["pitch"] == 100
    assert hot_dice_events[1]["pitch"] == 106


def test_hot_dice_pitch_does_not_ramp_when_multiplier_off():
    game, user1, player1 = _setup_game(FarkleOptions(hot_dice_multiplier=False))

    player1.current_roll = [1, 2, 3, 4, 5, 6]
    player1.banked_dice = []
    game.update_scoring_actions(player1)
    game.execute_action(player1, "score_large_straight_0")

    player1.current_roll = [1]
    player1.banked_dice = [2, 2, 2, 2, 2]
    game.update_scoring_actions(player1)
    game.execute_action(player1, "score_single_1_1")

    assert player1.turn_score == 210  # 200 + 10 (no multiplier)
    assert player1.hot_dice_multiplier == 1
    assert player1.hot_dice_chain == 0

    hot_dice_events = [
        m.data
        for m in user1.messages
        if m.type == "play_sound" and m.data["name"] == "game_farkle/hotdice.ogg"
    ]
    assert len(hot_dice_events) >= 2
    assert hot_dice_events[0]["pitch"] == 100
    assert hot_dice_events[1]["pitch"] == 100


def test_hot_dice_state_resets_on_farkle(monkeypatch):
    game, _, player1 = _setup_game(FarkleOptions(hot_dice_multiplier=True))

    player1.turn_score = 50
    player1.hot_dice_multiplier = 4
    player1.hot_dice_chain = 3
    player1.current_roll = []
    player1.banked_dice = []
    player1.has_taken_combo = True

    values = iter([10, 2, 2, 3, 3, 4, 6, 20])

    def fixed_randint(_a, _b):
        return next(values)

    monkeypatch.setattr(random, "randint", fixed_randint)
    game._action_roll(player1, "roll")

    assert player1.turn_score == 0
    assert player1.hot_dice_multiplier == 1
    assert player1.hot_dice_chain == 0


def test_bot_prefers_three_of_kind_over_single_five():
    game, _, player1 = _setup_game()

    player1.current_roll = [2, 2, 2, 5, 6, 6]
    player1.banked_dice = []
    player1.turn_score = 0
    game.update_scoring_actions(player1)

    action = game.bot_think(player1)
    assert action == "score_three_of_kind_2"


def test_bot_banks_with_high_multiplier_and_low_dice():
    game, _, player1 = _setup_game(FarkleOptions(hot_dice_multiplier=True))

    player1.score = 100
    player1.turn_score = 25
    player1.banked_dice = [1, 2, 3, 4, 5]
    player1.current_roll = []
    player1.hot_dice_multiplier = 4
    player1.has_taken_combo = True

    assert game.bot_think(player1) == "bank"


def test_bot_avoids_blocked_initial_bank_attempt():
    game, _, player1 = _setup_game(FarkleOptions(initial_bank_score=100))

    player1.score = 0
    player1.turn_score = 40
    player1.banked_dice = [1, 2, 3, 4, 5]
    player1.current_roll = []
    player1.has_taken_combo = True

    assert game.bot_think(player1) == "roll"
