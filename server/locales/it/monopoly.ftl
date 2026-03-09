# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = Preimpostazione: { $preset }
monopoly-select-preset = Seleziona un preset Monopoli
monopoly-option-changed-preset = Preimpostazione impostata su { $preset }.

# Preset labels
monopoly-preset-classic-standard = Standard classico e a tema
monopoly-preset-junior = Monopoli Junior
monopoly-preset-junior-modern = Monopoli Junior (moderno)
monopoly-preset-junior-legacy = Monopoli Junior (Legacy)
monopoly-preset-cheaters = Edizione di imbroglioni di Monopoli
monopoly-preset-electronic-banking = Banca elettronica
monopoly-preset-voice-banking = Banca vocale
monopoly-preset-sore-losers = Monopolio per i perdenti irritati
monopoly-preset-speed = Velocità del monopolio
monopoly-preset-builder = Costruttore di monopoli
monopoly-preset-city = Città del monopolio
monopoly-preset-bid-card-game = Offerta di monopolio
monopoly-preset-deal-card-game = Accordo di monopolio
monopoly-preset-knockout = Eliminazione del Monopoli
monopoly-preset-free-parking-jackpot = Jackpot per parcheggio gratuito

# Scaffold status
monopoly-announce-preset = Annuncia il preset corrente
monopoly-current-preset = Preimpostazione corrente: { $preset } (edizioni { $count }).
monopoly-scaffold-started = L'impalcatura Monopoli è iniziata con { $preset } (edizioni { $count }).

# Turn actions
monopoly-roll-dice = Lancia i dadi
monopoly-buy-property = Acquistare una proprietà
monopoly-banking-balance = Controlla il saldo bancario
monopoly-banking-transfer = Trasferire fondi
monopoly-banking-ledger = Revisione del registro bancario
monopoly-voice-command = Comando vocale
monopoly-cheaters-claim-reward = Claim cheat reward
monopoly-end-turn = Fine del turno

# Turn validation
monopoly-roll-first = Devi prima rotolare.
monopoly-already-rolled = Hai già tirato questo turno.
monopoly-no-property-to-buy = Non ci sono immobili da acquistare in questo momento.
monopoly-property-owned = Quella proprietà è già di proprietà.
monopoly-not-enough-cash = Non hai abbastanza soldi.
monopoly-action-disabled-for-preset = Questa azione è disabilitata per la preimpostazione selezionata.
monopoly-buy-disabled = L'acquisto diretto della proprietà è disabilitato per questa impostazione predefinita.

# Turn events
monopoly-pass-go = { $player } ha superato il GO e ha raccolto { $amount }.
monopoly-roll-result = { $player } ha rotolato { $die1 } + { $die2 } = { $total } ed è atterrato su { $space }.
monopoly-roll-only = { $player } laminato { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = Hai lanciato { $die1 } + { $die2 } = { $total } e sei atterrato su { $space }.
monopoly-player-roll-result = { $player } ha rotolato { $die1 } + { $die2 } = { $total } ed è atterrato su { $space }.
monopoly-you-roll-only = Hai tirato { $die1 } + { $die2 } = { $total }.
monopoly-player-roll-only = { $player } laminato { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = Hai tirato { $die1 } + { $die2 } = { $total }. Raddoppia!
monopoly-player-roll-only-doubles = { $player } laminato { $die1 } + { $die2 } = { $total }. Raddoppia!
monopoly-property-available = { $property } è disponibile per { $price }.
monopoly-property-bought = { $player } ha acquistato { $property } per { $price }.
monopoly-rent-paid = { $player } ha pagato { $amount } in affitto a { $owner } per { $property }.
monopoly-player-paid-player = { $player } ha pagato { $amount } a { $target }.
monopoly-you-completed-color-set = Ora possiedi tutte le proprietà { $group }.
monopoly-player-completed-color-set = { $player } ora possiede tutte le proprietà { $group }.
monopoly-you-completed-railroads = Ora possiedi tutte le ferrovie.
monopoly-player-completed-railroads = { $player } ora possiede tutte le ferrovie.
monopoly-you-completed-utilities = Ora possiedi tutte le utenze.
monopoly-player-completed-utilities = { $player } ora possiede tutte le utilità.
monopoly-landed-owned = { $player } è atterrato nella loro proprietà: { $property }.
monopoly-tax-paid = { $player } ha pagato { $amount } per { $tax }.
monopoly-go-to-jail = { $player } va in prigione (spostato in { $space }).
monopoly-bankrupt-player = Sei in bancarotta e fuori dal gioco.
monopoly-player-bankrupt = { $player } è in bancarotta. Creditore: { $creditor }.
monopoly-winner-by-bankruptcy = { $player } vince per bancarotta con { $cash } in contanti rimanente.
monopoly-winner-by-cash = { $player } vince con il totale in contanti più alto: { $cash }.
monopoly-city-winner-by-value = { $player } vince Monopoly City con valore finale { $total }.

# Additional actions
monopoly-auction-property = Immobile all'asta
monopoly-auction-bid = Effettua un'offerta all'asta
monopoly-auction-pass = Passa all'asta
monopoly-mortgage-property = Proprietà ipotecaria
monopoly-unmortgage-property = Proprietà senza ipoteca
monopoly-build-house = Costruisci una casa o un hotel
monopoly-sell-house = Vendere casa o albergo
monopoly-offer-trade = Offrire scambi
monopoly-accept-trade = Accetta scambi
monopoly-decline-trade = Declino il commercio
monopoly-read-cash = Leggi contanti
monopoly-pay-bail = Paga la cauzione
monopoly-use-jail-card = Usa la carta per uscire di prigione
monopoly-cash-report = { $cash } in contanti.
monopoly-property-amount-option = { $property } per { $amount }
monopoly-banking-transfer-option = Trasferisci da { $amount } a { $target }

# Additional prompts
monopoly-select-property-mortgage = Seleziona un immobile da ipotecare
monopoly-select-property-unmortgage = Seleziona un immobile da togliere dall'ipoteca
monopoly-select-property-build = Seleziona una proprietà su cui costruire
monopoly-select-property-sell = Seleziona un immobile da cui vendere
monopoly-select-trade-offer = Seleziona un'offerta commerciale
monopoly-select-auction-bid = Seleziona la tua offerta d'asta
monopoly-select-banking-transfer = Seleziona un trasferimento
monopoly-select-voice-command = Immettere un comando vocale che inizia con voice:

# Additional validation
monopoly-no-property-to-auction = Non ci sono immobili all'asta in questo momento.
monopoly-auction-active = Risolvi prima l'asta attiva.
monopoly-no-auction-active = Non c'è alcuna asta in corso.
monopoly-not-your-auction-turn = Non è il tuo turno nell'asta.
monopoly-no-mortgage-options = Non hai immobili da ipotecare.
monopoly-no-unmortgage-options = Non hai proprietà ipotecate da togliere dall'ipoteca.
monopoly-no-build-options = Non hai proprietà disponibili su cui costruire.
monopoly-no-sell-options = Non hai immobili con edifici disponibili da vendere.
monopoly-no-trade-options = Non hai operazioni valide da offrire in questo momento.
monopoly-no-trade-pending = Non ci sono scambi in sospeso per te.
monopoly-trade-pending = Uno scambio è già in sospeso.
monopoly-trade-no-longer-valid = Quel commercio non è più valido.
monopoly-not-in-jail = Non sei in prigione.
monopoly-no-jail-card = Non hai una carta per uscire di prigione.
monopoly-roll-again-required = Hai tirato il doppio e devi tirare di nuovo.
monopoly-resolve-property-first = Risolvi prima la decisione sulla proprietà in sospeso.

# Additional turn events
monopoly-roll-again = { $player } lancia un doppio e ottiene un altro tiro.
monopoly-you-roll-again = Hai tirato il doppio e hai ottenuto un altro tiro.
monopoly-player-roll-again = { $player } lancia un doppio e ottiene un altro tiro.
monopoly-jail-roll-doubles = { $player } ottiene un doppio ({ $die1 } e { $die2 }) e lascia la prigione.
monopoly-you-jail-roll-doubles = Hai tirato il doppio ({ $die1 } e { $die2 }) e sei uscito di prigione.
monopoly-player-jail-roll-doubles = { $player } ottiene un doppio ({ $die1 } e { $die2 }) e lascia la prigione.
monopoly-jail-roll-failed = { $player } ha mandato in prigione { $die1 } e { $die2 } (tentativo di { $attempts }).
monopoly-bail-paid = { $player } ha pagato la cauzione a { $amount }.
monopoly-three-doubles-jail = { $player } ottiene tre doppi in un turno e viene mandato in prigione.
monopoly-you-three-doubles-jail = Hai tirato tre doppi in un turno e vieni mandato in prigione.
monopoly-player-three-doubles-jail = { $player } ottiene tre doppi in un turno e viene mandato in prigione.
monopoly-jail-card-used = { $player } ha utilizzato una carta di uscita di prigione.
monopoly-sore-loser-rebate = { $player } ha ricevuto uno sconto perdente di { $amount }.
monopoly-cheaters-early-end-turn-blocked = { $player } ha provato a terminare il turno in anticipo e ha pagato una penalità per imbroglio di { $amount }.
monopoly-cheaters-payment-avoidance-blocked = { $player } ha attivato una penalità di pagamento per gli imbroglioni di { $amount }.
monopoly-cheaters-reward-granted = { $player } ha richiesto una ricompensa per gli imbroglioni di { $amount }.
monopoly-cheaters-reward-unavailable = { $player } ha già richiesto la ricompensa per gli imbroglioni in questo turno.

# Auctions and mortgages
monopoly-auction-no-bids = Nessuna offerta per { $property }. Resta invenduto.
monopoly-auction-started = Asta iniziata per { $property } (offerta di apertura: { $amount }).
monopoly-auction-turn = Turno dell'asta: { $player } per agire su { $property } (offerta attuale: { $amount }).
monopoly-auction-bid-placed = { $player } offre { $amount } per { $property }.
monopoly-auction-pass-event = { $player } ha trasmesso { $property }.
monopoly-auction-won = { $player } ha vinto l'asta per { $property } presso { $amount }.
monopoly-property-mortgaged = { $player } ha ipotecato { $property } per { $amount }.
monopoly-property-unmortgaged = { $player } { $property } non ipotecato per { $amount }.
monopoly-house-built-house = { $player } ha costruito una casa su { $property } per { $amount }. Ora ha { $level }.
monopoly-house-built-hotel = { $player } ha costruito un hotel su { $property } per { $amount }.
monopoly-house-sold = { $player } ha venduto un edificio su { $property } per { $amount } (livello: { $level }).
monopoly-trade-offered = { $proposer } ha offerto a { $target } uno scambio: { $offer }.
monopoly-trade-completed = Commercio completato tra { $proposer } e { $target }: { $offer }.
monopoly-trade-declined = { $target } ha rifiutato lo scambio da { $proposer }: { $offer }.
monopoly-trade-cancelled = Commercio annullato: { $offer }.
monopoly-free-parking-jackpot = { $player } ha vinto il jackpot del parcheggio gratuito di { $amount }.
monopoly-mortgaged-no-rent = { $player } è atterrato su { $property } ipotecato; non è dovuto l'affitto.
monopoly-builder-blocks-awarded = { $player } ha ottenuto i blocchi di costruzione { $amount } ({ $blocks } totale).
monopoly-builder-block-spent = { $player } ha speso un blocco builder ({ $blocks } rimanente).
monopoly-banking-transfer-success = { $from_player } ha trasferito { $amount } a { $to_player }.
monopoly-banking-transfer-failed = { $player } bonifico bancario non riuscito ({ $reason }).
monopoly-banking-balance-report = { $player } saldo bancario: { $cash }.
monopoly-banking-ledger-report = Attività bancaria recente: { $entries }.
monopoly-banking-ledger-empty = Nessuna transazione bancaria ancora.
monopoly-voice-command-error = Errore comando vocale: { $reason }.
monopoly-voice-command-accepted = Comando vocale accettato: { $intent }.
monopoly-voice-command-repeat = Ripetendo l'ultimo codice di risposta bancaria: { $response }.
monopoly-voice-transfer-staged = Trasferimento vocale organizzato: da { $amount } a { $target }. Di' voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = { $player } ha pagato { $amount } in interessi di trasferimento ipotecario.

# Card engine
monopoly-card-drawn = { $player } ha disegnato una carta { $deck }: { $card }.
monopoly-card-collect = { $player } ha raccolto { $amount }.
monopoly-card-pay = { $player } ha pagato { $amount }.
monopoly-card-move = { $player } spostato in { $space }.
monopoly-card-jail-free = { $player } ha ricevuto una carta di uscita di prigione.
monopoly-card-utility-roll = { $player } laminato { $die1 } + { $die2 } = { $total } per affitto utilità.
monopoly-deck-chance = Opportunità
monopoly-deck-community-chest = Forziere comunitario

# Card descriptions
monopoly-card-advance-to-go = Avanza verso GO e raccogli { $amount }
monopoly-card-advance-to-illinois-avenue = Avanzare verso Illinois Avenue
monopoly-card-advance-to-st-charles-place = Avanza fino a St. Charles Place
monopoly-card-advance-to-nearest-utility = Avanza fino all'utilità più vicina
monopoly-card-advance-to-nearest-railroad = Avanza fino alla Ferrovia più vicina e paga l'affitto doppio se posseduta
monopoly-card-bank-dividend-50 = La banca ti paga un dividendo di { $amount }
monopoly-card-go-back-three = Torna indietro di 3 spazi
monopoly-card-go-to-jail = Vai direttamente in prigione
monopoly-card-general-repairs = Effettua riparazioni generali su tutta la tua proprietà: { $per_house } per casa, { $per_hotel } per hotel
monopoly-card-poor-tax-15 = Paga una tassa scarsa di { $amount }
monopoly-card-reading-railroad = Fai un viaggio alla Reading Railroad
monopoly-card-boardwalk = Fai una passeggiata sul Boardwalk
monopoly-card-chairman-of-the-board = Presidente del Consiglio, paga { $amount } a ogni giocatore
monopoly-card-building-loan-matures = Il tuo mutuo edilizio scade, riscuoti { $amount }
monopoly-card-crossword-competition = Hai vinto un concorso di cruciverba, raccogli { $amount }
monopoly-card-bank-error-200 = Errore bancario a tuo favore, riscuoti { $amount }
monopoly-card-doctor-fee-50 = Onorario del medico, paga { $amount }
monopoly-card-sale-of-stock-50 = Dalla vendita dello stock ottieni { $amount }
monopoly-card-holiday-fund = Il fondo vacanze matura, ricevi { $amount }
monopoly-card-tax-refund-20 = Rimborso dell'imposta sul reddito, riscuotere { $amount }
monopoly-card-birthday = È il tuo compleanno, raccogli { $amount } da ogni giocatore
monopoly-card-life-insurance = L'assicurazione sulla vita matura, raccogli { $amount }
monopoly-card-hospital-fees-100 = Pagare le spese ospedaliere di { $amount }
monopoly-card-school-fees-50 = Paga le tasse scolastiche di { $amount }
monopoly-card-consultancy-fee-25 = Ricevi una commissione di consulenza { $amount }
monopoly-card-street-repairs = Sei valutato per le riparazioni stradali: { $per_house } per casa, { $per_hotel } per hotel
monopoly-card-beauty-contest-10 = Hai vinto il secondo premio in un concorso di bellezza, colleziona { $amount }
monopoly-card-inherit-100 = Erediti { $amount }
monopoly-card-get-out-of-jail = Esci gratis di prigione

# Board profile options
monopoly-set-board = Scheda: { $board }
monopoly-select-board = Seleziona un tabellone del Monopoli
monopoly-option-changed-board = Scheda impostata su { $board }.
monopoly-set-board-rules-mode = Modalità regole del tabellone: ​​{ $mode }
monopoly-select-board-rules-mode = Seleziona la modalità regole del tabellone
monopoly-option-changed-board-rules-mode = Modalità regole della scheda impostata su { $mode }.

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
monopoly-view-active-deed = Visualizza atto attivo
monopoly-view-active-deed-space = Visualizza { $property }
monopoly-browse-all-deeds = Sfoglia tutti gli atti
monopoly-view-my-properties = Visualizza le mie proprietà
monopoly-view-player-properties = Visualizza le informazioni sul giocatore
monopoly-view-selected-deed = Visualizza l'atto selezionato
monopoly-view-selected-owner-property-deed = Visualizza l'atto del giocatore selezionato
monopoly-select-property-deed = Seleziona un atto immobiliare
monopoly-select-player-properties = Seleziona un giocatore
monopoly-select-player-property-deed = Seleziona un atto di proprietà del giocatore
monopoly-no-active-deed = Non c'è nessun atto attivo da visionare in questo momento.
monopoly-no-deeds-available = Su questa scheda non sono disponibili proprietà con capacità di azione.
monopoly-no-owned-properties = Per questa visualizzazione non sono disponibili proprietà di proprietà.
monopoly-no-players-with-properties = Nessun giocatore disponibile.
monopoly-buy-for = Acquista per { $amount }
monopoly-you-have-no-owned-properties = Non possiedi alcuna proprietà.
monopoly-player-has-no-owned-properties = { $player } non possiede alcuna proprietà.
monopoly-owner-bank = Banca
monopoly-owner-unknown = Sconosciuto
monopoly-building-status-hotel = con albergo
monopoly-building-status-one-house = con 1 casa
monopoly-building-status-houses = con case { $count }
monopoly-mortgaged-short = ipotecato
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = Marrone
monopoly-color-light_blue = Azzurro
monopoly-color-pink = Rosa
monopoly-color-orange = Arancia
monopoly-color-red = Rosso
monopoly-color-yellow = Giallo
monopoly-color-green = Verde
monopoly-color-dark_blue = Blu scuro
monopoly-deed-type-color-group = Tipo: gruppo di colori { $color }
monopoly-deed-type-railroad = Tipo: Ferrovia
monopoly-deed-type-utility = Tipo: Utilità
monopoly-deed-type-generic = Tipo: { $kind }
monopoly-deed-purchase-price = Prezzo d'acquisto: { $amount }
monopoly-deed-rent = Noleggio: { $amount }
monopoly-deed-full-set-rent = Se il proprietario ha un set a colori completo: { $amount }
monopoly-deed-rent-one-house = Con 1 casa: { $amount }
monopoly-deed-rent-houses = Con case { $count }: { $amount }
monopoly-deed-rent-hotel = Con hotel: { $amount }
monopoly-deed-house-cost = Costo della casa: { $amount }
monopoly-deed-railroad-rent = Noleggio con ferrovie { $count }: { $amount }
monopoly-deed-utility-one-owned = Se si possiede un'utilità: lancio di dadi 4x
monopoly-deed-utility-both-owned = Se entrambe le utenze sono possedute: tiro di dado 10x
monopoly-deed-utility-base-rent = Canone di base delle utenze (precedente fallback): { $amount }
monopoly-deed-mortgage-value = Valore ipotecario: { $amount }
monopoly-deed-unmortgage-cost = Costo senza mutuo: { $amount }
monopoly-deed-owner = Proprietario: { $owner }
monopoly-deed-current-buildings = Edifici attuali: { $buildings }
monopoly-deed-status-mortgaged = Stato: ipotecato
monopoly-player-properties-label = { $player }, su { $space }, quadrato { $position }
monopoly-player-properties-label-no-space = { $player }, quadrato { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = { $tx_id } { $kind } guasto ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = Acquista { $property } da { $target } per { $amount }
monopoly-trade-offer-cash-for-property-summary = Offerta da { $amount } a { $target } per { $property }
monopoly-trade-sell-property-summary = Vendi { $property } a { $target } per { $amount }
monopoly-trade-offer-property-for-cash-summary = Offerta da { $property } a { $target } per { $amount }
monopoly-trade-swap-summary = Scambia { $give_property } con { $target } per { $receive_property }
monopoly-trade-swap-plus-cash-summary = Scambia { $give_property } + { $amount } con { $target } con { $receive_property }
monopoly-trade-swap-receive-cash-summary = Scambia { $give_property } con { $receive_property } + { $amount } da { $target }
monopoly-trade-buy-jail-card-summary = Acquista la carta jail da { $target } per { $amount }
monopoly-trade-sell-jail-card-summary = Vendi la carta jail a { $target } per { $amount }

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
monopoly-you-go-to-jail = You go to jail (moved to { $space }).
monopoly-player-go-to-jail = { $player } goes to jail (moved to { $space }).
monopoly-you-bail-paid = You paid { $amount } bail.
monopoly-player-bail-paid = { $player } paid { $amount } bail.
monopoly-you-jail-card-used = You used a get-out-of-jail card.
monopoly-player-jail-card-used = { $player } used a get-out-of-jail card.
monopoly-you-auction-pass-event = You passed on { $property }.
monopoly-player-auction-pass-event = { $player } passed on { $property }.
monopoly-you-auction-won = You won the auction for { $property } at { $amount }.
monopoly-player-auction-won = { $player } won the auction for { $property } at { $amount }.
monopoly-you-property-mortgaged = You mortgaged { $property } for { $amount }.
monopoly-player-property-mortgaged = { $player } mortgaged { $property } for { $amount }.
monopoly-you-property-unmortgaged = You unmortgaged { $property } for { $amount }.
monopoly-player-property-unmortgaged = { $player } unmortgaged { $property } for { $amount }.
monopoly-you-house-built-house = You built a house on { $property } for { $amount }. It now has { $level }.
monopoly-player-house-built-house = { $player } built a house on { $property } for { $amount }. It now has { $level }.
monopoly-you-house-built-hotel = You built a hotel on { $property } for { $amount }.
monopoly-player-house-built-hotel = { $player } built a hotel on { $property } for { $amount }.
monopoly-you-house-sold = You sold a building on { $property } for { $amount } (level: { $level }).
monopoly-player-house-sold = { $player } sold a building on { $property } for { $amount } (level: { $level }).
monopoly-you-banking-transfer-success = You transferred { $amount } to { $to_player }.
monopoly-player-banking-transfer-success = { $from_player } transferred { $amount } to { $to_player }.
monopoly-player-banking-transferred-to-you = { $from_player } transferred { $amount } to you.
monopoly-you-banking-transfer-failed = Your bank transfer failed ({ $reason }).
monopoly-player-banking-transfer-failed = { $player } bank transfer failed ({ $reason }).
monopoly-you-card-move = You moved to { $space }.
monopoly-player-card-move = { $player } moved to { $space }.
monopoly-you-landed-owned = You own it.
monopoly-player-landed-owned = { $player } owns it.
monopoly-auction-bid-custom-option = Enter bid amount
monopoly-enter-auction-bid = Enter auction bid amount
monopoly-utility-rent-detail = { $multiplier } times roll of { $roll }.
monopoly-space-with-houses = With { $count } houses.
monopoly-space-with-hotel = With a hotel.
