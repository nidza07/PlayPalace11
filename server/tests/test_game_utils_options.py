from dataclasses import dataclass
from types import SimpleNamespace

from server.game_utils.actions import ActionSet
from server.game_utils.options import (
    FloatOption,
    GameOptions,
    IntOption,
    MenuOption,
    get_option_meta,
    option_field,
)
from server.games.base import Player
from server.messages.localization import Localization


class OptionsUser:
    def __init__(self, locale: str = "en"):
        self.locale = locale


class OptionsGame:
    def __init__(self, user: OptionsUser):
        self._user = user
        self.players: list[Player] = []
        self._action_sets: dict[tuple[str, str], ActionSet] = {}

    def get_user(self, player: Player) -> OptionsUser | None:
        return self._user

    def get_action_set(self, player: Player, name: str) -> ActionSet | None:
        return self._action_sets.get((player.id, name))

    def set_action_set(self, player: Player, action_set: ActionSet) -> None:
        self._action_sets[(player.id, action_set.name)] = action_set


@dataclass
class DemoOptions(GameOptions):
    target_score: int = option_field(
        IntOption(
            default=5,
            min_val=1,
            max_val=20,
            value_key="score",
            label="opt-score",
            prompt="opt-score-prompt",
            change_msg="opt-score-change",
        )
    )
    theme: str = option_field(
        MenuOption(
            default="classic",
            choices=["classic", "neon"],
            label="opt-theme",
            prompt="opt-theme-prompt",
            change_msg="opt-theme-change",
            choice_labels={"classic": "label-classic", "neon": "label-neon"},
        )
    )
    speed: float = option_field(
        FloatOption(
            default=1.5,
            min_val=0.5,
            max_val=3.0,
            decimal_places=1,
            label="opt-speed",
            prompt="opt-speed-prompt",
            change_msg="opt-speed-change",
        )
    )


def test_int_option_create_action_and_validate(monkeypatch):
    option = IntOption(
        default=5,
        min_val=1,
        max_val=10,
        value_key="score",
        label="opt-score",
        prompt="opt-score-prompt",
        change_msg="opt-score-change",
    )

    def fake_get(locale, key, **kwargs):
        return f"{key}:{kwargs.get('score', '')}"

    monkeypatch.setattr(
        "server.game_utils.options.Localization.get",
        fake_get,
    )

    player = Player(id="p1", name="Alice")
    action = option.create_action("target_score", SimpleNamespace(), player, 7, "en")

    assert action.id == "set_target_score"
    assert action.input_request.prompt == "opt-score-prompt"

    ok, value = option.validate_and_convert("999")
    assert ok is True and value == 10

    ok, value = option.validate_and_convert("abc")
    assert ok is False and value == "abc"


def test_float_option_validate_and_convert(monkeypatch):
    option = FloatOption(
        default=2.0,
        min_val=0.5,
        max_val=5.0,
        decimal_places=2,
        label="opt-speed",
        prompt="opt-speed-prompt",
        change_msg="opt-speed-change",
    )

    ok, value = option.validate_and_convert("6.789")
    assert ok is True and value == 5.0

    ok, value = option.validate_and_convert("1.2345")
    assert ok is True and value == 1.23

    ok, value = option.validate_and_convert("not-a-number")
    assert ok is False and value == "not-a-number"


def test_menu_option_localized_choice_and_action(monkeypatch):
    menu = MenuOption(
        default="classic",
        choices=["classic", "neon"],
        label="opt-theme",
        prompt="opt-theme-prompt",
        change_msg="opt-theme-change",
        choice_labels={"classic": "label-classic"},
    )

    def fake_get(locale, key, **kwargs):
        mapping = {
            "label-classic": "Classic Label",
            "opt-theme": f"Theme:{kwargs.get('mode', '')}",
        }
        return mapping.get(key, key)

    monkeypatch.setattr(
        "server.game_utils.options.Localization.get",
        fake_get,
    )

    assert menu.get_localized_choice("classic", "en") == "Classic Label"
    action = menu.create_action(
        "style",
        SimpleNamespace(),
        Player(id="p1", name="Alice"),
        "classic",
        "en",
    )
    assert action.id == "set_style"
    assert action.input_request.prompt == "opt-theme-prompt"


def test_option_field_and_get_option_meta():
    meta = get_option_meta(DemoOptions, "theme")
    assert isinstance(meta, MenuOption)

    option_instance = DemoOptions()
    metas = option_instance.get_option_metas()
    assert set(metas.keys()) == {"target_score", "theme", "speed"}


def test_game_options_create_action_set_and_update_labels(monkeypatch):
    options = DemoOptions()
    user = OptionsUser()
    game = OptionsGame(user)
    player = Player(id="p1", name="Alice")
    game.players = [player]

    def fake_get(locale, key, **kwargs):
        mapping = {
            "opt-score": f"Score:{kwargs.get('score', '')}",
            "opt-theme": f"Theme:{kwargs.get('mode', '')}",
            "opt-speed": f"Speed:{kwargs.get('value', '')}",
            "label-classic": "Classic",
            "label-neon": "Neon",
        }
        return mapping.get(key, key)

    monkeypatch.setattr(
        "server.game_utils.options.Localization.get",
        fake_get,
    )

    action_set = options.create_options_action_set(game, player)
    game.set_action_set(player, action_set)

    assert action_set.get_action("set_target_score").label == "Score:5"
    assert action_set.get_action("set_theme").label == "Theme:Classic"

    options.target_score = 12
    options.theme = "neon"
    options.speed = 2.3

    options.update_options_labels(game)

    assert action_set.get_action("set_target_score").label == "Score:12"
    assert action_set.get_action("set_theme").label == "Theme:Neon"
    assert action_set.get_action("set_speed").label == "Speed:2.3"
