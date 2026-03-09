# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = Урьдчилан тохируулсан: { $preset }
monopoly-select-preset = Монополь урьдчилсан тохиргоог сонгоно уу
monopoly-option-changed-preset = { $preset } гэж урьдчилан тохируулсан.

# Preset labels
monopoly-preset-classic-standard = Сонгодог ба сэдэвчилсэн стандарт
monopoly-preset-junior = Monopoly Junior
monopoly-preset-junior-modern = Monopoly Junior (Орчин үеийн)
monopoly-preset-junior-legacy = Monopoly Junior (Legacy)
monopoly-preset-cheaters = Monopoly Cheaters Edition
monopoly-preset-electronic-banking = Цахим банк
monopoly-preset-voice-banking = Дуут банк
monopoly-preset-sore-losers = Өвдөж хохирсон хүмүүст зориулсан монополь
monopoly-preset-speed = Монополь хурд
monopoly-preset-builder = Монополь бүтээгч
monopoly-preset-city = Монополь хот
monopoly-preset-bid-card-game = Монополь тендер
monopoly-preset-deal-card-game = Монополийн гэрээ
monopoly-preset-knockout = Монополь нокаут
monopoly-preset-free-parking-jackpot = Үнэгүй зогсоол

# Scaffold status
monopoly-announce-preset = Одоогийн урьдчилан тохируулгыг зарлана
monopoly-current-preset = Одоогийн урьдчилан тохируулсан: { $preset } ({ $count } хувилбарууд).
monopoly-scaffold-started = Монополийн шат нь { $preset } ({ $count } хувилбарууд) -аар эхэлсэн.

# Turn actions
monopoly-roll-dice = Шоо өнхрүүл
monopoly-buy-property = Үл хөдлөх хөрөнгө худалдаж авах
monopoly-banking-balance = Банкны үлдэгдлийг шалгана уу
monopoly-banking-transfer = Мөнгө шилжүүлэх
monopoly-banking-ledger = Банкны дэвтэртэй танилцах
monopoly-voice-command = Дуут тушаал
monopoly-cheaters-claim-reward = Хууран мэхлэлтийн шагналыг нэхэмжлэх
monopoly-end-turn = Төгсгөлийн эргэлт

# Turn validation
monopoly-roll-first = Та эхлээд өнхрөх хэрэгтэй.
monopoly-already-rolled = Та энэ эргэлтийг аль хэдийн эргүүлсэн.
monopoly-no-property-to-buy = Яг одоо худалдаж авах хөрөнгө алга.
monopoly-property-owned = Тэр өмчийг аль хэдийн эзэмшиж байна.
monopoly-not-enough-cash = Танд хангалттай мөнгө байхгүй.
monopoly-action-disabled-for-preset = Сонгосон урьдчилсан тохиргоонд энэ үйлдлийг идэвхгүй болгосон.
monopoly-buy-disabled = Энэ урьдчилсан тохиргоонд үл хөдлөх хөрөнгийг шууд худалдаж авахыг идэвхгүй болгосон.

# Turn events
monopoly-pass-go = { $player } GO-г давж, { $amount } цуглуулсан.
monopoly-roll-result = { $player } { $die1 } + { $die2 } = { $total }-г өнхрүүлж, { $space } дээр буув.
monopoly-roll-only = { $player } цувисан { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = Та { $die1 } + { $die2 } = { $total } өнхрүүлэн { $space } дээр газардлаа.
monopoly-player-roll-result = { $player } { $die1 } + { $die2 } = { $total }-г өнхрүүлж, { $space } дээр буув.
monopoly-you-roll-only = Та { $die1 } + { $die2 } = { $total } өнхрүүлэв.
monopoly-player-roll-only = { $player } цувисан { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = Та { $die1 } + { $die2 } = { $total } өнхрүүлэв. Давхарууд!
monopoly-player-roll-only-doubles = { $player } цувисан { $die1 } + { $die2 } = { $total }. Давхарууд!
monopoly-property-available = { $price }-д { $property } ашиглах боломжтой.
monopoly-property-bought = { $player } { $price }-д зориулж { $property } худалдаж авсан.
monopoly-rent-paid = { $player } нь { $amount }-ийг { $owner }-д { $property }-ийн түрээсээр төлсөн.
monopoly-player-paid-player = { $player } { $amount }-ийг { $target }-д төлсөн.
monopoly-you-completed-color-set = Та одоо { $group }-ийн бүх өмчийг эзэмшиж байна.
monopoly-player-completed-color-set = { $player } одоо { $group }-ийн бүх өмчийг эзэмшдэг.
monopoly-you-completed-railroads = Та одоо бүх төмөр замыг эзэмшиж байна.
monopoly-player-completed-railroads = { $player } одоо бүх төмөр замыг эзэмшдэг.
monopoly-you-completed-utilities = Та одоо бүх хэрэгслийг эзэмшдэг.
monopoly-player-completed-utilities = { $player } одоо бүх хэрэгслийг эзэмшдэг.
monopoly-landed-owned = { $player } өөрийн өмч дээр газардсан: { $property }.
monopoly-tax-paid = { $player } { $tax }-д { $amount } төлсөн.
monopoly-go-to-jail = { $player } шоронд ордог ({ $space } руу шилжсэн).
monopoly-bankrupt-player = Та дампуурч, тоглоомоос гарлаа.
monopoly-player-bankrupt = { $player } дампуурлаа. Зээлдэгч: { $creditor }.
monopoly-winner-by-bankruptcy = { $cash } бэлэн мөнгө үлдсэн байхад { $player } дампуурснаар ялсан.
monopoly-winner-by-cash = { $player } хамгийн их мөнгөн дүнгээр хожиж байна: { $cash }.
monopoly-city-winner-by-value = { $player } { $total } эцсийн үнэ цэнээр Монополь хотыг хожлоо.

# Additional actions
monopoly-auction-property = Дуудлага худалдааны үл хөдлөх хөрөнгө
monopoly-auction-bid = Дуудлага худалдаанд оруулах
monopoly-auction-pass = Дуудлага худалдаанд оруулах
monopoly-mortgage-property = Ипотекийн үл хөдлөх хөрөнгө
monopoly-unmortgage-property = Үл хөдлөх хөрөнгийг барьцаалах
monopoly-build-house = Байшин эсвэл зочид буудал барих
monopoly-sell-house = Байшин эсвэл зочид буудал зарна
monopoly-offer-trade = Худалдаа санал болгох
monopoly-accept-trade = Худалдааг зөвшөөр
monopoly-decline-trade = Худалдааг багасгах
monopoly-read-cash = Бэлэн мөнгө унш
monopoly-pay-bail = Батлан ​​даалтад өгөх
monopoly-use-jail-card = Шоронгоос гарах картыг ашигла
monopoly-cash-report = { $cash } бэлнээр.
monopoly-property-amount-option = { $amount }-д зориулсан { $property }
monopoly-banking-transfer-option = { $amount }-г { $target } руу шилжүүл

# Additional prompts
monopoly-select-property-mortgage = Ипотекийн үл хөдлөх хөрөнгөө сонго
monopoly-select-property-unmortgage = Барьцаанаас гаргах үл хөдлөх хөрөнгөө сонго
monopoly-select-property-build = Барилга барих үл хөдлөх хөрөнгийг сонгоно уу
monopoly-select-property-sell = Худалдах үл хөдлөх хөрөнгөө сонго
monopoly-select-trade-offer = Худалдааны саналыг сонгоно уу
monopoly-select-auction-bid = Дуудлага худалдааны саналаа сонгоно уу
monopoly-select-banking-transfer = Шилжүүлгийг сонгоно уу
monopoly-select-voice-command = voice:-ээр эхэлсэн дуут тушаал оруулна уу

# Additional validation
monopoly-no-property-to-auction = Одоогоор дуудлага худалдаанд оруулах эд хөрөнгө байхгүй.
monopoly-auction-active = Идэвхтэй дуудлага худалдааг эхлээд шийд.
monopoly-no-auction-active = Дуудлага худалдаа хийгээгүй байна.
monopoly-not-your-auction-turn = Дуудлага худалдаанд орох ээлж биш.
monopoly-no-mortgage-options = Танд ипотекийн зээл авах боломжтой үл хөдлөх хөрөнгө байхгүй.
monopoly-no-unmortgage-options = Танд үл хөдлөх хөрөнгө барьцаалах боломжгүй.
monopoly-no-build-options = Танд барих боломжтой үл хөдлөх хөрөнгө байхгүй.
monopoly-no-sell-options = Танд зарах боломжтой барилга байгууламж байхгүй.
monopoly-no-trade-options = Танд яг одоо санал болгох хүчинтэй арилжаа алга.
monopoly-no-trade-pending = Таны хувьд хүлээгдэж буй арилжаа байхгүй.
monopoly-trade-pending = Худалдаа аль хэдийн хүлээгдэж байна.
monopoly-trade-no-longer-valid = Тэр наймаа хүчингүй болсон.
monopoly-not-in-jail = Та шоронд ороогүй байна.
monopoly-no-jail-card = Танд шоронгоос гарах карт байхгүй.
monopoly-roll-again-required = You rolled doubles and must roll again.
monopoly-resolve-property-first = Юуны өмнө хүлээгдэж буй үл хөдлөх хөрөнгийн асуудлыг шийдвэрлэ.

# Additional turn events
monopoly-roll-again = { $player } өнхрөх давхар болж, дахин нэг өнхрөх болно.
monopoly-you-roll-again = You rolled doubles and get another roll.
monopoly-player-roll-again = { $player } rolled doubles and gets another roll.
monopoly-jail-roll-doubles = { $player } rolled doubles ({ $die1 } and { $die2 }) and leaves jail.
monopoly-you-jail-roll-doubles = You rolled doubles ({ $die1 } and { $die2 }) and leave jail.
monopoly-player-jail-roll-doubles = { $player } rolled doubles ({ $die1 } and { $die2 }) and leaves jail.
monopoly-jail-roll-failed = { $player } rolled { $die1 } and { $die2 } in jail (attempt { $attempts }).
monopoly-bail-paid = { $player } paid { $amount } bail.
monopoly-three-doubles-jail = { $player } rolled three doubles in one turn and is sent to jail.
monopoly-you-three-doubles-jail = You rolled three doubles in one turn and are sent to jail.
monopoly-player-three-doubles-jail = { $player } rolled three doubles in one turn and is sent to jail.
monopoly-jail-card-used = { $player } used a get-out-of-jail card.
monopoly-sore-loser-rebate = { $player } received a sore loser rebate of { $amount }.
monopoly-cheaters-early-end-turn-blocked = { $player } tried to end the turn early and paid a cheating penalty of { $amount }.
monopoly-cheaters-payment-avoidance-blocked = { $player } triggered a cheaters payment penalty of { $amount }.
monopoly-cheaters-reward-granted = { $player } claimed a cheaters reward of { $amount }.
monopoly-cheaters-reward-unavailable = { $player } already claimed the cheaters reward this turn.

# Auctions and mortgages
monopoly-auction-no-bids = No bids for { $property }. It remains unsold.
monopoly-auction-started = Auction started for { $property } (opening bid: { $amount }).
monopoly-auction-turn = Auction turn: { $player } to act on { $property } (current bid: { $amount }).
monopoly-auction-bid-placed = { $player } bid { $amount } for { $property }.
monopoly-auction-pass-event = { $player } passed on { $property }.
monopoly-auction-won = { $player } won the auction for { $property } at { $amount }.
monopoly-property-mortgaged = { $player } mortgaged { $property } for { $amount }.
monopoly-property-unmortgaged = { $player } unmortgaged { $property } for { $amount }.
monopoly-house-built-house = { $player } built a house on { $property } for { $amount }. It now has { $level }.
monopoly-house-built-hotel = { $player } built a hotel on { $property } for { $amount }.
monopoly-house-sold = { $player } sold a building on { $property } for { $amount } (level: { $level }).
monopoly-trade-offered = { $proposer } offered { $target } a trade: { $offer }.
monopoly-trade-completed = Trade completed between { $proposer } and { $target }: { $offer }.
monopoly-trade-declined = { $target } declined trade from { $proposer }: { $offer }.
monopoly-trade-cancelled = Trade cancelled: { $offer }.
monopoly-free-parking-jackpot = { $player } collected the Free Parking jackpot of { $amount }.
monopoly-mortgaged-no-rent = { $player } landed on mortgaged { $property }; no rent is due.
monopoly-builder-blocks-awarded = { $player } gained { $amount } builder blocks ({ $blocks } total).
monopoly-builder-block-spent = { $player } spent a builder block ({ $blocks } remaining).
monopoly-banking-transfer-success = { $from_player } transferred { $amount } to { $to_player }.
monopoly-banking-transfer-failed = { $player } bank transfer failed ({ $reason }).
monopoly-banking-balance-report = { $player } bank balance: { $cash }.
monopoly-banking-ledger-report = Recent banking activity: { $entries }.
monopoly-banking-ledger-empty = No banking transactions yet.
monopoly-voice-command-error = Voice command error: { $reason }.
monopoly-voice-command-accepted = Voice command accepted: { $intent }.
monopoly-voice-command-repeat = Repeating last banking response code: { $response }.
monopoly-voice-transfer-staged = Voice transfer staged: { $amount } to { $target }. Say voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = { $player } paid { $amount } in mortgage transfer interest.

# Card engine
monopoly-card-drawn = { $player } drew a { $deck } card: { $card }.
monopoly-card-collect = { $player } collected { $amount }.
monopoly-card-pay = { $player } paid { $amount }.
monopoly-card-move = { $player } moved to { $space }.
monopoly-card-jail-free = { $player } received a get-out-of-jail card.
monopoly-card-utility-roll = { $player } rolled { $die1 } + { $die2 } = { $total } for utility rent.
monopoly-deck-chance = Chance
monopoly-deck-community-chest = Community Chest

# Card descriptions
monopoly-card-advance-to-go = Advance to GO and collect { $amount }
monopoly-card-advance-to-illinois-avenue = Advance to Illinois Avenue
monopoly-card-advance-to-st-charles-place = Advance to St. Charles Place
monopoly-card-advance-to-nearest-utility = Advance to the nearest Utility
monopoly-card-advance-to-nearest-railroad = Advance to the nearest Railroad and pay double rent if owned
monopoly-card-bank-dividend-50 = Bank pays you dividend of { $amount }
monopoly-card-go-back-three = Go back 3 spaces
monopoly-card-go-to-jail = Go directly to jail
monopoly-card-general-repairs = Make general repairs on all your property: { $per_house } per house, { $per_hotel } per hotel
monopoly-card-poor-tax-15 = Pay poor tax of { $amount }
monopoly-card-reading-railroad = Take a trip to Reading Railroad
monopoly-card-boardwalk = Take a walk on Boardwalk
monopoly-card-chairman-of-the-board = Chairman of the Board, pay { $amount } to every player
monopoly-card-building-loan-matures = Your building loan matures, collect { $amount }
monopoly-card-crossword-competition = You won a crossword competition, collect { $amount }
monopoly-card-bank-error-200 = Bank error in your favor, collect { $amount }
monopoly-card-doctor-fee-50 = Doctor's fee, pay { $amount }
monopoly-card-sale-of-stock-50 = From sale of stock you get { $amount }
monopoly-card-holiday-fund = Holiday fund matures, receive { $amount }
monopoly-card-tax-refund-20 = Income tax refund, collect { $amount }
monopoly-card-birthday = It is your birthday, collect { $amount } from every player
monopoly-card-life-insurance = Life insurance matures, collect { $amount }
monopoly-card-hospital-fees-100 = Pay hospital fees of { $amount }
monopoly-card-school-fees-50 = Pay school fees of { $amount }
monopoly-card-consultancy-fee-25 = Receive { $amount } consultancy fee
monopoly-card-street-repairs = You are assessed for street repairs: { $per_house } per house, { $per_hotel } per hotel
monopoly-card-beauty-contest-10 = You have won second prize in a beauty contest, collect { $amount }
monopoly-card-inherit-100 = You inherit { $amount }
monopoly-card-get-out-of-jail = Get out of jail free

# Board profile options
monopoly-set-board = Board: { $board }
monopoly-select-board = Select a Monopoly board
monopoly-option-changed-board = Board set to { $board }.
monopoly-set-board-rules-mode = Board rules mode: { $mode }
monopoly-select-board-rules-mode = Select board rules mode
monopoly-option-changed-board-rules-mode = Board rules mode set to { $mode }.

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
monopoly-view-active-deed = View active deed
monopoly-view-active-deed-space = View { $property }
monopoly-browse-all-deeds = Browse all deeds
monopoly-view-my-properties = View my properties
monopoly-view-player-properties = View player info
monopoly-view-selected-deed = View selected deed
monopoly-view-selected-owner-property-deed = View selected player deed
monopoly-select-property-deed = Select a property deed
monopoly-select-player-properties = Select a player
monopoly-select-player-property-deed = Select a player property deed
monopoly-no-active-deed = There is no active deed to view right now.
monopoly-no-deeds-available = No deed-capable properties are available on this board.
monopoly-no-owned-properties = No owned properties are available for this view.
monopoly-no-players-with-properties = No players are available.
monopoly-buy-for = Buy for { $amount }
monopoly-you-have-no-owned-properties = You do not own any properties.
monopoly-player-has-no-owned-properties = { $player } does not own any properties.
monopoly-owner-bank = Bank
monopoly-owner-unknown = Unknown
monopoly-building-status-hotel = with hotel
monopoly-building-status-one-house = with 1 house
monopoly-building-status-houses = with { $count } houses
monopoly-mortgaged-short = mortgaged
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = Brown
monopoly-color-light_blue = Light Blue
monopoly-color-pink = Pink
monopoly-color-orange = Orange
monopoly-color-red = Red
monopoly-color-yellow = Yellow
monopoly-color-green = Green
monopoly-color-dark_blue = Dark Blue
monopoly-deed-type-color-group = Type: { $color } color group
monopoly-deed-type-railroad = Type: Railroad
monopoly-deed-type-utility = Type: Utility
monopoly-deed-type-generic = Type: { $kind }
monopoly-deed-purchase-price = Purchase price: { $amount }
monopoly-deed-rent = Rent: { $amount }
monopoly-deed-full-set-rent = If owner has full color set: { $amount }
monopoly-deed-rent-one-house = With 1 house: { $amount }
monopoly-deed-rent-houses = With { $count } houses: { $amount }
monopoly-deed-rent-hotel = With hotel: { $amount }
monopoly-deed-house-cost = House cost: { $amount }
monopoly-deed-railroad-rent = Rent with { $count } railroads: { $amount }
monopoly-deed-utility-one-owned = If one utility is owned: 4x dice roll
monopoly-deed-utility-both-owned = If both utilities are owned: 10x dice roll
monopoly-deed-utility-base-rent = Utility base rent (legacy fallback): { $amount }
monopoly-deed-mortgage-value = Mortgage value: { $amount }
monopoly-deed-unmortgage-cost = Unmortgage cost: { $amount }
monopoly-deed-owner = Owner: { $owner }
monopoly-deed-current-buildings = Current buildings: { $buildings }
monopoly-deed-status-mortgaged = Status: Mortgaged
monopoly-player-properties-label = { $player }, on { $space }, square { $position }
monopoly-player-properties-label-no-space = { $player }, square { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = { $tx_id } { $kind } failed ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = Buy { $property } from { $target } for { $amount }
monopoly-trade-offer-cash-for-property-summary = Offer { $amount } to { $target } for { $property }
monopoly-trade-sell-property-summary = Sell { $property } to { $target } for { $amount }
monopoly-trade-offer-property-for-cash-summary = Offer { $property } to { $target } for { $amount }
monopoly-trade-swap-summary = Swap { $give_property } with { $target } for { $receive_property }
monopoly-trade-swap-plus-cash-summary = Swap { $give_property } + { $amount } with { $target } for { $receive_property }
monopoly-trade-swap-receive-cash-summary = Swap { $give_property } for { $receive_property } + { $amount } from { $target }
monopoly-trade-buy-jail-card-summary = Buy jail card from { $target } for { $amount }
monopoly-trade-sell-jail-card-summary = Sell jail card to { $target } for { $amount }

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
