# Mensagens do jogo Left Right Center (Português)

# Nome do jogo
game-name-leftrightcenter = Esquerda Direita Centro

# Ações
lrc-roll = Jogar { $count } { $count ->
    [one] dado
   *[other] dados
}

# Faces dos dados
lrc-face-left = Esquerda
lrc-face-right = Direita
lrc-face-center = Centro
lrc-face-dot = Ponto

# Eventos do jogo
lrc-roll-results = { $player } joga { $results }.
lrc-pass-left = { $player } passa { $count } { $count ->
    [one] ficha
   *[other] fichas
} para { $target }.
lrc-pass-right = { $player } passa { $count } { $count ->
    [one] ficha
   *[other] fichas
} para { $target }.
lrc-pass-center = { $player } coloca { $count } { $count ->
    [one] ficha
   *[other] fichas
} no centro.
lrc-no-chips = { $player } não tem fichas para jogar.
lrc-center-pot = { $count } { $count ->
    [one] ficha
   *[other] fichas
} no centro.
lrc-player-chips = { $player } agora tem { $count } { $count ->
    [one] ficha
   *[other] fichas
}.
lrc-winner = { $player } vence com { $count } { $count ->
    [one] ficha
   *[other] fichas
}!

# Opções
lrc-set-starting-chips = Fichas iniciais: { $count }
lrc-enter-starting-chips = Digite as fichas iniciais:
lrc-option-changed-starting-chips = Fichas iniciais definidas para { $count }.
