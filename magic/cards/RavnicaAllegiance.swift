import Foundation

extension Object {
    
    func adapt(_ amount: Int, _ cost: Cost) {
        addActivatedAbility(
            string: "Adapt " + String(amount),
            cost: cost,
            effect: {
                if self.getCounters(.PlusOnePlusOne) == 0 {
                    self.addCounters(.PlusOnePlusOne, amount)
                }
            }
        )
    }
    
    func addendum() -> Bool {
        return self.getController().active && Game.shared.getCurrentPhase() == .FirstMain || Game.shared.getCurrentPhase() == .SecondMain
    }
    
    func afterlife(_ amount: Int) {
        addTriggeredAbility(
            trigger: .ThisDies,
            effect: { self.getController().createToken(RNA.Spirit()) }
        )
    }
}

enum RNA {
    static var set = "rna"
    static var count = 259
    
    static let cards = [
//        AngelOfGrace,
//        AngelicExaltation,
        ArchwayAngel,
        ArrestersZeal,
        BringToTrial,
        CivicStalwart,
        ConcordiaPegasus,
//        ExposeToDaylight,
//        ForbiddingSpirit,
        HaazdaOfficer,
        HeroOfPrecinctOne,
//        ImpassionedOrator,
//        JusiciarsPortal,
//        KnightOfSorrows,
//        LumberingBattlement,
        MinistrantOfObligation,
        ProwlingCaracal,
        RallyToBattle,
        ResoluteWatchdog,
        SentinelsMark,
        SkyTether,
//        SmotheringTithe,
        SpiritOfTheSpires,
        SummaryJudgment,
        SyndicateMessenger,
        TenthDistrictVeteran,
//        TitheTaker,
        TwilightPanther,
        UnbreakableFormation,
        WatchfulGiant,
        ArrestersAdmonition,
        BenthicBiomancer,
        Chillbringer,
        
        AwakenTheErstwhile,
        
        BurnBright,
        
        EndRazeForerunners,
        
        Absorb,
        Aeromunculus,
        
        AzoriusSkyguard,
        BasilicaBellHaunt,
        Bedevil,
        
        CultGuildmage,
        
        GrowthSpiral,
        
        ImperiousOligarch,
        JudithTheScourgeDiva,
        
        Mortify,
        
        RakdosFirewheeler,
        SphinxsInsight,
        
        ZeganaUtopianSpeaker,
        
        AzoriusLocket,
        
        AzoriusGuildgate243,
        AzoriusGuildgate244,
        
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    static private func Mythics() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Mythic }) }
    static private func Rares() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Rare }) }
    static private func Uncommons() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Uncommon }) }
    static private func Commons() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Common && !$0().isBasicLand() }) }
    static private func BasicLands() -> [() -> Card] { return cards.filter({ $0().isBasicLand() }) }
    
    static func GeneratePack() -> [Card] {
        var cards: [Card] = []
        
        // TODO: Foils
        
        // For the mythics and rares, two copies of each rare and one of each mythic are found on the sheet
        let sheetSize = Mythics().count + 2 * Rares().count
        cards.append(Rares()[Int.random(in: 0 ..< sheetSize)]())
        
        return cards
    }
    
    // 1 Angel of Grace
    // 2 Angelic Exaltation
    static func ArchwayAngel() -> Card {
        let archwayAngel = Card(name: "Archway Angel", rarity: .Uncommon, set: set, number: 3)
        archwayAngel.setManaCost("5W")
        archwayAngel.setType(.Creature, .Angel)
        archwayAngel.flying = true
        archwayAngel.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let numGates = archwayAngel.getController().getPermanents().filter({ $0.isType(.Gate) }).count
                archwayAngel.getController().gainLife(2 * numGates)
        })
        archwayAngel.setFlavorText("A ray of hope breaks through the shroud of rain.")
        archwayAngel.power = 3
        archwayAngel.toughness = 4
        return archwayAngel
    }
    static func ArrestersZeal() -> Card {
        let arrestersZeal = Card(name: "Arrester's Zeal", rarity: .Common, set: set, number: 4)
        arrestersZeal.setManaCost("W")
        arrestersZeal.setType(.Instant)
        arrestersZeal.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(2, 2)
                if target.addendum() {
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.flying = true; return $0 }))
                }
            }))
        arrestersZeal.setFlavorText("Law is the light of civilization.")
        return arrestersZeal
    }
    static func BringToTrial() -> Card {
        let bringToTrial = Card(name: "Bring to Trial", rarity: .Common, set: set, number: 5)
        bringToTrial.setManaCost("2G")
        bringToTrial.setType(.Sorcery)
        bringToTrial.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() >= 4 },
                zones: [.Battlefield]),
            effect: { $0.exile() }))
        bringToTrial.setFlavorText("\"In you go, big guy. Watch your head.\"")
        return bringToTrial
    }
    static func CivicStalwart() -> Card {
        let civicStalwart = Card(name: "Civic Stalwart", rarity: .Common, set: set, number: 6)
        civicStalwart.setManaCost("3W")
        civicStalwart.setType(.Creature, .Elephant, .Soldier)
        civicStalwart.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { civicStalwart.getController().getCreatures().forEach({ creature in
                creature.pump(1, 1)
            })
        })
        civicStalwart.setFlavorText("\"These are your streets. Defend them! This is your neighborhood. Honor it! This is your city. Save it!\"")
        civicStalwart.power = 3
        civicStalwart.toughness = 3
        return civicStalwart
    }
    static func ConcordiaPegasus() -> Card {
        let concordiaPegasus = Card(name: "Concordia Pegasus", rarity: .Common, set: set, number: 7)
        concordiaPegasus.setManaCost("1W")
        concordiaPegasus.setType(.Creature, .Pegasus)
        concordiaPegasus.flying = true
        concordiaPegasus.setFlavorText("\"What makes a frog lizard any worse than a bird horse? Prejudice against the Simic, that's what. It's unfair!\"\n--Thados Arquef, Guardian Project biomancer")
        concordiaPegasus.power = 1
        concordiaPegasus.toughness = 3
        return concordiaPegasus
    }
    // 8 Expose to Daylight
    // 9 Forbidding Spirit
    static func HaazdaOfficer() -> Card {
        let haazdaOfficer = Card(name: "Haazda Officer", rarity: .Common, set: set, number: 10)
        haazdaOfficer.setManaCost("2W")
        haazdaOfficer.setType(.Creature, .Human, .Soldier)
        haazdaOfficer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === haazdaOfficer.getController() },
                    zones: [.Battlefield]),
                effect: { $0.pump(1, 1) }))
        haazdaOfficer.setFlavorText("\"You two, cover the alley! You, with me! Eyes on windows, balconies, and rooftops. Who knows what a fish-octopus-crab can do!\"")
        haazdaOfficer.power = 3
        haazdaOfficer.toughness = 2
        return haazdaOfficer
    }
    static func HeroOfPrecinctOne() -> Card {
        let heroOfPrecinctOne = Card(name: "Hero of Precinct One", rarity: .Rare, set: set, number: 11)
        heroOfPrecinctOne.setManaCost("1W")
        heroOfPrecinctOne.setType(.Creature, .Human, .Warrior)
        heroOfPrecinctOne.addTriggeredAbility(
            trigger: .YouCastMulticoloredSpell,
            effect: { heroOfPrecinctOne.getController().createToken(Human()) })
        heroOfPrecinctOne.setFlavorText("When the established order falters, what remains are ordinary people and their struggle to survive.")
        heroOfPrecinctOne.power = 2
        heroOfPrecinctOne.toughness = 1
        return heroOfPrecinctOne
    }
    // 12 Impassioned Orator
    // 13 Justiciar's Portal
    // 14 Knight of Sorrows
    // 15 Lumbering Battlement
    static func MinistrantOfObligation() -> Card {
        let ministrantOfObligation = Card(name: "Ministrant of Obligation", rarity: .Uncommon, set: set, number: 16)
        ministrantOfObligation.setManaCost("2W")
        ministrantOfObligation.setType(.Creature, .Human, .Cleric)
        ministrantOfObligation.afterlife(2)
        ministrantOfObligation.setFlavorText("When the price of your sins comes due, the Church of Deals is there to collect.")
        ministrantOfObligation.power = 2
        ministrantOfObligation.toughness = 1
        return ministrantOfObligation
    }
    static func ProwlingCaracal() -> Card {
        let prowlingCaracal = Card(name: "Prowling Caracal", rarity: .Common, set: set, number: 17)
        prowlingCaracal.setManaCost("1W")
        prowlingCaracal.setType(.Creature, .Cat)
        prowlingCaracal.setFlavorText("A hunter in the city requires the utmost cunning to survive. It must pounce only if the kill is certain, and leave the remains where no one will see.")
        prowlingCaracal.power = 3
        prowlingCaracal.toughness = 1
        return prowlingCaracal
    }
    static func RallyToBattle() -> Card {
        let rallyToBattle = Card(name: "Rally to Battle", rarity: .Common, set: set, number: 18)
        rallyToBattle.setManaCost("3W")
        rallyToBattle.setType(.Instant)
        rallyToBattle.addEffect({
            rallyToBattle.getController().getCreatures().forEach({ creature in
                creature.pump(1, 3)
                creature.untap()
            })
        })
        rallyToBattle.setFlavorText("The guildmasters loom large in the political sphere, but in the end, the rulers of Ravnica are its people.")
        return rallyToBattle
    }
    static func ResoluteWatchdog() -> Card {
        let resoluteWatchdog = Card(name: "Resolute Watchdog", rarity: .Uncommon, set: set, number: 19)
        resoluteWatchdog.setManaCost("W")
        resoluteWatchdog.setType(.Creature, .Hound)
        resoluteWatchdog.defender = true
        resoluteWatchdog.addActivatedAbility(
            string: "{1}, Sacrifice ~: Target creature you control gains indestructible.",
            cost: Cost.Mana("1").Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === resoluteWatchdog.getController()},
                    zones: [.Battlefield]),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.indestructible = true; return $0 }) )}
        ))
        resoluteWatchdog.setFlavorText("A friend in good times, a guardian in bad times, and a savior when all else fails.")
        resoluteWatchdog.power = 1
        resoluteWatchdog.toughness = 3
        return resoluteWatchdog
        
    }
    static func SentinelsMark() -> Card {
        let sentinelsMark = Card(name: "Sentinel's Mark", rarity: .Uncommon, set: set, number: 20)
        sentinelsMark.setManaCost("1W")
        sentinelsMark.setType(.Enchantment, .Aura)
        sentinelsMark.flash = true
        sentinelsMark.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 2
                // TODO Layers
                object.vigilance = true;
                return object
        })
        sentinelsMark.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                if let object = sentinelsMark.attachedTo {
                    object.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0 }))
                }
            },
            restriction: { sentinelsMark.addendum() })
        return sentinelsMark
    }
    static func SkyTether() -> Card {
        let skyTether = Card(name: "Sky Tether", rarity: .Uncommon, set: set, number: 21)
        skyTether.setManaCost("W")
        skyTether.setType(.Enchantment, .Aura)
        skyTether.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.defender = true
                object.flying = false
                return object
        })
        skyTether.setFlavorText("\"If you can't control your mount, I will control it for you.\"\n--Mirela, Azorius hussar")
        return skyTether
    }
    // 22 Smothering Tithe
    static func SpiritOfTheSpires() -> Card {
        let spiritOfTheSpires = Card(name: "Spirit of the Spires", rarity: .Uncommon, set: set, number: 23)
        spiritOfTheSpires.setManaCost("3W")
        spiritOfTheSpires.setType(.Creature, .Spirit)
        spiritOfTheSpires.flying = true
        spiritOfTheSpires.addStaticAbility({ object in
            if object != spiritOfTheSpires && object.isType(.Creature) && object.flying {
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        spiritOfTheSpires.setFlavorText("She breathes fair winds to tired griffins and lifts songbirds beyond the reach of stalking cats.")
        spiritOfTheSpires.power = 2
        spiritOfTheSpires.toughness = 4
        return spiritOfTheSpires
    }
    static func SummaryJudgment() -> Card {
        let summaryJudgment = Card(name: "Summary Judgment", rarity: .Common, set: set, number: 24)
        summaryJudgment.setManaCost("1W")
        summaryJudgment.setType(.Instant)
        summaryJudgment.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.isTapped },
                zones: [.Battlefield]),
            effect: { target in
                let damage = summaryJudgment.addendum() ? 5 : 3
                summaryJudgment.damage(to: target, damage)
        }))
        summaryJudgment.setFlavorText("Any challenge to Azorius authority is met with swift and potent retribution.")
        return summaryJudgment
    }
    static func SyndicateMessenger() -> Card {
        let syndicateMessenger = Card(name: "Syndicate Messenger", rarity: .Common, set: set, number: 25)
        syndicateMessenger.setManaCost("3W")
        syndicateMessenger.setType(.Creature, .Bird)
        syndicateMessenger.flying = true
        syndicateMessenger.afterlife(1)
        syndicateMessenger.setFlavorText("\"Many wings haunt the skies these days. Few of them bear good tidings.\"\n--Lavinia")
        syndicateMessenger.power = 2
        syndicateMessenger.toughness = 3
        return syndicateMessenger
    }
    static func TenthDistrictVeteran() -> Card {
        let tenthDistrictVeteran = Card(name: "Tenth District Veteran", rarity: .Common, set: set, number: 26)
        tenthDistrictVeteran.setManaCost("2W")
        tenthDistrictVeteran.setType(.Creature, .Human, .Soldier)
        tenthDistrictVeteran.vigilance = true
        tenthDistrictVeteran.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != tenthDistrictVeteran && $0.isType(.Creature) && $0.getController() === tenthDistrictVeteran.getController() },
                    zones: [.Battlefield]),
                effect: { $0.untap() }))
        tenthDistrictVeteran.setFlavorText("\"I keep reminding myself we do this because others can't, because we love this city. If we don't save it, no one will.\"")
        tenthDistrictVeteran.power = 2
        tenthDistrictVeteran.toughness = 3
        return tenthDistrictVeteran
    }
    // 27 Tithe Taker
    static func TwilightPanther() -> Card {
        let twilightPanther = Card(name: "Twilight Panther", rarity: .Common, set: set, number: 28)
        twilightPanther.setManaCost("W")
        twilightPanther.setType(.Creature, .Cat, .Spirit)
        twilightPanther.addActivatedAbility(
            string: "{B}: ~ gains deathtouch until end of turn.",
            cost: Cost.Mana("B"),
            effect: { twilightPanther.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0 }) )})
        twilightPanther.setFlavorText("A pet that can hunt both flesh and spirit is precious in a place where smiling assassins keep company with ghostly shadows.")
        twilightPanther.power = 1
        twilightPanther.toughness = 2
        return twilightPanther
    }
    static func UnbreakableFormation() -> Card {
        let unbreakableFormation = Card(name: "Unbreakable Formation", rarity: .Rare, set: set, number: 29)
        unbreakableFormation.setManaCost("2W")
        unbreakableFormation.setType(.Instant)
        unbreakableFormation.addEffect({
            unbreakableFormation.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.indestructible = true; return $0 }))
                if unbreakableFormation.addendum() {
                    creature.addCounter(.PlusOnePlusOne)
                    creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.vigilance = true; return $0 }))
                }
            })
        })
        return unbreakableFormation
    }
    static func WatchfulGiant() -> Card {
        let watchfulGiant = Card(name: "Watchful Giant", rarity: .Common, set: set, number: 30)
        watchfulGiant.setManaCost("5W")
        watchfulGiant.setType(.Creature, .Giant, .Soldier)
        watchfulGiant.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { watchfulGiant.getController().createToken(RNA.Human()) })
        watchfulGiant.setFlavorText("Loitering is not only illegal but unwise, since those who stay too long in one place are apt to be stepped on.")
        watchfulGiant.power = 3
        watchfulGiant.toughness = 6
        return watchfulGiant
    }
    static func ArrestersAdmonition() -> Card {
        let arrestersAdmonition = Card(name: "Arrester's Admonition", rarity: .Common, set: set, number: 31)
        arrestersAdmonition.setManaCost("2U")
        arrestersAdmonition.setType(.Instant)
        arrestersAdmonition.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.bounce()
                if arrestersAdmonition.addendum() {
                    arrestersAdmonition.getController().drawCard()
                }
        }))
        arrestersAdmonition.setFlavorText("Law is the voice of reason.")
        return arrestersAdmonition
    }
    static func BenthicBiomancer() -> Card {
        let benthicBiomancer = Card(name: "Benthic Biomancer", rarity: .Rare, set: set, number: 32)
        benthicBiomancer.setManaCost("U")
        benthicBiomancer.setType(.Creature, .Merfolk, .Wizard, .Mutant)
        benthicBiomancer.adapt(1, Cost.Mana("1U"))
        benthicBiomancer.addTriggeredAbility(
            trigger: .ThisGetsPlusOnePlusOneCounter,
            effect: {
                benthicBiomancer.getController().drawCard()
                benthicBiomancer.getController().discard()
        })
        benthicBiomancer.setFlavorText("\"I am my life's work.\"")
        benthicBiomancer.power = 1
        benthicBiomancer.toughness = 1
        return benthicBiomancer
    }
    static func Chillbringer() -> Card {
        let chillbringer = Card(name: "Chillbringer", rarity: .Common, set: set, number: 33)
        chillbringer.setManaCost("4U")
        chillbringer.setType(.Creature, .Elemental)
        chillbringer.flying = true
        chillbringer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== chillbringer.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    target.tap()
                    target.untapsDuringNextUntapStep = false
        }))
        chillbringer.setFlavorText("If you can see your breath, it's too late to run.")
        chillbringer.power = 3
        chillbringer.toughness = 3
        return chillbringer
    }
    // 34
    // 35
    // 36
    // 37 Essence Capture TODO
    // 38 Eyes Everywhere
    // 39
    // 40 Gateway Sneak TODO
    // 41 Humongulus TODO
    // 42 Mass Manipulation
    // 43 Mesmerizing Benthid
    // 44 Persistent Petitioners
    // 45 Precognitive Perception
    // 46
    // 47 Pteramander
    // 48 Quench
    // 49
    // 50
    // 51
    // 52 Skatewing Spy TODO
    // 53
    // 54
    // 55 Sphinx of Foresight
    // 56
    // 57
    // 58 Verity Circle TODO
    // 59
    // 60 Windstorm Drake TODO
    static func AwakenTheErstwhile() -> Card {
        let awakenTheErstwhile = Card(name: "Awaken the Erstwhile", rarity: .Rare, set: set, number: 61)
        awakenTheErstwhile.setManaCost("3BB")
        awakenTheErstwhile.setType(.Sorcery)
        awakenTheErstwhile.addEffect({
            Game.shared.bothPlayers({ player in
                let handSize = player.getHand().count
                player.discardHand()
                for _ in 0..<handSize {
                    player.createToken(RNA.Zombie())
                }
            })
        })
        awakenTheErstwhile.setFlavorText("In preparation for the conflict all foresaw, the Golgari called upon an army that had slept for millenia beneath the city.")
        return awakenTheErstwhile
    }
    // 62 Bankrupt in Blood
    // 63 Blade Juggler
    // 64
    // 65
    // 66
    // 67
    // 68
    // 69
    // 70 Cry of the Carnarium
    // 71
    // 72
    // 73 Drill Bit
    // 74 Font of Agonies
    // 75
    // 76 Gutterbones
    // 77
    // 78
    // 79 Orzhov Enforcer TODO
    // 80 Orzhov Racketeers
    // 81 Pestilent Spirit
    // 82
    // 83 Priest of Forgotten Gods
    // 84
    // 85 Spawn of Mayhem
    // 86
    // 87
    // 88
    // 89
    // 90
    // 91
    // 92 Amplifire
    static func BurnBright() -> Card {
        let burnBright = Card(name: "Burn Bright", rarity: .Common, set: set, number: 93)
        burnBright.setManaCost("2R")
        burnBright.setType(.Instant)
        burnBright.addEffect {
            burnBright.getController().getCreatures().forEach({ $0.pump(2, 0) })
        }
        burnBright.setFlavorText("\"From a great bonfire at the dawn of time, the first Gruul kindled their rage. The same flame burns in you.\"\n--Kroshkar, Gruul shaman")
        return burnBright
    }
    // 94 Burning-Tree Vandal
    // 95 Cavalcade of Calamity
    // 96 Clamor Shaman
    // 97
    // 98
    // 99 Electrodominance
    // 100
    // 101
    // 102 Gates Ablaze TODO
    // 103
    // 104
    // 105
    // 106 Immolation Shaman
    // 107 Light Up the Stage
    // 108 Mirror March
    // 109 Rix Maadi Reveler
    // 110
    // 111
    // 112
    // 113 Scorchmark
    // 114 Skarrgan Hellkite
    // 115 Skewer the Critics
    // 116 Smelt-Ward Ignus
    // 117
    // 118
    // 119
    // 120
    // 121
    // 122 Biogenic Ooze TODO
    // 123 Biogenic Upgrade
    static func EndRazeForerunners() -> Card {
        let endRazeForerunners = Card(name: "End-Raze Forerunners", rarity: .Rare, set: set, number: 124)
        endRazeForerunners.setManaCost("5GGG")
        endRazeForerunners.setType(.Creature, .Boar)
        endRazeForerunners.vigilance = true
        endRazeForerunners.trample = true
        endRazeForerunners.haste = true
        endRazeForerunners.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                endRazeForerunners.getController().getCreatures().filter({ $0 != endRazeForerunners }).forEach({ creature in
                    creature.pump(2, 2)
                    creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.vigilance = true; $0.trample = true; return $0 }))
                })
        })
        endRazeForerunners.setFlavorText("\"Smash this city to pieces.\"\n--Domri Rade")
        endRazeForerunners.power = 7
        endRazeForerunners.toughness = 7
        return endRazeForerunners
    }
    // 125
    // 126 Gatebreaker Ram TODO
    // 127
    // 128 Growth-Chamber Guardian TODO
    // 129 Gruul Beastmaster
    // 130 Guardian Project TODO
    // 131 Incubation Druid
    // 132
    // 133
    // 134 Rampage of the Clans TODO
    // 135
    // 136 Regenesis TODO
    // 137
    // 138
    // 139
    // 140 Sauroform Hybrid TODO
    // 141 Silhana Wayfinder TODO
    // 142
    // 143
    // 144
    // 145
    // 146 Titanic Brawl TODO
    // 147
    // 148 Trollbred Guardian TODO
    // 149 Wilderness Reclamation TODO
    // 150
    static func Absorb() -> Card {
        let absorb = Card(name: "Absorb", rarity: .Rare, set: set, number: 151)
        absorb.setManaCost("WUU")
        absorb.setType(.Instant)
        absorb.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetSpell(),
            effect: { target in
                target.counter()
                absorb.getController().gainLife(3)
        }))
        absorb.setFlavorText("\"In your misguided attempt to subvery the law, you have eloquently explained why the law must exist.\"")
        return absorb
    }
    static func Aeromunculus() -> Card {
        let aeromunculus = Card(name: "Aeromunculus", rarity: .Common, set: set, number: 152)
        aeromunculus.setManaCost("1GW")
        aeromunculus.setType(.Creature, .Homunculus, .Mutant)
        aeromunculus.flying = true
        aeromunculus.adapt(1, Cost.Mana("2GU"))
        aeromunculus.setFlavorText("\"The absence of binocular vision imposes certain challenges for a flying creature, which are overcome via echolocation.\"\n--Simic research notes")
        aeromunculus.power = 2
        aeromunculus.toughness = 3
        return aeromunculus
    }
    // 153
    // 154
    static func AzoriusSkyguard() -> Card {
        let azoriusSkyguard = Card(name: "Azorius Skyguard", rarity: .Uncommon, set: set, number: 155)
        azoriusSkyguard.setManaCost("4WU")
        azoriusSkyguard.setType(.Creature, .Human, .Knight)
        azoriusSkyguard.flying = true
        azoriusSkyguard.firstStrike = true
        azoriusSkyguard.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() !== azoriusSkyguard.getController() {
                object.power = object.getBasePower() - 1
            }
            return object
        })
        azoriusSkyguard.setFlavorText("\"These new thopters are all well and good, but four eyes are better than none.\"");
        azoriusSkyguard.power = 3
        azoriusSkyguard.toughness = 3
        return azoriusSkyguard
    }
    static func BasilicaBellHaunt() -> Card {
        let basilicaBellHaunt = Card(name: "Basilica Bell-Haunt", rarity: .Uncommon, set: set, number: 156)
        basilicaBellHaunt.setManaCost("WWBB")
        basilicaBellHaunt.setType(.Creature, .Spirit)
        basilicaBellHaunt.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                basilicaBellHaunt.getOpponent().discard()
                basilicaBellHaunt.getController().gainLife(3)
        })
        basilicaBellHaunt.setFlavorText("You can hear their tolling only when your debt is due.")
        basilicaBellHaunt.power = 3
        basilicaBellHaunt.toughness = 4
        return basilicaBellHaunt
    }
    static func Bedevil() -> Card {
        let bedevil = Card(name: "Bedevil", rarity: .Rare, set: set, number: 157)
        bedevil.setManaCost("BBR")
        bedevil.setType(.Instant)
        bedevil.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Planeswalker) },
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }))
        bedevil.setFlavorText("\"It's easy to get taken in by the spectacle, to enjoy a bit of naughty amusement. But make no mistake: the Cult of Rakdos is a danger.\"\n--Tajic")
        return bedevil
    }
    // 158 Biomancer's Familiar
    // 159 Bolrac-Clan Crusher
    // 160 Captive Audience
    // 161 Cindervines TODO
    // 162 Clan Guildmage
    // 163 Combine Guildmage
    static func CultGuildmage() -> Card {
        let cultGuildmage = Card(name: "Cult Guildmage", rarity: .Uncommon, set: set, number: 164)
        cultGuildmage.setManaCost("BR")
        cultGuildmage.setType(.Creature, .Human, .Shaman)
        cultGuildmage.addActivatedAbility(
            string: "{3}{B}, {T}: Target player discards a card. Activate this ability only any time you could cast a sorcery.",
            cost: Cost.Mana("3B").Tap(),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { $0.discard() }),
            manaAbility: false,
            sorcerySpeed: true)
        cultGuildmage.addActivatedAbility(
            string: "{R}, {T}: ~ deals 1 damage to target opponent or planeswalker.",
            cost: Cost.Mana("R").Tap(),
            effect: TargetedEffect(
                restriction: TargetingRestriction(
                    restriction: { target in
                        if let objectTarget = target as? Object {
                            return objectTarget.isType(.Planeswalker)
                        }
                        if let playerTarget = target as? Player {
                            return playerTarget !== cultGuildmage.getController()
                        }
                        return false
                    },
                    zones: [.Battlefield]),
                effect: { cultGuildmage.damage(to: $0, 1) }))
        cultGuildmage.power = 2
        cultGuildmage.toughness = 2
        return cultGuildmage
    }
    // 165 Deputy of Detention
    // 166 Domri, Chaos Bringer
    // 167 Dovin, Grand Arbiter
    // 168 Dovin's Accuity TODO
    // 169 Emergency Powers
    // 170 Ethereal Absolution TODO
    // 171
    // 172 Fireblade Artist
    // 173 Frenzied Arynx
    // 174 Frilled Mystic TODO
    // 175 Galloping Lizrog
    // 176
    // 177 Grasping Thrull TODO
    static func GrowthSpiral() -> Card {
        let growthSpiral = Card(name: "Growth Spiral", rarity: .Rare, set: set, number: 178)
        growthSpiral.setManaCost("GU")
        growthSpiral.setType(.Instant)
        growthSpiral.addEffect({
            growthSpiral.getController().drawCard()
            growthSpiral.getController().chooseCard(
                from: growthSpiral.getController().getHand(),
                restriction: { $0.isType(.Land) },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield()
            })
        })
        growthSpiral.setFlavorText("Cyclical and spiral patterns are the specialty of the Gyre Clade, which seeks to revitalize the cycles of nature.")
        return growthSpiral
    }
    // 179 Gruul Spellbreaker
    // 180 Gyre Engineer TODO
    // 181 Hackrobat
    // 182 High Alert
    // 183 Hydroid Krasis
    static func ImperiousOligarch() -> Card {
        let imperiousOligarch = Card(name: "Imperious Oligarch", rarity: .Common, set: set, number: 184)
        imperiousOligarch.setManaCost("WB")
        imperiousOligarch.setType(.Creature, .Human, .Cleric)
        imperiousOligarch.vigilance = true
        imperiousOligarch.afterlife(1)
        imperiousOligarch.setFlavorText("The rights of ghosts are strictly protected under Orzhov bylaws, and those who enforce them can count on the ghosts' assistance.")
        imperiousOligarch.power = 2
        imperiousOligarch.toughness = 1
        return imperiousOligarch
    }
    static func JudithTheScourgeDiva() -> Card {
        let judith = Card(name: "Judith, the Scourge Diva", rarity: .Rare, set: set, number: 185)
        judith.setManaCost("1BR")
        judith.setType(.Legendary, .Creature, .Human, .Shaman)
        judith.addStaticAbility({ object in
            if object != judith && object.isType(.Creature) && object.getController() === judith.getController() {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        judith.addTriggeredAbility(
            trigger: .NontokenCreatureYouControlDies,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { judith.damage(to: $0, 1) }))
        judith.setFlavorText("At the end of the show, she stands alone on a stage brilliant with blood.")
        judith.power = 2
        judith.toughness = 2
        return judith
    }
    // 186 Kaya, Orzhov Usurper
    // 187 Kaya's Wrath TODO
    // 188 Knight of the Last Breath
    // 189 Lavinia, Azorius Renegade
    // 190
    // 191 Macabre Mockery
    static func Mortify() -> Card {
        let mortify = Card(name: "Mortify", rarity: .Rare, set: set, number: 192)
        mortify.setManaCost("1WB")
        mortify.setType(.Instant)
        mortify.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) || $0.isType(.Enchantment) },
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }
        ))
        mortify.setFlavorText("\"Your debt is erased.\"\n--Hilgar, Orzhov euthanist")
        return mortify
    }
    // 193 Nikya of the Old Ways
    // 194 Pitiless Pontiff
    // 195 Prime Speaker Vannifar
    // 196
    // 196 Rafter Demon
    static func RakdosFirewheeler() -> Card {
        let rakdosFirewheeler = Card(name: "Rakdos Firewheeler", rarity: .Uncommon, set: set, number: 197)
        rakdosFirewheeler.setManaCost("BBRR")
        rakdosFirewheeler.setType(.Creature, .Human, .Rogue)
        rakdosFirewheeler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect(
                restrictions: [
                    TargetingRestriction.SinglePlayer(
                        restriction: { $0 !== rakdosFirewheeler.getController() }
                    ),
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Creature) || $0.isType(.Planeswalker) },
                        zones: [.Battlefield],
                        optional: true
                    )
                ],
                effect: { targets in
                    for target in targets {
                        rakdosFirewheeler.damage(to: target, 2)
                    }
        }))
        rakdosFirewheeler.setFlavorText("Ever wonder why you don't see an old Rakdos cultist?")
        rakdosFirewheeler.power = 4
        rakdosFirewheeler.toughness = 3
        return rakdosFirewheeler
    }
    // 198 Rakdos Roustabout TODO
    // 199 Rakdos, the Showstopper TODO
    // 200 Ravager Wurm
    // 201 Rhythm of the Wild
    // 202
    // 203 Savage Smash TODO
    // 204 Senate Guildmage TODO
    // 205 Seraph of the Scales TODO
    // 206 Sharktocrab
    // 207 Simic Ascendancy
    // 208 Sphinx of New Prahv
    static func SphinxsInsight() -> Card {
        let sphinxsInsight = Card(name: "Sphinx's Insight", rarity: .Common, set: set, number: 209)
        sphinxsInsight.setManaCost("2WU")
        sphinxsInsight.setType(.Instant)
        sphinxsInsight.addEffect({
            sphinxsInsight.getController().drawCards(2)
            if sphinxsInsight.addendum() {
                sphinxsInsight.getController().gainLife(2)
            }
        })
        sphinxsInsight.setFlavorText("\"Do not think me blind to your true mission... or your true master, Grand Arbiter.\"")
        return sphinxsInsight
    }
    // 210 Sunder Shaman
    // 211 Syndicate Guildmage TODO
    // 212 Teysa Karlov
    // 213 Theater of Horrors
    static func ZeganaUtopianSpeaker() -> Card {
        let zegana = Card(name: "Zegana, Utopian Speaker", rarity: .Rare, set: set, number: 214)
        zegana.setManaCost("2GU")
        zegana.setType(.Legendary, .Creature, .Merfolk, .Wizard)
        zegana.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { zegana.getController().drawCard() },
            restriction: { !zegana.getController().getCreatures().filter({ $0 != zegana && $0.hasCounter(.PlusOnePlusOne) }).isEmpty })
        zegana.adapt(4, Cost.Mana("4GU"))
        zegana.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === zegana.getController() && object.hasCounter(.PlusOnePlusOne) {
                object.trample = true
            }
            return object
        })
        zegana.power = 4
        zegana.toughness = 4
        return zegana
    }
    // 215 Zhur-Taa Goblin
    // 216
    // 217
    // 218
    // 219
    // 220
    // 221 Bedeck // Bedazzle
    // 222 Carnival // Carnage
    // 223 Collision // Colossus
    // 224 Consecrate // Consume
    // 225 Depose // Deploy
    // 226 Incubation // Incongruity
    // 227
    // 228 Revival // Revenge
    // 229 Thrash // Threat
    // 230 Warrant // Warden
    static func AzoriusLocket() -> Card {
        let azoriusLocket = Card(name: "Azorius Locket", rarity: .Uncommon, set: set, number: 231)
        azoriusLocket.setManaCost("3")
        azoriusLocket.setType(.Artifact)
        azoriusLocket.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { azoriusLocket.getController().addMana(color: .White) },
            manaAbility: true)
        azoriusLocket.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { azoriusLocket.getController().addMana(color: .Blue) },
            manaAbility: true)
        azoriusLocket.addActivatedAbility(
            string: "{U/W}{U/W}{U/W}{U/W}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{U/W}{U/W}{U/W}{U/W}").Tap().Sacrifice(),
            effect: { azoriusLocket.getController().drawCards(2) })
        azoriusLocket.setFlavorText("\"Mandatory lockets enable the tracking of all Senate personnel for improved security and efficiency.\"\n--Dovin Baan")
        return azoriusLocket
    }
    // 232 Gate Colossus
    // 233 Glass of the Guildpact TODO
    // 234 Gruul Locket
    // 235
    // 236 Orzhov Locket
    // 237 Rakdos Locket
    // 238 Scrabbling Claws
    // 239
    // 240 Simic Locket
    // 241 Sphinx of the Guildpact
    // 242 Tome of the Guildpact TODO
    static func AzoriusGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? AzoriusGuildgate243() : AzoriusGuildgate244()
    }
    static func AzoriusGuildgate243() -> Card {
        let azoriusGuildgate = Card(name: "Azorius Guildgate", rarity: .Common, set: set, number: 243)
        azoriusGuildgate.setManaCost("")
        azoriusGuildgate.setType(.Land, .Gate)
        azoriusGuildgate.entersTapped = true
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        azoriusGuildgate.setFlavorText("\"If the populace fears our authority, then I'd say we have an appropriately sensible populace.\"\n--Dovin Baan")
        return azoriusGuildgate
    }
    static func AzoriusGuildgate244() -> Card {
        let azoriusGuildgate = Card(name: "Azorius Guildgate", rarity: .Common, set: set, number: 244)
        azoriusGuildgate.setManaCost("")
        azoriusGuildgate.setType(.Land, .Gate)
        azoriusGuildgate.entersTapped = true
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        azoriusGuildgate.setFlavorText("\"If you want to know what's really going on in any building, you don't walk in the front door. You stake out the back.\"\n--Lavinia")
        return azoriusGuildgate
    }
    // 245 Blood Crypt
    // 246 Breeding Pool
    // 247
    // 248 Godless Shrine
    // 249 Gruul Guildgate
    // 250 Gruul Guildgate
    // 251 Hallowed Fountain
    // 252 Orzhov Guildgate
    // 253 Orzhov Guildgate
    // 254
    // 255 Rakdos Guildgate
    // 256 Rakdos Guildgate
    // 257 Simic Guildgate
    // 258 Simic Guildgate
    // 259 Stomping Ground
    
    static func Human() -> Token {
        let human = Token(name: "Human", set: set, number: 1)
        human.colors = [.White]
        human.setType(.Creature, .Human)
        human.power = 1
        human.toughness = 1
        return human
    }
    // T2 Illusion
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 3)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Zombie)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    // T4 Goblin
    // T5 Centaur
    // T6 Frog Lizard
    // T7 Ooze
    // T8 Beast
    // T9 Sphinx
    static func Spirit() -> Token {
        let spirit = Token(name: "Spirit", set: set, number: 10)
        spirit.colors = [.White, .Black]
        spirit.setType(.Creature, .Spirit)
        spirit.flying = true
        spirit.power = 1
        spirit.toughness = 1
        return spirit
    }
    // T11 Thopter
    // T12 Treasure
    // T13 Domri Emblem
}
