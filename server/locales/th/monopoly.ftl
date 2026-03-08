# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = ที่ตั้งไว้ล่วงหน้า: { $preset }
monopoly-select-preset = เลือกการตั้งค่าการผูกขาดล่วงหน้า
monopoly-option-changed-preset = ตั้งค่าล่วงหน้าเป็น { $preset }

# Preset labels
monopoly-preset-classic-standard = มาตรฐานคลาสสิกและธีม
monopoly-preset-junior = ผูกขาดจูเนียร์
monopoly-preset-junior-modern = โมโนโพลี่ จูเนียร์ (สมัยใหม่)
monopoly-preset-junior-legacy = Monopoly Junior (ดั้งเดิม)
monopoly-preset-cheaters = ฉบับผูกขาดขี้โกง
monopoly-preset-electronic-banking = ธนาคารอิเล็กทรอนิกส์
monopoly-preset-voice-banking = ธนาคารด้วยเสียง
monopoly-preset-sore-losers = การผูกขาดสำหรับผู้แพ้ที่เจ็บปวด
monopoly-preset-speed = ความเร็วผูกขาด
monopoly-preset-builder = ผู้สร้างการผูกขาด
monopoly-preset-city = เมืองผูกขาด
monopoly-preset-bid-card-game = การประมูลแบบผูกขาด
monopoly-preset-deal-card-game = ข้อตกลงการผูกขาด
monopoly-preset-knockout = การผูกขาดที่น่าพิศวง
monopoly-preset-free-parking-jackpot = แจ็คพอตที่จอดรถฟรี

# Scaffold status
monopoly-announce-preset = ประกาศที่ตั้งไว้ล่วงหน้าปัจจุบัน
monopoly-current-preset = ค่าที่ตั้งล่วงหน้าปัจจุบัน: { $preset } (รุ่น { $count })
monopoly-scaffold-started = ฐานการผูกขาดเริ่มต้นด้วย { $preset } (รุ่น { $count })

# Turn actions
monopoly-roll-dice = ทอยลูกเต๋า
monopoly-buy-property = ซื้อทรัพย์สิน
monopoly-banking-balance = ตรวจสอบยอดเงินในธนาคาร
monopoly-banking-transfer = โอนเงิน
monopoly-banking-ledger = ตรวจสอบบัญชีแยกประเภทธนาคาร
monopoly-voice-command = คำสั่งเสียง
monopoly-cheaters-claim-reward = รับรางวัลการโกง
monopoly-end-turn = จบเทิร์น

# Turn validation
monopoly-roll-first = คุณต้องม้วนก่อน
monopoly-already-rolled = คุณหมุนเทิร์นนี้ไปแล้ว
monopoly-no-property-to-buy = ไม่มีทรัพย์สินที่จะซื้อในขณะนี้
monopoly-property-owned = ทรัพย์สินนั้นมีกรรมสิทธิ์อยู่แล้ว
monopoly-not-enough-cash = คุณมีเงินสดไม่เพียงพอ
monopoly-action-disabled-for-preset = การดำเนินการนี้ถูกปิดใช้งานสำหรับค่าที่ตั้งล่วงหน้าที่เลือก
monopoly-buy-disabled = การซื้ออสังหาริมทรัพย์โดยตรงถูกปิดใช้งานสำหรับการตั้งค่าล่วงหน้านี้

# Turn events
monopoly-pass-go = { $player } ผ่าน GO และรวบรวม { $amount }
monopoly-roll-result = { $player } รีด { $die1 } + { $die2 } = { $total } และลงบน { $space }
monopoly-roll-only = { $player } รีด { $die1 } + { $die2 } = { $total }
monopoly-you-roll-result = คุณหมุน { $die1 } + { $die2 } = { $total } และลงบน { $space }
monopoly-player-roll-result = { $player } รีด { $die1 } + { $die2 } = { $total } และลงบน { $space }
monopoly-you-roll-only = คุณทอย { $die1 } + { $die2 } = { $total }
monopoly-player-roll-only = { $player } รีด { $die1 } + { $die2 } = { $total }
monopoly-you-roll-only-doubles = คุณทอย { $die1 } + { $die2 } = { $total } ดับเบิ้ล!
monopoly-player-roll-only-doubles = { $player } รีด { $die1 } + { $die2 } = { $total } ดับเบิ้ล!
monopoly-property-available = { $property } ใช้ได้กับ { $price }
monopoly-property-bought = { $player } ซื้อ { $property } สำหรับ { $price }
monopoly-rent-paid = { $player } จ่าย { $amount } เป็นค่าเช่าให้กับ { $owner } สำหรับ { $property }
monopoly-player-paid-player = { $player } จ่าย { $amount } ให้กับ { $target }
monopoly-you-completed-color-set = ตอนนี้คุณเป็นเจ้าของคุณสมบัติ { $group } ทั้งหมดแล้ว
monopoly-player-completed-color-set = ขณะนี้ { $player } เป็นเจ้าของคุณสมบัติ { $group } ทั้งหมด
monopoly-you-completed-railroads = ตอนนี้คุณเป็นเจ้าของทางรถไฟทั้งหมดแล้ว
monopoly-player-completed-railroads = ปัจจุบัน { $player } เป็นเจ้าของเส้นทางรถไฟทั้งหมด
monopoly-you-completed-utilities = ตอนนี้คุณเป็นเจ้าของสาธารณูปโภคทั้งหมดแล้ว
monopoly-player-completed-utilities = ขณะนี้ { $player } เป็นเจ้าของสาธารณูปโภคทั้งหมดแล้ว
monopoly-landed-owned = { $player } ลงจอดในทรัพย์สินของตนเอง: { $property }
monopoly-tax-paid = { $player } จ่าย { $amount } สำหรับ { $tax }
monopoly-go-to-jail = { $player } เข้าคุก (ย้ายไปที่ { $space })
monopoly-bankrupt-player = คุณล้มละลายและออกจากเกม
monopoly-player-bankrupt = { $player } ล้มละลาย เจ้าหนี้: { $creditor }
monopoly-winner-by-bankruptcy = { $player } ชนะโดยการล้มละลายโดยมีเงินสดเหลืออยู่ของ { $cash }
monopoly-winner-by-cash = { $player } ชนะด้วยยอดรวมเงินสดสูงสุด: { $cash }
monopoly-city-winner-by-value = { $player } ชนะ Monopoly City ด้วยมูลค่าสุดท้าย { $total }

# Additional actions
monopoly-auction-property = ทรัพย์สินประมูล
monopoly-auction-bid = ลงประมูล
monopoly-auction-pass = ผ่านการประมูล
monopoly-mortgage-property = ทรัพย์สินจำนอง
monopoly-unmortgage-property = ยกเลิกการจำนองทรัพย์สิน
monopoly-build-house = สร้างบ้านหรือโรงแรม
monopoly-sell-house = ขายบ้านหรือโรงแรม
monopoly-offer-trade = เสนอการค้า
monopoly-accept-trade = ยอมรับการค้า
monopoly-decline-trade = ปฏิเสธการค้า
monopoly-read-cash = อ่านเงินสด
monopoly-pay-bail = จ่ายเงินประกัน
monopoly-use-jail-card = ใช้บัตรออกจากคุก
monopoly-cash-report = { $cash } เป็นเงินสด
monopoly-property-amount-option = { $property } สำหรับ { $amount }
monopoly-banking-transfer-option = โอน { $amount } ไปยัง { $target }

# Additional prompts
monopoly-select-property-mortgage = เลือกทรัพย์สินที่จะจำนอง
monopoly-select-property-unmortgage = เลือกทรัพย์สินที่จะยกเลิกการจำนอง
monopoly-select-property-build = เลือกคุณสมบัติที่จะสร้าง
monopoly-select-property-sell = เลือกอสังหาริมทรัพย์ที่จะขาย
monopoly-select-trade-offer = เลือกข้อเสนอการค้า
monopoly-select-auction-bid = เลือกราคาประมูลของคุณ
monopoly-select-banking-transfer = เลือกการโอน
monopoly-select-voice-command = ป้อนคำสั่งเสียงที่ขึ้นต้นด้วย voice:

# Additional validation
monopoly-no-property-to-auction = ไม่มีทรัพย์สินที่จะประมูลในขณะนี้
monopoly-auction-active = แก้ไขการประมูลที่ใช้งานอยู่ก่อน
monopoly-no-auction-active = ไม่มีการประมูลอยู่ระหว่างดำเนินการ
monopoly-not-your-auction-turn = ไม่ใช่ตาของคุณในการประมูล
monopoly-no-mortgage-options = คุณไม่มีทรัพย์สินที่สามารถจำนองได้
monopoly-no-unmortgage-options = คุณไม่มีทรัพย์สินจำนองที่จะยกเลิกการจำนอง
monopoly-no-build-options = คุณไม่มีคุณสมบัติที่สามารถสร้างได้
monopoly-no-sell-options = คุณไม่มีทรัพย์สินพร้อมอาคารพร้อมขาย
monopoly-no-trade-options = คุณไม่มีการซื้อขายที่ถูกต้องที่จะเสนอในขณะนี้
monopoly-no-trade-pending = ไม่มีการซื้อขายที่รอดำเนินการสำหรับคุณ
monopoly-trade-pending = การซื้อขายอยู่ระหว่างดำเนินการแล้ว
monopoly-trade-no-longer-valid = การค้านั้นไม่ถูกต้องอีกต่อไป
monopoly-not-in-jail = คุณไม่ได้อยู่ในคุก
monopoly-no-jail-card = คุณไม่มีบัตรออกจากคุก
monopoly-roll-again-required = คุณทอยได้สองเท่าและต้องทอยอีกครั้ง
monopoly-resolve-property-first = แก้ไขการตัดสินใจเกี่ยวกับทรัพย์สินที่รอดำเนินการก่อน

# Additional turn events
monopoly-roll-again = { $player } ทอยสองเท่าและได้รับอีกทอย
monopoly-you-roll-again = คุณทอยได้สองเท่าและได้ทอยอีก
monopoly-player-roll-again = { $player } ทอยสองเท่าและได้รับอีกทอย
monopoly-jail-roll-doubles = { $player } ทอยสองเท่า ({ $die1 } และ { $die2 }) และออกจากคุก
monopoly-you-jail-roll-doubles = คุณทอยสองเท่า ({ $die1 } และ { $die2 }) และออกจากคุก
monopoly-player-jail-roll-doubles = { $player } ทอยสองเท่า ({ $die1 } และ { $die2 }) และออกจากคุก
monopoly-jail-roll-failed = { $player } รีด { $die1 } และ { $die2 } เข้าคุก (พยายาม { $attempts })
monopoly-bail-paid = { $player } จ่ายเงินประกันตัว { $amount } แล้ว
monopoly-three-doubles-jail = { $player } ทอยสามคู่ในคราวเดียวและถูกส่งตัวเข้าคุก
monopoly-you-three-doubles-jail = คุณทอยสามคู่ในคราวเดียวและถูกส่งเข้าคุก
monopoly-player-three-doubles-jail = { $player } ทอยสามคู่ในคราวเดียวและถูกส่งตัวเข้าคุก
monopoly-jail-card-used = { $player } ใช้บัตรออกจากคุก
monopoly-sore-loser-rebate = { $player } ได้รับส่วนลดผู้แพ้อย่างมากจาก { $amount }
monopoly-cheaters-early-end-turn-blocked = { $player } พยายามยุติเทิร์นก่อนกำหนดและจ่ายค่าปรับการโกง { $amount }
monopoly-cheaters-payment-avoidance-blocked = { $player } กระตุ้นให้เกิดการลงโทษผู้โกงของ { $amount }
monopoly-cheaters-reward-granted = { $player } ได้รับรางวัลผู้โกง { $amount }
monopoly-cheaters-reward-unavailable = { $player } ได้รับรางวัลจากผู้โกงในเทิร์นนี้แล้ว

# Auctions and mortgages
monopoly-auction-no-bids = ไม่มีการเสนอราคาสำหรับ { $property } มันยังคงขายไม่ออก
monopoly-auction-started = เริ่มประมูล { $property } (เปิดประมูล: { $amount })
monopoly-auction-turn = เทิร์นการประมูล: { $player } เพื่อดำเนินการกับ { $property } (ราคาเสนอปัจจุบัน: { $amount })
monopoly-auction-bid-placed = { $player } เสนอราคา { $amount } สำหรับ { $property }
monopoly-auction-pass-event = { $player } ส่งต่อ { $property }
monopoly-auction-won = { $player } ชนะการประมูล { $property } ที่ { $amount }
monopoly-property-mortgaged = { $player } จำนอง { $property } สำหรับ { $amount }
monopoly-property-unmortgaged = { $player } ยกเลิกการจำนอง { $property } สำหรับ { $amount }
monopoly-house-built-house = { $player } สร้างบ้านบน { $property } สำหรับ { $amount } ตอนนี้มี { $level } แล้ว
monopoly-house-built-hotel = { $player } สร้างโรงแรมบน { $property } สำหรับ { $amount }
monopoly-house-sold = { $player } ขายอาคารบน { $property } สำหรับ { $amount } (ระดับ: { $level })
monopoly-trade-offered = { $proposer } เสนอการซื้อขาย { $target }: { $offer }
monopoly-trade-completed = การซื้อขายเสร็จสิ้นระหว่าง { $proposer } และ { $target }: { $offer }
monopoly-trade-declined = { $target } ปฏิเสธการค้าจาก { $proposer }: { $offer }
monopoly-trade-cancelled = การค้าถูกยกเลิก: { $offer }
monopoly-free-parking-jackpot = { $player } รวบรวมแจ็คพอตที่จอดรถฟรีของ { $amount }
monopoly-mortgaged-no-rent = { $player } ลงจอดบน { $property } ที่ถูกจำนอง; ไม่มีค่าเช่าครบกำหนด
monopoly-builder-blocks-awarded = { $player } ได้รับบล็อกตัวสร้าง { $amount } (รวม { $blocks })
monopoly-builder-block-spent = { $player } ใช้บล็อกตัวสร้าง (เหลือ { $blocks })
monopoly-banking-transfer-success = { $from_player } โอน { $amount } ไปยัง { $to_player }
monopoly-banking-transfer-failed = การโอนเงินผ่านธนาคาร { $player } ล้มเหลว ({ $reason })
monopoly-banking-balance-report = ยอดคงเหลือในธนาคาร { $player }: { $cash }
monopoly-banking-ledger-report = กิจกรรมธนาคารล่าสุด: { $entries }
monopoly-banking-ledger-empty = ยังไม่มีการทำธุรกรรมทางธนาคาร
monopoly-voice-command-error = ข้อผิดพลาดคำสั่งเสียง: { $reason }
monopoly-voice-command-accepted = ยอมรับคำสั่งเสียง: { $intent }
monopoly-voice-command-repeat = ทำซ้ำรหัสตอบกลับของธนาคารล่าสุด: { $response }
monopoly-voice-transfer-staged = การถ่ายโอนเสียงตามขั้นตอน: { $amount } ถึง { $target } พูด voice: confirm transfer
monopoly-mortgage-transfer-interest-paid = { $player } จ่าย { $amount } เป็นดอกเบี้ยโอนจำนอง

# Card engine
monopoly-card-drawn = { $player } จั่วการ์ด { $deck }: { $card }
monopoly-card-collect = { $player } รวบรวม { $amount }
monopoly-card-pay = { $player } จ่าย { $amount } แล้ว
monopoly-card-move = { $player } ย้ายไปที่ { $space }
monopoly-card-jail-free = { $player } ได้รับบัตรออกจากคุก
monopoly-card-utility-roll = { $player } รีด { $die1 } + { $die2 } = { $total } สำหรับการเช่าสาธารณูปโภค
monopoly-deck-chance = โอกาส
monopoly-deck-community-chest = หีบชุมชน

# Card descriptions
monopoly-card-advance-to-go = ก้าวไปข้างหน้าเพื่อไปและรวบรวม { $amount }
monopoly-card-advance-to-illinois-avenue = มุ่งหน้าสู่อิลลินอยส์อเวนิว
monopoly-card-advance-to-st-charles-place = มุ่งหน้าสู่เซนต์ชาร์ลส์เพลส
monopoly-card-advance-to-nearest-utility = เลื่อนไปยังยูทิลิตี้ที่ใกล้ที่สุด
monopoly-card-advance-to-nearest-railroad = เลื่อนไปยังทางรถไฟที่ใกล้ที่สุดและจ่ายค่าเช่าสองเท่าหากเป็นเจ้าของ
monopoly-card-bank-dividend-50 = ธนาคารจ่ายเงินปันผลให้กับคุณเป็น { $amount }
monopoly-card-go-back-three = ย้อนกลับไป 3 ช่อง
monopoly-card-go-to-jail = เข้าคุกโดยตรง
monopoly-card-general-repairs = ทำการซ่อมแซมทั่วไปในทรัพย์สินทั้งหมดของคุณ: { $per_house } ต่อบ้าน, { $per_hotel } ต่อโรงแรม
monopoly-card-poor-tax-15 = จ่ายภาษีที่ไม่ดีของ { $amount }
monopoly-card-reading-railroad = เดินทางไปที่ทางรถไฟรีดดิ้ง
monopoly-card-boardwalk = เดินเล่นบนทางเดินริมทะเล
monopoly-card-chairman-of-the-board = ประธานคณะกรรมการ จ่าย { $amount } ให้กับผู้เล่นทุกคน
monopoly-card-building-loan-matures = สินเชื่ออาคารของคุณครบกำหนดชำระ รวบรวม { $amount }
monopoly-card-crossword-competition = คุณชนะการแข่งขันปริศนาอักษรไขว้ รวบรวม { $amount }
monopoly-card-bank-error-200 = ข้อผิดพลาดของธนาคารเป็นประโยชน์ต่อคุณ รวบรวม { $amount }
monopoly-card-doctor-fee-50 = ค่าหมอ จ่าย { $amount }
monopoly-card-sale-of-stock-50 = จากการขายหุ้น คุณจะได้รับ { $amount }
monopoly-card-holiday-fund = กองทุนวันหยุดครบกำหนด รับ { $amount }
monopoly-card-tax-refund-20 = คืนภาษีเงินได้ รวบรวม { $amount }
monopoly-card-birthday = เป็นวันเกิดของคุณ รวบรวม { $amount } จากผู้เล่นทุกคน
monopoly-card-life-insurance = ประกันชีวิตครบกำหนดชำระ { $amount }
monopoly-card-hospital-fees-100 = ชำระค่าโรงพยาบาลของ { $amount }
monopoly-card-school-fees-50 = ชำระค่าเล่าเรียนของ { $amount }
monopoly-card-consultancy-fee-25 = รับค่าที่ปรึกษา { $amount }
monopoly-card-street-repairs = คุณได้รับการประเมินสำหรับการซ่อมแซมถนน: { $per_house } ต่อบ้าน, { $per_hotel } ต่อโรงแรม
monopoly-card-beauty-contest-10 = คุณได้รับรางวัลที่สองในการประกวดความงาม สะสม { $amount }
monopoly-card-inherit-100 = คุณได้รับมรดก { $amount }
monopoly-card-get-out-of-jail = ออกจากคุกฟรีๆ

# Board profile options
monopoly-set-board = บอร์ด: { $board }
monopoly-select-board = เลือกกระดานผูกขาด
monopoly-option-changed-board = บอร์ดตั้งค่าเป็น { $board }
monopoly-set-board-rules-mode = โหมดกฎของบอร์ด: { $mode }
monopoly-select-board-rules-mode = เลือกโหมดกฎของบอร์ด
monopoly-option-changed-board-rules-mode = โหมดกฎของบอร์ดตั้งค่าเป็น { $mode }

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
monopoly-view-active-deed = ดูโฉนดที่ใช้งานอยู่
monopoly-view-active-deed-space = ดู { $property }
monopoly-browse-all-deeds = เรียกดูโฉนดทั้งหมด
monopoly-view-my-properties = ดูคุณสมบัติของฉัน
monopoly-view-player-properties = ดูข้อมูลผู้เล่น
monopoly-view-selected-deed = ดูโฉนดที่เลือก
monopoly-view-selected-owner-property-deed = ดูโฉนดของผู้เล่นที่เลือก
monopoly-select-property-deed = เลือกโฉนดทรัพย์สิน
monopoly-select-player-properties = เลือกผู้เล่น
monopoly-select-player-property-deed = เลือกโฉนดทรัพย์สินของผู้เล่น
monopoly-no-active-deed = ไม่มีโฉนดที่ใช้งานอยู่เพื่อดูในขณะนี้
monopoly-no-deeds-available = ไม่มีคุณสมบัติที่สามารถออกโฉนดได้บนบอร์ดนี้
monopoly-no-owned-properties = ไม่มีคุณสมบัติที่เป็นเจ้าของสำหรับข้อมูลพร็อพเพอร์ตี้นี้
monopoly-no-players-with-properties = ไม่มีผู้เล่นว่าง
monopoly-buy-for = ซื้อเพื่อ { $amount }
monopoly-you-have-no-owned-properties = คุณไม่ได้เป็นเจ้าของทรัพย์สินใดๆ
monopoly-player-has-no-owned-properties = { $player } ไม่ได้เป็นเจ้าของทรัพย์สินใดๆ
monopoly-owner-bank = ธนาคาร
monopoly-owner-unknown = ไม่ทราบ
monopoly-building-status-hotel = กับโรงแรม
monopoly-building-status-one-house = มีบ้าน 1 หลัง
monopoly-building-status-houses = กับบ้าน { $count }
monopoly-mortgaged-short = จำนอง
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = สีน้ำตาล
monopoly-color-light_blue = ฟ้าอ่อน
monopoly-color-pink = สีชมพู
monopoly-color-orange = ส้ม
monopoly-color-red = สีแดง
monopoly-color-yellow = สีเหลือง
monopoly-color-green = สีเขียว
monopoly-color-dark_blue = สีน้ำเงินเข้ม
monopoly-deed-type-color-group = ประเภท: กลุ่มสี { $color }
monopoly-deed-type-railroad = ประเภท: ทางรถไฟ
monopoly-deed-type-utility = ประเภท: ยูทิลิตี้
monopoly-deed-type-generic = ประเภท: { $kind }
monopoly-deed-purchase-price = ราคาซื้อ: { $amount }
monopoly-deed-rent = เช่า: { $amount }
monopoly-deed-full-set-rent = หากเจ้าของมีชุดสีครบชุด: { $amount }
monopoly-deed-rent-one-house = มีบ้าน 1 หลัง: { $amount }
monopoly-deed-rent-houses = ด้วยบ้าน { $count }: { $amount }
monopoly-deed-rent-hotel = กับโรงแรม: { $amount }
monopoly-deed-house-cost = ค่าบ้าน: { $amount }
monopoly-deed-railroad-rent = เช่าพร้อมรถไฟ { $count } : { $amount }
monopoly-deed-utility-one-owned = หากมียูทิลิตี้หนึ่งรายการ: ทอยลูกเต๋า 4 เท่า
monopoly-deed-utility-both-owned = หากเป็นเจ้าของยูทิลิตี้ทั้งสอง: ทอยลูกเต๋า 10 เท่า
monopoly-deed-utility-base-rent = ค่าเช่าฐานสาธารณูปโภค (ทางเลือกสำรองแบบเดิม): { $amount }
monopoly-deed-mortgage-value = มูลค่าสินเชื่อที่อยู่อาศัย: { $amount }
monopoly-deed-unmortgage-cost = ค่าใช้จ่ายในการยกเลิกการจำนอง: { $amount }
monopoly-deed-owner = เจ้าของ: { $owner }
monopoly-deed-current-buildings = อาคารปัจจุบัน: { $buildings }
monopoly-deed-status-mortgaged = สถานะ: ติดจำนอง
monopoly-player-properties-label = { $player } บน { $space } สี่เหลี่ยม { $position }
monopoly-player-properties-label-no-space = { $player } สี่เหลี่ยม { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = { $tx_id } { $kind } ล้มเหลว ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = ซื้อ { $property } จาก { $target } เพื่อรับ { $amount }
monopoly-trade-offer-cash-for-property-summary = เสนอ { $amount } ถึง { $target } สำหรับ { $property }
monopoly-trade-sell-property-summary = ขาย { $property } เป็น { $target } สำหรับ { $amount }
monopoly-trade-offer-property-for-cash-summary = เสนอ { $property } ถึง { $target } สำหรับ { $amount }
monopoly-trade-swap-summary = สลับ { $give_property } กับ { $target } สำหรับ { $receive_property }
monopoly-trade-swap-plus-cash-summary = สลับ { $give_property } + { $amount } กับ { $target } สำหรับ { $receive_property }
monopoly-trade-swap-receive-cash-summary = สลับ { $give_property } สำหรับ { $receive_property } + { $amount } จาก { $target }
monopoly-trade-buy-jail-card-summary = ซื้อการ์ดคุกจาก { $target } เพื่อรับ { $amount }
monopoly-trade-sell-jail-card-summary = ขายการ์ดคุกให้กับ { $target } เพื่อรับ { $amount }

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
