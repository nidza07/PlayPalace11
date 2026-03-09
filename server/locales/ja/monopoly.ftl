# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = プリセット: { $preset }
monopoly-select-preset = モノポリーのプリセットを選択します
monopoly-option-changed-preset = プリセットは{ $preset }に設定されています。

# Preset labels
monopoly-preset-classic-standard = クラシックおよびテーマ別スタンダード
monopoly-preset-junior = モノポリージュニア
monopoly-preset-junior-modern = モノポリージュニア (モダン)
monopoly-preset-junior-legacy = モノポリー ジュニア (レガシー)
monopoly-preset-cheaters = モノポリー チーターズ エディション
monopoly-preset-electronic-banking = 電子バンキング
monopoly-preset-voice-banking = ボイスバンキング
monopoly-preset-sore-losers = 負けず嫌いのためのモノポリー
monopoly-preset-speed = モノポリースピード
monopoly-preset-builder = モノポリービルダー
monopoly-preset-city = モノポリーシティ
monopoly-preset-bid-card-game = 独占入札
monopoly-preset-deal-card-game = 独占取引
monopoly-preset-knockout = モノポリー ノックアウト
monopoly-preset-free-parking-jackpot = 無料駐車場のジャックポット

# Scaffold status
monopoly-announce-preset = 現在のプリセットをアナウンスする
monopoly-current-preset = 現在のプリセット: { $preset } ({ $count } エディション)。
monopoly-scaffold-started = モノポリー足場は { $preset } ({ $count } エディション) から始まりました。

# Turn actions
monopoly-roll-dice = サイコロを振る
monopoly-buy-property = 不動産を購入する
monopoly-banking-balance = 銀行残高を確認する
monopoly-banking-transfer = 資金の移動
monopoly-banking-ledger = 銀行元帳を確認する
monopoly-voice-command = 音声コマンド
monopoly-cheaters-claim-reward = チート報酬を請求する
monopoly-end-turn = ターン終了

# Turn validation
monopoly-roll-first = まずロールする必要があります。
monopoly-already-rolled = あなたはすでにこのターンをロールしました。
monopoly-no-property-to-buy = 現在購入できる物件はありません。
monopoly-property-owned = その不動産はすでに所有されています。
monopoly-not-enough-cash = 現金が足りません。
monopoly-action-disabled-for-preset = このアクションは、選択したプリセットでは無効になっています。
monopoly-buy-disabled = このプリセットでは、プロパティを直接購入することはできません。

# Turn events
monopoly-pass-go = { $player } が GO を通過し、{ $amount } を収集しました。
monopoly-roll-result = { $player } は { $die1 } + { $die2 } = { $total } をロールし、{ $space } に着地しました。
monopoly-roll-only = { $player } は { $die1 } + { $die2 } = { $total } をロールしました。
monopoly-you-roll-result = { $die1 } + { $die2 } = { $total } をロールし、{ $space } に着地しました。
monopoly-player-roll-result = { $player } は { $die1 } + { $die2 } = { $total } をロールし、{ $space } に着地しました。
monopoly-you-roll-only = { $die1 } + { $die2 } = { $total } が出ました。
monopoly-player-roll-only = { $player } は { $die1 } + { $die2 } = { $total } をロールしました。
monopoly-you-roll-only-doubles = { $die1 } + { $die2 } = { $total } が出ました。ダブルス！
monopoly-player-roll-only-doubles = { $player } は { $die1 } + { $die2 } = { $total } をロールしました。ダブルス！
monopoly-property-available = { $property }は{ $price }で利用可能です。
monopoly-property-bought = { $player } は { $price } のために { $property } を購入しました。
monopoly-rent-paid = { $player } は、{ $property } の賃料として { $amount } を { $owner } に支払いました。
monopoly-player-paid-player = { $player }は{ $amount }を{ $target }に支払いました。
monopoly-you-completed-color-set = これで、{ $group } プロパティをすべて所有するようになりました。
monopoly-player-completed-color-set = { $player } は、{ $group } のすべてのプロパティを所有するようになりました。
monopoly-you-completed-railroads = これですべての鉄道を所有できるようになりました。
monopoly-player-completed-railroads = { $player } は現在、すべての鉄道を所有しています。
monopoly-you-completed-utilities = これで、すべてのユーティリティを所有できるようになりました。
monopoly-player-completed-utilities = { $player } は現在、すべてのユーティリティを所有しています。
monopoly-landed-owned = { $player } は自身の所有地である { $property } に着陸しました。
monopoly-tax-paid = { $player } は { $tax } のために { $amount } を支払いました。
monopoly-go-to-jail = { $player } は刑務所に送られます ({ $space } に移動)。
monopoly-bankrupt-player = あなたは破産し、ゲームから外れました。
monopoly-player-bankrupt = { $player }は破産しました。債権者: { $creditor }。
monopoly-winner-by-bankruptcy = { $player }は{ $cash }の現金が残った状態で破産により勝利します。
monopoly-winner-by-cash = { $player } は最高の現金総額を獲得し、{ $cash } が勝ちます。
monopoly-city-winner-by-value = { $player } が最終値 { $total } でモノポリーシティに勝利します。

# Additional actions
monopoly-auction-property = 競売物件
monopoly-auction-bid = オークションに入札する
monopoly-auction-pass = オークションに出す
monopoly-mortgage-property = 住宅ローン物件
monopoly-unmortgage-property = 抵当権のない不動産
monopoly-build-house = 家やホテルを建てる
monopoly-sell-house = 家やホテルを売る
monopoly-offer-trade = オファートレード
monopoly-accept-trade = 取引を受け入れる
monopoly-decline-trade = 貿易の衰退
monopoly-read-cash = 現金を読み取る
monopoly-pay-bail = 保釈金を支払う
monopoly-use-jail-card = 出所カードを使う
monopoly-cash-report = 現金の{ $cash }。
monopoly-property-amount-option = { $amount }の{ $property }
monopoly-banking-transfer-option = { $amount }を{ $target }に転送

# Additional prompts
monopoly-select-property-mortgage = 住宅ローンを組む物件を選択する
monopoly-select-property-unmortgage = 抵当権を解除する物件を選択してください
monopoly-select-property-build = 建築する物件を選択してください
monopoly-select-property-sell = 売却する物件を選択してください
monopoly-select-trade-offer = トレードオファーを選択してください
monopoly-select-auction-bid = オークション入札額を選択してください
monopoly-select-banking-transfer = 転送を選択してください
monopoly-select-voice-command = voice:で始まる音声コマンドを入力してください

# Additional validation
monopoly-no-property-to-auction = 現在競売にかけられる物件はありません。
monopoly-auction-active = まずアクティブなオークションを解決してください。
monopoly-no-auction-active = 進行中のオークションはありません。
monopoly-not-your-auction-turn = オークションではあなたの番ではありません。
monopoly-no-mortgage-options = 抵当に入れることができる不動産がありません。
monopoly-no-unmortgage-options = 抵当権を解除する抵当物件はありません。
monopoly-no-build-options = 構築できるプロパティがありません。
monopoly-no-sell-options = 販売可能な建物付きの物件はありません。
monopoly-no-trade-options = 現在、提案できる有効な取引はありません。
monopoly-no-trade-pending = 保留中の取引はありません。
monopoly-trade-pending = 取引はすでに保留中です。
monopoly-trade-no-longer-valid = その取引はもう無効です。
monopoly-not-in-jail = あなたは刑務所にはいません。
monopoly-no-jail-card = あなたは出所カードを持っていません。
monopoly-roll-again-required = ダブルスが出たので、もう一度出さなければなりません。
monopoly-resolve-property-first = まず保留中の不動産に関する決定を解決します。

# Additional turn events
monopoly-roll-again = { $player } はダブルを出して別のロールを獲得しました。
monopoly-you-roll-again = ダブルを出して別のロールを獲得しました。
monopoly-player-roll-again = { $player } はダブルを出して別のロールを獲得しました。
monopoly-jail-roll-doubles = { $player } はダブル ({ $die1 } と { $die2 }) を出して刑務所を出ました。
monopoly-you-jail-roll-doubles = ダブル ({ $die1 } と { $die2 }) を出して刑務所を出ました。
monopoly-player-jail-roll-doubles = { $player } はダブル ({ $die1 } と { $die2 }) を出して刑務所を出ました。
monopoly-jail-roll-failed = { $player } は刑務所で { $die1 } と { $die2 } をロールしました ({ $attempts } を試みました)。
monopoly-bail-paid = { $player }は{ $amount }の保釈金を支払った。
monopoly-three-doubles-jail = { $player } は 1 ターンに 3 つのダブルを出して刑務所に送られました。
monopoly-you-three-doubles-jail = 1 つのターンで 3 つのダブルが出たため、刑務所に送られます。
monopoly-player-three-doubles-jail = { $player } は 1 ターンに 3 つのダブルを出して刑務所に送られました。
monopoly-jail-card-used = { $player }は出所カードを使用しました。
monopoly-sore-loser-rebate = { $player } は { $amount } の敗者復活リベートを受け取りました。
monopoly-cheaters-early-end-turn-blocked = { $player } はターンを早めに終了しようとして、{ $amount } の不正行為ペナルティを支払いました。
monopoly-cheaters-payment-avoidance-blocked = { $player } は、{ $amount } の詐欺師の支払いペナルティをトリガーしました。
monopoly-cheaters-reward-granted = { $player } は、{ $amount } の詐欺師の報酬を請求しました。
monopoly-cheaters-reward-unavailable = { $player } はこのターンですでに詐欺師の報酬を獲得しています。

# Auctions and mortgages
monopoly-auction-no-bids = { $property } への入札はありません。売れ残ってます。
monopoly-auction-started = { $property }のオークションが開始されました（初値：{ $amount }）。
monopoly-auction-turn = オークションターン: { $player } が { $property } に基づいて行動します (現在の入札: { $amount })。
monopoly-auction-bid-placed = { $player } が { $amount } に { $property } を入札しました。
monopoly-auction-pass-event = { $player } は { $property } に引き継がれました。
monopoly-auction-won = { $player } は、{ $amount } で { $property } のオークションを落札しました。
monopoly-property-mortgaged = { $player }は{ $property }を{ $amount }のために抵当に入れました。
monopoly-property-unmortgaged = { $player } { $amount } 用の抵当権のない { $property }。
monopoly-house-built-house = { $player }は{ $amount }のために{ $property }上に家を建てました。 { $level }が追加されました。
monopoly-house-built-hotel = { $player }は{ $amount }のために{ $property }上にホテルを建設しました。
monopoly-house-sold = { $player } は、{ $property } 上の建物を { $amount } (レベル: { $level }) で販売しました。
monopoly-trade-offered = { $proposer } は { $target } に取引を提案しました: { $offer }。
monopoly-trade-completed = { $proposer } と { $target } の間で取引が完了しました: { $offer }。
monopoly-trade-declined = { $target } は { $proposer }: { $offer } からの取引を拒否しました。
monopoly-trade-cancelled = 取引キャンセル: { $offer }。
monopoly-free-parking-jackpot = { $player }は{ $amount }の無料駐車場ジャックポットを集めました。
monopoly-mortgaged-no-rent = { $player }は抵当に入った{ $property }に着陸しました。家賃はかかりません。
monopoly-builder-blocks-awarded = { $player } は { $amount } ビルダー ブロックを獲得しました ({ $blocks } 合計)。
monopoly-builder-block-spent = { $player } はビルダー ブロックを消費しました ({ $blocks } 残り)。
monopoly-banking-transfer-success = { $from_player }は{ $amount }を{ $to_player }に譲渡しました。
monopoly-banking-transfer-failed = { $player } 銀行振込に失敗しました ({ $reason })。
monopoly-banking-balance-report = { $player } 銀行残高: { $cash }。
monopoly-banking-ledger-report = 最近の銀行活動: { $entries }。
monopoly-banking-ledger-empty = まだ銀行取引はありません。
monopoly-voice-command-error = 音声コマンド エラー: { $reason }。
monopoly-voice-command-accepted = 受け入れられる音声コマンド: { $intent }。
monopoly-voice-command-repeat = 最後の銀行応答コードを繰り返しています: { $response }。
monopoly-voice-transfer-staged = ステージングされた音声転送: { $amount } から { $target }。 「音声確認転送」と言います。
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
