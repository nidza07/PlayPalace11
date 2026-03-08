# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = Prednastavitev: { $preset }
monopoly-select-preset = Izberite prednastavitev Monopola
monopoly-option-changed-preset = Prednastavitev je nastavljena na { $preset }.

# Preset labels
monopoly-preset-classic-standard = Klasični in tematski standardni
monopoly-preset-junior = Monopoly Junior
monopoly-preset-junior-modern = Monopoly Junior (Modern)
monopoly-preset-junior-legacy = Monopoly Junior (Legacy)
monopoly-preset-cheaters = Monopoly Cheaters Edition
monopoly-preset-electronic-banking = Elektronsko bančništvo
monopoly-preset-voice-banking = Glasovno bančništvo
monopoly-preset-sore-losers = Monopol za boleče zgube
monopoly-preset-speed = Monopolna hitrost
monopoly-preset-builder = Graditelj monopola
monopoly-preset-city = Monopolno mesto
monopoly-preset-bid-card-game = Monopolna ponudba
monopoly-preset-deal-card-game = Monopolni dogovor
monopoly-preset-knockout = Monopol Knockout
monopoly-preset-free-parking-jackpot = Brezplačno parkiranje Jackpot

# Scaffold status
monopoly-announce-preset = Objavi trenutno prednastavitev
monopoly-current-preset = Trenutna prednastavitev: { $preset } (izdaje { $count }).
monopoly-scaffold-started = Monopoly scaffold se je začel s { $preset } (izdaje { $count }).

# Turn actions
monopoly-roll-dice = Vrzite kocke
monopoly-buy-property = Kupi nepremičnino
monopoly-banking-balance = Preverite bančno stanje
monopoly-banking-transfer = Prenos sredstev
monopoly-banking-ledger = Pregled bančne knjige
monopoly-voice-command = Glasovni ukaz
monopoly-cheaters-claim-reward = Zahtevajte nagrado za goljufanje
monopoly-end-turn = Končni zavoj

# Turn validation
monopoly-roll-first = Najprej se morate zviti.
monopoly-already-rolled = Ta obrat ste že zavrteli.
monopoly-no-property-to-buy = Trenutno ni nepremičnine za nakup.
monopoly-property-owned = Ta nepremičnina je že v lasti.
monopoly-not-enough-cash = Nimate dovolj denarja.
monopoly-action-disabled-for-preset = To dejanje je onemogočeno za izbrano prednastavitev.
monopoly-buy-disabled = Neposredni nakup nepremičnine je za to prednastavitev onemogočen.

# Turn events
monopoly-pass-go = { $player } je opravil GO in zbral { $amount }.
monopoly-roll-result = { $player } je zavrtel { $die1 } + { $die2 } = { $total } in pristal na { $space }.
monopoly-roll-only = { $player } zavrtel { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = Vrgli ste { $die1 } + { $die2 } = { $total } in pristali na { $space }.
monopoly-player-roll-result = { $player } je zavrtel { $die1 } + { $die2 } = { $total } in pristal na { $space }.
monopoly-you-roll-only = Vrgli ste { $die1 } + { $die2 } = { $total }.
monopoly-player-roll-only = { $player } zavrtel { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = Vrgli ste { $die1 } + { $die2 } = { $total }. Dvojice!
monopoly-player-roll-only-doubles = { $player } zavrtel { $die1 } + { $die2 } = { $total }. Dvojice!
monopoly-property-available = { $property } je na voljo za { $price }.
monopoly-property-bought = { $player } je kupil { $property } za { $price }.
monopoly-rent-paid = { $player } je plačal { $amount } v najemnini { $owner } za { $property }.
monopoly-player-paid-player = { $player } je plačal { $amount } { $target }.
monopoly-you-completed-color-set = Zdaj ste lastnik vseh lastnosti { $group }.
monopoly-player-completed-color-set = { $player } je zdaj lastnik vseh lastnosti { $group }.
monopoly-you-completed-railroads = Zdaj imate v lasti vse železnice.
monopoly-player-completed-railroads = { $player } ima zdaj v lasti vse železnice.
monopoly-you-completed-utilities = Zdaj ste lastnik vseh pripomočkov.
monopoly-player-completed-utilities = { $player } ima zdaj v lasti vse pripomočke.
monopoly-landed-owned = { $player } je pristal na lastni posesti: { $property }.
monopoly-tax-paid = { $player } je plačal { $amount } za { $tax }.
monopoly-go-to-jail = { $player } gre v zapor (premaknjen v { $space }).
monopoly-bankrupt-player = Bankrotirali ste in izpadli iz igre.
monopoly-player-bankrupt = { $player } je v stečaju. Upnik: { $creditor }.
monopoly-winner-by-bankruptcy = { $player } zmaga zaradi bankrota s preostalim denarjem { $cash }.
monopoly-winner-by-cash = { $player } zmaga z najvišjo vsoto denarja: { $cash }.
monopoly-city-winner-by-value = { $player } zmaga Monopoly City s končno vrednostjo { $total }.

# Additional actions
monopoly-auction-property = Lastnina na dražbi
monopoly-auction-bid = Oddajte dražbeno ponudbo
monopoly-auction-pass = Prepust na dražbi
monopoly-mortgage-property = Hipotekarna nepremičnina
monopoly-unmortgage-property = Odstranite hipoteko na nepremičnino
monopoly-build-house = Zgradite hišo ali hotel
monopoly-sell-house = Prodam hišo ali hotel
monopoly-offer-trade = Ponudba trgovine
monopoly-accept-trade = Sprejmi trgovino
monopoly-decline-trade = Zavrnite trgovino
monopoly-read-cash = Beri gotovino
monopoly-pay-bail = Plačaj varščino
monopoly-use-jail-card = Uporabite kartico za izhod iz zapora
monopoly-cash-report = { $cash } v gotovini.
monopoly-property-amount-option = { $property } za { $amount }
monopoly-banking-transfer-option = Prenesite { $amount } na { $target }

# Additional prompts
monopoly-select-property-mortgage = Izberite nepremičnino za hipoteko
monopoly-select-property-unmortgage = Izberite nepremičnino za odpravo hipoteke
monopoly-select-property-build = Izberite nepremičnino za gradnjo
monopoly-select-property-sell = Izberite nepremičnino za prodajo
monopoly-select-trade-offer = Izberite trgovinsko ponudbo
monopoly-select-auction-bid = Izberite svojo dražbeno ponudbo
monopoly-select-banking-transfer = Izberite prenos
monopoly-select-voice-command = Vnesite glasovni ukaz, ki se začne z voice:

# Additional validation
monopoly-no-property-to-auction = Trenutno ni nepremičnine za dražbo.
monopoly-auction-active = Najprej rešite aktivno dražbo.
monopoly-no-auction-active = Nobena dražba ni v teku.
monopoly-not-your-auction-turn = Na dražbi niste na vrsti.
monopoly-no-mortgage-options = Nimate nepremičnin, ki bi bile na voljo za hipoteko.
monopoly-no-unmortgage-options = Nimate zastavljenih nepremičnin, ki bi jih morali razstaviti.
monopoly-no-build-options = Nimate razpoložljivih nepremičnin za gradnjo.
monopoly-no-sell-options = Nimate nepremičnin s stavbami, ki bi bile na voljo za prodajo.
monopoly-no-trade-options = Trenutno nimate veljavnih poslov za ponudbo.
monopoly-no-trade-pending = Za vas ni čakajočega posla.
monopoly-trade-pending = Posel je že v teku.
monopoly-trade-no-longer-valid = Ta trgovina ne velja več.
monopoly-not-in-jail = Niste v zaporu.
monopoly-no-jail-card = Nimate kartice za izhod iz zapora.
monopoly-roll-again-required = Vrgel si dvojke in moraš znova.
monopoly-resolve-property-first = Najprej rešite nerešeno lastninsko odločitev.

# Additional turn events
monopoly-roll-again = { $player } se podvoji in dobi še en met.
monopoly-you-roll-again = Vrgli ste dvojno in dobili ste še eno.
monopoly-player-roll-again = { $player } se podvoji in dobi še en met.
monopoly-jail-roll-doubles = { $player } je dosegel dvojnike ({ $die1 } in { $die2 }) in zapustil zapor.
monopoly-you-jail-roll-doubles = Vrgli ste dvojke ({ $die1 } in { $die2 }) in zapustili zapor.
monopoly-player-jail-roll-doubles = { $player } je dosegel dvojnike ({ $die1 } in { $die2 }) in zapustil zapor.
monopoly-jail-roll-failed = { $player } je vrgel { $die1 } in { $die2 } v zapor (poskus { $attempts }).
monopoly-bail-paid = { $player } plačal varščino { $amount }.
monopoly-three-doubles-jail = { $player } je vrgel tri dvojne igre v enem obratu in je poslan v zapor.
monopoly-you-three-doubles-jail = Vrgli ste tri dvojne v enem obratu in vas pošljejo v zapor.
monopoly-player-three-doubles-jail = { $player } je vrgel tri dvojne igre v enem obratu in je poslan v zapor.
monopoly-jail-card-used = { $player } je uporabil kartico za izhod iz zapora.
monopoly-sore-loser-rebate = { $player } je prejel hud poraženec rabat { $amount }.
monopoly-cheaters-early-end-turn-blocked = { $player } je poskusil predčasno zaključiti vrsto in plačal kazen za goljufanje v višini { $amount }.
monopoly-cheaters-payment-avoidance-blocked = { $player } je goljufom sprožil kazen za plačilo { $amount }.
monopoly-cheaters-reward-granted = { $player } je zahteval nagrado za goljufe v višini { $amount }.
monopoly-cheaters-reward-unavailable = { $player } je že zahteval, da bodo goljufi nagradili ta turn.

# Auctions and mortgages
monopoly-auction-no-bids = Ni ponudb za { $property }. Ostaja neprodano.
monopoly-auction-started = Začela se je dražba za { $property } (začetna ponudba: { $amount }).
monopoly-auction-turn = Obrat dražbe: { $player } za ukrepanje na { $property } (trenutna ponudba: { $amount }).
monopoly-auction-bid-placed = { $player } je ponudil { $amount } za { $property }.
monopoly-auction-pass-event = { $player } je prenesel { $property }.
monopoly-auction-won = { $player } je zmagal na dražbi za { $property } pri { $amount }.
monopoly-property-mortgaged = { $player } je zastavil { $property } za { $amount }.
monopoly-property-unmortgaged = { $player } brez hipoteke { $property } za { $amount }.
monopoly-house-built-house = { $player } je zgradil hišo na { $property } za { $amount }. Zdaj ima { $level }.
monopoly-house-built-hotel = { $player } je zgradil hotel na { $property } za { $amount }.
monopoly-house-sold = { $player } je prodal zgradbo na { $property } za { $amount } (raven: { $level }).
monopoly-trade-offered = { $proposer } je ponudil { $target } menjavo: { $offer }.
monopoly-trade-completed = Zaključeno trgovanje med { $proposer } in { $target }: { $offer }.
monopoly-trade-declined = { $target } je zavrnil trgovanje s { $proposer }: { $offer }.
monopoly-trade-cancelled = Trgovanje preklicano: { $offer }.
monopoly-free-parking-jackpot = { $player } je prejel jackpot za brezplačno parkiranje { $amount }.
monopoly-mortgaged-no-rent = { $player } je pristal na zastavljenem { $property }; ni najemnine.
monopoly-builder-blocks-awarded = { $player } je pridobil { $amount } gradbenih blokov (skupaj { $blocks }).
monopoly-builder-block-spent = { $player } je porabil gradbeni blok (ostal je { $blocks }).
monopoly-banking-transfer-success = { $from_player } je prenesel { $amount } na { $to_player }.
monopoly-banking-transfer-failed = Bančno nakazilo { $player } ni uspelo ({ $reason }).
monopoly-banking-balance-report = Bančno stanje { $player }: { $cash }.
monopoly-banking-ledger-report = Nedavna bančna dejavnost: { $entries }.
monopoly-banking-ledger-empty = Bančnih transakcij še ni.
monopoly-voice-command-error = Napaka glasovnega ukaza: { $reason }.
monopoly-voice-command-accepted = Glasovni ukaz sprejet: { $intent }.
monopoly-voice-command-repeat = Ponavljanje zadnje bančne odgovorne kode: { $response }.
monopoly-voice-transfer-staged = Stopenjski prenos glasu: { $amount } v { $target }. Izgovorite voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = { $player } je plačal { $amount } obresti za prenos hipoteke.

# Card engine
monopoly-card-drawn = { $player } je izvlekel karto { $deck }: { $card }.
monopoly-card-collect = { $player } je zbral { $amount }.
monopoly-card-pay = { $player } je plačal { $amount }.
monopoly-card-move = { $player } premaknjen v { $space }.
monopoly-card-jail-free = { $player } je prejel kartico za izhod iz zapora.
monopoly-card-utility-roll = { $player } zvit { $die1 } + { $die2 } = { $total } za najem komunalnih storitev.
monopoly-deck-chance = Priložnost
monopoly-deck-community-chest = Skupnostna skrinja

# Card descriptions
monopoly-card-advance-to-go = Napredujte do GO in zberite { $amount }
monopoly-card-advance-to-illinois-avenue = Naprej do Illinois Avenue
monopoly-card-advance-to-st-charles-place = Naprej do St. Charles Place
monopoly-card-advance-to-nearest-utility = Pojdite do najbližjega komunalnega podjetja
monopoly-card-advance-to-nearest-railroad = Napredujte do najbližje železnice in plačajte dvojno najemnino, če je v lasti
monopoly-card-bank-dividend-50 = Banka vam izplača dividende v višini { $amount }
monopoly-card-go-back-three = Vrnite se 3 mesta nazaj
monopoly-card-go-to-jail = Pojdi neposredno v zapor
monopoly-card-general-repairs = Opravite splošna popravila na vsej svoji posesti: { $per_house } na hišo, { $per_hotel } na hotel
monopoly-card-poor-tax-15 = Plačajte slab davek v višini { $amount }
monopoly-card-reading-railroad = Odpravite se na Reading Railroad
monopoly-card-boardwalk = Sprehodite se po Boardwalku
monopoly-card-chairman-of-the-board = Predsednik uprave, plačajte { $amount } vsakemu igralcu
monopoly-card-building-loan-matures = Vaše posojilo za gradnjo zapade, zberite { $amount }
monopoly-card-crossword-competition = Zmagal si na tekmovanju v križanki, zberi { $amount }
monopoly-card-bank-error-200 = Bančna napaka v vašo korist, zberite { $amount }
monopoly-card-doctor-fee-50 = Zdravniški honorar, plačajte { $amount }
monopoly-card-sale-of-stock-50 = Od prodaje zalog prejmete { $amount }
monopoly-card-holiday-fund = Počitniški sklad dozori, prejmite { $amount }
monopoly-card-tax-refund-20 = Vračilo dohodnine, zberite { $amount }
monopoly-card-birthday = Tvoj rojstni dan je, zberi { $amount } od vsakega igralca
monopoly-card-life-insurance = Življenjsko zavarovanje zapade, zberite { $amount }
monopoly-card-hospital-fees-100 = Plačajte bolnišnične stroške v višini { $amount }
monopoly-card-school-fees-50 = Plačajte šolnino v višini { $amount }
monopoly-card-consultancy-fee-25 = Prejmite plačilo za svetovanje { $amount }
monopoly-card-street-repairs = Ocenjeni ste za popravila ulic: { $per_house } na hišo, { $per_hotel } na hotel
monopoly-card-beauty-contest-10 = Na lepotnem tekmovanju ste osvojili drugo nagrado, zberite { $amount }
monopoly-card-inherit-100 = Podedujete { $amount }
monopoly-card-get-out-of-jail = Pojdi iz zapora svoboden

# Board profile options
monopoly-set-board = Plošča: { $board }
monopoly-select-board = Izberite ploščo Monopoly
monopoly-option-changed-board = Plošča je nastavljena na { $board }.
monopoly-set-board-rules-mode = Način pravil odbora: { $mode }
monopoly-select-board-rules-mode = Izberite način pravil na plošči
monopoly-option-changed-board-rules-mode = Način pravil odbora je nastavljen na { $mode }.

# Board labels
monopoly-board-classic-default = Classic Default
monopoly-board-mario-collectors = Super Mario Bros. Collector's Edition
monopoly-board-mario-kart = Monopoly Gamer Mario Kart
monopoly-board-mario-celebration = Super Mario Celebration
monopoly-board-mario-movie = Super Mario Bros. Movie Edition
monopoly-board-junior-super-mario = Junior Super Mario Edition
monopoly-board-disney-princesses = Disney Princesses
monopoly-board-disney-animation = Disney Animation
monopoly-board-disney-lion-king = Disney Lion King
monopoly-board-disney-mickey-friends = Disney Mickey and Friends
monopoly-board-disney-villains = Disney Villains
monopoly-board-disney-lightyear = Disney Lightyear
monopoly-board-marvel-80-years = Marvel 80 Years
monopoly-board-marvel-avengers = Marvel Avengers
monopoly-board-marvel-spider-man = Marvel Spider-Man
monopoly-board-marvel-black-panther-wf = Marvel Black Panther Wakanda Forever
monopoly-board-marvel-super-villains = Marvel Super Villains
monopoly-board-marvel-deadpool = Marvel Deadpool
monopoly-board-star-wars-40th = Star Wars 40th
monopoly-board-star-wars-boba-fett = Star Wars Boba Fett
monopoly-board-star-wars-light-side = Star Wars Light Side
monopoly-board-star-wars-the-child = Star Wars The Child
monopoly-board-star-wars-mandalorian = Star Wars The Mandalorian
monopoly-board-star-wars-complete-saga = Star Wars Complete Saga
monopoly-board-harry-potter = Harry Potter
monopoly-board-fortnite = Fortnite
monopoly-board-stranger-things = Stranger Things
monopoly-board-jurassic-park = Jurassic Park
monopoly-board-lord-of-the-rings = Lord of the Rings
monopoly-board-animal-crossing = Animal Crossing
monopoly-board-barbie = Barbie
monopoly-board-disney-star-wars-dark-side = Disney Star Wars Dark Side
monopoly-board-disney-legacy = Disney Legacy Edition
monopoly-board-disney-the-edition = Disney The Edition
monopoly-board-lord-of-the-rings-trilogy = Lord of the Rings Trilogy
monopoly-board-star-wars-saga = Star Wars Saga
monopoly-board-marvel-avengers-legacy = Marvel Avengers Legacy
monopoly-board-star-wars-legacy = Star Wars Legacy
monopoly-board-star-wars-classic-edition = Star Wars Classic Edition
monopoly-board-star-wars-solo = Star Wars Solo
monopoly-board-game-of-thrones = Game of Thrones
monopoly-board-deadpool-collectors = Deadpool Collector's Edition
monopoly-board-toy-story = Toy Story
monopoly-board-black-panther = Black Panther
monopoly-board-stranger-things-collectors = Stranger Things Collector's Edition
monopoly-board-ghostbusters = Ghostbusters
monopoly-board-marvel-eternals = Marvel Eternals
monopoly-board-transformers = Transformers
monopoly-board-stranger-things-netflix = Stranger Things Netflix Edition
monopoly-board-fortnite-collectors = Fortnite Collector's Edition
monopoly-board-star-wars-mandalorian-s2 = Star Wars Mandalorian Season 2
monopoly-board-transformers-beast-wars = Transformers Beast Wars
monopoly-board-marvel-falcon-winter-soldier = Marvel Falcon and Winter Soldier
monopoly-board-fortnite-flip = Fortnite Flip Edition
monopoly-board-marvel-flip = Marvel Flip Edition
monopoly-board-pokemon = Pokemon Edition

# Board rules mode labels
monopoly-board-rules-mode-auto = Auto
monopoly-board-rules-mode-skin-only = Skin only

# Board runtime announcements
monopoly-board-preset-autofixed = Board { $board } is incompatible with { $from_preset }; switched to { $to_preset }.
monopoly-board-rules-simplified = Board rules for { $board } are partially implemented; base preset behavior is used for missing mechanics.
monopoly-board-active = Active board: { $board } (mode: { $mode }).

# Deed and ownership browsing
monopoly-view-active-deed = Oglejte si aktivno listino
monopoly-view-active-deed-space = Ogled { $property }
monopoly-browse-all-deeds = Prebrskaj vsa dejanja
monopoly-view-my-properties = Poglej moje nepremičnine
monopoly-view-player-properties = Ogled informacij o igralcu
monopoly-view-selected-deed = Oglejte si izbrano listino
monopoly-view-selected-owner-property-deed = Oglejte si listino izbranega igralca
monopoly-select-property-deed = Izberite lastninsko listino
monopoly-select-player-properties = Izberite igralca
monopoly-select-player-property-deed = Izberite listino o lastnini igralca
monopoly-no-active-deed = Trenutno ni aktivne listine za ogled.
monopoly-no-deeds-available = Na tej plošči ni na voljo nobena nepremičnina, ki bi bila primerna za listino.
monopoly-no-owned-properties = Za ta pogled ni na voljo nobena lastnina.
monopoly-no-players-with-properties = Noben igralec ni na voljo.
monopoly-buy-for = Kupite za { $amount }
monopoly-you-have-no-owned-properties = Niste lastnik nobene nepremičnine.
monopoly-player-has-no-owned-properties = { $player } ni lastnik nobene lastnosti.
monopoly-owner-bank = Banka
monopoly-owner-unknown = Neznano
monopoly-building-status-hotel = s hotelom
monopoly-building-status-one-house = z 1 hišo
monopoly-building-status-houses = s hišami { $count }
monopoly-mortgaged-short = pod hipoteko
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = Rjava
monopoly-color-light_blue = Svetlo modra
monopoly-color-pink = Roza
monopoly-color-orange = Oranžna
monopoly-color-red = Rdeča
monopoly-color-yellow = Rumena
monopoly-color-green = zelena
monopoly-color-dark_blue = Temno modra
monopoly-deed-type-color-group = Tip: barvna skupina { $color }
monopoly-deed-type-railroad = Vrsta: železnica
monopoly-deed-type-utility = Tip: Pripomoček
monopoly-deed-type-generic = Tip: { $kind }
monopoly-deed-purchase-price = Nakupna cena: { $amount }
monopoly-deed-rent = Najem: { $amount }
monopoly-deed-full-set-rent = Če ima lastnik nastavljeno celotno barvo: { $amount }
monopoly-deed-rent-one-house = Z 1 hišo: { $amount }
monopoly-deed-rent-houses = S hišami { $count }: { $amount }
monopoly-deed-rent-hotel = S hotelom: { $amount }
monopoly-deed-house-cost = Hišni stroški: { $amount }
monopoly-deed-railroad-rent = Najem z železnicami { $count }: { $amount }
monopoly-deed-utility-one-owned = Če je v lasti en pripomoček: 4x met kocke
monopoly-deed-utility-both-owned = Če sta v lasti oba pripomočka: 10x met kocke
monopoly-deed-utility-base-rent = Osnovna najemnina za komunalne storitve (nadomestna različica): { $amount }
monopoly-deed-mortgage-value = Hipotekarna vrednost: { $amount }
monopoly-deed-unmortgage-cost = Stroški odprave hipoteke: { $amount }
monopoly-deed-owner = Lastnik: { $owner }
monopoly-deed-current-buildings = Trenutne zgradbe: { $buildings }
monopoly-deed-status-mortgaged = Status: Pod hipoteko
monopoly-player-properties-label = { $player }, na { $space }, kvadrat { $position }
monopoly-player-properties-label-no-space = { $player }, kvadrat { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = { $tx_id } { $kind } ni uspelo ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = Kupite { $property } pri { $target } za { $amount }
monopoly-trade-offer-cash-for-property-summary = Ponudite { $amount } do { $target } za { $property }
monopoly-trade-sell-property-summary = Prodajte { $property } na { $target } za { $amount }
monopoly-trade-offer-property-for-cash-summary = Ponudite { $property } do { $target } za { $amount }
monopoly-trade-swap-summary = Zamenjajte { $give_property } s { $target } za { $receive_property }
monopoly-trade-swap-plus-cash-summary = Zamenjajte { $give_property } + { $amount } s { $target } za { $receive_property }
monopoly-trade-swap-receive-cash-summary = Zamenjajte { $give_property } za { $receive_property } + { $amount } iz { $target }
monopoly-trade-buy-jail-card-summary = Kupite zaporno kartico pri { $target } za { $amount }
monopoly-trade-sell-jail-card-summary = Prodaj zaporno kartico { $target }-u za { $amount }

# Board space names
monopoly-space-go = GO
monopoly-space-mediterranean_avenue = Mediterranean Avenue
monopoly-space-community_chest_1 = Community Chest
monopoly-space-baltic_avenue = Baltic Avenue
monopoly-space-income_tax = Income Tax
monopoly-space-reading_railroad = Reading Railroad
monopoly-space-oriental_avenue = Oriental Avenue
monopoly-space-chance_1 = Chance
monopoly-space-vermont_avenue = Vermont Avenue
monopoly-space-connecticut_avenue = Connecticut Avenue
monopoly-space-jail = Jail / Just Visiting
monopoly-space-st_charles_place = St. Charles Place
monopoly-space-electric_company = Electric Company
monopoly-space-states_avenue = States Avenue
monopoly-space-virginia_avenue = Virginia Avenue
monopoly-space-pennsylvania_railroad = Pennsylvania Railroad
monopoly-space-st_james_place = St. James Place
monopoly-space-community_chest_2 = Community Chest
monopoly-space-tennessee_avenue = Tennessee Avenue
monopoly-space-new_york_avenue = New York Avenue
monopoly-space-free_parking = Free Parking
monopoly-space-kentucky_avenue = Kentucky Avenue
monopoly-space-chance_2 = Chance
monopoly-space-indiana_avenue = Indiana Avenue
monopoly-space-illinois_avenue = Illinois Avenue
monopoly-space-bo_railroad = B. & O. Railroad
monopoly-space-atlantic_avenue = Atlantic Avenue
monopoly-space-ventnor_avenue = Ventnor Avenue
monopoly-space-water_works = Water Works
monopoly-space-marvin_gardens = Marvin Gardens
monopoly-space-go_to_jail = Go to Jail
monopoly-space-pacific_avenue = Pacific Avenue
monopoly-space-north_carolina_avenue = North Carolina Avenue
monopoly-space-community_chest_3 = Community Chest
monopoly-space-pennsylvania_avenue = Pennsylvania Avenue
monopoly-space-short_line = Short Line
monopoly-space-chance_3 = Chance
monopoly-space-park_place = Park Place
monopoly-space-luxury_tax = Luxury Tax
monopoly-space-boardwalk = Boardwalk
monopoly-you-property-bought = You bought { $property } for { $price }.
monopoly-player-property-bought = { $player } bought { $property } for { $price }.
monopoly-you-rent-paid = You paid { $amount } in rent to { $owner } for { $property }.
monopoly-player-rent-paid = { $player } paid { $amount } in rent to { $owner } for { $property }.
monopoly-player-paid-you-rent = { $player } paid { $amount } in rent to you for { $property }.
monopoly-you-paid-player = You paid { $amount } to { $target }.
monopoly-player-paid-you = { $player } paid { $amount } to you.
monopoly-you-tax-paid = You paid { $amount } for { $tax }.
monopoly-player-tax-paid = { $player } paid { $amount } for { $tax }.
monopoly-auction-property-space = Auction { $property }
monopoly-you-pass-go = You passed GO and collected { $amount }.
monopoly-player-pass-go = { $player } passed GO and collected { $amount }.
monopoly-you-auction-turn = Your turn to act.
monopoly-player-auction-turn = { $player }'s turn to act.
monopoly-you-auction-bid-placed = You bid { $amount } for { $property }.
monopoly-player-auction-bid-placed = { $player } bid { $amount } for { $property }.
monopoly-you-card-collect = You collected { $amount }.
monopoly-player-card-collect = { $player } collected { $amount }.
monopoly-you-card-pay = You paid { $amount }.
monopoly-player-card-pay = { $player } paid { $amount }.
