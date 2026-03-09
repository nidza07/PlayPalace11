# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = Preestablecido: { $preset }
monopoly-select-preset = Seleccione un ajuste preestablecido de Monopoly
monopoly-option-changed-preset = Preestablecido en { $preset }.

# Preset labels
monopoly-preset-classic-standard = Estándar clásico y temático
monopoly-preset-junior = Monopolio Junior
monopoly-preset-junior-modern = Monopoly Junior (moderno)
monopoly-preset-junior-legacy = Monopoly Junior (heredado)
monopoly-preset-cheaters = Edición de tramposos de Monopoly
monopoly-preset-electronic-banking = Banca Electrónica
monopoly-preset-voice-banking = Banca por voz
monopoly-preset-sore-losers = Monopolio para perdedores doloridos
monopoly-preset-speed = Velocidad de monopolio
monopoly-preset-builder = Constructor de monopolio
monopoly-preset-city = Ciudad Monopolio
monopoly-preset-bid-card-game = Oferta de monopolio
monopoly-preset-deal-card-game = Acuerdo de monopolio
monopoly-preset-knockout = Nocaut de monopolio
monopoly-preset-free-parking-jackpot = Premio mayor de estacionamiento gratuito

# Scaffold status
monopoly-announce-preset = Anunciar el preset actual
monopoly-current-preset = Preajuste actual: { $preset } (ediciones { $count }).
monopoly-scaffold-started = El andamio Monopoly comenzó con { $preset } (ediciones { $count }).

# Turn actions
monopoly-roll-dice = tirar los dados
monopoly-buy-property = comprar propiedad
monopoly-banking-balance = Consultar saldo bancario
monopoly-banking-transfer = Transferir fondos
monopoly-banking-ledger = Revisar el libro mayor del banco
monopoly-voice-command = Comando de voz
monopoly-cheaters-claim-reward = Reclamar recompensa por trampa
monopoly-end-turn = Fin de turno

# Turn validation
monopoly-roll-first = Primero debes rodar.
monopoly-already-rolled = Ya has rodado este turno.
monopoly-no-property-to-buy = No hay ninguna propiedad para comprar en este momento.
monopoly-property-owned = Esa propiedad ya es propiedad.
monopoly-not-enough-cash = No tienes suficiente efectivo.
monopoly-action-disabled-for-preset = Esta acción está deshabilitada para el ajuste preestablecido seleccionado.
monopoly-buy-disabled = La compra directa de propiedades está deshabilitada para este ajuste preestablecido.

# Turn events
monopoly-pass-go = { $player } pasó GO y recogió { $amount }.
monopoly-roll-result = { $player } rodó { $die1 } + { $die2 } = { $total } y aterrizó en { $space }.
monopoly-roll-only = { $player } enrollado { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = Obtuviste { $die1 } + { $die2 } = { $total } y aterrizaste en { $space }.
monopoly-player-roll-result = { $player } rodó { $die1 } + { $die2 } = { $total } y aterrizó en { $space }.
monopoly-you-roll-only = Obtuviste { $die1 } + { $die2 } = { $total }.
monopoly-player-roll-only = { $player } enrollado { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = Obtuviste { $die1 } + { $die2 } = { $total }. ¡Dobles!
monopoly-player-roll-only-doubles = { $player } enrollado { $die1 } + { $die2 } = { $total }. ¡Dobles!
monopoly-property-available = { $property } está disponible para { $price }.
monopoly-property-bought = { $player } compró { $property } por { $price }.
monopoly-rent-paid = { $player } pagó { $amount } en alquiler a { $owner } por { $property }.
monopoly-player-paid-player = { $player } pagó { $amount } a { $target }.
monopoly-you-completed-color-set = Ahora posee todas las propiedades de { $group }.
monopoly-player-completed-color-set = { $player } ahora posee todas las propiedades de { $group }.
monopoly-you-completed-railroads = Ahora eres dueño de todos los ferrocarriles.
monopoly-player-completed-railroads = { $player } ahora posee todos los ferrocarriles.
monopoly-you-completed-utilities = Ahora eres dueño de todos los servicios públicos.
monopoly-player-completed-utilities = { $player } ahora posee todas las utilidades.
monopoly-landed-owned = { $player } aterrizó en su propia propiedad: { $property }.
monopoly-tax-paid = { $player } pagó { $amount } por { $tax }.
monopoly-go-to-jail = { $player } va a la cárcel (trasladado a { $space }).
monopoly-bankrupt-player = Estás en quiebra y fuera del juego.
monopoly-player-bankrupt = { $player } está en quiebra. Acreedor: { $creditor }.
monopoly-winner-by-bankruptcy = { $player } gana por quiebra y queda efectivo de { $cash }.
monopoly-winner-by-cash = { $player } gana con el total de efectivo más alto: { $cash }.
monopoly-city-winner-by-value = { $player } gana Monopoly City con valor final { $total }.

# Additional actions
monopoly-auction-property = propiedad en subasta
monopoly-auction-bid = Realizar oferta de subasta
monopoly-auction-pass = Pase en subasta
monopoly-mortgage-property = propiedad hipotecaria
monopoly-unmortgage-property = Propiedad deshipotecada
monopoly-build-house = construir casa u hotel
monopoly-sell-house = Vender casa u hotel
monopoly-offer-trade = Oferta comercial
monopoly-accept-trade = Aceptar intercambio
monopoly-decline-trade = Rechazar el comercio
monopoly-read-cash = leer efectivo
monopoly-pay-bail = pagar la fianza
monopoly-use-jail-card = Utilice la tarjeta para salir de la cárcel
monopoly-cash-report = { $cash } en efectivo.
monopoly-property-amount-option = { $property } para { $amount }
monopoly-banking-transfer-option = Transferir { $amount } a { $target }

# Additional prompts
monopoly-select-property-mortgage = Seleccione una propiedad para hipotecar
monopoly-select-property-unmortgage = Seleccione una propiedad para deshipotecar
monopoly-select-property-build = Seleccione una propiedad para construir
monopoly-select-property-sell = Seleccione una propiedad para vender
monopoly-select-trade-offer = Seleccione una oferta comercial
monopoly-select-auction-bid = Seleccione su oferta de subasta
monopoly-select-banking-transfer = Seleccione una transferencia
monopoly-select-voice-command = Ingrese un comando de voz que comience con voice:

# Additional validation
monopoly-no-property-to-auction = No hay ninguna propiedad para subastar en este momento.
monopoly-auction-active = Resuelva primero la subasta activa.
monopoly-no-auction-active = No hay ninguna subasta en curso.
monopoly-not-your-auction-turn = No es tu turno en la subasta.
monopoly-no-mortgage-options = No tienes propiedades disponibles para hipotecar.
monopoly-no-unmortgage-options = No tienes propiedades hipotecadas para deshipotecar.
monopoly-no-build-options = No tienes propiedades disponibles para construir.
monopoly-no-sell-options = No tienes propiedades con edificios disponibles para vender.
monopoly-no-trade-options = No tienes ninguna operación válida para ofrecer en este momento.
monopoly-no-trade-pending = No hay ninguna operación pendiente para usted.
monopoly-trade-pending = Ya hay un intercambio pendiente.
monopoly-trade-no-longer-valid = Ese intercambio ya no es válido.
monopoly-not-in-jail = No estás en la cárcel.
monopoly-no-jail-card = No tienes una tarjeta para salir de la cárcel.
monopoly-roll-again-required = Obtuviste dobles y debes tirar nuevamente.
monopoly-resolve-property-first = Resuelva primero la decisión de propiedad pendiente.

# Additional turn events
monopoly-roll-again = { $player } sacó dobles y obtiene otra tirada.
monopoly-you-roll-again = Obtuviste dobles y obtuviste otra tirada.
monopoly-player-roll-again = { $player } sacó dobles y obtiene otra tirada.
monopoly-jail-roll-doubles = { $player } tira dobles ({ $die1 } y { $die2 }) y sale de la cárcel.
monopoly-you-jail-roll-doubles = Obtuviste dobles ({ $die1 } y { $die2 }) y saliste de la cárcel.
monopoly-player-jail-roll-doubles = { $player } tira dobles ({ $die1 } y { $die2 }) y sale de la cárcel.
monopoly-jail-roll-failed = { $player } llevó a { $die1 } y { $die2 } a la cárcel (intento { $attempts }).
monopoly-bail-paid = { $player } pagó la fianza a { $amount }.
monopoly-three-doubles-jail = { $player } obtuvo tres dobles en un turno y es enviado a prisión.
monopoly-you-three-doubles-jail = Obtuviste tres dobles en un turno y te enviaron a la cárcel.
monopoly-player-three-doubles-jail = { $player } obtuvo tres dobles en un turno y es enviado a prisión.
monopoly-jail-card-used = { $player } utilizó una tarjeta para salir de la cárcel.
monopoly-sore-loser-rebate = { $player } recibió un reembolso por perdedor doloroso de { $amount }.
monopoly-cheaters-early-end-turn-blocked = { $player } intentó terminar el turno antes y pagó una penalización por trampa de { $amount }.
monopoly-cheaters-payment-avoidance-blocked = { $player } desencadenó una multa por pago a los tramposos de { $amount }.
monopoly-cheaters-reward-granted = { $player } reclamó una recompensa por tramposos de { $amount }.
monopoly-cheaters-reward-unavailable = { $player } ya reclamó la recompensa por tramposos este turno.

# Auctions and mortgages
monopoly-auction-no-bids = No hay pujas para { $property }. Sigue sin venderse.
monopoly-auction-started = Subasta iniciada para { $property } (oferta inicial: { $amount }).
monopoly-auction-turn = Turno de subasta: { $player } para actuar sobre { $property } (oferta actual: { $amount }).
monopoly-auction-bid-placed = { $player } oferta { $amount } por { $property }.
monopoly-auction-pass-event = { $player } pasó a { $property }.
monopoly-auction-won = { $player } ganó la subasta de { $property } en { $amount }.
monopoly-property-mortgaged = { $player } hipotecó { $property } por { $amount }.
monopoly-property-unmortgaged = { $player } { $property } sin hipotecar para { $amount }.
monopoly-house-built-house = { $player } construyó una casa en { $property } para { $amount }. Ahora tiene { $level }.
monopoly-house-built-hotel = { $player } construyó un hotel en { $property } para { $amount }.
monopoly-house-sold = { $player } vendió un edificio en { $property } por { $amount } (nivel: { $level }).
monopoly-trade-offered = { $proposer } le ofreció a { $target } un intercambio: { $offer }.
monopoly-trade-completed = Comercio completado entre { $proposer } y { $target }: { $offer }.
monopoly-trade-declined = { $target } rechazó el comercio de { $proposer }: { $offer }.
monopoly-trade-cancelled = Comercio cancelado: { $offer }.
monopoly-free-parking-jackpot = { $player } recogió el premio mayor de estacionamiento gratuito de { $amount }.
monopoly-mortgaged-no-rent = { $player } aterrizó en { $property } hipotecado; no se debe pagar alquiler.
monopoly-builder-blocks-awarded = { $player } obtuvo los bloques de construcción { $amount } ({ $blocks } en total).
monopoly-builder-block-spent = { $player } gastó un bloque de construcción (queda { $blocks }).
monopoly-banking-transfer-success = { $from_player } transfirió { $amount } a { $to_player }.
monopoly-banking-transfer-failed = Error en la transferencia bancaria { $player } ({ $reason }).
monopoly-banking-balance-report = Saldo bancario { $player }: { $cash }.
monopoly-banking-ledger-report = Actividad bancaria reciente: { $entries }.
monopoly-banking-ledger-empty = Aún no hay transacciones bancarias.
monopoly-voice-command-error = Error de comando de voz: { $reason }.
monopoly-voice-command-accepted = Comando de voz aceptado: { $intent }.
monopoly-voice-command-repeat = Repitiendo el último código de respuesta bancaria: { $response }.
monopoly-voice-transfer-staged = Transferencia de voz por etapas: { $amount } a { $target }. Diga voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = { $player } pagó { $amount } en intereses de transferencia de hipoteca.

# Card engine
monopoly-card-drawn = { $player } sacó una carta { $deck }: { $card }.
monopoly-card-collect = { $player } recopiló { $amount }.
monopoly-card-pay = { $player } pagó { $amount }.
monopoly-card-move = { $player } se trasladó a { $space }.
monopoly-card-jail-free = { $player } recibió una tarjeta para salir de la cárcel.
monopoly-card-utility-roll = { $player } rodó { $die1 } + { $die2 } = { $total } para alquiler de servicios públicos.
monopoly-deck-chance = Oportunidad
monopoly-deck-community-chest = Cofre comunitario

# Card descriptions
monopoly-card-advance-to-go = Avanza hasta GO y recoge { $amount }
monopoly-card-advance-to-illinois-avenue = Avance hasta la avenida Illinois
monopoly-card-advance-to-st-charles-place = Avanza hasta St. Charles Place
monopoly-card-advance-to-nearest-utility = Avance hasta la empresa de servicios públicos más cercana
monopoly-card-advance-to-nearest-railroad = Avance hasta el ferrocarril más cercano y pague el doble de alquiler si es propietario.
monopoly-card-bank-dividend-50 = El banco le paga dividendo de { $amount }
monopoly-card-go-back-three = Retroceder 3 espacios
monopoly-card-go-to-jail = Ir directamente a la carcel
monopoly-card-general-repairs = Realice reparaciones generales en toda su propiedad: { $per_house } por casa, { $per_hotel } por hotel
monopoly-card-poor-tax-15 = Pagar impuestos pobres de { $amount }
monopoly-card-reading-railroad = Haga un viaje al ferrocarril de Reading
monopoly-card-boardwalk = Da un paseo por el malecón
monopoly-card-chairman-of-the-board = Presidente de la junta directiva, pague { $amount } a cada jugador.
monopoly-card-building-loan-matures = Su préstamo de construcción vence, cobre { $amount }
monopoly-card-crossword-competition = Ganaste un concurso de crucigramas, recopila { $amount }
monopoly-card-bank-error-200 = Error bancario a tu favor, cobra { $amount }
monopoly-card-doctor-fee-50 = Honorarios del médico, paga { $amount }
monopoly-card-sale-of-stock-50 = De la venta de stock obtienes { $amount }
monopoly-card-holiday-fund = El fondo de vacaciones vence, recibe { $amount }
monopoly-card-tax-refund-20 = Devolución del impuesto sobre la renta, recaudación { $amount }
monopoly-card-birthday = Es tu cumpleaños, recoge { $amount } de cada jugador.
monopoly-card-life-insurance = El seguro de vida vence, cobra { $amount }
monopoly-card-hospital-fees-100 = Pagar honorarios hospitalarios de { $amount }
monopoly-card-school-fees-50 = Pagar las tasas escolares de { $amount }
monopoly-card-consultancy-fee-25 = Reciba honorarios de consultoría { $amount }
monopoly-card-street-repairs = Se le evalúa por reparaciones de calles: { $per_house } por casa, { $per_hotel } por hotel
monopoly-card-beauty-contest-10 = Has ganado el segundo premio en un concurso de belleza, recoge { $amount }
monopoly-card-inherit-100 = Heredas { $amount }
monopoly-card-get-out-of-jail = Salir de la carcel gratis

# Board profile options
monopoly-set-board = Tablero: { $board }
monopoly-select-board = Seleccione un tablero de Monopoly
monopoly-option-changed-board = Tablero configurado en { $board }.
monopoly-set-board-rules-mode = Modo de reglas del tablero: { $mode }
monopoly-select-board-rules-mode = Seleccionar el modo de reglas del tablero
monopoly-option-changed-board-rules-mode = Modo de reglas del tablero configurado en { $mode }.

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
monopoly-view-active-deed = Ver escritura activa
monopoly-view-active-deed-space = Ver { $property }
monopoly-browse-all-deeds = Explorar todas las escrituras
monopoly-view-my-properties = Ver mis propiedades
monopoly-view-player-properties = Ver información del jugador
monopoly-view-selected-deed = Ver escritura seleccionada
monopoly-view-selected-owner-property-deed = Ver escritura del jugador seleccionado
monopoly-select-property-deed = Seleccione una escritura de propiedad
monopoly-select-player-properties = Selecciona un jugador
monopoly-select-player-property-deed = Seleccione una escritura de propiedad del jugador
monopoly-no-active-deed = No hay ninguna escritura activa para ver en este momento.
monopoly-no-deeds-available = No hay propiedades escriturables disponibles en este tablero.
monopoly-no-owned-properties = No hay propiedades propias disponibles para esta vista.
monopoly-no-players-with-properties = No hay jugadores disponibles.
monopoly-buy-for = Comprar para { $amount }
monopoly-you-have-no-owned-properties = No posees ninguna propiedad.
monopoly-player-has-no-owned-properties = { $player } no posee ninguna propiedad.
monopoly-owner-bank = Banco
monopoly-owner-unknown = Desconocido
monopoly-building-status-hotel = con hotel
monopoly-building-status-one-house = con 1 casa
monopoly-building-status-houses = con casas { $count }
monopoly-mortgaged-short = hipotecado
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = Marrón
monopoly-color-light_blue = Azul claro
monopoly-color-pink = Rosa
monopoly-color-orange = Naranja
monopoly-color-red = Rojo
monopoly-color-yellow = Amarillo
monopoly-color-green = Verde
monopoly-color-dark_blue = Azul oscuro
monopoly-deed-type-color-group = Tipo: grupo de colores { $color }
monopoly-deed-type-railroad = Tipo: Ferrocarril
monopoly-deed-type-utility = Tipo: Utilidad
monopoly-deed-type-generic = Tipo: { $kind }
monopoly-deed-purchase-price = Precio de compra: { $amount }
monopoly-deed-rent = Alquiler: { $amount }
monopoly-deed-full-set-rent = Si el propietario tiene un conjunto a todo color: { $amount }
monopoly-deed-rent-one-house = Con 1 casa: { $amount }
monopoly-deed-rent-houses = Con casas { $count }: { $amount }
monopoly-deed-rent-hotel = Con hotel: { $amount }
monopoly-deed-house-cost = Costo de la casa: { $amount }
monopoly-deed-railroad-rent = Alquiler con ferrocarriles { $count }: { $amount }
monopoly-deed-utility-one-owned = Si se posee una utilidad: tirada de dados 4x
monopoly-deed-utility-both-owned = Si ambos servicios públicos son propiedad: tirada de dados 10x
monopoly-deed-utility-base-rent = Alquiler base de servicios públicos (reserva heredada): { $amount }
monopoly-deed-mortgage-value = Valor de la hipoteca: { $amount }
monopoly-deed-unmortgage-cost = Costo de deshipoteca: { $amount }
monopoly-deed-owner = Propietario: { $owner }
monopoly-deed-current-buildings = Edificios actuales: { $buildings }
monopoly-deed-status-mortgaged = Estado: Hipotecado
monopoly-player-properties-label = { $player }, en { $space }, cuadrado { $position }
monopoly-player-properties-label-no-space = { $player }, cuadrado { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = { $tx_id } { $kind } falló ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = Compre { $property } de { $target } para { $amount }
monopoly-trade-offer-cash-for-property-summary = Oferta { $amount } a { $target } para { $property }
monopoly-trade-sell-property-summary = Vender { $property } a { $target } por { $amount }
monopoly-trade-offer-property-for-cash-summary = Oferta { $property } a { $target } para { $amount }
monopoly-trade-swap-summary = Intercambiar { $give_property } con { $target } por { $receive_property }
monopoly-trade-swap-plus-cash-summary = Intercambia { $give_property } + { $amount } con { $target } por { $receive_property }
monopoly-trade-swap-receive-cash-summary = Intercambiar { $give_property } por { $receive_property } + { $amount } de { $target }
monopoly-trade-buy-jail-card-summary = Compre tarjeta de cárcel de { $target } para { $amount }
monopoly-trade-sell-jail-card-summary = Vender tarjeta de cárcel a { $target } por { $amount }

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
