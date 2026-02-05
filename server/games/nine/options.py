from dataclasses import dataclass

from mashumaro.mixins.json import DataClassJSONMixin

from ..base import GameOptions


@dataclass
class NineOptions(GameOptions, DataClassJSONMixin):
    """
    Options for the Nine card game.
    """

    winning_score: int = 1  # Number of cards player must have to win
