# Monopoly game messages

# Game info
game-name-monopoly = Monopol

# Lobby options
monopoly-set-preset = Šablon: { $preset }
monopoly-select-preset = Izaberite Monopol šablon
monopoly-option-changed-preset = Šablon podešen na { $preset }.

# Preset labels
monopoly-preset-classic-standard = Klasična i standardna tema
monopoly-preset-junior = Dečiji Monopol
monopoly-preset-junior-modern = Dečiji Monopol (savremeni)
monopoly-preset-junior-legacy = Dečiji Monopol (stariji)
monopoly-preset-cheaters = Monopol za varalice
monopoly-preset-electronic-banking = Elektronsko bankarstvo
monopoly-preset-voice-banking = Glasovno bankarstvo
monopoly-preset-sore-losers = Monopol za ljute gubitnike
monopoly-preset-speed = Brzinski Monopol
monopoly-preset-builder = Monopol za graditelje
monopoly-preset-city = Gradski Monopol
monopoly-preset-bid-card-game = Monopol licitacija
monopoly-preset-deal-card-game = Monopol deljenja
monopoly-preset-knockout = Monopol izbacivanja
monopoly-preset-free-parking-jackpot = Džek pot na besplatnom parkingu

# Scaffold status
monopoly-announce-preset = Izgovori trenutni šablon
monopoly-current-preset = Trenutni šablon: { $preset } ({ $count } vrsta).
monopoly-scaffold-started = Monopol šablon započet sa { $preset } ({ $count } vrsta).

# Turn actions
monopoly-roll-dice = Baci kockice
monopoly-buy-property = Kupi nekretninu
monopoly-banking-balance = Proveri stanje na računu
monopoly-banking-transfer = Prebaci sredstva
monopoly-banking-ledger = Proveri bankovnu knjigu
monopoly-voice-command = Glasovna komanda
monopoly-cheaters-claim-reward = Prikupi nagradu za varanje
monopoly-end-turn = Završi potez

# Turn validation
monopoly-roll-first = Prvo morate da bacite.
monopoly-already-rolled = Već ste bacili u ovom potezu.
monopoly-no-property-to-buy = Trenutno nema nekretnina za kupovinu right now.
monopoly-property-owned = Ova nekretnina je već kupljena.
monopoly-not-enough-cash = Nemate dovoljno novca.
monopoly-action-disabled-for-preset = Ova radnja je onemogućena u odabranom šablonu.
monopoly-buy-disabled = Diretkna kupovina nekretnina je onemogućena u ovom šablonu.

# Turn events
monopoly-pass-go = { $player } prelazi početno polje i dobija { $amount } (novac: { $cash }).
monopoly-roll-result = { $player } dobija { $die1 } + { $die2 } = { $total } i staje na { $space }.
monopoly-property-available = { $property } je dostupno za { $price }.
monopoly-property-bought = { $player } kupuje { $property } za { $price } (novac: { $cash }).
monopoly-rent-paid = { $player } plaća { $amount } kao kiriju igraču { $owner } za { $property }.
monopoly-landed-owned = { $player } staje na sopstvenu nekretninu: { $property }.
monopoly-tax-paid = { $player } plaća { $amount } za { $tax } (novac: { $cash }).
monopoly-go-to-jail = { $player } ide u zatvor (prelazi na { $space }).
monopoly-bankrupt-player = Bankrotirali ste i ispadate iz igre.
monopoly-player-bankrupt = { $player } bankrotira. Kredit: { $creditor }.
monopoly-winner-by-bankruptcy = { $player } pobeđuje bankrotiranjem sa { $cash } preostalog novca.
monopoly-winner-by-cash = { $player } pobeđuje sa najvećom količinom novca: { $cash }.
monopoly-city-winner-by-value = { $player } pobeđuje u gradskom monopolu uz konačnu vrednost { $total }.

# Additional actions
monopoly-auction-property = Stavi nekretninu na aukciju
monopoly-auction-bid = Pošalji ponudu u aukciji
monopoly-auction-pass = Preskoči aukciju
monopoly-mortgage-property = Stavi nekretninu pod hipoteku
monopoly-unmortgage-property = Ukloni hipoteku sa nekretnine
monopoly-build-house = Sagradi kuću ili hotel
monopoly-sell-house = Prodaj kuću ili hotel
monopoly-offer-trade = Ponudi razmenu
monopoly-accept-trade = Prihvati razmenu
monopoly-decline-trade = Odbij razmenu
monopoly-pay-bail = Plati za izlazak iz zatvora
monopoly-use-jail-card = Koristi kartu za izlazak iz zatvora

# Additional prompts
monopoly-select-property-mortgage = Izaberite nekretninu za stavljanje pod hipoteku
monopoly-select-property-unmortgage = Izaberite nekretninu za uklanjanje hipoteke
monopoly-select-property-build = Izaberite nekretninu na kojoj želite da gradite
monopoly-select-property-sell = Izaberite nekretninu sa koje želite da prodate
monopoly-select-trade-offer = Izaberite razmenu
monopoly-select-auction-bid = Izaberite vašu ponudu na aukciji
monopoly-select-banking-transfer = Izaberite prebacivanje
monopoly-select-voice-command = Upišite glasovnu komandu koja počinje sa voice:

# Additional validation
monopoly-no-property-to-auction = Nema nekretnina koje se trenutno mogu staviti na aukciju.
monopoly-auction-active = Prvo završite aktivnu aukciju.
monopoly-no-auction-active = Nema aukcije u toku.
monopoly-not-your-auction-turn = Niste na potezu u aukciji.
monopoly-no-mortgage-options = Nemate dostupnih nekretnina za stavljanje pod hipoteku.
monopoly-no-unmortgage-options = Nemate nekretnina pod hipotekom sa kojih se hipoteka može ukloniti.
monopoly-no-build-options = Nemate nekretnina na kojima možete da gradite.
monopoly-no-sell-options = Nemate nekretnina sa dostupnim građevinama za prodaju.
monopoly-no-trade-options = Trenutno nemate ispravnih razmena koje možete da ponudite.
monopoly-no-trade-pending = Nema razmena koje čekaju na vas.
monopoly-trade-pending = Razmena već čeka.
monopoly-trade-no-longer-valid = Ta razmena više nije ispravna.
monopoly-not-in-jail = Niste u zatvoru.
monopoly-no-jail-card = Nemate kartu za izlazak iz zatvora.
monopoly-roll-again-required = Dobili ste duple i morate ponovo da bacite.
monopoly-resolve-property-first = Prvo donesite odluku o nekretnini koja čeka.

# Additional turn events
monopoly-roll-again = { $player } dobija duple i ponovo baca.
monopoly-jail-roll-doubles = { $player } dobija duple ({ $die1 } i { $die2 }) i napušta zatvor.
monopoly-jail-roll-failed = { $player } dobija { $die1 } i { $die2 } u zatvoru (pokušaj { $attempts }).
monopoly-bail-paid = { $player } plaća { $amount } kaucije (novac: { $cash }).
monopoly-three-doubles-jail = { $player } dobija tri duple u jednom potezu i odlazi u zatvor.
monopoly-jail-card-used = { $player } koristi kartu za besplatan izlazak iz zatvora ({ $cards } preostalo).
monopoly-sore-loser-rebate = { $player } dobija naknadu za ljutog gubitnika { $amount } (novac: { $cash }).
monopoly-cheaters-early-end-turn-blocked = { $player } pokušava da završi potez pre vremena i plaća kaznu za varanje od { $amount } (novac: { $cash }).
monopoly-cheaters-payment-avoidance-blocked = { $player } je izazvao plaćanje kazne za varanje od { $amount } (novac: { $cash }).
monopoly-cheaters-reward-granted = { $player } dobija nagradu za varanje  { $amount } (novac: { $cash }).
monopoly-cheaters-reward-unavailable = { $player } je već dobio nagradu za varanje u ovom potezu.

# Auctions and mortgages
monopoly-auction-no-bids = Nema ponuda za { $property }. Ostaje neprodato.
monopoly-auction-started = Aukcija za { $property } je počela (početna ponuda: { $amount }).
monopoly-auction-turn = Potez aukcije: { $player } odlučuje za { $property } (trenutna ponuda: { $amount }).
monopoly-auction-bid-placed = { $player } nudi { $amount } za { $property }.
monopoly-auction-pass-event = { $player } ne želi { $property }.
monopoly-auction-won = { $player } dobija aukciju za { $property } sa { $amount } (novac: { $cash }).
monopoly-property-mortgaged = { $player } stavlja { $property } pod hipoteku za { $amount } (novac: { $cash }).
monopoly-property-unmortgaged = { $player } uklanja hipoteku sa { $property } za { $amount } (novac: { $cash }).
monopoly-house-built = { $player } gradi na { $property } za { $amount } (nivo: { $level }, novac: { $cash }).
monopoly-house-sold = { $player } prodaje građevinu na { $property } za { $amount } (nivo: { $level }, novac: { $cash }).
monopoly-trade-offered = { $proposer } nudi razmenu igraču { $target }: { $offer }.
monopoly-trade-completed = Razmena izvršena između igrača { $proposer } i { $target }: { $offer }.
monopoly-trade-declined = { $target } odbija razmenu igrača { $proposer }: { $offer }.
monopoly-trade-cancelled = Razmena je otkazana: { $offer }.
monopoly-free-parking-jackpot = { $player } dobija džek pot na besplatnom parkingu { $amount } (novac: { $cash }).
monopoly-mortgaged-no-rent = { $player } staje na nekretninu pod hipotekom { $property }; nema kirije.
monopoly-builder-blocks-awarded = { $player } dobija { $amount } blokova za građevinu ({ $blocks } ukupno).
monopoly-builder-block-spent = { $player } troši blok za građevinu ({ $blocks } preostalo).
monopoly-banking-transfer-success = { $from_player } prebacuje { $amount } igraču { $to_player }.
monopoly-banking-transfer-failed = Prebacivanje novca igrača { $player } nije uspelo ({ $reason }).
monopoly-banking-balance-report = { $player } tekući račun: { $cash }.
monopoly-banking-ledger-report = Najnovije promene na računu: { $entries }.
monopoly-banking-ledger-empty = Još uvek nema transakcija na računu.
monopoly-voice-command-error = Greška glasovne komande: { $reason }.
monopoly-voice-command-accepted = Glasovna komanda prihvaćena: { $intent }.
monopoly-voice-command-repeat = Ponavljanje poslednjeg odgovora banke code: { $response }.
monopoly-voice-transfer-staged = Glasovno prebacivanje započeto: { $amount } za igrača { $target }. Recite voice: confirm transfer.

# Card engine
monopoly-card-drawn = { $player } vuče  kartu iz špila { $deck }: { $card }.
monopoly-card-collect = { $player } dobija { $amount } (novac: { $cash }).
monopoly-card-pay = { $player } plaća { $amount } (novac: { $cash }).
monopoly-card-move = { $player } prelazi na polje { $space }.
monopoly-card-jail-free = { $player } dobija kartu za izlazak iz zatvora ({ $cards } ukupno).

# Card descriptions
monopoly-card-advance-to-go = Krećite se do početnog polja i dobijte 200
monopoly-card-bank-dividend-50 = Banka vam plaća dividentu od 50
monopoly-card-go-back-three = Vratite se 3 polja nazad
monopoly-card-go-to-jail = Idite pravo u zatvor
monopoly-card-poor-tax-15 = Platite porez za siromaštvo od 15
monopoly-card-bank-error-200 = Greška banke u vašu korist, dobijate 200
monopoly-card-doctor-fee-50 = Cena za doktora, platite 50
monopoly-card-tax-refund-20 = Refundiranje za porez, dobijate 20
monopoly-card-get-out-of-jail = Besplatan izlazak iz zatvora

# Board profile options
monopoly-set-board = Tabla: { $board }
monopoly-select-board = Izaberite tablu za Monopol
monopoly-option-changed-board = Tabla podešena na { $board }.
monopoly-set-board-rules-mode = Režim pravila table: { $mode }
monopoly-select-board-rules-mode = Izaberite režim pravila table
monopoly-option-changed-board-rules-mode = Režim pravila table podešen na { $mode }.

# Board labels
monopoly-board-classic-default = Podrazumevana klasična
monopoly-board-mario-collectors = Super Mario Bros. Za kolektore
monopoly-board-mario-kart = Monopol igra Mario Kart
monopoly-board-mario-celebration = Super Mario Celebration
monopoly-board-mario-movie = Super Mario Bros. Filmska verzija
monopoly-board-junior-super-mario = Junior Super Mario verzija
monopoly-board-disney-princesses = Dizni Princeze
monopoly-board-disney-animation = Dizni animacija
monopoly-board-disney-lion-king = Dizni Kralj Lavova
monopoly-board-disney-mickey-friends = Dizni Miki i prijatelji
monopoly-board-disney-villains = Dizni negativci
monopoly-board-disney-lightyear = Dizni Svetlosna godina
monopoly-board-marvel-80-years = Marvel 80 godina
monopoly-board-marvel-avengers = Marvel Osvetnici
monopoly-board-marvel-spider-man = Marvel Spajdermen
monopoly-board-marvel-black-panther-wf = Marvel Crni Panter Wakanda Forever
monopoly-board-marvel-super-villains = Marvel Super negativci
monopoly-board-marvel-deadpool = Marvel Dedpul
monopoly-board-star-wars-40th = Ratovi Zvezda četrdesete
monopoly-board-star-wars-boba-fett = Ratovi Zvezda Boba Fett
monopoly-board-star-wars-light-side = Ratovi Zvezda svetla strana
monopoly-board-star-wars-the-child = Ratovi zvezda dete
monopoly-board-star-wars-mandalorian = Star Wars The Mandalorian
monopoly-board-star-wars-complete-saga = Ratovi zvezda kompletna saga
monopoly-board-harry-potter = Hari Poter
monopoly-board-fortnite = Fortnajt
monopoly-board-stranger-things = Čudne stvari
monopoly-board-jurassic-park = Park iz doba Jure
monopoly-board-lord-of-the-rings = Gospodar prstenova
monopoly-board-animal-crossing = Životinjsko putovanje
monopoly-board-barbie = Barbi
monopoly-board-disney-star-wars-dark-side = Dizni Ratovi zvezda mračna strana
monopoly-board-disney-legacy = Dizni starija verzija
monopoly-board-disney-the-edition = Dizni The verzija
monopoly-board-lord-of-the-rings-trilogy = Trilogija Gospodar prstenova
monopoly-board-star-wars-saga = Saga Ratovi zvezda
monopoly-board-marvel-avengers-legacy = Marvel Osvetnici starija verzija
monopoly-board-star-wars-legacy = Ratovi zvezda starija verzija
monopoly-board-star-wars-classic-edition = Ratovi zvezda klasična verzija
monopoly-board-star-wars-solo = Ratovi zvezda solo
monopoly-board-game-of-thrones = Igra prestola
monopoly-board-deadpool-collectors = Dedpul za kolektore
monopoly-board-toy-story = Priča o igračkama
monopoly-board-black-panther = Crni Panter
monopoly-board-stranger-things-collectors = Čudne stvari verzija za kolektore
monopoly-board-ghostbusters = Isterivači duhova
monopoly-board-marvel-eternals = Marvel Eternals
monopoly-board-transformers = Transformersi
monopoly-board-stranger-things-netflix = Čudne stvari Netflix verzija
monopoly-board-fortnite-collectors = Fortnajt za kolektore
monopoly-board-star-wars-mandalorian-s2 = Star Wars Mandalorian Season 2
monopoly-board-transformers-beast-wars = Transformersi ratovi zveri
monopoly-board-marvel-falcon-winter-soldier = Marvel Falcon and Winter Soldier
monopoly-board-fortnite-flip = Fortnite Flip Edition
monopoly-board-marvel-flip = Marvel Flip Edition
monopoly-board-pokemon = Pokemon Edition

# Board rules mode labels
monopoly-board-rules-mode-auto = Auto
monopoly-board-rules-mode-skin-only = Samo skin

# Board runtime announcements
monopoly-board-preset-autofixed = Tabla { $board } je nekompatibilna sa { $from_preset }; prebačeno na { $to_preset }.
monopoly-board-rules-simplified = Pravila table za { $board } su delimično primenjena; osnovni šablon ponašanja se koristi za mehanizme koji nedostaju.
monopoly-board-active = Aktivna tabla: { $board } (režim: { $mode }).
