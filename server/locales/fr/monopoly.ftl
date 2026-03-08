# Monopoly game messages

# Game info
game-name-monopoly = Monopoly

# Lobby options
monopoly-set-preset = Préréglage : { $preset }
monopoly-select-preset = Sélectionnez un préréglage Monopoly
monopoly-option-changed-preset = Préréglage réglé sur { $preset }.

# Preset labels
monopoly-preset-classic-standard = Standard classique et thématique
monopoly-preset-junior = Monopoly Junior
monopoly-preset-junior-modern = Monopoly Junior (moderne)
monopoly-preset-junior-legacy = Monopoly Junior (héritage)
monopoly-preset-cheaters = Édition des tricheurs de monopole
monopoly-preset-electronic-banking = Services bancaires électroniques
monopoly-preset-voice-banking = Banque vocale
monopoly-preset-sore-losers = Monopole pour les mauvais perdants
monopoly-preset-speed = Vitesse de monopole
monopoly-preset-builder = Constructeur de monopole
monopoly-preset-city = Ville de monopole
monopoly-preset-bid-card-game = Offre de monopole
monopoly-preset-deal-card-game = Accord de monopole
monopoly-preset-knockout = KO au monopole
monopoly-preset-free-parking-jackpot = Gros lot de stationnement gratuit

# Scaffold status
monopoly-announce-preset = Annoncer le préréglage actuel
monopoly-current-preset = Préréglage actuel : { $preset } (éditions { $count }).
monopoly-scaffold-started = L'échafaudage de monopole a commencé avec { $preset } (éditions { $count }).

# Turn actions
monopoly-roll-dice = Lancer les dés
monopoly-buy-property = Acheter une propriété
monopoly-banking-balance = Vérifier le solde bancaire
monopoly-banking-transfer = Transférer des fonds
monopoly-banking-ledger = Vérifier le grand livre bancaire
monopoly-voice-command = Commande vocale
monopoly-cheaters-claim-reward = Réclamez une récompense de triche
monopoly-end-turn = Fin du tour

# Turn validation
monopoly-roll-first = Vous devez d'abord lancer.
monopoly-already-rolled = Vous avez déjà lancé ce tour-ci.
monopoly-no-property-to-buy = Il n’y a aucune propriété à acheter pour le moment.
monopoly-property-owned = Cette propriété est déjà possédée.
monopoly-not-enough-cash = Vous n'avez pas assez d'argent.
monopoly-action-disabled-for-preset = Cette action est désactivée pour le préréglage sélectionné.
monopoly-buy-disabled = L'achat direct d'une propriété est désactivé pour ce préréglage.

# Turn events
monopoly-pass-go = { $player } a réussi GO et a collecté { $amount }.
monopoly-roll-result = { $player } a roulé { $die1 } + { $die2 } = { $total } et a atterri sur { $space }.
monopoly-roll-only = { $player } roulé { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-result = Vous avez lancé { $die1 } + { $die2 } = { $total } et atterri sur { $space }.
monopoly-player-roll-result = { $player } a roulé { $die1 } + { $die2 } = { $total } et a atterri sur { $space }.
monopoly-you-roll-only = Vous avez obtenu { $die1 } + { $die2 } = { $total }.
monopoly-player-roll-only = { $player } roulé { $die1 } + { $die2 } = { $total }.
monopoly-you-roll-only-doubles = Vous avez obtenu { $die1 } + { $die2 } = { $total }. Double!
monopoly-player-roll-only-doubles = { $player } roulé { $die1 } + { $die2 } = { $total }. Double!
monopoly-property-available = { $property } est disponible pour { $price }.
monopoly-property-bought = { $player } a acheté { $property } pour { $price }.
monopoly-rent-paid = { $player } a payé { $amount } en loyer à { $owner } pour { $property }.
monopoly-player-paid-player = { $player } a payé { $amount } à { $target }.
monopoly-you-completed-color-set = Vous possédez désormais toutes les propriétés { $group }.
monopoly-player-completed-color-set = { $player } possède désormais toutes les propriétés { $group }.
monopoly-you-completed-railroads = Vous possédez désormais tous les chemins de fer.
monopoly-player-completed-railroads = { $player } possède désormais tous les chemins de fer.
monopoly-you-completed-utilities = Vous possédez désormais tous les utilitaires.
monopoly-player-completed-utilities = { $player } possède désormais tous les utilitaires.
monopoly-landed-owned = { $player } a atterri sur sa propre propriété : { $property }.
monopoly-tax-paid = { $player } a payé { $amount } pour { $tax }.
monopoly-go-to-jail = { $player } va en prison (déplacé vers { $space }).
monopoly-bankrupt-player = Vous êtes en faillite et hors jeu.
monopoly-player-bankrupt = { $player } est en faillite. Créancier : { $creditor }.
monopoly-winner-by-bankruptcy = { $player } gagne par faillite avec les liquidités restantes de { $cash }.
monopoly-winner-by-cash = { $player } gagne avec le total de cash le plus élevé : { $cash }.
monopoly-city-winner-by-value = { $player } remporte Monopoly City avec la valeur finale { $total }.

# Additional actions
monopoly-auction-property = Propriété aux enchères
monopoly-auction-bid = Placer une offre aux enchères
monopoly-auction-pass = Passer aux enchères
monopoly-mortgage-property = Propriété hypothécaire
monopoly-unmortgage-property = Propriété non hypothéquée
monopoly-build-house = Construire une maison ou un hôtel
monopoly-sell-house = Vendre une maison ou un hôtel
monopoly-offer-trade = Offre d'échange
monopoly-accept-trade = Accepter le commerce
monopoly-decline-trade = Refuser le commerce
monopoly-read-cash = Lire de l'argent
monopoly-pay-bail = Payer une caution
monopoly-use-jail-card = Utilisez une carte de sortie de prison
monopoly-cash-report = { $cash } en espèces.
monopoly-property-amount-option = { $property } pour { $amount }
monopoly-banking-transfer-option = Transférer { $amount } vers { $target }

# Additional prompts
monopoly-select-property-mortgage = Sélectionnez un bien à hypothéquer
monopoly-select-property-unmortgage = Sélectionnez un bien à déshypothéquer
monopoly-select-property-build = Sélectionnez une propriété sur laquelle construire
monopoly-select-property-sell = Sélectionnez une propriété à vendre
monopoly-select-trade-offer = Sélectionnez une offre commerciale
monopoly-select-auction-bid = Sélectionnez votre enchère
monopoly-select-banking-transfer = Sélectionnez un transfert
monopoly-select-voice-command = Entrez une commande vocale commençant par voice:

# Additional validation
monopoly-no-property-to-auction = Il n’y a aucun bien à vendre aux enchères pour le moment.
monopoly-auction-active = Résolvez d'abord l'enchère active.
monopoly-no-auction-active = Il n'y a pas d'enchères en cours.
monopoly-not-your-auction-turn = Ce n'est pas votre tour dans la vente aux enchères.
monopoly-no-mortgage-options = Vous n'avez pas de propriétés disponibles à hypothéquer.
monopoly-no-unmortgage-options = Vous n’avez pas de propriétés hypothéquées à déshypothéquer.
monopoly-no-build-options = Vous ne disposez pas de propriétés disponibles sur lesquelles construire.
monopoly-no-sell-options = Vous n'avez pas de propriétés avec immeubles disponibles à la vente.
monopoly-no-trade-options = Vous n'avez aucune transaction valide à proposer pour le moment.
monopoly-no-trade-pending = Il n’y a aucune transaction en attente pour vous.
monopoly-trade-pending = Un échange est déjà en cours.
monopoly-trade-no-longer-valid = Cet échange n'est plus valable.
monopoly-not-in-jail = Vous n'êtes pas en prison.
monopoly-no-jail-card = Vous n'avez pas de carte de sortie de prison.
monopoly-roll-again-required = Vous avez obtenu un double et devez relancer le dé.
monopoly-resolve-property-first = Résolvez d’abord la décision relative à la propriété en attente.

# Additional turn events
monopoly-roll-again = { $player } obtient un double et obtient un autre lancer.
monopoly-you-roll-again = Vous avez lancé un double et obtenez un autre lancer.
monopoly-player-roll-again = { $player } obtient un double et obtient un autre lancer.
monopoly-jail-roll-doubles = { $player } a obtenu un double ({ $die1 } et { $die2 }) et sort de prison.
monopoly-you-jail-roll-doubles = Vous avez obtenu des doubles ({ $die1 } et { $die2 }) et sortez de prison.
monopoly-player-jail-roll-doubles = { $player } a obtenu un double ({ $die1 } et { $die2 }) et sort de prison.
monopoly-jail-roll-failed = { $player } a roulé { $die1 } et { $die2 } en prison (tentative de { $attempts }).
monopoly-bail-paid = { $player } a payé la caution de { $amount }.
monopoly-three-doubles-jail = { $player } a obtenu trois doubles en un seul tour et est envoyé en prison.
monopoly-you-three-doubles-jail = Vous avez obtenu trois doubles en un tour et êtes envoyé en prison.
monopoly-player-three-doubles-jail = { $player } a obtenu trois doubles en un seul tour et est envoyé en prison.
monopoly-jail-card-used = { $player } a utilisé une carte de sortie de prison.
monopoly-sore-loser-rebate = { $player } a reçu une remise pour mauvais perdant par rapport à { $amount }.
monopoly-cheaters-early-end-turn-blocked = { $player } a tenté de terminer le tour plus tôt et a payé une pénalité de triche de { $amount }.
monopoly-cheaters-payment-avoidance-blocked = { $player } a déclenché une pénalité de paiement pour les tricheurs de { $amount }.
monopoly-cheaters-reward-granted = { $player } a réclamé une récompense de tricheur de { $amount }.
monopoly-cheaters-reward-unavailable = { $player } a déjà réclamé la récompense des tricheurs ce tour-ci.

# Auctions and mortgages
monopoly-auction-no-bids = Aucune offre pour { $property }. Il reste invendu.
monopoly-auction-started = Début des enchères pour { $property } (offre d'ouverture : { $amount }).
monopoly-auction-turn = Tour d'enchère : { $player } pour agir sur { $property } (enchère actuelle : { $amount }).
monopoly-auction-bid-placed = { $player } a enchéri sur { $amount } pour { $property }.
monopoly-auction-pass-event = { $player } a transmis { $property }.
monopoly-auction-won = { $player } a remporté l'enchère pour { $property } à { $amount }.
monopoly-property-mortgaged = { $player } a hypothéqué { $property } pour { $amount }.
monopoly-property-unmortgaged = { $player } { $property } non hypothéqué pour { $amount }.
monopoly-house-built-house = { $player } a construit une maison sur { $property } pour { $amount }. Il a désormais { $level }.
monopoly-house-built-hotel = { $player } a construit un hôtel sur { $property } pour { $amount }.
monopoly-house-sold = { $player } a vendu un immeuble sur { $property } pour { $amount } (niveau : { $level }).
monopoly-trade-offered = { $proposer } a proposé un échange à { $target } : { $offer }.
monopoly-trade-completed = Échange réalisé entre { $proposer } et { $target } : { $offer }.
monopoly-trade-declined = { $target } a refusé le commerce de { $proposer } : { $offer }.
monopoly-trade-cancelled = Échange annulé : { $offer }.
monopoly-free-parking-jackpot = { $player } a collecté le jackpot du parking gratuit de { $amount }.
monopoly-mortgaged-no-rent = { $player } a atterri sur { $property } hypothéqué ; aucun loyer n'est dû.
monopoly-builder-blocks-awarded = { $player } a gagné des blocs de construction { $amount } (total { $blocks }).
monopoly-builder-block-spent = { $player } a dépensé un bloc de construction ({ $blocks } restant).
monopoly-banking-transfer-success = { $from_player } a transféré { $amount } à { $to_player }.
monopoly-banking-transfer-failed = Échec du virement bancaire { $player } ({ $reason }).
monopoly-banking-balance-report = Solde bancaire { $player } : { $cash }.
monopoly-banking-ledger-report = Activité bancaire récente : { $entries }.
monopoly-banking-ledger-empty = Aucune transaction bancaire pour l'instant.
monopoly-voice-command-error = Erreur de commande vocale : { $reason }.
monopoly-voice-command-accepted = Commande vocale acceptée : { $intent }.
monopoly-voice-command-repeat = Répétition du dernier code de réponse bancaire : { $response }.
monopoly-voice-transfer-staged = Transfert vocal étape par étape : { $amount } vers { $target }. Dites voice: confirm transfer.
monopoly-mortgage-transfer-interest-paid = { $player } a payé { $amount } en intérêts de transfert hypothécaire.

# Card engine
monopoly-card-drawn = { $player } a pioché une carte { $deck } : { $card }.
monopoly-card-collect = { $player } a collecté { $amount }.
monopoly-card-pay = { $player } a payé { $amount }.
monopoly-card-move = { $player } a été déplacé vers { $space }.
monopoly-card-jail-free = { $player } a reçu une carte de sortie de prison.
monopoly-card-utility-roll = { $player } roulé { $die1 } + { $die2 } = { $total } pour le loyer utilitaire.
monopoly-deck-chance = Chance
monopoly-deck-community-chest = Coffre communautaire

# Card descriptions
monopoly-card-advance-to-go = Avancez vers GO et récupérez { $amount }
monopoly-card-advance-to-illinois-avenue = Avancez jusqu’à l’avenue Illinois
monopoly-card-advance-to-st-charles-place = Avancez jusqu’à la Place Saint-Charles
monopoly-card-advance-to-nearest-utility = Avancez jusqu'au service public le plus proche
monopoly-card-advance-to-nearest-railroad = Avancez jusqu'au chemin de fer le plus proche et payez le double du loyer si vous en êtes propriétaire
monopoly-card-bank-dividend-50 = La banque vous verse un dividende de { $amount }
monopoly-card-go-back-three = Reculez de 3 espaces
monopoly-card-go-to-jail = Allez directement en prison
monopoly-card-general-repairs = Effectuez des réparations générales sur tous vos biens : { $per_house } par maison, { $per_hotel } par hôtel
monopoly-card-poor-tax-15 = Payer la mauvaise taxe de { $amount }
monopoly-card-reading-railroad = Faites un voyage au chemin de fer de Reading
monopoly-card-boardwalk = Promenez-vous sur Boardwalk
monopoly-card-chairman-of-the-board = Président du conseil d'administration, payez { $amount } à chaque joueur
monopoly-card-building-loan-matures = Votre prêt immobilier arrive à échéance, collectez { $amount }
monopoly-card-crossword-competition = Vous avez gagné un concours de mots croisés, récupérez des { $amount }
monopoly-card-bank-error-200 = Erreur bancaire en votre faveur, collectez { $amount }
monopoly-card-doctor-fee-50 = Honoraires du médecin, payez { $amount }
monopoly-card-sale-of-stock-50 = De la vente du stock, vous obtenez { $amount }
monopoly-card-holiday-fund = Le fonds de vacances arrive à échéance, recevez { $amount }
monopoly-card-tax-refund-20 = Remboursement d'impôt sur le revenu, collectez { $amount }
monopoly-card-birthday = C'est ton anniversaire, récupère des { $amount } auprès de chaque joueur
monopoly-card-life-insurance = L'assurance-vie arrive à échéance, collectez { $amount }
monopoly-card-hospital-fees-100 = Payer les frais d'hospitalisation de { $amount }
monopoly-card-school-fees-50 = Payer les frais de scolarité de { $amount }
monopoly-card-consultancy-fee-25 = Recevez les honoraires de conseil { $amount }
monopoly-card-street-repairs = Vous êtes évalué pour les réparations des rues : { $per_house } par maison, { $per_hotel } par hôtel
monopoly-card-beauty-contest-10 = Vous avez gagné le deuxième prix d'un concours de beauté, collectionnez { $amount }
monopoly-card-inherit-100 = Vous héritez de { $amount }
monopoly-card-get-out-of-jail = Sortez de prison gratuitement

# Board profile options
monopoly-set-board = Carte : { $board }
monopoly-select-board = Sélectionnez un tableau Monopoly
monopoly-option-changed-board = Carte réglée sur { $board }.
monopoly-set-board-rules-mode = Mode règles du tableau : { $mode }
monopoly-select-board-rules-mode = Sélectionnez le mode de règles du tableau
monopoly-option-changed-board-rules-mode = Mode de règles du tableau défini sur { $mode }.

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
monopoly-view-active-deed = Afficher l'acte actif
monopoly-view-active-deed-space = Voir { $property }
monopoly-browse-all-deeds = Parcourir tous les actes
monopoly-view-my-properties = Voir mes propriétés
monopoly-view-player-properties = Afficher les informations sur le joueur
monopoly-view-selected-deed = Afficher l'acte sélectionné
monopoly-view-selected-owner-property-deed = Afficher l'acte du joueur sélectionné
monopoly-select-property-deed = Sélectionnez un acte de propriété
monopoly-select-player-properties = Sélectionnez un joueur
monopoly-select-player-property-deed = Sélectionnez un acte de propriété de joueur
monopoly-no-active-deed = Il n’y a aucun acte actif à consulter pour le moment.
monopoly-no-deeds-available = Aucune propriété pouvant faire l'objet d'un acte n'est disponible sur ce forum.
monopoly-no-owned-properties = Aucune propriété détenue n'est disponible pour cette vue.
monopoly-no-players-with-properties = Aucun joueur n'est disponible.
monopoly-buy-for = Acheter pour { $amount }
monopoly-you-have-no-owned-properties = Vous ne possédez aucune propriété.
monopoly-player-has-no-owned-properties = { $player } ne possède aucune propriété.
monopoly-owner-bank = Banque
monopoly-owner-unknown = Inconnu
monopoly-building-status-hotel = avec hôtel
monopoly-building-status-one-house = avec 1 maison
monopoly-building-status-houses = avec les maisons { $count }
monopoly-mortgaged-short = hypothécaire
monopoly-deed-menu-label = { $property } ({ $owner })
monopoly-deed-menu-label-extra = { $property } ({ $owner }; { $extras })
monopoly-color-brown = Brun
monopoly-color-light_blue = Bleu clair
monopoly-color-pink = Rose
monopoly-color-orange = Orange
monopoly-color-red = Rouge
monopoly-color-yellow = Jaune
monopoly-color-green = Vert
monopoly-color-dark_blue = Bleu foncé
monopoly-deed-type-color-group = Type : groupe de couleurs { $color }
monopoly-deed-type-railroad = Type : Chemin de fer
monopoly-deed-type-utility = Type : Utilitaire
monopoly-deed-type-generic = Type : { $kind }
monopoly-deed-purchase-price = Prix ​​d'achat : { $amount }
monopoly-deed-rent = Loyer : { $amount }
monopoly-deed-full-set-rent = Si le propriétaire dispose d'un jeu de couleurs : { $amount }
monopoly-deed-rent-one-house = Avec 1 maison : { $amount }
monopoly-deed-rent-houses = Avec les maisons { $count } : { $amount }
monopoly-deed-rent-hotel = Avec hôtel : { $amount }
monopoly-deed-house-cost = Coût de la maison : { $amount }
monopoly-deed-railroad-rent = Location avec les chemins de fer { $count } : { $amount }
monopoly-deed-utility-one-owned = Si un utilitaire est possédé : 4x lancer de dés
monopoly-deed-utility-both-owned = Si les deux services publics sont possédés : 10x lancer de dés
monopoly-deed-utility-base-rent = Loyer de base des services publics (ancienne solution de secours) : { $amount }
monopoly-deed-mortgage-value = Valeur hypothécaire : { $amount }
monopoly-deed-unmortgage-cost = Coût non hypothécaire : { $amount }
monopoly-deed-owner = Propriétaire : { $owner }
monopoly-deed-current-buildings = Bâtiments actuels : { $buildings }
monopoly-deed-status-mortgaged = Statut : hypothéqué
monopoly-player-properties-label = { $player }, sur { $space }, carré { $position }
monopoly-player-properties-label-no-space = { $player }, carré { $position }
monopoly-banking-ledger-entry-success = { $tx_id } { $kind } { $from_id }->{ $to_id } { $amount } ({ $reason })
monopoly-banking-ledger-entry-failed = Échec de { $tx_id } { $kind } ({ $reason })

# Trade menu summaries
monopoly-trade-buy-property-summary = Achetez { $property } auprès de { $target } pour { $amount }
monopoly-trade-offer-cash-for-property-summary = Offre { $amount } à { $target } pour { $property }
monopoly-trade-sell-property-summary = Vendre { $property } à { $target } pour { $amount }
monopoly-trade-offer-property-for-cash-summary = Offre { $property } à { $target } pour { $amount }
monopoly-trade-swap-summary = Remplacer { $give_property } par { $target } contre { $receive_property }
monopoly-trade-swap-plus-cash-summary = Remplacer { $give_property } + { $amount } par { $target } contre { $receive_property }
monopoly-trade-swap-receive-cash-summary = Remplacer { $give_property } par { $receive_property } + { $amount } de { $target }
monopoly-trade-buy-jail-card-summary = Achetez une carte de prison auprès de { $target } pour { $amount }
monopoly-trade-sell-jail-card-summary = Vendez une carte de prison à { $target } pour { $amount }

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
