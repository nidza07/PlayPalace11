# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = Förinställning: { $preset }
monopoly-select-preset = Välj en Monopol-förinställning
monopoly-option-changed-preset = Förinställning inställd på { $preset }.

# Preset labels
monopoly-preset-classic-standard = Klassisk och temastandard
monopoly-preset-junior = Monopol Junior
monopoly-preset-junior-modern = Monopol Junior (Modern)
monopoly-preset-junior-legacy = Monopol Junior (Legacy)
monopoly-preset-cheaters = Monopol Cheaters Edition
monopoly-preset-electronic-banking = Elektronisk bankverksamhet
monopoly-preset-voice-banking = Röstbank
monopoly-preset-sore-losers = Monopol för Sore Losers
monopoly-preset-speed = Monopol Speed
monopoly-preset-builder = Monopolbyggare
monopoly-preset-city = Monopolstad
monopoly-preset-bid-card-game = Monopolbud
monopoly-preset-deal-card-game = Monopolavtal
monopoly-preset-knockout = Monopol Knockout
monopoly-preset-free-parking-jackpot = Gratis parkering Jackpot

# Scaffold status
monopoly-announce-preset = Meddela aktuell förinställning
monopoly-current-preset = Aktuell förinställning: { $preset } ({ $count }-utgåvor).
monopoly-scaffold-started = Monopolställning började med { $preset } ({ $count }-utgåvor).

# Turn actions
monopoly-roll-dice = Kasta tärning
monopoly-buy-property = Köp fastighet
monopoly-banking-balance = Kontrollera banksaldo
monopoly-banking-transfer = Överföra pengar
monopoly-banking-ledger = Granska bankreskontra
monopoly-voice-command = Röstkommando
monopoly-cheaters-claim-reward = Gör anspråk på fuskbelöning
monopoly-end-turn = Avsluta sväng

# Turn validation
monopoly-roll-first = Du måste rulla först.
monopoly-already-rolled = Du har redan rullat den här svängen.
monopoly-no-property-to-buy = Det finns ingen fastighet att köpa just nu.
monopoly-property-owned = Den fastigheten ägs redan.
monopoly-not-enough-cash = Du har inte tillräckligt med kontanter.
monopoly-action-disabled-for-preset = Denna åtgärd är inaktiverad för den valda förinställningen.
monopoly-buy-disabled = Att köpa egendom direkt är inaktiverat för denna förinställning.

# Turn events
monopoly-pass-go = { $player } klarade GO och samlade { $amount }.
monopoly-roll-result = { $player } rullade { $die1 } + { $die2 } = { $total } och landade på { $space }.
monopoly-roll-only = { $player } rullade { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = Du rullade { $die1 } + { $die2 } = { $total } och landade på { $space }.
monopoly-player-roll-result = { $player } rullade { $die1 } + { $die2 } = { $total } och landade på { $space }.
monopoly-you-roll-only = Du rullade { $die1 } + { $die2 } = { $total }.
monopoly-player-roll-only = { $player } rullade { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = Du rullade { $die1 } + { $die2 } = { $total }. Dubbel!
monopoly-player-roll-only-doubles = { $player } rullade { $die1 } + { $die2 } = { $total }. Dubbel!
monopoly-property-available = { $property } är tillgängligt för { $price }.
monopoly-property-bought = { $player } köpte { $property } för { $price }.
monopoly-rent-paid = { $player } betalade { $amount } i hyra till { $owner } för { $property }.
monopoly-player-paid-player = { $player } betalade { $amount } till { $target }.
monopoly-you-completed-color-set = Du äger nu alla { $group }-egenskaper.
monopoly-player-completed-color-set = { $player } äger nu alla { $group }-fastigheter.
monopoly-you-completed-railroads = Du äger nu alla järnvägar.
monopoly-player-completed-railroads = { $player } äger nu alla järnvägar.
monopoly-you-completed-utilities = Du äger nu alla verktyg.
monopoly-player-completed-utilities = { $player } äger nu alla verktyg.
monopoly-landed-owned = { $player } landade på sin egen fastighet: { $property }.
monopoly-tax-paid = { $player } betalade { $amount } för { $tax }.
monopoly-go-to-jail = { $player } hamnar i fängelse (flyttad till { $space }).
monopoly-bankrupt-player = Du är i konkurs och ur spelet.
monopoly-player-bankrupt = { $player } är i konkurs. Borgenär: { $creditor }.
monopoly-winner-by-bankruptcy = { $player } vinner genom konkurs med { $cash } kontanter kvar.
monopoly-winner-by-cash = { $player } vinner med den högsta kontantsumman: { $cash }.
monopoly-city-winner-by-value = { $player } vinner Monopol City med slutvärdet { $total }.

# Additional actions
monopoly-auction-property = Auktionsfastighet
monopoly-auction-bid = Lägg auktionsbud
monopoly-auction-pass = Passera på auktion
monopoly-mortgage-property = Inteckningsfastighet
monopoly-unmortgage-property = Belåna egendom
monopoly-build-house = Bygg hus eller hotell
monopoly-sell-house = Sälj hus eller hotell
monopoly-offer-trade = Erbjud handel
monopoly-accept-trade = Acceptera handel
monopoly-decline-trade = Minska handeln
monopoly-read-cash = Läs kontanter
monopoly-pay-bail = Betala borgen
monopoly-use-jail-card = Använd ett få-ut-ur-fängelse-kort
monopoly-cash-report = { $cash } kontant.
monopoly-property-amount-option = { $property } för { $amount }
monopoly-banking-transfer-option = Överför { $amount } till { $target }

# Additional prompts
monopoly-select-property-mortgage = Välj en fastighet att belåna
monopoly-select-property-unmortgage = Välj en fastighet att belåna
monopoly-select-property-build = Välj en fastighet att bygga på
monopoly-select-property-sell = Välj en fastighet att sälja från
monopoly-select-trade-offer = Välj ett handelserbjudande
monopoly-select-auction-bid = Välj ditt auktionsbud
monopoly-select-banking-transfer = Välj en överföring
monopoly-select-voice-command = Ange ett röstkommando som börjar med voice:

# Additional validation
monopoly-no-property-to-auction = Det finns ingen egendom att auktionera ut just nu.
monopoly-auction-active = Lös den aktiva auktionen först.
monopoly-no-auction-active = Det pågår ingen auktion.
monopoly-not-your-auction-turn = Det är inte din tur i auktionen.
monopoly-no-mortgage-options = Du har inga fastigheter tillgängliga att belåna.
monopoly-no-unmortgage-options = Du har inga intecknade fastigheter att lösa.
monopoly-no-build-options = Du har inga fastigheter att bygga på.
monopoly-no-sell-options = Du har inga fastigheter med byggnader tillgängliga att sälja.
monopoly-no-trade-options = Du har inga giltiga affärer att erbjuda just nu.
monopoly-no-trade-pending = Det finns ingen väntande handel för dig.
monopoly-trade-pending = En affär väntar redan.
monopoly-trade-no-longer-valid = Den handeln är inte längre giltig.
monopoly-not-in-jail = Du sitter inte i fängelse.
monopoly-no-jail-card = Du har inte ett få-ut-ur-fängelse-kort.
monopoly-roll-again-required = Du rullade dubblar och måste rulla igen.
monopoly-resolve-property-first = Lös det pågående fastighetsbeslutet först.

# Additional turn events
monopoly-roll-again = { $player } rullade dubblar och får ytterligare ett kast.
monopoly-you-roll-again = Du rullade dubblar och får ytterligare ett kast.
monopoly-player-roll-again = { $player } rullade dubblar och får ytterligare ett kast.
monopoly-jail-roll-doubles = { $player } rullade dubbel ({ $die1 } och { $die2 }) och lämnar fängelse.
monopoly-you-jail-roll-doubles = Du kastade dubbel ({ $die1 } och { $die2 }) och lämnar fängelset.
monopoly-player-jail-roll-doubles = { $player } rullade dubbel ({ $die1 } och { $die2 }) och lämnar fängelse.
monopoly-jail-roll-failed = { $player } rullade { $die1 } och { $die2 } i fängelse (försök { $attempts }).
monopoly-bail-paid = { $player } betalade { $amount } borgen.
monopoly-three-doubles-jail = { $player } kastade tre dubblar i en omgång och skickas till fängelse.
monopoly-you-three-doubles-jail = Du kastade tre dubblar i en omgång och skickas till fängelse.
monopoly-player-three-doubles-jail = { $player } kastade tre dubblar i en omgång och skickas till fängelse.
monopoly-jail-card-used = { $player } använde ett get-out-of-jail-kort.
monopoly-sore-loser-rebate = { $player } fick en hård förlorarrabatt på { $amount }.
monopoly-cheaters-early-end-turn-blocked = { $player } försökte avsluta turnen tidigt och betalade en fuskstraff på { $amount }.
monopoly-cheaters-payment-avoidance-blocked = { $player } utlöste en fuskarnas betalningsstraff på { $amount }.
monopoly-cheaters-reward-granted = { $player } gjorde anspråk på en fuskbelöning på { $amount }.
monopoly-cheaters-reward-unavailable = { $player } har redan gjort anspråk på att fuskarna belönar denna tur.

# Auctions and mortgages
monopoly-auction-no-bids = Inga bud på { $property }. Den förblir osåld.
monopoly-auction-started = Auktionen startade för { $property } (öppningsbud: { $amount }).
monopoly-auction-turn = Auktionstur: { $player } för att agera på { $property } (nuvarande bud: { $amount }).
monopoly-auction-bid-placed = { $player } bud { $amount } för { $property }.
monopoly-auction-pass-event = { $player } har gått vidare till { $property }.
monopoly-auction-won = { $player } vann auktionen för { $property } på { $amount }.
monopoly-property-mortgaged = { $player } intecknade { $property } för { $amount }.
monopoly-property-unmortgaged = { $player } obelånad { $property } för { $amount }.
monopoly-house-built-house = { $player } byggde ett hus på { $property } för { $amount }. Den har nu { $level }.
monopoly-house-built-hotel = { $player } byggde ett hotell på { $property } för { $amount }.
monopoly-house-sold = { $player } sålde en byggnad på { $property } för { $amount } (nivå: { $level }).
monopoly-trade-offered = { $proposer } erbjöd { $target } en handel: { $offer }.
monopoly-trade-completed = Handel genomförd mellan { $proposer } och { $target }: { $offer }.
monopoly-trade-declined = { $target } avböjde handel från { $proposer }: { $offer }.
monopoly-trade-cancelled = Handeln avbruten: { $offer }.
monopoly-free-parking-jackpot = { $player } samlade in gratis parkeringsjackpotten från { $amount }.
monopoly-mortgaged-no-rent = { $player } landade på intecknade { $property }; ingen hyra utgår.
monopoly-builder-blocks-awarded = { $player } fick { $amount } byggblock ({ $blocks } totalt).
monopoly-builder-block-spent = { $player } använde ett byggblock ({ $blocks } återstår).
monopoly-banking-transfer-success = { $from_player } överförde { $amount } till { $to_player }.
monopoly-banking-transfer-failed = { $player } banköverföring misslyckades ({ $reason }).
monopoly-banking-balance-report = { $player } banksaldo: { $cash }.
monopoly-banking-ledger-report = Senaste bankverksamhet: { $entries }.
monopoly-banking-ledger-empty = Inga banktransaktioner ännu.
monopoly-voice-command-error = Röstkommandofel: { $reason }.
monopoly-voice-command-accepted = Röstkommando accepterat: { $intent }.
monopoly-voice-command-repeat = Upprepa senaste banksvarskod: { $response }.
monopoly-voice-transfer-staged = Röstöverföring iscensatt: { $amount } till { $target }. Säg voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = { $player } betalade { $amount } i bolåneränta.

# Card engine
monopoly-card-drawn = { $player } drog ett { $deck }-kort: { $card }.
monopoly-card-collect = { $player } samlade in { $amount }.
monopoly-card-pay = { $player } betalade { $amount }.
monopoly-card-move = { $player } flyttade till { $space }.
monopoly-card-jail-free = { $player } fick ett kort för att komma ut ur fängelset.
monopoly-card-utility-roll = { $player } rullade { $die1 } + { $die2 } = { $total } för brukshyra.
monopoly-deck-chance = Chans
monopoly-deck-community-chest = Gemenskapskassa

# Card descriptions
monopoly-card-advance-to-go = Avancera till GO och samla { $amount }
monopoly-card-advance-to-illinois-avenue = Avancera till Illinois Avenue
monopoly-card-advance-to-st-charles-place = Avancera till St. Charles Place
monopoly-card-advance-to-nearest-utility = Avancera till närmaste Utility
monopoly-card-advance-to-nearest-railroad = Avancera till närmaste järnväg och betala dubbel hyra om ägs
monopoly-card-bank-dividend-50 = Banken ger dig utdelning på { $amount }
monopoly-card-go-back-three = Gå tillbaka 3 platser
monopoly-card-go-to-jail = Gå direkt till fängelse
monopoly-card-general-repairs = Gör allmänna reparationer på all din fastighet: { $per_house } per hus, { $per_hotel } per hotell
monopoly-card-poor-tax-15 = Betala dålig skatt på { $amount }
monopoly-card-reading-railroad = Ta en tur till Reading Railroad
monopoly-card-boardwalk = Ta en promenad på Boardwalk
monopoly-card-chairman-of-the-board = Styrelseordförande, betala { $amount } till varje spelare
monopoly-card-building-loan-matures = Ditt bygglån förfaller, hämta { $amount }
monopoly-card-crossword-competition = Du vann en korsordstävling, samla { $amount }
monopoly-card-bank-error-200 = Bankfel till din fördel, samla { $amount }
monopoly-card-doctor-fee-50 = Läkararvode, betala { $amount }
monopoly-card-sale-of-stock-50 = Från försäljning av lager får du { $amount }
monopoly-card-holiday-fund = Semesterfonden förfaller, ta emot { $amount }
monopoly-card-tax-refund-20 = Återbetalning av inkomstskatt, hämta { $amount }
monopoly-card-birthday = Det är din födelsedag, samla { $amount } från alla spelare
monopoly-card-life-insurance = Livförsäkring förfaller, hämta { $amount }
monopoly-card-hospital-fees-100 = Betala sjukhusavgifter på { $amount }
monopoly-card-school-fees-50 = Betala skolavgifter på { $amount }
monopoly-card-consultancy-fee-25 = Få { $amount } konsultavgift
monopoly-card-street-repairs = Du bedöms för gatureparationer: { $per_house } per hus, { $per_hotel } per hotell
monopoly-card-beauty-contest-10 = Du har vunnit andra pris i en skönhetstävling, samla { $amount }
monopoly-card-inherit-100 = Du ärver { $amount }
monopoly-card-get-out-of-jail = Gå ut ur fängelset gratis

# Board profile options
monopoly-set-board = Styrelse: { $board }
monopoly-select-board = Välj en monopolbräda
monopoly-option-changed-board = Styrelsen inställd på { $board }.
monopoly-set-board-rules-mode = Styrelsereglerläge: { $mode }
monopoly-select-board-rules-mode = Välj styrelsereglerläge
monopoly-option-changed-board-rules-mode = Styrelsereglerläge inställt på { $mode }.

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
monopoly-view-active-deed = Se aktiv gärning
monopoly-view-active-deed-space = Visa { $property }
monopoly-browse-all-deeds = Bläddra bland alla handlingar
monopoly-view-my-properties = Se mina fastigheter
monopoly-view-player-properties = Se spelarinformation
monopoly-view-selected-deed = Visa vald gärning
monopoly-view-selected-owner-property-deed = Se vald spelarhandling
monopoly-select-property-deed = Välj en fastighetshandling
monopoly-select-player-properties = Välj en spelare
monopoly-select-player-property-deed = Välj en spelares egendomshandling
monopoly-no-active-deed = Det finns ingen aktiv handling att se just nu.
monopoly-no-deeds-available = Inga deed-kapabla egenskaper är tillgängliga på denna tavla.
monopoly-no-owned-properties = Inga ägda fastigheter är tillgängliga för den här vyn.
monopoly-no-players-with-properties = Inga spelare är tillgängliga.
monopoly-buy-for = Köp för { $amount }
monopoly-you-have-no-owned-properties = Du äger inga fastigheter.
monopoly-player-has-no-owned-properties = { $player } äger inga fastigheter.
monopoly-owner-bank = Bank
monopoly-owner-unknown = Okänd
monopoly-building-status-hotel = med hotell
monopoly-building-status-one-house = med 1 hus
monopoly-building-status-houses = med { $count } hus
monopoly-mortgaged-short = intecknat
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = Brun
monopoly-color-light_blue = Ljusblå
monopoly-color-pink = Rosa
monopoly-color-orange = Orange
monopoly-color-red = Röd
monopoly-color-yellow = Gul
monopoly-color-green = Grön
monopoly-color-dark_blue = Mörkblå
monopoly-deed-type-color-group = Typ: { $color } färggrupp
monopoly-deed-type-railroad = Typ: Järnväg
monopoly-deed-type-utility = Typ: Verktyg
monopoly-deed-type-generic = Typ: { $kind }
monopoly-deed-purchase-price = Inköpspris: { $amount }
monopoly-deed-rent = Hyra: { $amount }
monopoly-deed-full-set-rent = Om ägaren har fullfärgsuppsättning: { $amount }
monopoly-deed-rent-one-house = Med 1 hus: { $amount }
monopoly-deed-rent-houses = Med { $count }-hus: { $amount }
monopoly-deed-rent-hotel = Med hotell: { $amount }
monopoly-deed-house-cost = Huskostnad: { $amount }
monopoly-deed-railroad-rent = Hyr med { $count } järnvägar: { $amount }
monopoly-deed-utility-one-owned = Om ett verktyg ägs: 4x tärningskast
monopoly-deed-utility-both-owned = Om båda verktygen ägs: 10x tärningskast
monopoly-deed-utility-base-rent = Utility-bashyra (legacy reserv): { $amount }
monopoly-deed-mortgage-value = Bolånevärde: { $amount }
monopoly-deed-unmortgage-cost = Unmorgage kostnad: { $amount }
monopoly-deed-owner = Ägare: { $owner }
monopoly-deed-current-buildings = Nuvarande byggnader: { $buildings }
monopoly-deed-status-mortgaged = Status: Intecknad
monopoly-player-properties-label = { $player }, på { $space }, fyrkantig { $position }
monopoly-player-properties-label-no-space = { $player }, fyrkantig { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = { $tx_id } { $kind } misslyckades ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = Köp { $property } från { $target } för { $amount }
monopoly-trade-offer-cash-for-property-summary = Erbjud { $amount } till { $target } för { $property }
monopoly-trade-sell-property-summary = Sälj { $property } till { $target } för { $amount }
monopoly-trade-offer-property-for-cash-summary = Erbjud { $property } till { $target } för { $amount }
monopoly-trade-swap-summary = Byt { $give_property } med { $target } mot { $receive_property }
monopoly-trade-swap-plus-cash-summary = Byt { $give_property } + { $amount } med { $target } mot { $receive_property }
monopoly-trade-swap-receive-cash-summary = Byt { $give_property } mot { $receive_property } + { $amount } från { $target }
monopoly-trade-buy-jail-card-summary = Köp fängelsekort från { $target } för { $amount }
monopoly-trade-sell-jail-card-summary = Sälj fängelsekort till { $target } för { $amount }

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
