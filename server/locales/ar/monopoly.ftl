# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = الإعداد المسبق: { $preset }
monopoly-select-preset = حدد إعدادًا مسبقًا للاحتكار
monopoly-option-changed-preset = تم ضبطه مسبقًا على { $preset }.

# Preset labels
monopoly-preset-classic-standard = معيار كلاسيكي وموضوعي
monopoly-preset-junior = مونوبولي جونيور
monopoly-preset-junior-modern = مونوبولي جونيور (حديث)
monopoly-preset-junior-legacy = مونوبولي جونيور (تراث)
monopoly-preset-cheaters = طبعة الغشاشين الاحتكارية
monopoly-preset-electronic-banking = الخدمات المصرفية الإلكترونية
monopoly-preset-voice-banking = الخدمات المصرفية الصوتية
monopoly-preset-sore-losers = احتكار الخاسرين المؤلمين
monopoly-preset-speed = سرعة الاحتكار
monopoly-preset-builder = منشئ الاحتكار
monopoly-preset-city = مدينة الاحتكار
monopoly-preset-bid-card-game = عرض الاحتكار
monopoly-preset-deal-card-game = صفقة الاحتكار
monopoly-preset-knockout = الضربة القاضية الاحتكارية
monopoly-preset-free-parking-jackpot = مواقف مجانية للسيارات

# Scaffold status
monopoly-announce-preset = الإعلان عن الإعداد المسبق الحالي
monopoly-current-preset = الإعداد المسبق الحالي: { $preset } (إصدارات { $count }).
monopoly-scaffold-started = بدأت سقالة الاحتكار بـ { $preset } (إصدارات { $count }).

# Turn actions
monopoly-roll-dice = لفة النرد
monopoly-buy-property = شراء العقارات
monopoly-banking-balance = التحقق من الرصيد البنكي
monopoly-banking-transfer = تحويل الأموال
monopoly-banking-ledger = مراجعة دفتر الأستاذ البنكي
monopoly-voice-command = أمر صوتي
monopoly-cheaters-claim-reward = المطالبة بمكافأة الغش
monopoly-end-turn = نهاية بدوره

# Turn validation
monopoly-roll-first = تحتاج إلى التدحرج أولاً.
monopoly-already-rolled = لقد توالت بالفعل هذا المنعطف.
monopoly-no-property-to-buy = لا يوجد عقار للشراء في الوقت الحالي.
monopoly-property-owned = هذا العقار مملوك بالفعل.
monopoly-not-enough-cash = ليس لديك ما يكفي من النقود.
monopoly-action-disabled-for-preset = تم تعطيل هذا الإجراء للإعداد المسبق المحدد.
monopoly-buy-disabled = تم تعطيل شراء العقارات مباشرة لهذا الإعداد المسبق.

# Turn events
monopoly-pass-go = اجتاز { $player } GO وجمع { $amount }.
monopoly-roll-result = تدحرجت { $player } على { $die1 } + { $die2 } = { $total } وهبطت على { $space }.
monopoly-roll-only = { $player } توالت { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = لقد تدحرجت { $die1 } + { $die2 } = { $total } وهبطت على { $space }.
monopoly-player-roll-result = تدحرجت { $player } على { $die1 } + { $die2 } = { $total } وهبطت على { $space }.
monopoly-you-roll-only = لقد قمت بتدوير { $die1 } + { $die2 } = { $total }.
monopoly-player-roll-only = { $player } توالت { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = لقد قمت بتدوير { $die1 } + { $die2 } = { $total }. الزوجي!
monopoly-player-roll-only-doubles = { $player } توالت { $die1 } + { $die2 } = { $total }. الزوجي!
monopoly-property-available = { $property } متاح لـ { $price }.
monopoly-property-bought = اشترت { $player } { $property } مقابل { $price }.
monopoly-rent-paid = دفعت { $player } إيجار { $amount } إلى { $owner } مقابل { $property }.
monopoly-player-paid-player = دفعت { $player } { $amount } إلى { $target }.
monopoly-you-completed-color-set = أنت الآن تمتلك كافة خصائص { $group }.
monopoly-player-completed-color-set = تمتلك { $player } الآن جميع خصائص { $group }.
monopoly-you-completed-railroads = أنت الآن تملك كل خطوط السكك الحديدية.
monopoly-player-completed-railroads = تمتلك { $player } الآن جميع خطوط السكك الحديدية.
monopoly-you-completed-utilities = أنت الآن تملك كافة المرافق.
monopoly-player-completed-utilities = تمتلك { $player } الآن كافة المرافق.
monopoly-landed-owned = هبطت { $player } على ممتلكاتهم الخاصة: { $property }.
monopoly-tax-paid = دفعت { $player } { $amount } مقابل { $tax }.
monopoly-go-to-jail = يذهب { $player } إلى السجن (تم نقله إلى { $space }).
monopoly-bankrupt-player = أنت مفلس وخرج من اللعبة.
monopoly-player-bankrupt = { $player } مفلسة. الدائن: { $creditor }.
monopoly-winner-by-bankruptcy = { $player } يفوز بالإفلاس مع بقاء أموال { $cash }.
monopoly-winner-by-cash = { $player } يفوز بأعلى إجمالي نقدي: { $cash }.
monopoly-city-winner-by-value = { $player } يفوز بـ Monopoly City بالقيمة النهائية { $total }.

# Additional actions
monopoly-auction-property = خاصية المزاد
monopoly-auction-bid = مكان عرض المزاد
monopoly-auction-pass = تمر في المزاد
monopoly-mortgage-property = ملكية الرهن العقاري
monopoly-unmortgage-property = الممتلكات غير الرهن العقاري
monopoly-build-house = بناء منزل أو فندق
monopoly-sell-house = بيع منزل أو فندق
monopoly-offer-trade = عرض التجارة
monopoly-accept-trade = قبول التجارة
monopoly-decline-trade = تراجع التجارة
monopoly-read-cash = قراءة النقدية
monopoly-pay-bail = دفع الكفالة
monopoly-use-jail-card = استخدم بطاقة الخروج من السجن
monopoly-cash-report = { $cash } نقدا.
monopoly-property-amount-option = { $property } لـ { $amount }
monopoly-banking-transfer-option = نقل { $amount } إلى { $target }

# Additional prompts
monopoly-select-property-mortgage = اختر عقارًا للرهن العقاري
monopoly-select-property-unmortgage = حدد خاصية لإلغاء الرهن العقاري
monopoly-select-property-build = اختر عقارًا للبناء عليه
monopoly-select-property-sell = اختر عقارًا للبيع منه
monopoly-select-trade-offer = حدد عرضًا تجاريًا
monopoly-select-auction-bid = حدد عرض المزاد الخاص بك
monopoly-select-banking-transfer = حدد النقل
monopoly-select-voice-command = أدخل أمرًا صوتيًا يبدأ بـ voice:

# Additional validation
monopoly-no-property-to-auction = لا يوجد عقار للمزاد في الوقت الحالي.
monopoly-auction-active = قم بحل المزاد النشط أولاً.
monopoly-no-auction-active = لا يوجد مزاد في التقدم.
monopoly-not-your-auction-turn = ليس دورك في المزاد.
monopoly-no-mortgage-options = ليس لديك عقارات متاحة للرهن العقاري.
monopoly-no-unmortgage-options = ليس لديك عقارات مرهونة لفك رهنها.
monopoly-no-build-options = ليس لديك خصائص متاحة للبناء عليها.
monopoly-no-sell-options = ليس لديك عقارات ومباني متاحة للبيع.
monopoly-no-trade-options = ليس لديك أي صفقات صالحة لعرضها الآن.
monopoly-no-trade-pending = لا توجد تجارة معلقة بالنسبة لك.
monopoly-trade-pending = التجارة معلقة بالفعل.
monopoly-trade-no-longer-valid = هذه التجارة لم تعد صالحة.
monopoly-not-in-jail = أنت لست في السجن.
monopoly-no-jail-card = ليس لديك بطاقة خروج من السجن.
monopoly-roll-again-required = لقد تدحرجت الزوجي ويجب أن تتدحرج مرة أخرى.
monopoly-resolve-property-first = حل قرار الملكية المعلق أولاً.

# Additional turn events
monopoly-roll-again = تم تدحرج { $player } بشكل مزدوج ويحصل على لفة أخرى.
monopoly-you-roll-again = لقد تدحرجت الزوجي وحصلت على لفة أخرى.
monopoly-player-roll-again = تم تدحرج { $player } بشكل مزدوج ويحصل على لفة أخرى.
monopoly-jail-roll-doubles = تدحرجت { $player } الزوجي ({ $die1 } و { $die2 }) وغادرت السجن.
monopoly-you-jail-roll-doubles = لقد تدحرجت الزوجي ({ $die1 } و{ $die2 }) وخرجت من السجن.
monopoly-player-jail-roll-doubles = تدحرجت { $player } الزوجي ({ $die1 } و { $die2 }) وغادرت السجن.
monopoly-jail-roll-failed = قام { $player } بتدوير { $die1 } و{ $die2 } في السجن (محاولة { $attempts }).
monopoly-bail-paid = دفعت { $player } كفالة { $amount }.
monopoly-three-doubles-jail = قام { $player } بتدوير ثلاث ثنائيات في دورة واحدة وتم إرساله إلى السجن.
monopoly-you-three-doubles-jail = لقد رميت ثلاث ثنائيات في دورة واحدة وتم إرسالك إلى السجن.
monopoly-player-three-doubles-jail = قام { $player } بتدوير ثلاث ثنائيات في دورة واحدة وتم إرساله إلى السجن.
monopoly-jail-card-used = استخدم { $player } بطاقة الخروج من السجن.
monopoly-sore-loser-rebate = تلقى { $player } خصمًا خاسرًا مؤلمًا بقيمة { $amount }.
monopoly-cheaters-early-end-turn-blocked = حاول { $player } إنهاء الدور مبكرًا ودفع عقوبة الغش { $amount }.
monopoly-cheaters-payment-avoidance-blocked = تسبب { $player } في فرض عقوبة دفع الغشاشين بقيمة { $amount }.
monopoly-cheaters-reward-granted = حصل { $player } على مكافأة الغشاشين وهي { $amount }.
monopoly-cheaters-reward-unavailable = لقد ادعى { $player } بالفعل أن الغشاشين يكافئون هذا الدور.

# Auctions and mortgages
monopoly-auction-no-bids = لا توجد عروض لـ { $property }. يبقى غير مباع.
monopoly-auction-started = بدأ المزاد على { $property } (عرض الافتتاح: { $amount }).
monopoly-auction-turn = دور المزاد: { $player } للعمل على { $property } (العرض الحالي: { $amount }).
monopoly-auction-bid-placed = { $player } عرض { $amount } لـ { $property }.
monopoly-auction-pass-event = تم تمرير { $player } على { $property }.
monopoly-auction-won = فاز { $player } بالمزاد العلني لـ { $property } في { $amount }.
monopoly-property-mortgaged = رهن { $player } { $property } مقابل { $amount }.
monopoly-property-unmortgaged = { $player } غير مرهونة { $property } لـ { $amount }.
monopoly-house-built-house = قام { $player } ببناء منزل على { $property } لـ { $amount }. لديها الآن { $level }.
monopoly-house-built-hotel = قامت { $player } ببناء فندق على { $property } لـ { $amount }.
monopoly-house-sold = باعت { $player } مبنى على { $property } مقابل { $amount } (المستوى: { $level }).
monopoly-trade-offered = عرضت { $proposer } على { $target } صفقة تجارية: { $offer }.
monopoly-trade-completed = اكتملت التجارة بين { $proposer } و{ $target }: { $offer }.
monopoly-trade-declined = رفض { $target } التجارة من { $proposer }: { $offer }.
monopoly-trade-cancelled = تم إلغاء التجارة: { $offer }.
monopoly-free-parking-jackpot = حصلت { $player } على الجائزة الكبرى لمواقف السيارات المجانية { $amount }.
monopoly-mortgaged-no-rent = هبطت { $player } على { $property } المرهونة ؛ لا يوجد إيجار مستحق.
monopoly-builder-blocks-awarded = حصل { $player } على كتل بناء { $amount } (إجمالي { $blocks }).
monopoly-builder-block-spent = قضى { $player } كتلة إنشاء (بقي { $blocks }).
monopoly-banking-transfer-success = قام { $from_player } بنقل { $amount } إلى { $to_player }.
monopoly-banking-transfer-failed = فشل التحويل البنكي { $player } ({ $reason }).
monopoly-banking-balance-report = رصيد البنك { $player }: { $cash }.
monopoly-banking-ledger-report = الأنشطة المصرفية الأخيرة: { $entries }.
monopoly-banking-ledger-empty = لا توجد معاملات مصرفية حتى الآن.
monopoly-voice-command-error = خطأ في الأمر الصوتي: { $reason }.
monopoly-voice-command-accepted = قبول الأمر الصوتي: { $intent }.
monopoly-voice-command-repeat = تكرار رمز الاستجابة المصرفية الأخير: { $response }.
monopoly-voice-transfer-staged = نقل الصوت على مراحل: { $amount } إلى { $target }. قل voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = دفعت { $player } { $amount } في فوائد تحويل الرهن العقاري.

# Card engine
monopoly-card-drawn = قام { $player } برسم بطاقة { $deck }: { $card }.
monopoly-card-collect = تم جمع { $player } { $amount }.
monopoly-card-pay = { $player } دفعت { $amount }.
monopoly-card-move = انتقل { $player } إلى { $space }.
monopoly-card-jail-free = تلقى { $player } بطاقة الخروج من السجن.
monopoly-card-utility-roll = { $player } توالت { $die1 } + { $die2 } = { $total } للإيجار المرافق.
monopoly-deck-chance = فرصة
monopoly-deck-community-chest = صدر المجتمع

# Card descriptions
monopoly-card-advance-to-go = تقدم إلى GO واجمع { $amount }
monopoly-card-advance-to-illinois-avenue = تقدم إلى شارع إلينوي
monopoly-card-advance-to-st-charles-place = تقدم إلى مكان سانت تشارلز
monopoly-card-advance-to-nearest-utility = تقدم إلى أقرب المرافق
monopoly-card-advance-to-nearest-railroad = تقدم إلى أقرب خط سكة حديد وادفع إيجارًا مضاعفًا إذا كنت تملكه
monopoly-card-bank-dividend-50 = يدفع لك البنك أرباحًا بقيمة { $amount }
monopoly-card-go-back-three = العودة 3 مسافات
monopoly-card-go-to-jail = الذهاب مباشرة إلى السجن
monopoly-card-general-repairs = قم بإجراء إصلاحات عامة على جميع الممتلكات الخاصة بك: { $per_house } لكل منزل، { $per_hotel } لكل فندق
monopoly-card-poor-tax-15 = ادفع ضريبة { $amount } الضعيفة
monopoly-card-reading-railroad = قم برحلة إلى ريدينغ للسكك الحديدية
monopoly-card-boardwalk = قم بالمشي على الممشى الخشبي
monopoly-card-chairman-of-the-board = رئيس مجلس الإدارة، ادفع { $amount } لكل لاعب
monopoly-card-building-loan-matures = ينضج قرض البناء الخاص بك، اجمع { $amount }
monopoly-card-crossword-competition = لقد فزت في مسابقة الكلمات المتقاطعة، اجمع { $amount }
monopoly-card-bank-error-200 = خطأ البنك لصالحك، جمع { $amount }
monopoly-card-doctor-fee-50 = رسوم الطبيب، ادفع { $amount }
monopoly-card-sale-of-stock-50 = من بيع المخزون تحصل على { $amount }
monopoly-card-holiday-fund = ينضج صندوق العطلات، واحصل على { $amount }
monopoly-card-tax-refund-20 = استرداد ضريبة الدخل، وجمع { $amount }
monopoly-card-birthday = إنه عيد ميلادك، اجمع { $amount } من كل لاعب
monopoly-card-life-insurance = ينضج التأمين على الحياة، وجمع { $amount }
monopoly-card-hospital-fees-100 = دفع رسوم المستشفى { $amount }
monopoly-card-school-fees-50 = دفع الرسوم المدرسية { $amount }
monopoly-card-consultancy-fee-25 = احصل على رسوم الاستشارة { $amount }
monopoly-card-street-repairs = يتم تقييمك لإصلاحات الشوارع: { $per_house } لكل منزل، و{ $per_hotel } لكل فندق
monopoly-card-beauty-contest-10 = لقد فزت بالجائزة الثانية في مسابقة الجمال، اجمع { $amount }
monopoly-card-inherit-100 = أنت ترث { $amount }
monopoly-card-get-out-of-jail = الخروج من السجن مجانا

# Board profile options
monopoly-set-board = اللوحة: { $board }
monopoly-select-board = حدد لوحة الاحتكار
monopoly-option-changed-board = تم ضبط اللوحة على { $board }.
monopoly-set-board-rules-mode = وضع قواعد اللوحة: { $mode }
monopoly-select-board-rules-mode = حدد وضع قواعد اللوحة
monopoly-option-changed-board-rules-mode = تم ضبط وضع قواعد اللوحة على { $mode }.

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
monopoly-view-active-deed = عرض الفعل النشط
monopoly-view-active-deed-space = عرض { $property }
monopoly-browse-all-deeds = تصفح جميع الأفعال
monopoly-view-my-properties = عرض عقاراتي
monopoly-view-player-properties = عرض معلومات اللاعب
monopoly-view-selected-deed = عرض الفعل المحدد
monopoly-view-selected-owner-property-deed = عرض صك اللاعب المحدد
monopoly-select-property-deed = اختر سند ملكية
monopoly-select-player-properties = اختر لاعبا
monopoly-select-player-property-deed = اختر سند ملكية اللاعب
monopoly-no-active-deed = لا يوجد صك نشط لعرضه الآن.
monopoly-no-deeds-available = لا تتوفر أي خصائص قادرة على التصرف في هذا المنتدى.
monopoly-no-owned-properties = لا توجد عقارات مملوكة متاحة لهذا العرض.
monopoly-no-players-with-properties = لا يوجد لاعبين متاحين.
monopoly-buy-for = شراء { $amount }
monopoly-you-have-no-owned-properties = أنت لا تملك أي عقارات.
monopoly-player-has-no-owned-properties = { $player } لا يملك أي عقارات.
monopoly-owner-bank = بنك
monopoly-owner-unknown = مجهول
monopoly-building-status-hotel = مع الفندق
monopoly-building-status-one-house = مع 1 منزل
monopoly-building-status-houses = مع منازل { $count }
monopoly-mortgaged-short = مرهونة
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = بني
monopoly-color-light_blue = أزرق فاتح
monopoly-color-pink = لون القرنفل
monopoly-color-orange = البرتقالي
monopoly-color-red = أحمر
monopoly-color-yellow = أصفر
monopoly-color-green = أخضر
monopoly-color-dark_blue = أزرق غامق
monopoly-deed-type-color-group = النوع: مجموعة الألوان { $color }
monopoly-deed-type-railroad = النوع: السكك الحديدية
monopoly-deed-type-utility = النوع: فائدة
monopoly-deed-type-generic = النوع: { $kind }
monopoly-deed-purchase-price = سعر الشراء: { $amount }
monopoly-deed-rent = الإيجار: { $amount }
monopoly-deed-full-set-rent = إذا كان لدى المالك مجموعة ألوان كاملة: { $amount }
monopoly-deed-rent-one-house = مع منزل واحد: { $amount }
monopoly-deed-rent-houses = مع منازل { $count }: { $amount }
monopoly-deed-rent-hotel = مع الفندق: { $amount }
monopoly-deed-house-cost = تكلفة المنزل: { $amount }
monopoly-deed-railroad-rent = الإيجار مع خطوط السكك الحديدية { $count }: { $amount }
monopoly-deed-utility-one-owned = إذا كان لديك مرفق واحد مملوك: 4x رمي النرد
monopoly-deed-utility-both-owned = إذا كانت كلا المرافقين مملوكتين: 10x لفة النرد
monopoly-deed-utility-base-rent = الإيجار الأساسي للمرافق (الاحتياطي القديم): { $amount }
monopoly-deed-mortgage-value = قيمة الرهن العقاري: { $amount }
monopoly-deed-unmortgage-cost = تكلفة عدم الرهن العقاري: { $amount }
monopoly-deed-owner = المالك: { $owner }
monopoly-deed-current-buildings = المباني الحالية: { $buildings }
monopoly-deed-status-mortgaged = الحالة : مرهونة
monopoly-player-properties-label = { $player }، على { $space }، مربع { $position }
monopoly-player-properties-label-no-space = { $player }، مربع { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = فشل { $tx_id } { $kind } ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = قم بشراء { $property } من { $target } مقابل { $amount }
monopoly-trade-offer-cash-for-property-summary = عرض { $amount } إلى { $target } لـ { $property }
monopoly-trade-sell-property-summary = قم ببيع { $property } إلى { $target } مقابل { $amount }
monopoly-trade-offer-property-for-cash-summary = عرض { $property } إلى { $target } لـ { $amount }
monopoly-trade-swap-summary = استبدل { $give_property } بـ { $target } بـ { $receive_property }
monopoly-trade-swap-plus-cash-summary = استبدل { $give_property } + { $amount } بـ { $target } لـ { $receive_property }
monopoly-trade-swap-receive-cash-summary = استبدل { $give_property } بـ { $receive_property } + { $amount } من { $target }
monopoly-trade-buy-jail-card-summary = قم بشراء بطاقة السجن من { $target } لـ { $amount }
monopoly-trade-sell-jail-card-summary = بيع بطاقة السجن إلى { $target } لـ { $amount }

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
