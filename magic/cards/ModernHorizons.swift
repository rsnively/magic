import Foundation

extension Object {
    func fatefulHour() -> Bool {
        return getController().getLife() <= 5
    }
    
    func battleCry() {
        self.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                self.getController().getCreatures().filter({ $0 != self && $0.isAttacking }).forEach({ $0.pump(1, 0) })
        })
    }
    func exalted() {
        self.addTriggeredAbility(
            trigger: .CreatureYouControlAttacksAlone,
            effect: { associatedObjects in
                let creature = associatedObjects[CreatureYouControlAttacksAlone_Creature]!.first!
                creature.pump(1, 1)
        })
    }
}

enum MH1 {
    static var set = "mh1"
    static var count = 254
    
    static let cards = [

        
        GenerousGift,
        
        KingOfThePride,
        
        LancerSliver,
        
        RhoxVeteran,
        SegovianAngel,
        
        SisayWeatherlightCaptain,
        
        WallOfOneThousandCuts,
        
        BazaarTrademage,
        
        Exclude,
        
        ManOWar,
        
        Oneirophage,
        
        PhantomNinja,
        
        RainOfRevelation,
        
        SpellSnuff,
        
        DeadOfWinter,
        Defile,
        
        Throatseeker,
        
        AriaOfFlame,
        
        CleavingSliver,
        
        GoblinChampion,
        
        GoblinMatron,
        GoblinOriflamme,
        
        IgneousElemental,
        
        OreScaleGuardian,
        
        RavenousGiant,
        
        ConiferWurm,
        
        LlanowarTribe,
        
        MurasaBehemoth,
        
        Regrowth,
        RimeTender,
        
        SavageSwipe,
        
        TwinSilkSpider,
        
        WallOfBlossoms,
        
        CloudshredderSliver,
        
        EladamrisCall,
        
        IceFangCoatl,
        
        MunitionsExpert,
        NaturesChant,
        
        RuinationRioter,
        
        PrismaticVista,
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 1 Morophon, the Boundless
    // 2 Astral Prayers
    // 3 Astral Drift
    // 4 Battle Screech
    // 5 Dismantling Blow
    // 6 Enduring Sliver
    // 7 Ephemerate
    // 8 Face of Divinity
    // 9 First Sliver's Chosen
    // 10 Force of Virtue
    static func GenerousGift() -> Card {
        let generousGift = Card(name: "Generous Gift", rarity: .Uncommon, set: set, number: 11)
        generousGift.setManaCost("2W")
        generousGift.setType(.Instant)
        generousGift.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetPermanent(),
            effect: { target in
                let player = target.getController()
                _ = target.destroy()
                player.createToken(Elephant())
        }))
        generousGift.setFlavorText("The best presents are impossible to regift.")
        return generousGift
    }
    // 12 Gilded Light
    // 13 Giver of Runes
    // 14 Impostor of the Sixth Pride
    // 15 Irregular Cohort
    static func KingOfThePride() -> Card {
        let kingOfThePride = Card(name: "King of the Pride", rarity: .Uncommon, set: set, number: 16)
        kingOfThePride.setManaCost("2W")
        kingOfThePride.setType(.Creature, .Cat)
        kingOfThePride.addStaticAbility(
            requirement: AbilityRequirement.OtherSubtypeYouControl(source: kingOfThePride, subtype: .Cat),
            effect: { $0.pumped(2, 1) },
            layer: .PowerToughnessChanging)
        kingOfThePride.setFlavorText("\"Glorious, to walk again across the savannah with my beloved.\"\n--\"Love Song of Night and Day\"")
        kingOfThePride.power = 2
        kingOfThePride.toughness = 1
        return kingOfThePride
    }
    // 17 Knight of Old Benalia
    static func LancerSliver() -> Card {
        let lancerSliver = Card(name: "Lancer Sliver", rarity: .Common, set: set, number: 18)
        lancerSliver.setManaCost("2W")
        lancerSliver.setType(.Creature, .Sliver)
        lancerSliver.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: lancerSliver, subtype: .Sliver),
            effect: { $0.withKeyword(.FirstStrike) },
            layer: .AbilityAddingOrRemoving)
        lancerSliver.setFlavorText("\"These polearms were supposed to help!\"\n--Merrik Aidar, Benalish patrol")
        lancerSliver.power = 2
        lancerSliver.toughness = 2
        return lancerSliver
    }
    // 19 Martyr's Soul
    // 20 On Thin Ice
    // 21 Ranger-Captain of Eos
    // 22 Recruit the Worthy
    // 23 Reprobation
    static func RhoxVeteran() -> Card {
        let rhoxVeteran = Card(name: "Rhox Veteran", rarity: .Common, set: set, number: 24)
        rhoxVeteran.setManaCost("3W")
        rhoxVeteran.setType(.Creature, .Rhino, .Soldier)
        rhoxVeteran.battleCry()
        rhoxVeteran.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== rhoxVeteran.getController() },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        rhoxVeteran.setFlavorText("\"Battle is all about where you stand. Never stand in my way.\"")
        rhoxVeteran.power = 2
        rhoxVeteran.toughness = 4
        return rhoxVeteran
    }
    static func SegovianAngel() -> Card {
        let segovianAngel = Card(name: "Segovian Angel", rarity: .Common, set: set, number: 25)
        segovianAngel.setManaCost("W")
        segovianAngel.setType(.Creature, .Angel)
        segovianAngel.flying = true
        segovianAngel.vigilance = true
        segovianAngel.setFlavorText("When Worzel summoned Segovian angels to fight Thomil's Gargantikari gnats, the ensuing battle numbered among the Multiverse's least destructive.")
        segovianAngel.power = 1
        segovianAngel.toughness = 1
        return segovianAngel
    }
    // 26 Serra the Benevolent
    // 27 Settle Beyond Reality
    // 28 Shelter
    static func SisayWeatherlightCaptain() -> Card {
        let sisay = Card(name: "Sisay, Weatherlight Captain", rarity: .Rare, set: set, number: 29)
        sisay.setManaCost("2W")
        sisay.setType(.Legendary, .Creature, .Human, .Soldier)
        sisay.addStaticAbility(
            requirement: AbilityRequirement.This(sisay),
            effect: { object in
                let otherLegendaryPermanents = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Legendary) })
                let numColors = otherLegendaryPermanents.map({ $0.colors }).joined().count
                return object.pumped(numColors, numColors)
            },
            layer: .PowerToughnessChanging)
        sisay.addActivatedAbility(
            string: "{W}{U}{B}{R}{G}: Search your library for a legendary permanent card with converted mana cost less than Sisay's power, put that card onto the battlefield, then shuffle your library.",
            cost: Cost.Mana("WUBRG"),
            effect: {
                sisay.getController().chooseCard(
                    from: sisay.getController().getLibrary(),
                    restriction: { $0.isType(.Legendary) && $0.getConvertedManaCost() < sisay.getPower() },
                    action: { chosen, rest in
                        chosen?.putOntoBattlefield()
                        sisay.getController().shuffleLibrary()
                })
        })
        return sisay
    }
    // 30 Soul-Strike Technician
    // 31 Splicer's Skill
    // 32 Stirring Address
    // 33 Trustworthy Scout
    // 34 Valiant Changeling
    // 35 Vesperlark
    static func WallOfOneThousandCuts() -> Card {
        let wallOfOneThousandCuts = Card(name: "Wall of One Thousand Cuts", rarity: .Common, set: set, number: 36)
        wallOfOneThousandCuts.setManaCost("3WW")
        wallOfOneThousandCuts.setType(.Creature, .Wall)
        wallOfOneThousandCuts.defender = true
        wallOfOneThousandCuts.flying = true
        wallOfOneThousandCuts.addActivatedAbility(
            string: "{W}: ~ can attack this turn as though it didn't have defender.",
            cost: Cost.Mana("W"),
            effect: { wallOfOneThousandCuts.giveKeywordUntilEndOfTurn(.CanAttackWithDefender) })
        wallOfOneThousandCuts.setFlavorText("Families of the fallen donate the swords of their loved ones to bolster the city's defenses.")
        wallOfOneThousandCuts.power = 3
        wallOfOneThousandCuts.toughness = 5
        return wallOfOneThousandCuts
    }
    // 37 Winds of Abandon
    // 38 Wing Shards
    // 39 Zhalfirin Decoy
    // 40 Archmage's Charm
    static func BazaarTrademage() -> Card {
        let bazaarTrademage = Card(name: "Bazaar Trademage", rarity: .Rare, set: set, number: 41)
        bazaarTrademage.setManaCost("2U")
        bazaarTrademage.setType(.Creature, .Human, .Wizard)
        bazaarTrademage.flying = true
        bazaarTrademage.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                bazaarTrademage.getController().drawCards(2)
                bazaarTrademage.getController().discard(3)
        })
        bazaarTrademage.setFlavorText("He traded a lamp for a scepter, the scepter for a ruby, and the ruby for a simple rug.")
        bazaarTrademage.power = 3
        bazaarTrademage.toughness = 4
        return bazaarTrademage
    }
    // 42 Blizzard Strix
    // 43 Chillerpillar
    // 44 Choking Tethers
    // 45 Cunning Evasion
    // 46 Echo of Eons
    // 47 Everdream
    static func Exclude() -> Card {
        let exclude = Card(name: "Exclude", rarity: .Uncommon, set: set, number: 48)
        exclude.setManaCost("2U")
        exclude.setType(.Instant)
        exclude.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreatureSpell(),
            effect: { target in
                target.counter()
                exclude.getController().drawCard()
        }))
        exclude.setFlavorText("\"I don't have time for you right now.\"\n--Teferi")
        return exclude
    }
    // 49 Eyekite
    // 50 Fact or Fiction
    // 51 Faerie Seer
    // 52 Force of Negation
    // 53 Future Sight
    // 54 Iceberg Cancrix
    static func ManOWar() -> Card {
        let manoWar = Card(name: "Man-o'-War", rarity: .Common, set: set, number: 55)
        manoWar.setManaCost("2U")
        manoWar.setType(.Creature, .Jellyfish)
        manoWar.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.bounce() }))
        manoWar.setFlavorText("\"Beauty to the eye does not always translate to the touch.\"\n--Naimah, Femeref philosopher")
        manoWar.power = 2
        manoWar.toughness = 2
        return manoWar
    }
    // 56 Marit Lage's Slumber
    // 57 Mirrodin Besieged
    // 58 Mist-Syndicate Naga
    // 59 Moonblade Shinobi
    static func Oneirophage() -> Card {
        let oneirophage = Card(name: "Oneirophage", rarity: .Uncommon, set: set, number: 60)
        oneirophage.setManaCost("3U")
        oneirophage.setType(.Creature, .Squid, .Illusion)
        oneirophage.flying = true
        oneirophage.addTriggeredAbility(
            trigger: .YouDrawCard,
            effect: { oneirophage.addCounter(.PlusOnePlusOne) })
        oneirophage.setFlavorText("It manifests at wizard academies to siphon inspiration from young prodigies.")
        oneirophage.power = 1
        oneirophage.toughness = 2
        return oneirophage
    }
    // 61 Phantasmal Form
    static func PhantomNinja() -> Card {
        let phantomNinja = Card(name: "Phantom Ninja", rarity: .Common, set: set, number: 62)
        phantomNinja.setManaCost("1UU")
        phantomNinja.setType(.Creature, .Illusion, .Ninja)
        phantomNinja.unblockable = true
        phantomNinja.setFlavorText("\"Ninjas can run across water, pull ladders from pockets, kill with a kiss, and slip between bricks. Pack of lies, I say.\"\n--Benden, teahouse gossip")
        phantomNinja.power = 2
        phantomNinja.toughness = 2
        return phantomNinja
    }
    // 63 Pondering Mage
    // 64 Prohibit
    static func RainOfRevelation() -> Card {
        let rainOfRevelation = Card(name: "Rain of Revelation", rarity: .Common, set: set, number: 65)
        rainOfRevelation.setManaCost("3U")
        rainOfRevelation.setType(.Instant)
        rainOfRevelation.addEffect({
            rainOfRevelation.getController().drawCards(3)
            rainOfRevelation.getController().discard()
        })
        rainOfRevelation.setFlavorText("\"As the sky opened up, we ran for shelter. Halfway there I came to the sudden realization that, already soaked, there might be more to gain from experiencing the rain than running from it.\"")
        return rainOfRevelation
    }
    // 66 Rebuild
    // 67 Scour All Possibilities
    // 68 Scuttling Sliver
    // 69 Smoke Shroud
    static func SpellSnuff() -> Card {
        let spellSnuff = Card(name: "Spell Snuff", rarity: .Common, set: set, number: 70)
        spellSnuff.setManaCost("1UU")
        spellSnuff.setType(.Instant)
        spellSnuff.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetSpell(),
            effect: { target in
                target.counter()
                if spellSnuff.fatefulHour() {
                    spellSnuff.getController().drawCard()
                }
        }))
        spellSnuff.setFlavorText("\"Good night.\"")
        return spellSnuff
    }
    // 71 Stream of Thought
    // 72 String of Disappearances
    // 73 Tribute Mage
    // 74 Twisted Reflection
    // 75 Urza, Lord High Artificer
    // 76 Watcher for Tomorrow
    // 77 Windcaller Aven
    // 78 Winter's Rest
    // 79 Azra Smokeshaper
    // 80 Cabal Therapist
    // 81 Carrion Feeder
    // 82 Changeling Outcast
    // 83 Cordial Vampire
    // 84 Crypt Rats
    static func DeadOfWinter() -> Card {
        let deadOfWinter = Card(name: "Dead of Winter", rarity: .Rare, set: set, number: 85)
        deadOfWinter.setManaCost("2B")
        deadOfWinter.setType(.Sorcery)
        deadOfWinter.addEffect({
            let amount = -deadOfWinter.getController().getPermanents().filter({ $0.isType(.Snow) }).count
            Game.shared.bothPlayers({ player in
                player.getCreatures().filter({ !$0.isType(.Snow) }).forEach({ $0.pump(amount, amount) })
            })
        })
        deadOfWinter.setFlavorText("\"At last, silence.\"\n--Tevesh Szat")
        return deadOfWinter
    }
    static func Defile() -> Card {
        let defile = Card(name: "Defile", rarity: .Common, set: set, number: 86)
        defile.setManaCost("B")
        defile.setType(.Instant)
        defile.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                let numSwamps = defile.getController().getPermanents().filter({ $0.isType(.Swamp) }).count
                target.pump(-numSwamps, -numSwamps)
        }))
        defile.setFlavorText("The only shortcut in a bog is to the bottom.")
        return defile
    }
    // 87 Diabolic Edict
    // 88 Dregscape Sliver
    // 89 Endling
    // 90 Feaster of Fools
    // 91 First-Sphere Gargantua
    // 92 Force of Despair"1
    // 93 Gluttonous Slug
    // 94 Graveshifter
    // 95 Headless Specter
    // 96 Mind Rake
    // 97 Mob
    // 98 Nether Spirit
    // 99 Ninja of the New Moon
    // 100 Plague Engineer
    // 101 Putrid Goblin
    // 102 Rank Officer
    // 103 Ransack the Lab
    // 104 Return from Extinction
    // 105 Sadistic Obsession
    // 106 Shatter Assumptions
    // 107 Silumgar Scavenger
    // 108 Sling-Gang Lieutenant
    // 109 Smiting Helix
    static func Throatseeker() -> Card {
        let throatseeker = Card(name: "Throatseeker", rarity: .Uncommon, set: set, number: 110)
        throatseeker.setManaCost("2B")
        throatseeker.setType(.Creature, .Vampire, .Ninja)
        throatseeker.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(
                source: throatseeker,
                subtype: .Ninja,
                additionalRequirement: { $0.isAttacking && !$0.blocked }),
            effect: { $0.withKeyword(.Lifelink) },
            layer: .AbilityAddingOrRemoving)
        throatseeker.setFlavorText("\"I just felt a drip. It must be about to rain.\"\n--Stoneway Market vendor, last words")
        throatseeker.power = 3
        throatseeker.toughness = 2
        return throatseeker
    }
    // 111 Umezawa's Charm
    // 112 Undead Augur
    // 113 Unearth
    // 114 Venemous Changeling
    // 115 Warteye Witch
    // 116 Yawgmoth, Thran Physician
    // 117 Alpine Guide
    static func AriaOfFlame() -> Card {
        let ariaOfFlame = Card(name: "Aria of Flame", rarity: .Rare, set: set, number: 118)
        ariaOfFlame.setManaCost("2R")
        ariaOfFlame.setType(.Enchantment)
        ariaOfFlame.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { ariaOfFlame.eachOpponent({ $0.gainLife(10) })})
        ariaOfFlame.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: TargetedEffect(
                restriction: TargetingRestriction.TargetPlayerOrPlaneswalker(),
                effect: { target in
                    ariaOfFlame.addCounter(.Verse)
                    ariaOfFlame.damage(to: target, ariaOfFlame.getCounters(.Verse))
            }))
        return ariaOfFlame
    }
    // 119 Bladeback Sliver
    // 120 Bogardan Dragonheart
    static func CleavingSliver() -> Card {
        let cleavingSliver = Card(name: "Cleaving Sliver", rarity: .Common, set: set, number: 121)
        cleavingSliver.setManaCost("3R")
        cleavingSliver.setType(.Creature, .Sliver)
        cleavingSliver.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: cleavingSliver, subtype: .Sliver),
            effect: { $0.pumped(2, 0) },
            layer: .PowerToughnessChanging)
        cleavingSliver.setFlavorText("When it wrigggled closer to a thrum of slivers, their talons hardened and glinted in the sun. One took a playful swipe at a tree trunk, and its new blade cut clean through.")
        cleavingSliver.power = 2
        cleavingSliver.toughness = 2
        return cleavingSliver
    }
    // 122 Firebolt
    // 123 Fists of Flame
    // 124 Force of Rage
    // 125 Geomancer's Gambit
    // 126 Goatnap
    static func GoblinChampion() -> Card {
        let goblinChampion = Card(name: "Goblin Champion", rarity: .Common, set: set, number: 127)
        goblinChampion.setManaCost("R")
        goblinChampion.setType(.Creature, .Goblin, .Warrior)
        goblinChampion.haste = true
        goblinChampion.exalted()
        goblinChampion.setFlavorText("The stories of his heroics are inspiring, though none of them are remotely true.")
        goblinChampion.power = 0
        goblinChampion.toughness = 1
        return goblinChampion
    }
    // 128 Goblin Engineer
    static func GoblinMatron() -> Card {
        let goblinMatron = Card(name: "Goblin Matron", rarity: .Uncommon, set: set, number: 129)
        goblinMatron.setManaCost("2R")
        goblinMatron.setType(.Creature, .Goblin)
        goblinMatron.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { goblinMatron.getController().chooseCard(
                from: goblinMatron.getController().getLibrary(),
                restriction: { $0.isType(.Goblin) },
                action: { chosen, rest in
                    chosen?.putIntoHand()
                    goblinMatron.getController().shuffleLibrary()
            })})
        goblinMatron.setFlavorText("A mother only a child could love.")
        goblinMatron.power = 1
        goblinMatron.toughness = 1
        return goblinMatron
    }
    static func GoblinOriflamme() -> Card {
        let goblinOriflamme = Card(name: "Goblin Oriflamme", rarity: .Uncommon, set: set, number: 130)
        goblinOriflamme.setManaCost("1R")
        goblinOriflamme.setType(.Enchantment)
        goblinOriflamme.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(
                source: goblinOriflamme,
                additionalRequirement: { $0.isAttacking }),
            effect: { return $0.pumped(1, 0) },
            layer: .PowerToughnessChanging)
        goblinOriflamme.setFlavorText("\"It was difficult to tell whether the piles of gore within the warrens were mere trash heaps, sacred altars, or warnings.\"\n--Sarpadian Empires, vol. IV")
        return goblinOriflamme
    }
    // 131 Goblin War Party
    // 132 Hollowhead Sliver
    static func IgneousElemental() -> Card {
        let igneousElemental = Card(name: "Igneous Elemental", rarity: .Common, set: set, number: 133)
        igneousElemental.setManaCost("4RR")
        igneousElemental.setType(.Creature, .Elemental)
        igneousElemental.addStaticAbility(
            requirement: AbilityRequirement.This(igneousElemental),
            effect: { object in
                let landCardInGraveyard = !object.getController().getGraveyard().filter({ $0.isType(.Land) }).isEmpty
                if landCardInGraveyard {
                    object.castingCost = object.getBaseCastingCost().reducedBy(2)
                }
                return object
            },
            layer: .CostReduction,
            allZones: true)
        igneousElemental.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { igneousElemental.damage(to: $0, 2) },
                effectOptional: true))
        igneousElemental.setFlavorText("Volcanic violence made manifest.")
        igneousElemental.power = 4
        igneousElemental.toughness = 3
        return igneousElemental
    }
    // 134 Lava Dart
    // 135 Magmatic Sinkhole
    // 136 Orcish Hellraiser
    static func OreScaleGuardian() -> Card {
        let oreScaleGuardian = Card(name: "Ore-Scale Guardian", rarity: . Uncommon, set: set, number: 137)
        oreScaleGuardian.setManaCost("5RR")
        oreScaleGuardian.setType(.Creature, .Dragon)
        oreScaleGuardian.addStaticAbility(
            requirement: AbilityRequirement.This(oreScaleGuardian),
            effect: { object in
                let landCardsInGraveyard = object.getController().getGraveyard().filter({ $0.isType(.Land) }).count
                object.castingCost = object.getBaseCastingCost().reducedBy(landCardsInGraveyard)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        oreScaleGuardian.flying = true
        oreScaleGuardian.haste = true
        oreScaleGuardian.setFlavorText("A dragon's loyalty cannot be earned, but it can be bought.")
        oreScaleGuardian.power = 4
        oreScaleGuardian.toughness = 4
        return oreScaleGuardian
    }
    // 138 Pashalik Mons
    // 139 Pillage
    // 140 Planebound Accomplice
    // 141 Pyrophobia
    // 142 Quakefoot Cyclops
    static func RavenousGiant() -> Card {
        let ravenousGiant = Card(name: "Ravenous Giant", rarity: .Uncommon, set: set, number: 143)
        ravenousGiant.setManaCost("2RR")
        ravenousGiant.setType(.Creature, .Giant)
        ravenousGiant.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: {
                ravenousGiant.damage(to: ravenousGiant.getController(), 1)
        })
        ravenousGiant.setFlavorText("The might of an army with the restraint of a child.")
        ravenousGiant.power = 5
        ravenousGiant.toughness = 5
        return ravenousGiant
    }
    // 144 Reckless Charge
    // 145 Seasoned Pyromancer
    // 146 Shenanigans
    // 147 Spinehorn Minotaur
    // 148 Spiteful Sliver
    // 149 Tectonic Reformation
    // 150 Throes of Chaos
    // 151 Urza's Rage
    // 152 Vengeful Devil
    // 153 Viashino Sandsprinter
    // 154 Volatile Claws
    // 155 Ayula, Queen Among Bears
    // 156 Ayula's Influence
    // 157 Bellowing Elk
    // 158 Collector Ouphe
    static func ConiferWurm() -> Card {
        let coniferWurm = Card(name: "Conifer Wurm", rarity: .Uncommon, set: set, number: 159)
        coniferWurm.setManaCost("4G")
        coniferWurm.setType(.Snow, .Creature, .Wurm)
        coniferWurm.trample = true
        coniferWurm.addActivatedAbility(
            string: "{3}{G}: ~ gets +X/+X until end of turn, where X is the number of snow permanents you control.",
            cost: Cost.Mana("3G"),
            effect: {
                let numSnowPermanents = coniferWurm.getController().getPermanents().filter({ $0.isType(.Snow) }).count
                coniferWurm.pump(numSnowPermanents, numSnowPermanents)
        })
        coniferWurm.setFlavorText("During seasonal thaws, the wurms slough their skin against trees to promote growth.")
        coniferWurm.power = 4
        coniferWurm.toughness = 4
        return coniferWurm
    }
    // 160 Crashing Footfalls
    // 161 Deep Forest Hermit
    // 162 Elvish Fury
    // 163 Excavating Anurid
    // 164 Force of Vigor
    // 165 Frostwalla
    // 166 Genesis
    // 167 Glacial Revelation
    // 168 Hexdrinker
    // 169 Krosan Tusker
    static func LlanowarTribe() -> Card {
        let llanowarTribe = Card(name: "Llanowar Tribe", rarity: .Uncommon, set: set, number: 170)
        llanowarTribe.setManaCost("GGG")
        llanowarTribe.setType(.Creature, .Elf, .Druid)
        llanowarTribe.addActivatedAbility(
            string: "{T}: Add {G}{G}{G}.",
            cost: Cost.Tap(),
            effect: { llanowarTribe.getController().addMana(color: .Green, 3) })
        llanowarTribe.setFlavorText("\"Llanowar remembers the Ice Age, the Phyrexian Invasion, and the Rift Era. So long as we draw breath, we will ensure such disasters never threaten our world again.\"")
        llanowarTribe.power = 3
        llanowarTribe.toughness = 3
        return llanowarTribe
    }
    // 171 Mother Bear
    static func MurasaBehemoth() -> Card {
        let murasaBehemoth = Card(name: "Murasa Behemoth", rarity: .Common, set: set, number: 172)
        murasaBehemoth.setManaCost("4GG")
        murasaBehemoth.setType(.Creature, .Beast)
        murasaBehemoth.trample = true
        murasaBehemoth.addStaticAbility(
            requirement: AbilityRequirement.This(murasaBehemoth),
            effect: { object in
                let landInGraveyard = !object.getController().getGraveyard().filter({ $0.isType(.Land) }).isEmpty
                return landInGraveyard ? object.pumped(3, 3) : object
            },
            layer: .PowerToughnessChanging)
        murasaBehemoth.setFlavorText("The loss of its hunting grounds made it all the more dangerous.")
        murasaBehemoth.power = 5
        murasaBehemoth.toughness = 5
        return murasaBehemoth
    }
    // 173 Nantuko Cultivator
    // 174 Nimble Mongoose
    static func Regrowth() -> Card {
        let regrowth = Card(name: "Regrowth", rarity: .Uncommon, set: set, number: 175)
        regrowth.setManaCost("1G")
        regrowth.setType(.Sorcery)
        regrowth.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.getOwner() === regrowth.getOwner() },
                zones: [.Graveyard] ),
            effect: { $0.putIntoHand() }))
        regrowth.setFlavorText("\"While the root remains, the tree yet lives.\"")
        return regrowth
    }
    static func RimeTender() -> Card {
        let rimeTender = Card(name: "Rime Tender", rarity: .Common, set: set, number: 176)
        rimeTender.setManaCost("1G")
        rimeTender.setType(.Snow, .Creature, .Human, .Druid)
        rimeTender.addActivatedAbility(
            string: "{T}: Untap another target snow permanent.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Snow) && $0.isPermanent() },
                    zones: [.Battlefield]),
                effect: { $0.untap() }))
        rimeTender.setFlavorText("\"Fools view winter as the season of death because they cannot see the life underneath.\"")
        rimeTender.power = 2
        rimeTender.toughness = 2
        return rimeTender
    }
    // 177 Saddled Rimestag
    static func SavageSwipe() -> Card {
        let savageSwipe = Card(name: "Savage Swipe", rarity: .Common, set: set, number: 178)
        savageSwipe.setManaCost("G")
        savageSwipe.setType(.Sorcery)
        savageSwipe.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === savageSwipe.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== savageSwipe.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                if let myCreature = targets[0] {
                    if myCreature.getPower() == 2 {
                        myCreature.pump(2, 2)
                    }
                    if let theirCreature = targets[1] {
                        myCreature.fight(theirCreature)
                    }
                }
            }))
        savageSwipe.setFlavorText("Nine generations of metalworking skill are no match for nine hundred pounds of rage.")
        return savageSwipe
    }
    // 179 Scale Up
    // 180 Spore Frog
    // 181 Springbloom Druid
    // 182 Squirrel Nest
    // 183 Tempered Sliver
    // 184 Thornado
    // 185 Treefolk Umbra
    // 186 Treetop Ambusher
    // 187 Trumpeting Herd
    static func TwinSilkSpider() -> Card {
        let twinSilkSpider = Card(name: "Twin-Silk Spider", rarity: .Common, set: set, number: 188)
        twinSilkSpider.setManaCost("2R")
        twinSilkSpider.setType(.Creature, .Spider)
        twinSilkSpider.reach = true
        twinSilkSpider.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { twinSilkSpider.getController().createToken(Spider()) })
        twinSilkSpider.setFlavorText("A forest-wide network of webs brings a hungry couple to captured prey.")
        twinSilkSpider.power = 1
        twinSilkSpider.toughness = 2
        return twinSilkSpider
    }
    // 189 Unbound Flourishing
    static func WallOfBlossoms() -> Card {
        let wallOfBlossoms = Card(name: "Wall of Blosoms", rarity: .Uncommon, set: set, number: 190)
        wallOfBlossoms.setManaCost("1G")
        wallOfBlossoms.setType(.Creature, .Plant, .Wall)
        wallOfBlossoms.defender = true
        wallOfBlossoms.addTriggeredAbility(trigger: .ThisETB, effect: { wallOfBlossoms.getController().drawCard() })
        wallOfBlossoms.setFlavorText("Each flower identical, every leaf and petal disturbingly exact.")
        wallOfBlossoms.power = 0
        wallOfBlossoms.toughness = 4
        return wallOfBlossoms
    }
    // 191 Weather the Storm
    // 192 Webweaver Changeling
    // 193 Winding Way
    // 194 Abominable Treefolk
    static func CloudshredderSliver() -> Card {
        let cloudshredderSliver = Card(name: "Cloudshredder Sliver", rarity: .Rare, set: set, number: 195)
        cloudshredderSliver.setManaCost("RW")
        cloudshredderSliver.setType(.Creature, .Sliver)
        cloudshredderSliver.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: cloudshredderSliver, subtype: .Sliver),
            effect: { $0.withKeyword(.Flying).withKeyword(.Haste) },
            layer: .AbilityAddingOrRemoving)
        cloudshredderSliver.setFlavorText("Forked tails rustled. Talons clicked. A lone sliver streaked overhead like jagged lightning, and the hive thundered.")
        cloudshredderSliver.power = 1
        cloudshredderSliver.toughness = 1
        return cloudshredderSliver
    }
    // 196 Collected Conjuring
    static func EladamrisCall() -> Card {
        let eladamrisCall = Card(name: "Eladamri's Call", rarity: .Rare, set: set, number: 197)
        eladamrisCall.setManaCost("GW")
        eladamrisCall.setType(.Sorcery)
        eladamrisCall.addEffect({
            eladamrisCall.getController().chooseCard(
                from: eladamrisCall.getController().getLibrary(),
                restriction: { $0.isType(.Creature) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    eladamrisCall.getController().shuffleLibrary()
            })
        })
        eladamrisCall.setFlavorText("Tribal rivalries and petty disputes were laid aside at Eladamri's summons.")
        return eladamrisCall
    }
    // 198 Etchings of the Chosen
    // 199 Fallen Shinobi
    // 200 The First Sliver
    // 201 Good-Fortune Unicorn
    // 202 Hogaak, Arisen Necropolis
    static func IceFangCoatl() -> Card {
        let iceFangCoatl = Card(name: "Ice-Fang Coatl", rarity: .Rare, set: set, number: 203)
        iceFangCoatl.setManaCost("GU")
        iceFangCoatl.setType(.Snow, .Creature, .Snake)
        iceFangCoatl.flash = true
        iceFangCoatl.flying = true
        iceFangCoatl.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { iceFangCoatl.getController().drawCard() })
        iceFangCoatl.addStaticAbility(
            requirement: AbilityRequirement.This(iceFangCoatl),
            effect: { object in
                let numSnowPermanents = object.getController().getPermanents().filter({ $0.isType(.Snow) }).count
                return (numSnowPermanents >= 3) ? object.withKeyword(.Deathtouch) : object
            },
            layer: .AbilityAddingOrRemoving)
        iceFangCoatl.power = 1
        iceFangCoatl.toughness = 1
        return iceFangCoatl
    }
    // 204 Ingenious Infiltrator
    // 205 Kaya's Guile
    // 206 Kess, Dissident Mage
    // 207 Lavabelly Sliver
    // 208 Lightning Skelemental
    static func MunitionsExpert() -> Card {
        let munitionsExpert = Card(name: "Munitions Expert", rarity: .Uncommon, set: set, number: 209)
        munitionsExpert.setManaCost("BR")
        munitionsExpert.setType(.Creature, .Goblin)
        munitionsExpert.flash = true
        munitionsExpert.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureOrPlaneswalker(),
                effect: { target in
                    let numGoblins = munitionsExpert.getController().getPermanents().filter({ $0.isType(.Goblin) }).count
                    munitionsExpert.damage(to: target, numGoblins)
                },
                effectOptional: true))
        munitionsExpert.setFlavorText("When dealing with goblins, if it isn't nailed down, it's headed your way.")
        munitionsExpert.power = 1
        munitionsExpert.toughness = 1
        return munitionsExpert
    }
    static func NaturesChant() -> Card {
        let naturesChant = Card(name: "Nature's Chant", rarity: .Common, set: set, number: 210)
        naturesChant.setManaCost("1{G/W}")
        naturesChant.setType(.Instant)
        naturesChant.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { _ = $0.destroy() }))
        naturesChant.setFlavorText("\"Plant every sword. Embrace every soul.\"\n--Trostani")
        return naturesChant
    }
    // 211 Reap the Past
    // 212 Rotwidow Pack
    static func RuinationRioter() -> Card {
        let ruinationRioter = Card(name: "Ruination Rioter", rarity: .Uncommon, set: set, number: 213)
        ruinationRioter.setManaCost("GR")
        ruinationRioter.setType(.Creature, .Human, .Berserker)
        ruinationRioter.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { target in
                    let landsInGraveyard = ruinationRioter.getController().getGraveyard().filter({ $0.isType(.Land) }).count
                    ruinationRioter.damage(to: target, landsInGraveyard)
                },
                effectOptional: true))
        ruinationRioter.setFlavorText("\"Those urbanist cobble-roaches won't know what hit them.\"")
        ruinationRioter.power = 2
        ruinationRioter.toughness = 2
        return ruinationRioter
    }
    // 214 Soulherder
    // 215 Thundering Djinn
    // 216 Unsettled Mariner
    // 217 Wrenn and Six
    // 218 Altar of Dementia
    // 219 Amorphous Axe
    // 220 Arcum's Astrolabe
    // 221 Birthing Boughs
    // 222 Farmstead Gleaner
    // 223 Fountain of Ichor
    // 224 Icehide Golem
    // 225 Lesser Masticore
    // 226 Mox Tantalite
    // 227 Scrapyard Recombinator
    // 228 Sword of Sinew and Steel
    // 229 Sword of Truth and Justice
    // 230 Talisman of Conviction
    // 231 Talisman of Creativity
    // 232 Talisman of Curiosity
    // 233 Talisman of Hierarchy
    // 234 Talisman of Resilience
    // 235 Universal Automaton
    // 236 Barren Moor
    // 237 Cave of Temptation
    // 238 Fiery Islet
    // 239 Forgotten Cave
    // 240 Frostwalk Bastion
    // 241 Hall of Heliod's Glory
    // 242 Lonely Sandbar
    // 243 Nurturing Peatland
    static func PrismaticVista() -> Card {
        let prismaticVista = Card(name: "Prismatic Vista", rarity: .Rare, set: set, number: 244)
        prismaticVista.setManaCost("")
        prismaticVista.setType(.Land)
        prismaticVista.addActivatedAbility(
            string: "{T}, Pay 1 life, Sacrifice ~: Search your library for a basic land card, put it onto the battlefield, then shuffle your library.",
            cost: Cost.Tap().Life(1).Sacrifice(),
            effect: { prismaticVista.getController().chooseCard(
                from: prismaticVista.getController().getLibrary(),
                restriction: { $0.isBasicLand() },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield()
                    prismaticVista.getController().shuffleLibrary()
            })
        })
        prismaticVista.setFlavorText("There is beauty in the uncertainty of potential.")
        return prismaticVista
    }
    // 245 Secluded Steppe
    // 246 Silent Clearing
    // 247 Sunbaked Canyon
    // 248 Tranquil Thicket
    // 249 Waterlogged Grove
    // Snow-Covered Basics
    // 255 Flusterstorm

    
    // T1 Shapeshifter
    // T2 Angel
    // T3 Bird
    // T4 Soldier
    // T5 Illusion
    // T6 Marit Lage
    // T7 Zombie
    // T8 Elemental
    // T9 ElementalTrampleHaste
    // T10 Goblin
    // T11 Bear
    static func Elephant() -> Token {
        let elephant = Token(name: "Elephant", set: set, number: 12)
        elephant.colors = [.Green]
        elephant.setType(.Creature, .Elephant)
        elephant.power = 3
        elephant.toughness = 3
        return elephant
    }
    // T13 Rhino
    static func Spider() -> Token {
        let spider = Token(name: "Spider", set: set, number: 14)
        spider.colors = [.Green]
        spider.setType(.Creature, .Spider)
        spider.reach = true
        spider.power = 1
        spider.toughness = 2
        return spider
    }
    // T15 Squirrel
    // T16 Spirit
    // T17 Construct
    // T18 Golem
    // T19 Myr
    // T20 Serra Emblem
    // T21 Wrenn Emblem
}
