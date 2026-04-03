"""
Tests for the Rainbow game.

Unit tests, play tests, and persistence tests.
"""

import json
import random

import pytest

from server.core.users.bot import Bot
from server.core.users.test_user import MockUser
from server.games.rainbow.game import (
    COLOR_NAMES,
    MAX_HAND,
    RAINBOW_WIN,
    START_DROPS,
    RainbowGame,
    RainbowOptions,
    RainbowPlayer,
    color_name,
)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def make_game(num_humans: int = 0, num_bots: int = 2) -> tuple[RainbowGame, list, list]:
    """Create a game with the given numbers of human and bot players.

    Returns (game, human_users, bot_users).
    """
    game = RainbowGame()
    humans = []
    bots = []
    for i in range(num_humans):
        name = f"Human{i + 1}"
        user = MockUser(name)
        game.add_player(name, user)
        humans.append(user)
    for i in range(num_bots):
        name = f"Bot{i + 1}"
        bot = Bot(name)
        game.add_player(name, bot)
        bots.append(bot)
    return game, humans, bots


# ---------------------------------------------------------------------------
# Unit tests
# ---------------------------------------------------------------------------

class TestRainbowUnit:
    """Unit tests for Rainbow helpers and basic game mechanics."""

    def test_game_identity(self):
        game = RainbowGame()
        assert game.get_name() == "Rainbow"
        assert game.get_type() == "rainbow"
        assert game.get_min_players() == 2
        assert game.get_max_players() == 20

    def test_color_names_complete(self):
        assert len(COLOR_NAMES) == 7
        for i in range(1, 8):
            assert i in COLOR_NAMES

    def test_color_by_name_roundtrip(self):
        for i, name in COLOR_NAMES.items():
            assert color_name(i, "en") == name

    def test_color_name_locale(self):
        # English names must be non-empty
        for i in range(1, 8):
            assert color_name(i, "en")

    def test_options_defaults(self):
        game = RainbowGame()
        assert game.options.turn_limit_seconds == 120

    def test_player_initial_state(self):
        game = RainbowGame()
        user = MockUser("Alice")
        player = game.add_player("Alice", user)
        assert isinstance(player, RainbowPlayer)
        assert player.hand == []
        assert player.rainbow_count == 0

    def test_get_rainbow_color_none_when_empty(self):
        game = RainbowGame()
        user = MockUser("Alice")
        p = game.add_player("Alice", user)
        game.on_start()
        # Force a specific hand state
        p.hand = []
        p.rainbow_count = 0
        assert game._get_rainbow_color(p) is None

    def test_get_rainbow_color_needs_next(self):
        game = RainbowGame()
        user = MockUser("Alice")
        p = game.add_player("Alice", user)
        user2 = MockUser("Bob")
        game.add_player("Bob", user2)
        game.on_start()

        # Player needs color 1 (Red), has exactly one
        p.hand = [1, 2, 3]
        p.rainbow_count = 0
        assert game._get_rainbow_color(p) == 1

    def test_get_rainbow_color_not_unique(self):
        game = RainbowGame()
        user = MockUser("Alice")
        p = game.add_player("Alice", user)
        user2 = MockUser("Bob")
        game.add_player("Bob", user2)
        game.on_start()

        # Has two Reds — can't send (not unique)
        p.hand = [1, 1, 2, 3]
        p.rainbow_count = 0
        assert game._get_rainbow_color(p) is None

    def test_get_rainbow_color_wrong_color(self):
        game = RainbowGame()
        user = MockUser("Alice")
        p = game.add_player("Alice", user)
        user2 = MockUser("Bob")
        game.add_player("Bob", user2)
        game.on_start()

        # rainbow_count = 2, needs color 3 (Yellow)
        p.hand = [1, 2, 4]  # has Red but not Yellow
        p.rainbow_count = 2
        assert game._get_rainbow_color(p) is None

    def test_get_merge_colors(self):
        game = RainbowGame()
        user = MockUser("Alice")
        p = game.add_player("Alice", user)
        user2 = MockUser("Bob")
        game.add_player("Bob", user2)
        game.on_start()

        p.hand = [2, 2, 2, 2, 3, 3]
        colors = game._get_merge_colors(p)
        assert 2 in colors
        assert 3 not in colors

    def test_get_next_player(self):
        game, _, _ = make_game(num_bots=3)
        game.on_start()

        p0 = game.players[0]
        p1 = game.players[1]
        next_p = game._get_next_player(p0)  # type: ignore
        assert next_p is not None
        assert next_p in game.players

    def test_has_five_consecutive(self):
        game = RainbowGame()
        # No five consecutive
        pool = [1, 2, 3, 4, 5, 6, 7, 1, 2, 3]
        assert not game._has_five_consecutive(pool)
        # Five consecutive of same color in 10
        pool_bad = [1, 1, 1, 1, 1, 2, 3, 4, 5, 6]
        assert game._has_five_consecutive(pool_bad)


# ---------------------------------------------------------------------------
# Action tests
# ---------------------------------------------------------------------------

class TestRainbowActions:
    """Test individual game actions."""

    def setup_method(self):
        """Set up a 2-player game."""
        self.game = RainbowGame()
        self.user1 = MockUser("Alice")
        self.user2 = MockUser("Bob")
        self.p1 = self.game.add_player("Alice", self.user1)
        self.p2 = self.game.add_player("Bob", self.user2)
        self.game.on_start()
        # Make Alice the current player
        self.game.current_player = self.p1

    def _give_hand(self, player: RainbowPlayer, hand: list[int]) -> None:
        """Set the player's hand and sync the action set."""
        player.hand = list(hand)
        self.game._update_hand_actions(player)

    def test_send_rainbow_removes_from_hand(self):
        """Tapping the next rainbow color sends it and increments rainbow_count."""
        self.p1.rainbow_count = 0
        self._give_hand(self.p1, [1, 2, 3])  # Red at index 0, exactly one copy

        self.game.execute_action(self.p1, "drop_0")  # tap Red

        assert self.p1.rainbow_count == 1
        assert 1 not in self.p1.hand

    def test_send_rainbow_not_allowed_when_not_unique(self):
        """Tapping a duplicate of the next color does NOT send to rainbow."""
        self.p1.rainbow_count = 0
        self._give_hand(self.p1, [1, 1, 2])  # Two Reds — can't send

        self.game.execute_action(self.p1, "drop_0")  # tap first Red

        # rainbow_count should not have changed (merge didn't apply; only 2 Reds, not 4)
        assert self.p1.rainbow_count == 0

    def test_merge_rain_removes_three(self):
        """Tapping a color with 4 copies merges 3 into rain."""
        self.p1.rainbow_count = 0
        self._give_hand(self.p1, [2, 2, 2, 2, 3])  # 4 Oranges at indices 0-3
        rain_before = len(self.game.rain)

        self.game.execute_action(self.p1, "drop_0")  # tap Orange → merge

        assert self.p1.hand.count(2) == 1  # 4 - 3 = 1 left
        assert len(self.game.rain) == rain_before + 3

    def test_take_rain_adds_to_hand(self):
        """Taking from rain adds a drop to the player's hand."""
        self._give_hand(self.p1, [1, 2])
        self.game.rain = [3, 4, 5]
        hand_before = len(self.p1.hand)
        rain_before = len(self.game.rain)

        self.game.execute_action(self.p1, "take_rain")

        assert len(self.p1.hand) == hand_before + 1
        assert len(self.game.rain) == rain_before - 1

    def test_take_rain_blocked_when_empty(self):
        """Can't take from rain when rain is empty."""
        self._give_hand(self.p1, [1, 2])
        self.game.rain = []
        hand_before = len(self.p1.hand)

        self.game.execute_action(self.p1, "take_rain")

        assert len(self.p1.hand) == hand_before  # no change

    def test_take_rain_blocked_when_hand_full(self):
        """Can't take from rain when hand is full (10 drops)."""
        self._give_hand(self.p1, list(range(1, 8)) + [1, 2, 3])  # 10 drops
        assert len(self.p1.hand) == MAX_HAND
        self.game.rain = [4]
        hand_before = len(self.p1.hand)

        self.game.execute_action(self.p1, "take_rain")

        assert len(self.p1.hand) == hand_before

    def test_skip_advances_turn(self):
        """Skipping turn advances to next player."""
        current_before = self.game.current_player
        self.game.execute_action(self.p1, "skip_turn")
        assert self.game.current_player is not current_before

    def test_send_rainbow_win(self):
        """Tapping the 7th color triggers a win."""
        self.p1.rainbow_count = 6  # needs Violet (7)
        self._give_hand(self.p1, [7, 3, 5])  # Violet at index 0, exactly one copy

        self.game.execute_action(self.p1, "drop_0")  # tap Violet

        assert self.p1.rainbow_count == 7
        assert self.game.status == "finished"

    def test_read_hand_speaks(self):
        """Read hand action produces speech output."""
        self._give_hand(self.p1, [1, 3, 5])
        self.game.execute_action(self.p1, "read_hand")
        messages = self.user1.get_spoken_messages()
        assert len(messages) > 0

    def test_offer_forced_when_rain_empty_and_next_has_room(self):
        """Offer is forced when rain is empty and recipient has room."""
        self.game.rain = []
        self._give_hand(self.p1, [2, 3, 4])
        self._give_hand(self.p2, [1, 2])
        p2_hand_before = len(self.p2.hand)
        p1_hand_before = len(self.p1.hand)

        self.game.execute_action(self.p1, "offer_drop", input_value="Orange")

        # Forced transfer: p2 gets a drop
        assert len(self.p2.hand) == p2_hand_before + 1
        assert len(self.p1.hand) == p1_hand_before - 1
        assert not self.game.offer_active

    def test_offer_forced_when_recipient_full(self):
        """Offer goes to rain when recipient has full hand."""
        self.game.rain = [1, 2]
        self._give_hand(self.p1, [2, 3, 4])
        self._give_hand(self.p2, list(range(1, 8)) + [1, 2, 3])  # 10 drops
        assert len(self.p2.hand) == MAX_HAND
        rain_before = len(self.game.rain)
        p1_before = len(self.p1.hand)

        self.game.execute_action(self.p1, "offer_drop", input_value="Orange")

        assert len(self.game.rain) == rain_before + 1
        assert len(self.p1.hand) == p1_before - 1

    def test_offer_pending_for_human(self):
        """Offer to a human recipient sets offer_active state."""
        self.game.rain = [1, 2, 3]
        self._give_hand(self.p1, [2, 3, 4])
        self._give_hand(self.p2, [1, 2])

        self.game.execute_action(self.p1, "offer_drop", input_value="Orange")

        assert self.game.offer_active
        assert self.game.offer_from_id == self.p1.id
        assert self.game.offer_to_id == self.p2.id
        assert self.game.offer_color == 2  # Orange

    def test_accept_offer_transfers_drop(self):
        """Accepting an offer transfers the drop to recipient."""
        # Set up offer state manually
        self.game.rain = [1, 2, 3]
        self._give_hand(self.p1, [2, 3, 4])
        self._give_hand(self.p2, [1])

        self.game.offer_active = True
        self.game.offer_from_id = self.p1.id
        self.game.offer_to_id = self.p2.id
        self.game.offer_color = 2  # Orange
        self.game.offer_hand_idx = 0  # Index of Orange in p1's hand

        p2_before = len(self.p2.hand)
        p1_before = len(self.p1.hand)

        self.game.execute_action(self.p2, "accept_offer")

        assert not self.game.offer_active
        assert len(self.p2.hand) == p2_before + 1
        assert len(self.p1.hand) == p1_before - 1
        assert 2 in self.p2.hand

    def test_decline_offer_keeps_drop(self):
        """Declining an offer keeps the drop with the offerer."""
        self.game.rain = [1, 2, 3]
        self._give_hand(self.p1, [2, 3, 4])
        self._give_hand(self.p2, [1])

        self.game.offer_active = True
        self.game.offer_from_id = self.p1.id
        self.game.offer_to_id = self.p2.id
        self.game.offer_color = 2
        self.game.offer_hand_idx = 0

        p1_hand_before = list(self.p1.hand)

        self.game.execute_action(self.p2, "decline_offer")

        assert not self.game.offer_active
        assert self.p1.hand == p1_hand_before  # unchanged

    def test_action_not_available_on_other_turn(self):
        """Turn actions are disabled for the non-current player."""
        # p2 is not current player; send_rainbow should be disabled
        self.p2.rainbow_count = 0
        self._give_hand(self.p2, [1, 2, 3])

        enabled = self.game.get_all_enabled_actions(self.p2)
        enabled_ids = [a.action.id for a in enabled]
        assert "send_rainbow" not in enabled_ids

    def test_accept_offer_not_visible_without_offer(self):
        """Accept/decline are hidden when no offer is active."""
        self.game.offer_active = False
        visible = self.game.get_all_visible_actions(self.p2)
        visible_ids = [a.action.id for a in visible]
        assert "accept_offer" not in visible_ids
        assert "decline_offer" not in visible_ids

    def test_accept_offer_visible_to_target(self):
        """Accept/decline are visible to the offer target."""
        self.game.offer_active = True
        self.game.offer_from_id = self.p1.id
        self.game.offer_to_id = self.p2.id
        self.game.offer_color = 3

        visible = self.game.get_all_visible_actions(self.p2)
        visible_ids = [a.action.id for a in visible]
        assert "accept_offer" in visible_ids
        assert "decline_offer" in visible_ids

    def test_check_scores_speaks(self):
        """Check scores produces game status speech."""
        self.game.execute_action(self.p1, "check_scores")
        messages = self.user1.get_spoken_messages()
        assert len(messages) > 0


# ---------------------------------------------------------------------------
# Serialization tests
# ---------------------------------------------------------------------------

class TestRainbowSerialization:
    """Test game state persistence."""

    def test_basic_serialization_roundtrip(self):
        """Game state survives a JSON round-trip."""
        game, _, _ = make_game(num_bots=2)
        game.on_start()

        # Modify state
        game.players[0].rainbow_count = 3
        game.rain = [1, 2, 3, 4]
        game.turn_index = 1

        json_str = game.to_json()
        loaded = RainbowGame.from_json(json_str)

        assert loaded.players[0].rainbow_count == 3
        assert loaded.rain == [1, 2, 3, 4]
        assert loaded.turn_index == 1

    def test_hand_preserved(self):
        """Player hands are preserved through serialization."""
        game, _, _ = make_game(num_bots=2)
        game.on_start()
        game.players[0].hand = [1, 3, 5, 7]

        json_str = game.to_json()
        loaded = RainbowGame.from_json(json_str)

        assert loaded.players[0].hand == [1, 3, 5, 7]

    def test_offer_state_preserved(self):
        """Offer state is preserved through serialization."""
        game, _, _ = make_game(num_bots=2)
        game.on_start()
        game.offer_active = True
        game.offer_from_id = game.players[0].id
        game.offer_to_id = game.players[1].id
        game.offer_color = 4
        game.offer_hand_idx = 2

        json_str = game.to_json()
        loaded = RainbowGame.from_json(json_str)

        assert loaded.offer_active is True
        assert loaded.offer_color == 4
        assert loaded.offer_hand_idx == 2

    def test_rain_pool_preserved(self):
        """Rain pool is preserved through serialization."""
        game, _, _ = make_game(num_bots=2)
        game.on_start()
        game.rain = [2, 5, 1, 7, 3]

        json_str = game.to_json()
        loaded = RainbowGame.from_json(json_str)

        assert loaded.rain == [2, 5, 1, 7, 3]


# ---------------------------------------------------------------------------
# Play tests (full game simulations)
# ---------------------------------------------------------------------------

class TestRainbowPlayTests:
    """Run complete games to verify the game works end-to-end."""

    def _run_game(
        self,
        game: RainbowGame,
        users: list,
        max_ticks: int = 10000,
        save_every: int = 0,
    ) -> RainbowGame:
        """Run a game to completion, optionally saving/reloading periodically."""
        for tick in range(max_ticks):
            if not game.game_active:
                break

            if save_every > 0 and tick % save_every == 0 and tick > 0:
                json_str = game.to_json()
                game = RainbowGame.from_json(json_str)
                game.rebuild_runtime_state()
                for user in users:
                    name = user.username if hasattr(user, "username") else user.player_name
                    game.attach_user(name, user)
                for player in game.players:
                    game.setup_player_actions(player)

            game.on_tick()

        return game

    def _get_users(self, users: list) -> list:
        return users

    def test_two_bot_game_completes(self):
        """A 2-bot game runs to completion."""
        random.seed(42)
        game, _, bots = make_game(num_bots=2)
        game.on_start()

        game = self._run_game(game, bots, max_ticks=20000)

        assert not game.game_active, "Game should have finished"
        # One player should have completed rainbow
        assert any(p.rainbow_count == RAINBOW_WIN for p in game.players)

    def test_four_bot_game_completes(self):
        """A 4-bot game runs to completion."""
        random.seed(77)
        game, _, bots = make_game(num_bots=4)
        game.on_start()

        game = self._run_game(game, bots, max_ticks=30000)

        assert not game.game_active, "Game should have finished"
        assert any(p.rainbow_count == RAINBOW_WIN for p in game.players)

    def test_two_bot_game_with_serialization(self):
        """A 2-bot game completes with periodic serialization."""
        random.seed(99)
        game, _, bots = make_game(num_bots=2)
        game.on_start()

        game = self._run_game(game, bots, max_ticks=20000, save_every=100)

        assert not game.game_active, "Game should have finished"
        assert any(p.rainbow_count == RAINBOW_WIN for p in game.players)

    def test_four_bot_game_with_serialization(self):
        """A 4-bot game completes with periodic serialization."""
        random.seed(55)
        game, _, bots = make_game(num_bots=4)
        game.on_start()

        game = self._run_game(game, bots, max_ticks=30000, save_every=100)

        assert not game.game_active, "Game should have finished"
        assert any(p.rainbow_count == RAINBOW_WIN for p in game.players)

    def test_initial_deal_correct(self):
        """Each player starts with START_DROPS drops."""
        random.seed(1)
        game, _, _ = make_game(num_bots=2)
        game.on_start()

        for player in game.players:
            if not player.is_spectator:
                assert len(player.hand) == START_DROPS, (
                    f"{player.name} should have {START_DROPS} drops, "
                    f"got {len(player.hand)}"
                )

    def test_rain_pool_size(self):
        """Rain pool starts at the expected size."""
        random.seed(2)
        for num_players in range(2, 5):
            bots = []
            game = RainbowGame()
            for i in range(num_players):
                name = f"Bot{i}"
                b = Bot(name)
                game.add_player(name, b)
                bots.append(b)
            game.on_start()

            expected_total = (num_players + 3) * RAINBOW_WIN
            expected_rain = expected_total - num_players * START_DROPS
            assert len(game.rain) == expected_rain, (
                f"{num_players} players: expected rain={expected_rain}, got {len(game.rain)}"
            )

    def test_win_requires_all_seven_colors(self):
        """Win only triggers when rainbow_count reaches 7."""
        game, _, _ = make_game(num_bots=2)
        game.on_start()
        p = game.players[0]
        game.current_player = p

        for color in range(1, RAINBOW_WIN):
            p.rainbow_count = color - 1
            p.hand = [color, 2, 3]  # target color at index 0, exactly one copy
            game._update_hand_actions(p)
            game.execute_action(p, "drop_0")  # tap the target color
            assert game.status != "finished", (
                f"Game should not finish after sending color {color}"
            )
            game.current_player = p  # reset for next action

        # Now send the final color (Violet = 7)
        p.rainbow_count = RAINBOW_WIN - 1
        p.hand = [RAINBOW_WIN, 2, 3]  # Violet at index 0
        game._update_hand_actions(p)
        game.execute_action(p, "drop_0")
        assert game.status == "finished"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
