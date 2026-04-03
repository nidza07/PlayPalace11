"""
Rainbow Game Implementation for PlayPalace v11.

Each player collects colored drops and tries to be the first to send all
7 colors (in order) to the rainbow. The rain pool is a shared supply that
players can draw from, merge excess drops into, or trade with each other.

UI model:
  - The player's hand is shown directly as menu items (one item per drop,
    duplicates shown separately).
  - Enter on a drop: if it can be sent to the rainbow, do so; if the player
    has 4 of that color, merge 3 into rain; otherwise explain why not.
  - Shift+Enter on a focused drop: offer that drop to the next player.
  - Space: draw the top drop from the rain pool.
"""

from __future__ import annotations

import random
from collections import Counter
from dataclasses import dataclass, field
from datetime import datetime

from ..base import Game, Player, GameOptions
from ..registry import register_game
from ...game_utils.action_guard_mixin import ActionGuardMixin
from ...game_utils.actions import Action, ActionSet, MenuInput, Visibility
from ...game_utils.bot_helper import BotHelper
from ...game_utils.game_result import GameResult, PlayerResult
from ...game_utils.options import option_field, IntOption
from ...messages.localization import Localization
from server.core.ui.keybinds import KeybindState


# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

MAX_HAND = 10           # Maximum drops in a player's hand
START_DROPS = 8         # Drops dealt to each player at start
RAINBOW_WIN = 7         # Rainbow color index that means "complete" (Violet)
TURN_LIMIT_TICKS = 2400 # 2 minutes at 50ms/tick
WARN_INTERVAL_TICKS = 600  # warn every 30 seconds

# Color integer → English name (used as canonical IDs in options/menus)
COLOR_NAMES: dict[int, str] = {
    1: "Red",
    2: "Orange",
    3: "Yellow",
    4: "Green",
    5: "Aqua",
    6: "Blue",
    7: "Violet",
}

# Localization key suffix for each color
COLOR_LOCALE_KEYS: dict[int, str] = {
    1: "rainbow-color-red",
    2: "rainbow-color-orange",
    3: "rainbow-color-yellow",
    4: "rainbow-color-green",
    5: "rainbow-color-aqua",
    6: "rainbow-color-blue",
    7: "rainbow-color-violet",
}

# Maximum hand size used when clearing old drop actions
_MAX_POSSIBLE_DROPS = MAX_HAND + 1


def color_name(color_int: int, locale: str = "en") -> str:
    """Return the localized name for a color integer."""
    key = COLOR_LOCALE_KEYS.get(color_int)
    if key:
        return Localization.get(locale, key)
    return str(color_int)


# ---------------------------------------------------------------------------
# Player dataclass
# ---------------------------------------------------------------------------

@dataclass
class RainbowPlayer(Player):
    """Player state for Rainbow game."""

    hand: list[int] = field(default_factory=list)  # Color values 1-7 in hand
    rainbow_count: int = 0                          # Drops sent to rainbow (0-7)


# ---------------------------------------------------------------------------
# Options
# ---------------------------------------------------------------------------

@dataclass
class RainbowOptions(GameOptions):
    """Options for Rainbow game."""

    turn_limit_seconds: int = option_field(
        IntOption(
            default=120,
            min_val=30,
            max_val=600,
            value_key="seconds",
            label="rainbow-set-turn-limit",
            prompt="rainbow-enter-turn-limit",
            change_msg="rainbow-option-changed-turn-limit",
            description="rainbow-desc-turn-limit",
        )
    )


# ---------------------------------------------------------------------------
# Game
# ---------------------------------------------------------------------------

@dataclass
@register_game
class RainbowGame(ActionGuardMixin, Game):
    """
    Rainbow drop game.

    Players take turns sending colored drops to their personal rainbow.
    Drops must be sent in color order (Red → Orange → … → Violet).
    The first player to send all 7 colors wins.

    The player's hand is displayed as individual menu items — one per drop,
    duplicates included. Pressing Enter on a drop either:
      - Sends it to the rainbow (if it's the next needed color and unique), OR
      - Merges 3 of that color into the rain (if the player has 4 or more), OR
      - Tells the player they can't use it right now.
    Shift+Enter on a focused drop offers it to the next player.
    Space draws the top drop from the rain pool.
    """

    players: list[RainbowPlayer] = field(default_factory=list)
    options: RainbowOptions = field(default_factory=RainbowOptions)

    # Rain pool (shared supply of drops)
    rain: list[int] = field(default_factory=list)

    # Winner (set when _declare_winner is called, used in build_game_result)
    winner_name: str = ""

    # Offer state: set while waiting for the recipient to respond
    offer_active: bool = False
    offer_from_id: str = ""   # Player ID of the offerer
    offer_to_id: str = ""     # Player ID of the recipient (next player)
    offer_color: int = 0      # Color value being offered
    offer_hand_idx: int = 0   # Index of the offered drop in the offerer's hand

    # Turn timer
    turn_ticks: int = 0
    last_warn_tick: int = 0

    # ---------------------------------------------------------------------------
    # Identity
    # ---------------------------------------------------------------------------

    @classmethod
    def get_name(cls) -> str:
        return "Rainbow"

    @classmethod
    def get_type(cls) -> str:
        return "rainbow"

    @classmethod
    def get_category(cls) -> str:
        return "category-uncategorized"

    @classmethod
    def get_min_players(cls) -> int:
        return 2

    @classmethod
    def get_max_players(cls) -> int:
        return 20

    def create_player(self, player_id: str, name: str, is_bot: bool = False) -> RainbowPlayer:
        return RainbowPlayer(id=player_id, name=name, is_bot=is_bot)

    # ---------------------------------------------------------------------------
    # Initial action set creation (lobby phase — hand is empty)
    # ---------------------------------------------------------------------------

    def create_turn_action_set(self, player: RainbowPlayer) -> ActionSet:
        """Create the initial turn action set.

        Drop-slot actions are added later by _update_hand_actions once the
        game starts and players have actual drops in their hands.
        """
        user = self.get_user(player)
        locale = user.locale if user else "en"
        return self._build_turn_action_set(player, locale)

    def _build_turn_action_set(self, player: RainbowPlayer, locale: str) -> ActionSet:
        """Build a fresh turn action set with the player's current hand + global actions."""
        aset = ActionSet(name="turn")

        # --- Hand drops (one per drop, including duplicates) ---
        for idx, color in enumerate(player.hand):
            cname = color_name(color, locale)
            aset.add(Action(
                id=f"drop_{idx}",
                label=cname,
                handler="_action_tap_drop",
                is_enabled="_is_drop_action_enabled",
                is_hidden="_is_drop_action_hidden",
                show_in_actions_menu=False,
            ))

        # --- Take from rain (Space) ---
        aset.add(Action(
            id="take_rain",
            label=Localization.get(locale, "rainbow-take-rain"),
            handler="_action_take_rain",
            is_enabled="_is_take_rain_enabled",
            is_hidden="_is_take_rain_hidden",
            show_in_actions_menu=True,
        ))

        # --- Skip turn ---
        aset.add(Action(
            id="skip_turn",
            label=Localization.get(locale, "rainbow-skip"),
            handler="_action_skip_turn",
            is_enabled="_is_skip_turn_enabled",
            is_hidden="_is_skip_turn_hidden",
            show_in_actions_menu=True,
        ))

        # --- Offer focused drop (Shift+Enter, keybind-only) ---
        aset.add(Action(
            id="offer_focused_drop",
            label=Localization.get(locale, "rainbow-offer-focused"),
            handler="_action_offer_focused_drop",
            is_enabled="_is_offer_focused_drop_enabled",
            is_hidden="_is_always_hidden",
            show_in_actions_menu=False,
        ))

        # --- Offer drop via actions menu (with color selection submenu) ---
        next_p = self._get_next_player(player)
        target_name = next_p.name if next_p else "?"
        aset.add(Action(
            id="offer_drop",
            label=Localization.get(locale, "rainbow-offer-drop", player=target_name),
            handler="_action_offer_drop",
            is_enabled="_is_offer_drop_enabled",
            is_hidden="_is_offer_drop_hidden",
            get_label="_get_offer_drop_label",
            input_request=MenuInput(
                prompt="rainbow-select-offer-drop",
                options="_get_offer_options",
                bot_select="_bot_select_offer",
                include_cancel=True,
            ),
            show_in_actions_menu=True,
        ))

        # --- Accept offer (shown only to offer target) ---
        aset.add(Action(
            id="accept_offer",
            label=Localization.get(locale, "rainbow-accept"),
            handler="_action_accept_offer",
            is_enabled="_is_accept_offer_enabled",
            is_hidden="_is_accept_offer_hidden",
            show_in_actions_menu=True,
        ))

        # --- Decline offer (shown only to offer target) ---
        aset.add(Action(
            id="decline_offer",
            label=Localization.get(locale, "rainbow-decline"),
            handler="_action_decline_offer",
            is_enabled="_is_decline_offer_enabled",
            is_hidden="_is_decline_offer_hidden",
            show_in_actions_menu=True,
        ))

        # --- Read hand (keybind I, always available in actions menu) ---
        aset.add(Action(
            id="read_hand",
            label=Localization.get(locale, "rainbow-read-hand"),
            handler="_action_read_hand",
            is_enabled="_is_read_hand_enabled",
            is_hidden="_is_always_hidden",
            show_in_actions_menu=True,
        ))

        # --- Hand + rain status (keybind E) ---
        aset.add(Action(
            id="check_hand_status",
            label=Localization.get(locale, "rainbow-status-hand-header"),
            handler="_action_check_hand_status",
            is_enabled="_is_check_scores_enabled",
            is_hidden="_is_always_hidden",
            show_in_actions_menu=True,
        ))

        return aset

    def _update_hand_actions(self, player: RainbowPlayer) -> None:
        """Sync the drop-slot actions in the turn set with the player's current hand.

        Removes all existing drop_* actions and adds a fresh set based on the
        current hand (duplicates included, in order).
        """
        turn_set = self.get_action_set(player, "turn")
        if not turn_set:
            return

        user = self.get_user(player)
        locale = user.locale if user else "en"

        # Remove old drop actions (by position, up to the maximum possible)
        for i in range(_MAX_POSSIBLE_DROPS):
            action_id = f"drop_{i}"
            if turn_set.get_action(action_id):
                turn_set.remove(action_id)
            # Also remove any stale entries in _order
            if action_id in turn_set._order:
                turn_set._order.remove(action_id)

        # Insert fresh drop actions at the front of the action order
        # We do this by building a new _order list: drops first, then the rest
        existing_order = list(turn_set._order)
        new_drop_ids = []
        for idx, color in enumerate(player.hand):
            cname = color_name(color, locale)
            action_id = f"drop_{idx}"
            turn_set._actions[action_id] = Action(
                id=action_id,
                label=cname,
                handler="_action_tap_drop",
                is_enabled="_is_drop_action_enabled",
                is_hidden="_is_drop_action_hidden",
                show_in_actions_menu=False,
            )
            new_drop_ids.append(action_id)

        turn_set._order = new_drop_ids + existing_order

    def _update_all_hand_actions(self) -> None:
        """Update hand actions for every non-spectator player."""
        for player in self.players:
            if not player.is_spectator and isinstance(player, RainbowPlayer):
                self._update_hand_actions(player)

    # ---------------------------------------------------------------------------
    # Keybinds
    # ---------------------------------------------------------------------------

    def setup_keybinds(self) -> None:
        """Define all keybinds for the game."""
        super().setup_keybinds()

        # Space → draw from rain
        self.define_keybind("space", "Take from rain", ["take_rain"], state=KeybindState.ACTIVE)

        # Shift+Enter on focused drop → offer it
        self.define_keybind(
            "shift+enter", "Offer focused drop", ["offer_focused_drop"],
            state=KeybindState.ACTIVE,
        )

        # Utility keybinds
        self.define_keybind("p", "Skip turn", ["skip_turn"], state=KeybindState.ACTIVE)
        self.define_keybind("y", "Accept offer", ["accept_offer"], state=KeybindState.ACTIVE)
        self.define_keybind("n", "Decline offer", ["decline_offer"], state=KeybindState.ACTIVE)
        self.define_keybind("i", "Read hand", ["read_hand"], state=KeybindState.ACTIVE,
                            include_spectators=True)
        self.define_keybind("o", "Offer drop", ["offer_drop"], state=KeybindState.ACTIVE)
        self.define_keybind("e", "Hand and rain status", ["check_hand_status"],
                            state=KeybindState.ACTIVE, include_spectators=True)

    # ---------------------------------------------------------------------------
    # Drop action callbacks (action_id-aware)
    # ---------------------------------------------------------------------------

    def _is_drop_action_hidden(self, player: RainbowPlayer, action_id: str) -> Visibility:
        """Drops are shown only on the current player's turn (no offer pending)."""
        if self.status != "playing":
            return Visibility.HIDDEN
        if self.offer_active:
            return Visibility.HIDDEN
        if player != self.current_player:
            return Visibility.HIDDEN
        # Guard: slot still valid
        try:
            idx = int(action_id.split("_")[1])
            if idx >= len(player.hand):
                return Visibility.HIDDEN
        except (ValueError, IndexError):
            return Visibility.HIDDEN
        return Visibility.VISIBLE

    def _is_drop_action_enabled(self, player: RainbowPlayer, action_id: str) -> str | None:
        """Drops are always enabled when visible — the handler explains the outcome."""
        if self.status != "playing":
            return "action-not-playing"
        if self.offer_active:
            return "rainbow-offer-already-pending"
        if player != self.current_player:
            return "action-not-your-turn"
        return None

    # ---------------------------------------------------------------------------
    # Global action enabled / hidden callbacks
    # ---------------------------------------------------------------------------

    def _is_turn_action_base(self, player: RainbowPlayer) -> str | None:
        """Base check for actions that require it to be the player's turn."""
        error = self.guard_turn_action_enabled(player)
        if error:
            return error
        if self.offer_active:
            return "rainbow-offer-already-pending"
        return None

    def _is_take_rain_enabled(self, player: RainbowPlayer) -> str | None:
        error = self._is_turn_action_base(player)
        if error:
            return error
        if not self.rain:
            return "rainbow-no-rain-drops"
        if len(player.hand) >= MAX_HAND:
            return "rainbow-hand-full"
        return None

    def _is_take_rain_hidden(self, player: RainbowPlayer) -> Visibility:
        error = self._is_turn_action_base(player)
        return Visibility.HIDDEN if error else Visibility.VISIBLE

    def _is_skip_turn_enabled(self, player: RainbowPlayer) -> str | None:
        return self._is_turn_action_base(player)

    def _is_skip_turn_hidden(self, player: RainbowPlayer) -> Visibility:
        error = self._is_turn_action_base(player)
        return Visibility.HIDDEN if error else Visibility.VISIBLE

    def _is_offer_focused_drop_enabled(self, player: RainbowPlayer) -> str | None:
        return self._is_turn_action_base(player)

    def _is_offer_drop_enabled(self, player: RainbowPlayer) -> str | None:
        error = self._is_turn_action_base(player)
        if error:
            return error
        if not player.hand:
            return "rainbow-no-drops-to-offer"
        return None

    def _is_offer_drop_hidden(self, player: RainbowPlayer) -> Visibility:
        error = self._is_turn_action_base(player)
        return Visibility.HIDDEN if error else Visibility.VISIBLE

    def _get_offer_drop_label(self, player: RainbowPlayer, action_id: str) -> str:
        user = self.get_user(player)
        locale = user.locale if user else "en"
        next_p = self._get_next_player(player)
        target_name = next_p.name if next_p else "?"
        return Localization.get(locale, "rainbow-offer-drop", player=target_name)

    # --- Offer response ---

    def _is_accept_offer_enabled(self, player: RainbowPlayer) -> str | None:
        if self.status != "playing":
            return "action-not-playing"
        if not self.offer_active or player.id != self.offer_to_id:
            return "action-not-your-turn"
        return None

    def _is_accept_offer_hidden(self, player: RainbowPlayer) -> Visibility:
        if self.offer_active and player.id == self.offer_to_id:
            return Visibility.VISIBLE
        return Visibility.HIDDEN

    def _is_decline_offer_enabled(self, player: RainbowPlayer) -> str | None:
        return self._is_accept_offer_enabled(player)

    def _is_decline_offer_hidden(self, player: RainbowPlayer) -> Visibility:
        return self._is_accept_offer_hidden(player)

    # --- Read hand ---

    def _is_read_hand_enabled(self, player: RainbowPlayer) -> str | None:
        if self.status != "playing":
            return "action-not-playing"
        return None

    # ---------------------------------------------------------------------------
    # Options menu for offer_drop (color selection)
    # ---------------------------------------------------------------------------

    def _get_offer_options(self, player: RainbowPlayer) -> list[str]:
        """Return unique localized color names from the player's hand (for actions-menu offer)."""
        locale = self._locale(player)
        seen: set[int] = set()
        options = []
        for color in player.hand:
            if color not in seen and color in COLOR_NAMES:
                seen.add(color)
                options.append(color_name(color, locale))
        return options

    def _bot_select_offer(self, player: RainbowPlayer, options: list[str]) -> str:
        """Bot picks a random color to offer."""
        return random.choice(options) if options else ""  # nosec B311

    def _color_from_localized_name(self, name: str, locale: str) -> int | None:
        """Reverse-map a localized color name back to a color integer."""
        for color_int in COLOR_NAMES:
            if color_name(color_int, locale) == name:
                return color_int
        return None

    # ---------------------------------------------------------------------------
    # Helpers
    # ---------------------------------------------------------------------------

    def _get_rainbow_color(self, player: RainbowPlayer) -> int | None:
        """Return the color this player can send to the rainbow (exactly 1 copy needed), or None."""
        needed = player.rainbow_count + 1
        if needed > RAINBOW_WIN:
            return None
        if player.hand.count(needed) == 1:
            return needed
        return None

    def _get_merge_colors(self, player: RainbowPlayer) -> list[int]:
        """Return color ints where player has 4+ copies."""
        counts = Counter(player.hand)
        return [c for c, n in counts.items() if n >= 4]

    def _get_next_player(self, player: RainbowPlayer) -> RainbowPlayer | None:
        """Return the player after `player` in turn order."""
        if not self.turn_player_ids:
            return None
        try:
            idx = self.turn_player_ids.index(player.id)
        except ValueError:
            return None
        next_id = self.turn_player_ids[(idx + 1) % len(self.turn_player_ids)]
        return self.get_player_by_id(next_id)  # type: ignore

    def _get_active_rb_players(self) -> list[RainbowPlayer]:
        return [p for p in self.players if not p.is_spectator and isinstance(p, RainbowPlayer)]

    def _locale(self, player: RainbowPlayer) -> str:
        user = self.get_user(player)
        return user.locale if user else "en"

    def _broadcast_color_l(self, msg: str, color: int, buffer: str = "table", **kwargs) -> None:
        """Broadcast one message to all players with color name resolved per locale."""
        for p in self.players:
            u = self.get_user(p)
            if not u:
                continue
            cname = color_name(color, self._locale(p))  # type: ignore
            u.speak_l(msg, buffer, color=cname, **kwargs)

    def _broadcast_color_action_l(
        self,
        actor: RainbowPlayer,
        personal_msg: str,
        others_msg: str,
        color: int,
        buffer: str = "table",
        **kwargs,
    ) -> None:
        """Like broadcast_personal_l but resolves color name in each recipient's locale."""
        for p in self.players:
            u = self.get_user(p)
            if not u:
                continue
            locale = self._locale(p)  # type: ignore
            cname = color_name(color, locale)
            if p is actor:
                u.speak_l(personal_msg, buffer, color=cname, **kwargs)
            else:
                u.speak_l(others_msg, buffer, player=actor.name, color=cname, **kwargs)

    def _turn_limit_ticks(self) -> int:
        return self.options.turn_limit_seconds * 20

    # ---------------------------------------------------------------------------
    # Game start & turn management
    # ---------------------------------------------------------------------------

    def on_start(self) -> None:
        self.status = "playing"
        self.game_active = True

        active = self._get_active_rb_players()

        # Build the rain pool: (num_players + 3) × 7 drops
        total_players = len(active) + 3
        rain_pool: list[int] = []
        for _ in range(total_players):
            rain_pool.extend(range(1, RAINBOW_WIN + 1))
        random.shuffle(rain_pool)  # nosec B311
        rain_pool = self._shuffle_no_five_consecutive(rain_pool)

        # Deal START_DROPS to each player
        for player in active:
            player.hand = []
            player.rainbow_count = 0
            for _ in range(START_DROPS):
                if rain_pool:
                    player.hand.append(rain_pool.pop())

        self.rain = rain_pool

        # Random turn order
        random.shuffle(active)  # nosec B311
        self.set_turn_players(active)
        self.turn_ticks = 0
        self.last_warn_tick = 0

        self.broadcast_l("rainbow-dealing")
        self.broadcast_l("rainbow-game-start")

        # Sync hand actions for all players now that hands are dealt
        self._update_all_hand_actions()
        self._update_rain_ambience()
        self._start_turn()

    def _shuffle_no_five_consecutive(self, pool: list[int]) -> list[int]:
        for _ in range(100):
            if not self._has_five_consecutive(pool):
                break
            random.shuffle(pool)  # nosec B311
        return pool

    def _has_five_consecutive(self, pool: list[int]) -> bool:
        for i in range(len(pool) - 9):
            window = pool[i:i + 10]
            counts = Counter(window)
            if any(c >= 5 for c in counts.values()):
                return True
        return False

    def _start_turn(self) -> None:
        self.turn_ticks = 0
        self.last_warn_tick = 0
        player = self.current_player
        if not player:
            return

        self.announce_turn()

        if player.is_bot:
            BotHelper.jolt_bot(player, ticks=random.randint(10, 20))  # nosec B311

        # Fix menu focus bug: reset to first item for current player
        self.rebuild_player_menu(player, position=1)
        # Rebuild all other players' menus normally
        for p in self.players:
            if p is not player:
                self.rebuild_player_menu(p)

    def _end_turn(self, skip_extra: bool = False) -> None:
        self.offer_active = False
        self.offer_from_id = ""
        self.offer_to_id = ""
        self.offer_color = 0
        self.offer_hand_idx = 0

        if skip_extra:
            self.skip_next_players(1)

        # Sync hand actions before advancing (hands may have changed)
        self._update_all_hand_actions()
        self._update_rain_ambience()
        self.advance_turn(announce=False)
        self._start_turn()

    def _update_rain_ambience(self) -> None:
        """Switch rain/birds ambience based on whether the rain pool has drops."""
        if self.rain:
            self.play_ambience("game_rainbow/rain.ogg")
        else:
            self.play_ambience("game_rainbow/birds.ogg")

    def rebuild_runtime_state(self) -> None:
        """Rebuild runtime state after deserialization."""
        super().rebuild_runtime_state()
        # Re-sync hand actions so drop slots match actual hands
        self._update_all_hand_actions()

    # ---------------------------------------------------------------------------
    # Action handlers — drop tapping (Enter on a hand item)
    # ---------------------------------------------------------------------------

    def _action_tap_drop(self, player: RainbowPlayer, action_id: str) -> None:
        """Handle Enter on a drop item in the hand.

        Priority:
          1. Send to rainbow (next needed color, exactly 1 copy).
          2. Merge 3 into rain (4 or more copies of this color).
          3. Tell the player they can't use this drop right now.
        """
        try:
            idx = int(action_id.split("_")[1])
        except (ValueError, IndexError):
            return

        if idx >= len(player.hand):
            return

        color = player.hand[idx]
        locale = self._locale(player)
        cname = color_name(color, locale)
        user = self.get_user(player)

        # 1. Send to rainbow?
        needed = player.rainbow_count + 1
        if color == needed and player.hand.count(color) == 1:
            player.hand.pop(idx)
            player.rainbow_count += 1
            self.play_sound("game_rainbow/rainbow.ogg")
            self._broadcast_color_action_l(player, "rainbow-you-send", "rainbow-player-sends", color)
            if player.rainbow_count >= RAINBOW_WIN:
                self._declare_winner(player)
                return
            self._end_turn()
            return

        # 2. Merge 3 into rain?
        if player.hand.count(color) >= 4:
            removed = 0
            new_hand = []
            for c in player.hand:
                if c == color and removed < 3:
                    self.rain.append(c)
                    removed += 1
                else:
                    new_hand.append(c)
            player.hand = new_hand
            random.shuffle(self.rain)  # nosec B311
            self.play_sound("game_rainbow/activated.ogg")
            self._broadcast_color_action_l(player, "rainbow-you-merge", "rainbow-player-merges", color)
            self._end_turn()
            return

        # 3. Can't use this drop — explain why
        if user:
            self.play_sound("game_rainbow/border.ogg")
            if color == needed:
                # Has 2+ of the needed color — must first reduce to 1
                user.speak_l("rainbow-cannot-send-duplicate", color=cname)
            else:
                user.speak_l("rainbow-cannot-use-drop", color=cname,
                             next_color=color_name(needed, locale))

    # ---------------------------------------------------------------------------
    # Action handlers — global turn actions
    # ---------------------------------------------------------------------------

    def _action_take_rain(self, player: RainbowPlayer, action_id: str) -> None:
        """Draw the top drop from the rain pool."""
        if not self.rain or len(player.hand) >= MAX_HAND:
            return

        color = self.rain.pop()
        player.hand.append(color)

        self.play_sound("game_rainbow/activated.ogg")
        self._broadcast_color_action_l(player, "rainbow-you-take", "rainbow-player-takes", color)
        self._end_turn()

    def _action_skip_turn(self, player: RainbowPlayer, action_id: str) -> None:
        self.broadcast_personal_l(player, "rainbow-you-skip", "rainbow-player-skips")
        self._end_turn()

    def _action_offer_focused_drop(self, player: RainbowPlayer, action_id: str) -> None:
        """Offer the currently focused drop to the next player (Shift+Enter)."""
        ctx = self.get_action_context(player)
        item_id = ctx.menu_item_id

        if not item_id or not item_id.startswith("drop_"):
            user = self.get_user(player)
            if user:
                user.speak_l("rainbow-focus-drop-first")
            return

        try:
            idx = int(item_id.split("_")[1])
        except (ValueError, IndexError):
            return

        if idx >= len(player.hand):
            return

        color = player.hand[idx]

        next_p = self._get_next_player(player)
        if not next_p:
            return

        self._process_offer(player, next_p, color, idx)

    def _action_offer_drop(self, player: RainbowPlayer, input_value: str, action_id: str) -> None:
        """Offer a drop selected from the actions-menu submenu."""
        if input_value == "_cancel":
            self.rebuild_all_menus()
            return

        locale = self._locale(player)
        color = self._color_from_localized_name(input_value, locale)
        if color is None:
            return

        try:
            hand_idx = player.hand.index(color)
        except ValueError:
            return

        next_p = self._get_next_player(player)
        if not next_p:
            return

        self._process_offer(player, next_p, color, hand_idx)

    # ---------------------------------------------------------------------------
    # Offer logic
    # ---------------------------------------------------------------------------

    def _process_offer(
        self,
        offerer: RainbowPlayer,
        recipient: RainbowPlayer,
        color: int,
        hand_idx: int,
    ) -> None:
        """Handle all offer scenarios once the offerer has selected a drop."""
        # Announce the offer to bystanders
        for p in self.players:
            if p is offerer or p is recipient:
                continue
            u = self.get_user(p)
            if u:
                u.speak_l("rainbow-player-offers", buffer="table",
                          player=offerer.name, target=recipient.name)

        # Case 1: recipient hand is full → drop goes to rain
        if len(recipient.hand) >= MAX_HAND:
            offerer.hand.pop(hand_idx)
            self.rain.append(color)
            random.shuffle(self.rain)  # nosec B311
            self._broadcast_color_l(
                "rainbow-offer-forced-full", color, target=recipient.name,
            )
            self._end_turn()
            return

        # Case 2: no rain left, or offerer hand is full → forced transfer
        if not self.rain or len(offerer.hand) >= MAX_HAND:
            offerer.hand.pop(hand_idx)
            recipient.hand.append(color)
            self._broadcast_color_l(
                "rainbow-offer-forced-transfer", color, target=recipient.name,
            )
            self._end_turn()
            return

        # Case 3: recipient is a bot → random accept/decline after delay
        if recipient.is_bot:
            BotHelper.jolt_bot(recipient, ticks=random.randint(40, 80))  # nosec B311
            self.offer_active = True
            self.offer_from_id = offerer.id
            self.offer_to_id = recipient.id
            self.offer_color = color
            self.offer_hand_idx = hand_idx
            self.rebuild_all_menus()
            return

        # Case 4: human recipient → wait for their response
        self.offer_active = True
        self.offer_from_id = offerer.id
        self.offer_to_id = recipient.id
        self.offer_color = color
        self.offer_hand_idx = hand_idx

        u_recipient = self.get_user(recipient)
        locale_r = self._locale(recipient)
        cname_r = color_name(color, locale_r)
        if u_recipient:
            u_recipient.speak_l("rainbow-offer-received", buffer="table",
                                player=offerer.name, color=cname_r)

        u_offerer = self.get_user(offerer)
        if u_offerer:
            u_offerer.speak_l("rainbow-offer-already-pending")

        self.rebuild_all_menus()

    def _action_accept_offer(self, player: RainbowPlayer, action_id: str) -> None:
        if not self.offer_active or player.id != self.offer_to_id:
            return

        offerer = self.get_player_by_id(self.offer_from_id)
        color = self.offer_color
        hand_idx = self.offer_hand_idx

        if not isinstance(offerer, RainbowPlayer):
            self._end_turn()
            return

        # Transfer the drop
        if 0 <= hand_idx < len(offerer.hand) and offerer.hand[hand_idx] == color:
            offerer.hand.pop(hand_idx)
        else:
            try:
                offerer.hand.remove(color)
            except ValueError:
                pass

        player.hand.append(color)

        self._broadcast_color_action_l(player, "rainbow-you-accept", "rainbow-player-accepted", color)
        self._end_turn()

    def _action_decline_offer(self, player: RainbowPlayer, action_id: str) -> None:
        if not self.offer_active or player.id != self.offer_to_id:
            return
        self.broadcast_personal_l(player, "rainbow-you-decline", "rainbow-player-declined")
        self._end_turn()

    # ---------------------------------------------------------------------------
    # Action handlers — utilities
    # ---------------------------------------------------------------------------

    def _action_read_hand(self, player: RainbowPlayer, action_id: str) -> None:
        user = self.get_user(player)
        if not user:
            return

        locale = self._locale(player)
        if not player.hand:
            user.speak_l("rainbow-hand-empty")
        else:
            sorted_hand = sorted(player.hand)
            names = ", ".join(color_name(c, locale) for c in sorted_hand)
            user.speak_l("rainbow-hand-header", count=len(player.hand))
            user.speak_l("rainbow-hand-contents", colors=names)

        needed = player.rainbow_count + 1
        if needed <= RAINBOW_WIN:
            user.speak_l("rainbow-next-needed", color=color_name(needed, locale))
        else:
            user.speak_l("rainbow-rainbow-complete")

    # ---------------------------------------------------------------------------
    # Custom score / status actions
    # ---------------------------------------------------------------------------

    def _action_check_scores(self, player: RainbowPlayer, action_id: str) -> None:
        """S key: announce rainbow progress for each player."""
        user = self.get_user(player)
        if not user:
            return
        for p in self._get_active_rb_players():
            user.speak_l("rainbow-status-rainbow-only", player=p.name, rainbow=p.rainbow_count)

    def _action_check_hand_status(self, player: RainbowPlayer, action_id: str) -> None:
        """E key: announce hand counts and rain pool size."""
        user = self.get_user(player)
        if not user:
            return
        for p in self._get_active_rb_players():
            user.speak_l("rainbow-status-hand-only", player=p.name, hand=len(p.hand))
        user.speak_l("rainbow-status-rain", count=len(self.rain))

    def _is_check_scores_enabled(self, player: RainbowPlayer) -> str | None:
        if self.status != "playing":
            return "action-not-playing"
        return None

    # ---------------------------------------------------------------------------
    # Bot AI
    # ---------------------------------------------------------------------------

    def bot_think(self, player: RainbowPlayer) -> str | None:
        """Return the action_id the bot should execute."""
        if self.offer_active:
            return None

        # 1. Can send a drop to the rainbow?
        rainbow_color = self._get_rainbow_color(player)
        if rainbow_color:
            try:
                idx = player.hand.index(rainbow_color)
                return f"drop_{idx}"
            except ValueError:
                pass

        # 2. Can merge 3 into rain?
        merge_colors = self._get_merge_colors(player)
        if merge_colors:
            color = merge_colors[0]
            try:
                idx = player.hand.index(color)
                return f"drop_{idx}"
            except ValueError:
                pass

        # 3. Take from rain?
        if self.rain and len(player.hand) < MAX_HAND:
            return "take_rain"

        # 4. Offer a drop — always useful: if next player is full, drop goes to rain
        next_p = self._get_next_player(player)
        if player.hand and next_p:
            return "offer_drop"

        # 5. Skip (only if hand is empty)
        return "skip_turn"

    def _process_bot_offer_response(self) -> None:
        """Handle a bot's response to a pending offer."""
        recipient = self.get_player_by_id(self.offer_to_id)
        if not isinstance(recipient, RainbowPlayer) or not recipient.is_bot:
            return

        if recipient.bot_think_ticks > 0:
            recipient.bot_think_ticks -= 1
            return

        if random.randint(0, 1) == 0:  # nosec B311
            self.execute_action(recipient, "accept_offer")
        else:
            self.execute_action(recipient, "decline_offer")

    # ---------------------------------------------------------------------------
    # Turn timer
    # ---------------------------------------------------------------------------

    def _on_turn_timeout(self) -> None:
        current = self.current_player
        if not isinstance(current, RainbowPlayer):
            self._end_turn()
            return

        if self.offer_active:
            offerer = self.get_player_by_id(self.offer_from_id)
            recipient = self.get_player_by_id(self.offer_to_id)

            if isinstance(offerer, RainbowPlayer) and isinstance(recipient, RainbowPlayer):
                color = self.offer_color
                hand_idx = self.offer_hand_idx

                if 0 <= hand_idx < len(offerer.hand) and offerer.hand[hand_idx] == color:
                    offerer.hand.pop(hand_idx)
                else:
                    try:
                        offerer.hand.remove(color)
                    except ValueError:
                        pass

                recipient.hand.append(color)

                self.play_sound("game_rainbow/limit.ogg")
                for p in self.players:
                    u = self.get_user(p)
                    if not u:
                        continue
                    locale = self._locale(p)  # type: ignore
                    cname = color_name(color, locale)
                    if p.id == recipient.id:
                        u.speak_l("rainbow-offer-timeout-you-receive",
                                  player=offerer.name, color=cname, buffer="table")
                    else:
                        u.speak_l("rainbow-offer-timeout-receives",
                                  player=offerer.name, target=recipient.name,
                                  color=cname, buffer="table")

                self._end_turn(skip_extra=True)
                return

        self.play_sound("game_rainbow/limit.ogg")
        self.broadcast_personal_l(
            current, "rainbow-timeout-you", "rainbow-timeout-player", player=current.name,
        )
        self._end_turn()

    # ---------------------------------------------------------------------------
    # Win condition
    # ---------------------------------------------------------------------------

    def _declare_winner(self, winner: RainbowPlayer) -> None:
        self.winner_name = winner.name
        for p in self.players:
            u = self.get_user(p)
            if not u:
                continue
            if p.id == winner.id:
                u.speak_l("rainbow-you-win", buffer="table")
            else:
                u.speak_l("rainbow-player-wins", player=winner.name, buffer="table")
        self.play_sound("common/victory.ogg")
        self.finish_game()

    # ---------------------------------------------------------------------------
    # Tick loop
    # ---------------------------------------------------------------------------

    def on_tick(self) -> None:
        super().on_tick()

        if not self.game_active or self.status != "playing":
            return

        if self.offer_active:
            recipient = self.get_player_by_id(self.offer_to_id)
            if isinstance(recipient, RainbowPlayer) and recipient.is_bot:
                self._process_bot_offer_response()
        else:
            BotHelper.on_tick(self)

        self.turn_ticks += 1
        limit = self._turn_limit_ticks()
        if self.turn_ticks >= limit:
            self._on_turn_timeout()
            return

        # Time warning every 30 seconds for the human current player
        elapsed_seconds = self.turn_ticks // 20
        warn_interval_seconds = WARN_INTERVAL_TICKS // 20
        last_warn_seconds = self.last_warn_tick // 20
        if (elapsed_seconds > 0
                and elapsed_seconds % warn_interval_seconds == 0
                and elapsed_seconds != last_warn_seconds):
            remaining = self.options.turn_limit_seconds - elapsed_seconds
            if remaining > 0:
                self.last_warn_tick = self.turn_ticks
                current = self.current_player
                if current and not current.is_bot:
                    u = self.get_user(current)
                    if u:
                        u.play_sound("game_rainbow/warning.ogg")
                        u.speak_l("rainbow-time-remaining", seconds=remaining)

    # ---------------------------------------------------------------------------
    # Game result
    # ---------------------------------------------------------------------------

    def build_game_result(self) -> GameResult:
        return GameResult(
            game_type=self.get_type(),
            timestamp=datetime.now().isoformat(),
            duration_ticks=self.sound_scheduler_tick,
            player_results=[
                PlayerResult(
                    player_id=p.id,
                    player_name=p.name,
                    is_bot=p.is_bot,
                    is_virtual_bot=getattr(p, "is_virtual_bot", False),
                )
                for p in self._get_active_rb_players()
            ],
            custom_data={"rain_remaining": len(self.rain), "winner_name": self.winner_name},
        )

    def format_end_screen(self, result: GameResult, locale: str) -> list[str]:
        lines = []
        for p in self._get_active_rb_players():
            lines.append(
                Localization.get(locale, "rainbow-status-player",
                                 player=p.name, hand=len(p.hand), rainbow=p.rainbow_count)
            )
        return lines
