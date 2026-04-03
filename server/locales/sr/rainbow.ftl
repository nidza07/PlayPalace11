# Rainbow game messages

game-name-rainbow = Duga! (Nezvanična)

# Color names
rainbow-color-red = Crvena
rainbow-color-orange = Narandžasta
rainbow-color-yellow = Žuta
rainbow-color-green = Zelena
rainbow-color-aqua = Tirkizna
rainbow-color-blue = Plava
rainbow-color-violet = Ljubičasta

# Turn actions
rainbow-take-rain = Uzmi iz kiše
rainbow-offer-drop = Ponudi kap igraču { $player }
rainbow-offer-focused = Ponudi fokusiranu kap
rainbow-skip = Preskoči potez
rainbow-accept = Prihvati
rainbow-decline = Odbij
rainbow-read-hand = Pročitaj karte u ruci

# Input prompts
rainbow-select-offer-drop = Izaberi kap koju želiš da ponudiš igraču { $player }:

# Action feedback - send to rainbow
rainbow-you-send = Poslali ste boju { $color } u dugu.
rainbow-player-sends = { $player } šalje boju { $color } u dugu.

# Action feedback - merge into rain
rainbow-you-merge = Spojili ste 3 { $color } kapi u kišu.
rainbow-player-merges = { $player } spaja 3 kapi { $color } u kišu.

# Action feedback - take from rain
rainbow-you-take = Uzeli ste { $color } boju iz kiše.
rainbow-player-takes = { $player } uzima kap iz kiše.

# Action feedback - skip
rainbow-you-skip = Preskočili ste svoj potez.
rainbow-player-skips = { $player } preskače svoj potez.

# Offer mechanics
rainbow-you-offer = Ponudili ste boju { $color } igraču { $target }.
rainbow-player-offers = { $player } nudi kap igraču { $target }.
rainbow-offer-received = { $player } vam nudi boju { $color }. Prihvatate li ili odbijate?

rainbow-you-accept = Prihvatili ste boju { $color }.
rainbow-player-accepted = { $player } prihvata kap.

rainbow-you-decline = Odbili ste ponudu.
rainbow-player-declined = { $player } odbija ponudu.

# Forced transfer: recipient has full hand
rainbow-offer-forced-full = { $target } ima punu ruku. { $color } boja umesto toga ide u kišu.

# Forced transfer: no rain available or offerer full
rainbow-offer-forced-transfer = Ponuda je automatski prihvaćena — { $target } dobija boju { $color }.

# Offer timeout: a pending offer expires
rainbow-offer-timeout-receives = { $player } čeka predugo. { $target } dobija { $color } boju kao utešnu nagradu.
rainbow-offer-timeout-you-receive = { $player } predugo čeka. Dobijate { $color } boju.

# Turn timeout
rainbow-timeout-you = Vaše vreme je isteklo. Potez je preskočen.
rainbow-timeout-player = Vreme za igrača { $player } je isteklo. Potez je preskočen.

# Time warnings (shown during turn)
rainbow-time-remaining = Preostalo vreme: { $seconds } sekundi.

# Game start
rainbow-dealing = Deljenje kapi...
rainbow-game-start = Trka za dugu počinje!

# Win / loss
rainbow-you-win = Čestitamo! Složili ste dugu i pobedili!
rainbow-player-wins = { $player } ima složenu dugu! Čestitke svima!

# Status / scores (S key)
rainbow-status-header = Status duge:
rainbow-status-rain = Kiša: { $count } { $count ->
    [one] kap
    [few] kapi
   *[other] kapi
}
rainbow-status-player = { $player }: Ruka { $hand }, Duga { $rainbow }/7

# Hand readout (I key)
rainbow-hand-header = Tvoja ruka ({ $count } { $count ->
    [one] kap
    [few] kapi
   *[other] kapi
}):
rainbow-hand-contents = { $colors }
rainbow-hand-empty = Tvoja ruka je prazna.
rainbow-next-needed = Sledeća boja koja vam je potrebna za dugu: { $color }
rainbow-rainbow-complete = Već ste složili dugu!

# Disabled reasons
rainbow-cannot-send-duplicate = Imate više od jedne kapi boje: { $color }, pa je još ne možete poslati u dugu. Prvo spojite višak u kišu.
rainbow-cannot-use-drop = Ne možeš trenutno da iskoristiš boju { $color }. Sledeća boja koja vam treba je { $next_color }.
rainbow-focus-drop-first = Prvo se fokusirajte na kap u vašoj ruci, a zatim pritisnite Shift+Enter da je ponudite.
rainbow-no-rain-drops = Nema kapi u kiši.
rainbow-hand-full = Vaša ruka je puna (maksimalno 10 kapi).
rainbow-no-drops-to-offer = Nemate kapi koje možeš ponuditi.
rainbow-offer-already-pending = Već imate ponudu koja čeka na odgovor.

# Options
rainbow-set-turn-limit = Vremensko ograničenje poteza: { $seconds } sekundi
rainbow-enter-turn-limit = Unesite vremensko ograničenje za potez u sekundama:
rainbow-option-changed-turn-limit = Vremensko ograničenje poteza je promenjeno na { $seconds } sekundi.
rainbow-desc-turn-limit = Koliko sekundi svaki igrač ima da odigra svoj potez pre nego što bude automatski preskočen.

# Validation
rainbow-need-more-players = Za igru Duga potrebna su najmanje 2 igrača.

# Rainbow-only status line (S key)
rainbow-status-rainbow-only = { $player }: Duga { $rainbow }/7

# Hand-only status line (E key)
rainbow-status-hand-only = { $player }: { $hand } kapi u ruci

rainbow-status-hand-header = Status ruke i kiše: