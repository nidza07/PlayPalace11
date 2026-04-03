# Rainbow game messages

game-name-rainbow = Rainbow! (Unofficial)

# Color names
rainbow-color-red = Red
rainbow-color-orange = Orange
rainbow-color-yellow = Yellow
rainbow-color-green = Green
rainbow-color-aqua = Aqua
rainbow-color-blue = Blue
rainbow-color-violet = Violet

# Turn actions
rainbow-take-rain = Take from rain
rainbow-offer-drop = Offer drop to { $player }
rainbow-offer-focused = Offer focused drop
rainbow-skip = Skip turn
rainbow-accept = Accept
rainbow-decline = Decline
rainbow-read-hand = Read hand

# Input prompts
rainbow-select-offer-drop = Select a drop to offer to { $player }:

# Action feedback - send to rainbow
rainbow-you-send = You sent { $color } to the rainbow.
rainbow-player-sends = { $player } sent { $color } to the rainbow.

# Action feedback - merge into rain
rainbow-you-merge = You merged 3 { $color } drops into the rain.
rainbow-player-merges = { $player } merged 3 { $color } drops into the rain.

# Action feedback - take from rain
rainbow-you-take = You took { $color } from the rain.
rainbow-player-takes = { $player } took a drop from the rain.

# Action feedback - skip
rainbow-you-skip = You skipped your turn.
rainbow-player-skips = { $player } skipped their turn.

# Offer mechanics
rainbow-you-offer = You offered { $color } to { $target }.
rainbow-player-offers = { $player } offered a drop to { $target }.
rainbow-offer-received = { $player } is offering you { $color }. Accept or decline?

rainbow-you-accept = You accepted { $color }.
rainbow-player-accepted = { $player } accepted the drop.

rainbow-you-decline = You declined the offer.
rainbow-player-declined = { $player } declined the offer.

# Forced transfer: recipient has full hand
rainbow-offer-forced-full = { $target } has a full hand. { $color } goes to the rain instead.

# Forced transfer: no rain available or offerer full
rainbow-offer-forced-transfer = Offer automatically accepted — { $target } receives { $color }.

# Offer timeout: a pending offer expires
rainbow-offer-timeout-receives = { $player } took too long. { $target } receives { $color } as a consolation prize.
rainbow-offer-timeout-you-receive = { $player } took too long. You receive { $color }.

# Turn timeout
rainbow-timeout-you = Your time expired. Turn skipped.
rainbow-timeout-player = { $player }'s time expired. Turn skipped.

# Time warnings (shown during turn)
rainbow-time-remaining = { $seconds } seconds remaining.

# Game start
rainbow-dealing = Dealing drops...
rainbow-game-start = The rainbow race begins!

# Win / loss
rainbow-you-win = Congratulations! You completed the rainbow and won!
rainbow-player-wins = { $player } completed the rainbow! Congratulations to all!

# Status / scores (S key)
rainbow-status-header = Rainbow Status:
rainbow-status-rain = Rain pool: { $count } { $count ->
    [one] drop
   *[other] drops
}
rainbow-status-player = { $player }: Hand { $hand }, Rainbow { $rainbow }/7

# Hand readout (I key)
rainbow-hand-header = Your hand ({ $count } { $count ->
    [one] drop
   *[other] drops
}):
rainbow-hand-contents = { $colors }
rainbow-hand-empty = Your hand is empty.
rainbow-next-needed = Next color needed for your rainbow: { $color }
rainbow-rainbow-complete = You have already completed the rainbow!

# Disabled reasons
rainbow-cannot-send-duplicate = You have more than one { $color }, so you can't send it to the rainbow yet. Merge the extras into rain first.
rainbow-cannot-use-drop = You can't use { $color } right now. The next color you need is { $next_color }.
rainbow-focus-drop-first = Focus on a drop in your hand first, then press Shift+Enter to offer it.
rainbow-no-rain-drops = There are no drops in the rain.
rainbow-hand-full = Your hand is full (10 drops maximum).
rainbow-no-drops-to-offer = You have no drops to offer.
rainbow-offer-already-pending = You already have an offer waiting for a response.

# Options
rainbow-set-turn-limit = Turn limit: { $seconds } seconds
rainbow-enter-turn-limit = Enter the turn time limit in seconds:
rainbow-option-changed-turn-limit = Turn limit changed to { $seconds } seconds.
rainbow-desc-turn-limit = How many seconds each player has to take their turn before it is automatically skipped.

# Validation
rainbow-need-more-players = Rainbow requires at least 2 players.

# Rainbow-only status line (S key)
rainbow-status-rainbow-only = { $player }: Rainbow { $rainbow }/7

# Hand-only status line (E key)
rainbow-status-hand-only = { $player }: { $hand } drops in hand

rainbow-status-hand-header = Hand and Rain Status:
