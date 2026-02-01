"""Bot AI for Ludo."""

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from .game import LudoGame, LudoPlayer


def bot_think(game: "LudoGame", player: "LudoPlayer") -> str | None:
    """Return the bot's next action."""
    if player != game.current_player:
        return None
    if player.move_options:
        best_index = _best_move_index(player)
        if best_index is not None:
            return f"move_token_{best_index + 1}"
    return "roll_dice"


def _best_move_index(player: "LudoPlayer") -> int | None:
    """Pick the best move index for a bot."""
    if not player.move_options:
        return None

    best_index = None
    best_score = -1
    for idx in player.move_options.keys():
        token = player.tokens[idx]
        score = 0
        if token.state == "home_column":
            score = 1000 + token.position
        elif token.state == "track":
            score = 500 + token.position
        elif token.state == "yard":
            score = 300

        if score > best_score:
            best_score = score
            best_index = idx

    return best_index
