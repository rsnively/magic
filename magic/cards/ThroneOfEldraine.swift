import Foundation

enum ELD {
    static var set = "eld"
    static var count = 269
    
    static let cards = [
        
        AllThatGliters,
        
        BelovedPrincess,
//        CharmingPrince,
        TheCircleOfLoyalty,
        
//        FaerieGodmother,
        
//        Giant Killer,
        
        HarmoniousArchon,
        
        Righteousness,
        
        ShiningArmor,
//        SilverflameRitual,
        
        TrappedInTheTower,
        TrueLovesKiss,
        VenerableKnight,
        WorthyKnight,
        
//        AnimatingFaerie,
        
        CorridorMonitor,
        
//        EmryLurkerOfTheLoch,
        
        FaerieVandal,
        
//        Frogify,
//        Gadwick, the Wizened,
//        HypnoticSprite,
        IntoTheStory,
        
        MidnightClock,
        
//        MysticalDispute,
//        Opt,
        
//        RunAwayTogether,
        
//        StolenByTheFae,
//        SyrElenoraTheDiscerning,
        TomeRaider,
//        TurnIntoAPumpkin,
        
//        WishfulMerfolk,
//        WitchingWell,
//        AyaraFirstOfLochthwain,
        BakeIntoAPie,
        
//        BelleOfTheBrawl,
        
//        BogNaughty,
//        CauldronFamiliar,
        
//        ClackbridgeTroll,
        EpicDownfall,
        EyeCollector,
        
//        FoulmireKnight,
        
//        LostLegion,
        
//        MurderousRider,
//        OathswornKnight,
//        OrderOfMidnight,
//        PiperOfTheSwarm,
//        RankleMasterOfPranks,
        
        ReaveSoul,
        
//        SmittenSwordmaster,
//        SpectersShriek,
//        SyrKonradTheGrim,
        
        WickedGuardian,
//        WishclawTalisman,
//        WitchsVengeance,
        
        BlowYourHouseDown,
        
        BrimstoneTrebuchet,
        BurningYardTrainer,
//        ClaimTheFirstborn,
        CrystalSlipper,
        Embercleave,
//        EmberethPaladin,
//        EmberethShieldbreaker,
//        FerventChampion,
        
        Joust,
        
//        MerchantOfTheVale,
//        OgreErrant,
//        OpportunisticDragon,
        RagingRedcap,
//        RedcapMelee,
        
//        RobberOfTheRich,
//        ScorchingDragonfire,
//        SearingBarrage,
//        SevenDwarves,
//        SkullknockerOgre,
//        SlayingFire,
        
//        SyrCarahTheBold,
        
        WeaselbackRedcap,
//        BeanstalkGiant,
//        CuriousPair,
//        EdgewallInnkeeper,
//        FeastingTrollKing,
        FellThePheasant,
        FierceWitchstalker,
//        FlaxenIntruder,
        
//        GarenbrigPaladin,
        
//        GildedGoose,
        
//        InsatiableAppetite,
//        KeeperOfFables,
        
//        LovestruckBeast,
//        ManaleafRider,
        OakhameAdversary,
//        OnceAndFuture,
//        OnceUponATime,
//        Outmuscle,
//        QuestingBeast,
        
//        ReturnToNature,
//        RosethornAcolyte,
        
//        TrailOfCrumbs,
        
//        WickedWolf,
//        WildbornPreserver,
        WildwoodTracker,
        WolfsQuarry,
        
//        DoomForetold,
        
        GarrukCursedHuntsman,
        
        InspiringVeteran,
//        LochmereSerpent,
        MaraleafPixie,
//        OkoThiefOfCrowns,
        OutlawsMerriment,
//        TheRoyalScions,
//        SavvyHunter,
        Shinechaser,
        SteelclawLance,
        
//        Wandermare,
        WintermoorCommander,
        ArcanistsOwl,
//        CovetousUrge,
        
//        EliteHeadhunter,
        FirebornKnight,
        
//        OakhameRanger,
        
        ThunderousSnapper,
        
//        EnchantedCarriage,
//        Gingerbrute,
        GoldenEgg,
        
//        HeraldicBanner,
//        InquisitivePuppet,
        JoustingDummy,
        
        RovingKeep,
        
//        SorcerousSpyglass,
//        SpinningWheel,
        
//        WitchsOven,
        
//        TournamentGrounds,
//        WitchsCottage,
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 1
    static func AllThatGliters() -> Card {
        let allThatGlitters = Card(name: "All That Glitters", rarity: .Uncommon, set: set, number: 2)
        allThatGlitters.setManaCost("1W")
        allThatGlitters.setType(.Enchantment, .Aura)
        allThatGlitters.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                let numArtifactsEnchantments = allThatGlitters.getController().getArtifactsAndEnchantments().count
                return object.pumped(numArtifactsEnchantments, numArtifactsEnchantments)
            },
            layer: .PowerToughnessChanging)
        allThatGlitters.setFlavorText("A faerie's glee at her trove quickly fades to contentment, then to boredom, then to an urge to steal more.")
        return allThatGlitters
    }
    // 2
    // 3
    // 4
    // 5
    // 6
    static func BelovedPrincess() -> Card {
        let belovedPrincess = Card(name: "Beloved Princess", rarity: .Common, set: set, number: 7)
        belovedPrincess.setManaCost("W")
        belovedPrincess.setType(.Creature, .Human, .Noble)
        belovedPrincess.lifelink = true
        belovedPrincess.blockabilityRequirements.append({ object in
            return object.getPower() < 3
        })
        belovedPrincess.setFlavorText("Sometimes a gentle slipper can travel where an armored boot's been denied.")
        belovedPrincess.power = 1
        belovedPrincess.toughness = 1
        return belovedPrincess
    }
    // 8 Charming Prince
    static func TheCircleOfLoyalty() -> Card {
        let theCircleOfLoyalty = Card(name: "The Circle of Loyalty", rarity: .Mythic, set: set, number: 9)
        theCircleOfLoyalty.setManaCost("4WW")
        theCircleOfLoyalty.setType(.Legendary, .Artifact)
        theCircleOfLoyalty.addStaticAbility(
            requirement: AbilityRequirement.This(theCircleOfLoyalty),
            effect: { object in
                // TODO: Make sure casting circle of loyalty w/ another on the battlefield works
                let numKnights = object.getController().getPermanents().filter({ $0.isType(.Knight) }).count
                object.castingCost = object.getBaseCastingCost().reducedBy(numKnights)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        theCircleOfLoyalty.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: theCircleOfLoyalty, subtype: .Knight),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        theCircleOfLoyalty.addTriggeredAbility(
            trigger: .YouCastLegendarySpell,
            effect: { theCircleOfLoyalty.getController().createToken(Knight()) })
        theCircleOfLoyalty.addActivatedAbility(
            string: "{3}{W}, {T}: Create a 2/2 white Knight creature token with vigilance.",
            cost: Cost.Mana("3W").Tap(),
            effect: { theCircleOfLoyalty.getController().createToken(Knight()) })
        return theCircleOfLoyalty
    }
    // 10
    // 11 Faerie Godmother
    // 12
    // 13
    // 14 Giant Killer
    // 15
    // 16
    static func HarmoniousArchon() -> Card {
        let harmoniousArchon = Card(name: "Harmonious Archon", rarity: .Mythic, set: set, number: 17)
        harmoniousArchon.setManaCost("4WW")
        harmoniousArchon.setType(.Creature, .Archon)
        harmoniousArchon.flying = true
        harmoniousArchon.addStaticAbility(
            requirement: AbilityRequirement.Creatures(additionalRequirement: { !$0.isType(.Archon) }),
            effect: { $0.withBasePowerAndToughness(3, 3) },
            layer: .PowerToughnessSetting)
        harmoniousArchon.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                harmoniousArchon.getController().createToken(Human())
                harmoniousArchon.getController().createToken(Human())
            })
        harmoniousArchon.setFlavorText("First among equals.")
        harmoniousArchon.power = 4
        harmoniousArchon.toughness = 5
        return harmoniousArchon
    }
    
    static func Righteousness() -> Card {
        let righteousness = Card(name: "Righteousness", rarity: .Uncommon, set: set, number: 27)
        righteousness.setManaCost("W")
        righteousness.setType(.Instant)
        righteousness.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.blocking },
                zones: [.Battlefield]),
            effect: { $0.pump(7, 7) }))
        righteousness.setFlavorText("Syr Damon looked at the dragon and saw the faces of every innocent it had devoured. Suddenly, his sword blazed like the sun.")
        return righteousness
    }
    // 28
    static func ShiningArmor() -> Card {
        let shiningArmor = Card(name: "Shining Armor", rarity: .Common, set: set, number: 29)
        shiningArmor.setManaCost("1W")
        shiningArmor.setType(.Artifact, .Equipment)
        shiningArmor.flash = true
        shiningArmor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Knight) && $0.getController() === shiningArmor.getController() },
                    zones: [.Battlefield]),
                effect: { shiningArmor.attachTo($0) }))
        shiningArmor.addEquipAbility(
            string: "{3}: Equip",
            cost: Cost.Mana("3"),
            effects: [
                ({ $0.pumped(0, 2) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.Vigilance) }, .AbilityAddingOrRemoving)
            ])
        return shiningArmor
    }
    // 30 Silverflame Ritual
    // 31
    // 32
    static func TrappedInTheTower() -> Card {
        let trappedInTheTower = Card(name: "Trapped in the Tower", rarity: .Common, set: set, number: 33)
        trappedInTheTower.setManaCost("1W")
        trappedInTheTower.setType(.Enchantment, .Aura)
        trappedInTheTower.addEnchantAbility(
            restriction: TargetingRestriction.SingleObject(
                // TODO: make sure you can't enchant flying creatures, make sure giving flying causes to fall off
                restriction: { $0.isType(.Creature) && !$0.flying },
                zones: [.Battlefield]),
            effects: [
                ({ return $0.withKeyword(.CantAttack) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantBlock) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantActivateAbilities) }, .AbilityAddingOrRemoving),
            ])
        trappedInTheTower.setFlavorText("\"At least up here I have some peace and quiet.\"")
        return trappedInTheTower
    }
    static func TrueLovesKiss() -> Card {
        let trueLovesKiss = Card(name: "True Love's Kiss", rarity: .Common, set: set, number: 34)
        trueLovesKiss.setManaCost("2WW")
        trueLovesKiss.setType(.Instant)
        trueLovesKiss.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { object in
                object.exile()
                trueLovesKiss.getController().drawCard()
        }))
        trueLovesKiss.setFlavorText("\"Be careful, dear. Some people deserve their curses.\"\n--Marawen, barrow witch")
        return trueLovesKiss
    }
    static func VenerableKnight() -> Card {
        let venerableKnight = Card(name: "Venerable Knight", rarity: .Uncommon, set: set, number: 35)
        venerableKnight.setManaCost("W")
        venerableKnight.setType(.Creature, .Human, .Knight)
        venerableKnight.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Knight) && $0.getController() === venerableKnight.getController()},
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        venerableKnight.setFlavorText("\"May this blade guide you on your great journey, as it did me on mine.\"")
        venerableKnight.power = 2
        venerableKnight.toughness = 1
        return venerableKnight
    }
    static func WorthyKnight() -> Card {
        let worthyKnight = Card(name: "Worthy Knight", rarity: .Rare, set: set, number: 36)
        worthyKnight.setManaCost("1W")
        worthyKnight.setType(.Creature, .Human, .Knight)
        worthyKnight.addTriggeredAbility(
            trigger: .YouCastKnightSpell,
            effect: { worthyKnight.getController().createToken(Human()) })
        worthyKnight.setFlavorText("Every Ardenvale aspirant must step through the flame. Their honor determines whether they burn or shine.")
        worthyKnight.power = 2
        worthyKnight.toughness = 2
        return worthyKnight
    }
    // 37
    // 38 Animating Faerie
    // 39
    // 40
    static func CorridorMonitor() -> Card {
        let corridorMonitor = Card(name: "Corridor Monitor", rarity: .Common, set: set, number: 41)
        corridorMonitor.setManaCost("1U")
        corridorMonitor.setType(.Artifact, .Creature, .Construct)
        corridorMonitor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { ($0.isType(.Artifact) || $0.isType(.Creature)) && $0.getController() === corridorMonitor.getController()},
                    zones: [.Battlefield]),
                effect: { $0.untap() }))
        corridorMonitor.setFlavorText("Castle Vantress has no locks on its doors, but interlopers rarely make it past the foyer.")
        corridorMonitor.power = 1
        corridorMonitor.toughness = 4
        return corridorMonitor
    }
    // 42
    // 43 Emry, Lurker of the Loch
    // 44
    static func FaerieVandal() -> Card {
        let faerieVandal = Card(name: "Faerie Vandal", rarity: .Uncommon, set: set, number: 45)
        faerieVandal.setManaCost("1U")
        faerieVandal.setType(.Creature, .Faerie, .Rogue)
        faerieVandal.flash = true
        faerieVandal.flying = true
        faerieVandal.addTriggeredAbility(
            trigger: .YouDrawSecondCard,
            effect: { faerieVandal.addCounter(.PlusOnePlusOne) })
        faerieVandal.setFlavorText("History may be written by the triumphant, but it's often rewritten by the troublesome.")
        faerieVandal.power = 1
        faerieVandal.toughness = 2
        return faerieVandal
    }
    // 46
    // 47 Frogify
    // 48 Gadwick, the Wizened
    // 49 Hypnotic Sprite
    static func IntoTheStory() -> Card {
        let intoTheStory = Card(name: "Into the Story", rarity: .Uncommon, set: set, number: 50)
        intoTheStory.setManaCost("5UU")
        intoTheStory.setType(.Instant)
        intoTheStory.addStaticAbility(
            requirement: AbilityRequirement.This(intoTheStory),
            effect: { object in
                if object.anyOpponent({ $0.getGraveyard().count >= 7 }) {
                    object.castingCost = object.getBaseCastingCost().reducedBy(3)
                }
                return object
            },
            layer: .CostReduction,
            allZones: true)
        intoTheStory.addEffect({
            intoTheStory.getController().drawCards(4)
        })
        intoTheStory.setFlavorText("The boundary between real and imaginary is as thin as the page, and just as easily torn.")
        return intoTheStory
    }
    // 51
    // 52
    // 53
    static func MidnightClock() -> Card {
        let midnightClock = Card(name: "Midnight Clock", rarity: .Rare, set: set, number: 54)
        midnightClock.setManaCost("2U")
        midnightClock.setType(.Artifact)
        midnightClock.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { midnightClock.getController().addMana(color: .Blue )},
            manaAbility: true)
        midnightClock.addActivatedAbility(
            string: "{2}{U}: Put an hour counter on ~.",
            cost: Cost.Mana("2U"),
            effect: { midnightClock.addCounter(.Hour) })
        midnightClock.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { midnightClock.addCounter(.Hour) })
        midnightClock.addTriggeredAbility(
            trigger: .ThisGetsTwelfthHourCounter,
            effect: {
                midnightClock.getController().shuffleGraveyardAndHandIntoLibrary()
                midnightClock.getController().drawCards(7)
                midnightClock.exile()
            })
        return midnightClock
    }
    // 55
    // 56
    // 57
    // 58 Mystical Dispute
    // 59 Opt
    // 60
    // 61
    // 62 Run Away Together
    // 63
    // 64
    // 65
    // 66 Stolen by the Fae
    // 67 Syr Elenora, the Discerning
    static func TomeRaider() -> Card {
        let tomeRaider = Card(name: "Tome Raider", rarity: .Common, set: set, number: 68)
        tomeRaider.setManaCost("2U")
        tomeRaider.setType(.Creature, .Faerie)
        tomeRaider.flying = true
        tomeRaider.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { tomeRaider.getController().drawCard() })
        tomeRaider.setFlavorText("\"Humans are so forgetful. Every page I steal becomes a secret they can't remember.\"")
        tomeRaider.power = 1
        tomeRaider.toughness = 1
        return tomeRaider
    }
    // 69 Turn Into a Pumpkin
    // 70
    // 71
    // 72
    // 73 Wishful Merfolk
    // 74 Witching Well
    // 75 Ayara, First of Lochthwain
    static func BakeIntoAPie() -> Card {
        let bakeIntoAPie = Card(name: "Bake Into a Pie", rarity: .Common, set: set, number: 76)
        bakeIntoAPie.setManaCost("2BB")
        bakeIntoAPie.setType(.Instant)
        bakeIntoAPie.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: {
                _ = $0.destroy()
                bakeIntoAPie.getController().createToken(Food())
        }))
        bakeIntoAPie.setFlavorText("\"My secret ingredient? Well, I can't tell you that. But here's a hint. It's not love.\"")
        return bakeIntoAPie
    }
    // 77
    // 78 Belle of the Brawl
    // 79
    // 80 Bog Naughty
    // 81 Cauldron Familiar
    // 82
    // 83
    // 84 Clackbridge Troll
    static func EpicDownfall() -> Card {
        let epicDownfall = Card(name: "Epic Downfall", rarity: .Uncommon, set: set, number: 85)
        epicDownfall.setManaCost("1B")
        epicDownfall.setType(.Sorcery)
        epicDownfall.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getConvertedManaCost() >= 3 },
                zones: [.Battlefield]),
            effect: { $0.exile() }))
        epicDownfall.setFlavorText("The dragon had a lot of things going through his mind that day. He didn't expect a sword to be one of them.")
        return epicDownfall
    }
    static func EyeCollector() -> Card {
        let eyeCollector = Card(name: "Eye Collector", rarity: .Common, set: set, number: 86)
        eyeCollector.setManaCost("B")
        eyeCollector.setType(.Creature, .Faerie)
        eyeCollector.flying = true
        eyeCollector.addTriggeredAbility(
            trigger: .ThisDealsCombatDamageToPlayer,
            effect: {
                Game.shared.bothPlayers({ $0.mill(1) })
        })
        eyeCollector.setFlavorText("\"Lord Rankle will see you now--all he asks is a small token of tribute.\"")
        eyeCollector.power = 1
        eyeCollector.toughness = 1
        return eyeCollector
    }
    // 87
    // 88
    // 89
    // 90 Foulmire Knight
    // 91
    // 92
    // 93
    // 94 Lost Legion
    // 95
    // 96
    // 97 Murderous Rider
    // 98 Oathsworn Knight
    // 99 Order of Midnight
    // 100 Piper of the Swarm
    // 101 Rankle, Master of Pranks
    // 102
    static func ReaveSoul() -> Card {
        let reaveSoul = Card(name: "Reave Soul", rarity: .Common, set: set, number: 103)
        reaveSoul.setManaCost("1B")
        reaveSoul.setType(.Sorcery)
        reaveSoul.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() <= 3 },
                zones: [.Battlefield]),
            effect: { _ = $0.destroy() }))
        reaveSoul.setFlavorText("\"Into amethyst, I pour\nEnvy's shadow, sorrow's gleam.\nLure the one whose scorn I bore\nThat I may hear one final scream.\"\n--Barrow witch incantation")
        return reaveSoul
    }
    // 104
    // 105 Smitten Swordmaster
    // 106 Specter's Shriek
    // 107 Syr Konrad, the Grim
    // 108
    static func WickedGuardian() -> Card {
        let wickedGuardian = Card(name: "Wicked Guardian", rarity: .Common, set: set, number: 109)
        wickedGuardian.setManaCost("3B")
        wickedGuardian.setType(.Creature, .Human, .Noble)
        wickedGuardian.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != wickedGuardian && $0.isType(.Creature) && $0.getController() === wickedGuardian.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    wickedGuardian.damage(to: target, 2)
                    wickedGuardian.getController().drawCard()
                },
                effectOptional: true))
        wickedGuardian.setFlavorText("\"Some are born to greatness. You were born to scrub greatness's floors.\"")
        wickedGuardian.power = 4
        wickedGuardian.toughness = 2
        return wickedGuardian
    }
    // 110 Wishclaw Talisman
    // 111 Witch's Vengeance
    // 112
    // 113
    static func BlowYourHouseDown() -> Card {
        let blowYourHouseDown = Card(name: "Blow Your House Down", rarity: .Common, set: set, number: 114)
        blowYourHouseDown.setManaCost("2R")
        blowYourHouseDown.setType(.Sorcery)
        blowYourHouseDown.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.TargetCreature(optional: true),
                TargetingRestriction.TargetCreature(optional: true),
                TargetingRestriction.TargetCreature(optional: true),
            ],
            effect: { objects in
                for case .some(let object) in objects {
                    object.giveKeywordUntilEndOfTurn(.CantBlock)
                    if object.isType(.Wall) {
                        _ = object.destroy()
                    }
                }
            },
            distinctTargets: true))
        blowYourHouseDown.setFlavorText("\"You think these walls will protect you? My, you have a dim view of the power of the wilds.\"\n--Marawn, barrow witch")
        return blowYourHouseDown
    }
    // 115
    static func BrimstoneTrebuchet() -> Card {
        let brimstoneTrebuchet = Card(name: "Brimstone Trebuchet", rarity: .Common, set: set, number: 116)
        brimstoneTrebuchet.setManaCost("2R")
        brimstoneTrebuchet.setType(.Artifact, .Creature, .Wall)
        brimstoneTrebuchet.defender = true
        brimstoneTrebuchet.reach = true
        brimstoneTrebuchet.addActivatedAbility(
            string: "{T}: ~ deals 1 damage to each opponent.",
            cost: Cost.Tap(),
            effect: { brimstoneTrebuchet.eachOpponent({ brimstoneTrebuchet.damage(to: $0, 1) }) })
        brimstoneTrebuchet.addTriggeredAbility(
            trigger: .KnightEntersBattlefieldUnderYourControl,
            effect: { brimstoneTrebuchet.untap() })
        brimstoneTrebuchet.power = 1
        brimstoneTrebuchet.toughness = 3
        return brimstoneTrebuchet
    }
    static func BurningYardTrainer() -> Card {
        let burningYardTrainer = Card(name: "Burning-Yard Trainer", rarity: .Uncommon, set: set, number: 117)
        burningYardTrainer.setManaCost("4R")
        burningYardTrainer.setType(.Creature, .Human, .Knight)
        burningYardTrainer.trample = true
        burningYardTrainer.haste = true
        burningYardTrainer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != burningYardTrainer && $0.isType(.Knight) && $0.getController() === burningYardTrainer.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    target.pump(2, 2)
                    target.giveKeywordUntilEndOfTurn(.Trample)
                    target.giveKeywordUntilEndOfTurn(.Haste)
                }))
        burningYardTrainer.setFlavorText("\"For every scar I've received, I've given ten back.\"")
        burningYardTrainer.power = 3
        burningYardTrainer.toughness = 3
        return burningYardTrainer
    }
    // 118 Claim the Firstborn
    static func CrystalSlipper() -> Card {
        let crystalSlipper = Card(name: "Crystal Slipper", rarity: .Common, set: set, number: 119)
        crystalSlipper.setManaCost("1R")
        crystalSlipper.setType(.Artifact, .Equipment)
        crystalSlipper.addEquipAbility(
            string: "{1}: Equip.",
            cost: Cost.Mana("1"),
            effects: [
                ({ $0.pumped(1, 0) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.Haste) }, .AbilityAddingOrRemoving)
            ])
        crystalSlipper.setFlavorText("\"After the death of her mother, Cassia found that things that appear fragile can be very strong indeed.\"\n--Beyond the Great Henge")
        return crystalSlipper
    }
    static func Embercleave() -> Card {
        let embercleave = Card(name: "Embercleave", rarity: .Mythic, set: set, number: 120)
        embercleave.setManaCost("4RR")
        embercleave.setType(.Legendary, .Artifact, .Equipment)
        embercleave.flash = true
        embercleave.addStaticAbility(
            requirement: AbilityRequirement.This(embercleave),
            effect: { object in
                // TODO: Make sure casting w/ another on the battlefield works
                let numAttackingCreatures = object.getController().getCreatures().filter({ $0.isAttacking }).count
                object.castingCost = object.getBaseCastingCost().reducedBy(numAttackingCreatures)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        embercleave.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === embercleave.getController() },
                    zones: [.Battlefield]),
                effect: { embercleave.attachTo($0) }))
        embercleave.addEquipAbility(
            string: "{3}: Equip",
            cost: Cost.Mana("3"),
            effects: [
                ({ $0.pumped(1, 1) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.DoubleStrike) }, .AbilityAddingOrRemoving),
                ({ $0.withKeyword(.Trample) }, .AbilityAddingOrRemoving)
            ])
        return embercleave
    }
    // 121 Embereth Paladin
    // 122 Embereth Shieldbreaker
    // 123
    // 124 Fervent Champion
    // 125
    // 126
    // 127
    // 128
    static func Joust() -> Card {
        let joust = Card(name: "Joust", rarity: .Uncommon, set: set, number: 129)
        joust.setManaCost("1R")
        joust.setType(.Sorcery)
        joust.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === joust.getController() },
                    zones: [.Battlefield]
                ),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== joust.getController() },
                    zones: [.Battlefield]
                )
            ],
            effect: { targets in
                if let myCreature = targets[0] {
                    if myCreature.isType(.Knight) {
                        myCreature.pump(2, 1)
                    }
                    if let theirCreature = targets[1] {
                        myCreature.fight(theirCreature)
                    }
                }
        }))
        joust.setFlavorText("\"Life is a tournament that rewards the bold.\"\n--Syr Layne, knight of Embereth")
        return joust
    }
    // 130
    // 131 Merchant of the Vale
    // 132 Ogre Errant
    // 133 Opportunistic Dragon
    static func RagingRedcap() -> Card {
        let ragingRedcap = Card(name: "Raging Redcap", rarity: .Common, set: set, number: 134)
        ragingRedcap.setManaCost("2R")
        ragingRedcap.setType(.Creature, .Goblin, .Knight)
        ragingRedcap.doubleStrike = true
        ragingRedcap.setFlavorText("Many tales of redcap terror begin with two simple things: bloodlust and stolen steel.")
        ragingRedcap.power = 1
        ragingRedcap.toughness = 2
        return ragingRedcap
    }
    // 135 Redcap Melee
    // 136
    // 137
    // 138 Robber of the Rich
    // 139 Scorching Dragonfire
    // 140 Searing Barrage
    // 141 Seven Dwarves
    // 142 Skullknocker Ogre
    // 143 Slaying Fire
    // 144
    // 145 Syr Carah, the Bold
    // 146
    // 147
    static func WeaselbackRedcap() -> Card {
        let weaselbackRedcap = Card(name: "Weaselback Redcap", rarity: .Common, set: set, number: 148)
        weaselbackRedcap.setManaCost("R")
        weaselbackRedcap.setType(.Creature, .Goblin, .Knight)
        weaselbackRedcap.addActivatedAbility(
            string: "{1}{R}: ~ gets +2/+0 until end of turn.",
            cost: Cost.Mana("1R"),
            effect: { weaselbackRedcap.pump(2, 0) })
        weaselbackRedcap.setFlavorText("\"I would rather cast myself into the abyss than let my blood stain the cap of these monsters.\"\n--Syr Alin, the Lion's Claw")
        weaselbackRedcap.power = 1
        weaselbackRedcap.toughness = 1
        return weaselbackRedcap
    }
    // 149 Beanstalk Giant
    // 150 Curious Pair
    // 151 Edgewall Innkeeper
    // 152 Feasting Troll King
    static func FellThePheasant() -> Card {
        let fellThePheasant = Card(name: "Phell the Pheasant", rarity: .Common, set: set, number: 153)
        fellThePheasant.setManaCost("2G")
        fellThePheasant.setType(.Instant)
        fellThePheasant.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.flying },
                zones: [.Battlefield]),
            effect: { target in
                fellThePheasant.damage(to: target, 5)
                fellThePheasant.getController().createToken(Food())
        }))
        fellThePheasant.setFlavorText("\"A keen eye and a steady hand are essential for defeating most foes, including hunger.\"\n--Syr Grenphire, knight of Garenbrig")
        return fellThePheasant
    }
    static func FierceWitchstalker() -> Card {
        let fierceWitchstalker = Card(name: "Fierce Witchstalker", rarity: .Common, set: set, number: 154)
        fierceWitchstalker.setManaCost("2GG")
        fierceWitchstalker.setType(.Creature, .Wolf)
        fierceWitchstalker.trample = true
        fierceWitchstalker.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { fierceWitchstalker.getController().createToken(Food()) })
        fierceWitchstalker.setFlavorText("While the realm has laws, in the wilds there are other ways of balancing power.")
        fierceWitchstalker.power = 4
        fierceWitchstalker.toughness = 4
        return fierceWitchstalker
    }
    // 155 Flaxen Intruder
    // 156
    // 157 Garenbrig Paladin
    // 158
    // 159
    // 160 Gilded Goose
    // 161
    // 162 Insatiable Appetite
    // 163 Keeper of Fables
    // 164
    // 165 Lovestruck Beast
    // 166 Manaleaf Rider
    static func OakhameAdversary() -> Card {
        let oakhameAdversary = Card(name: "Oakhame Adversary", rarity: .Uncommon, set: set, number: 167)
        oakhameAdversary.setManaCost("3G")
        oakhameAdversary.setType(.Creature, .Elf, .Warrior)
        oakhameAdversary.addStaticAbility(
            requirement: AbilityRequirement.This(oakhameAdversary),
            effect: { object in
                if oakhameAdversary.anyOpponent({ !$0.getPermanents().filter({ $0.isColor(.Green) }).isEmpty }) {
                    object.castingCost = object.getBaseCastingCost().reducedBy(2)
                }
                return object
            },
            layer: .CostReduction,
            allZones: true)
        oakhameAdversary.deathtouch = true
        oakhameAdversary.addTriggeredAbility(
            trigger: .ThisDealsCombatDamageToPlayer,
            effect: { oakhameAdversary.getController().drawCard() })
        oakhameAdversary.setFlavorText("The elves remember every secret path from the days when they ruled the realm.")
        oakhameAdversary.power = 2
        oakhameAdversary.toughness = 3
        return oakhameAdversary
    }
    // 168 Once and Future
    // 169 Once Upon a Time
    // 170 Outmuscle
    // 171 Questing Beast
    // 172
    // 173 Return to Nature
    // 174 Rosethorn Acolyte
    // 175
    // 176
    // 177
    // 178
    // 179 Trail of Crumbs
    // 180
    // 181 Wicked Wolf
    // 182 Wildborn Preserver
    static func WildwoodTracker() -> Card {
        let wildwoodTracker = Card(name: "Wildwood Tracker", rarity: .Common, set: set, number: 183)
        wildwoodTracker.setManaCost("G")
        wildwoodTracker.setType(.Creature, .Elf, .Warrior)
        wildwoodTracker.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { wildwoodTracker.pump(1, 1) },
            effectOptional: false,
            restriction: { !wildwoodTracker.getController().getCreatures().filter({ $0 != wildwoodTracker && !$0.isType(.Human) }).isEmpty })
        wildwoodTracker.addTriggeredAbility(
            trigger: .ThisBlocks,
            effect: { wildwoodTracker.pump(1, 1) },
            effectOptional: false,
            restriction: { !wildwoodTracker.getController().getCreatures().filter({ $0 != wildwoodTracker && !$0.isType(.Human) }).isEmpty })
        wildwoodTracker.setFlavorText("\"This one was wearing shoes made of glass. She'll be no ordinary prey.\"")
        wildwoodTracker.power = 1
        wildwoodTracker.toughness = 1
        return wildwoodTracker
    }
    static func WolfsQuarry() -> Card {
        let wolfsQuarry = Card(name: "Wolf's Quarry", rarity: .Common, set: set, number: 184)
        wolfsQuarry.setManaCost("4GG")
        wolfsQuarry.setType(.Sorcery)
        wolfsQuarry.addEffect({
            wolfsQuarry.getController().createToken(Boar())
            wolfsQuarry.getController().createToken(Boar())
            wolfsQuarry.getController().createToken(Boar())
        })
        wolfsQuarry.setFlavorText("\"The monster was gaining on them. Twice it had found them. There was only one place left to hide.\"\n--Tales of the Fae")
        return wolfsQuarry
    }
    // 185
    // 186
    // 187 Doom Foretold
    // 188
    // 189
    // 190
    static func GarrukCursedHuntsman() -> Card {
        let garruk = Card(name: "Garruk, Cursed Huntsman", rarity: .Mythic, set: set, number: 191)
        garruk.setManaCost("4BG")
        garruk.setType(.Legendary, .Planeswalker, .Garruk)
        garruk.addLoyaltyAbility(
            string: "{+0}: Create two 2/2 black and green Wolf creature tokens with \"When this creature dies, put a loyalty counter on each Garruk you control.\"",
            loyalty: 0,
            effect: {
                garruk.getController().createToken(Wolf())
                garruk.getController().createToken(Wolf())
            })
        garruk.addLoyaltyAbility(
            string: "{-3}: Destroy target creature. Draw a card.",
            loyalty: -3,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { target in
                    _ = target.destroy()
                    garruk.getController().drawCard()
                }))
        garruk.addLoyaltyAbility(
            string: "{-6}: You get an emblem with \"Creatures you control get +3/+3 and have trample.\"",
            loyalty: -6,
            effect: { garruk.getController().createEmblem(GarrukEmblem()) })
        garruk.startingLoyalty = 5
        return garruk
    }
    // 192
    // 193
    static func InspiringVeteran() -> Card {
        let inspiringVeteran = Card(name: "Inspiring Veteran", rarity: .Uncommon, set: set, number: 194)
        inspiringVeteran.setManaCost("RW")
        inspiringVeteran.setType(.Creature, .Human, .Knight)
        inspiringVeteran.addStaticAbility(
            requirement: AbilityRequirement.OtherSubtypeYouControl(source: inspiringVeteran, subtype: .Knight),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        inspiringVeteran.setFlavorText("\"I fight for my daughter, who may not set foot on a battlefield for many years. Remember who you fight for.\"")
        inspiringVeteran.power = 2
        inspiringVeteran.toughness = 2
        return inspiringVeteran
    }
    // 195 Lochmere Serpent
    static func MaraleafPixie() -> Card {
        let maraleafPixie = Card(name: "Maraleaf Pixie", rarity: .Uncommon, set: set, number: 196)
        maraleafPixie.setManaCost("GU")
        maraleafPixie.setType(.Creature, .Faerie)
        maraleafPixie.flying = true
        maraleafPixie.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: {
                maraleafPixie.getController().addMana(color: .Green)
            },
            manaAbility: true)
        maraleafPixie.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: {
                maraleafPixie.getController().addMana(color: .Blue)
            },
            manaAbility: true)
        maraleafPixie.setFlavorText("Neither hostile nor friendly, pixies flit through the forest seeking the treasures of the wilds.")
        maraleafPixie.power = 2
        maraleafPixie.toughness = 2
        return maraleafPixie
    }
    // 197 Oko, Thief of Crowns
    static func OutlawsMerriment() -> Card {
        let outlawsMerriment = Card(name: "Outlaws' Merriment", rarity: .Mythic, set: set, number: 198)
        outlawsMerriment.setManaCost("1RWW")
        outlawsMerriment.setType(.Enchantment)
        outlawsMerriment.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: {
                let r = Int.random(in: 1 ... 3)
                if r == 1 {
                    outlawsMerriment.getController().createToken(HumanWarrior())
                } else if r == 2 {
                    outlawsMerriment.getController().createToken(HumanCleric())
                } else {
                    outlawsMerriment.getController().createToken(HumanRogue())
                }
            })
        return outlawsMerriment
    }
    // 199 The Royal Scions
    // 200 Savvy Hunter
    static func Shinechaser() -> Card {
        let shinechaser = Card(name: "Shinechaser", rarity: .Uncommon, set: set, number: 201)
        shinechaser.setManaCost("1WU")
        shinechaser.setType(.Creature, .Faerie)
        shinechaser.flying = true
        shinechaser.vigilance = true
        shinechaser.addStaticAbility(
            requirement: AbilityRequirement.This(shinechaser),
            effect: { object in
                if !object.getController().getArtifacts().isEmpty {
                    return object.pumped(1, 1)
                }
                return object
            },
            layer: .PowerToughnessChanging)
        shinechaser.addStaticAbility(
            requirement: AbilityRequirement.This(shinechaser),
            effect: { object in
                if !object.getController().getEnchantments().isEmpty {
                    return object.pumped(1, 1)
                }
                return object
            },
            layer: .PowerToughnessChanging)
        shinechaser.power = 1
        shinechaser.toughness = 1
        return shinechaser
    }
    static func SteelclawLance() -> Card {
        let steelclawLance = Card(name: "Steelclaw Lance", rarity: .Uncommon, set: set, number: 202)
        steelclawLance.setManaCost("BR")
        steelclawLance.setType(.Artifact, .Equipment)
        
        func effect(_ object: Object) -> Object { return object.pumped(2, 2) }
        steelclawLance.addEquipAbility(
            string: "{1}: Equip Knight.",
            cost: Cost.Mana("1"),
            effect: effect,
            layer: .PowerToughnessChanging,
            restriction: { $0.isType(.Knight) })
        steelclawLance.addEquipAbility(
            string: "{3}: Equip.",
            cost: Cost.Mana("3"),
            effect: effect,
            layer: .PowerToughnessChanging)
        
        steelclawLance.setFlavorText("\"A traditional lance is fine for the Burning Yard, but in the wilds you need a nastier bite.\"\n--Kenver, Embereth weaponsmith")
        return steelclawLance
    }
    // 203
    // 204 Wandermare
    static func WintermoorCommander() -> Card {
        let wintermoorCommander = Card(name: "Wintermoor Commander", rarity: .Uncommon, set: set, number: 205)
        wintermoorCommander.setManaCost("WB")
        wintermoorCommander.setType(.Creature, .Human, .Knight)
        wintermoorCommander.deathtouch = true
        wintermoorCommander.addStaticAbility(
            requirement: AbilityRequirement.This(wintermoorCommander),
            effect: { object in
                object.toughness = object.getController().getPermanents().filter({ $0.isType(.Knight) }).count
                return object
            },
            layer: .PowerToughnessCDA,
            allZones: true)
        wintermoorCommander.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != wintermoorCommander && $0.isType(.Knight) && $0.getController() === wintermoorCommander.getController() },
                    zones: [.Battlefield]),
                effect: { $0.giveKeywordUntilEndOfTurn(.Indestructible) }))
        wintermoorCommander.power = 2
        return wintermoorCommander
    }
    static func ArcanistsOwl() -> Card {
        let arcanistsOwl = Card(name: "Arcanist's Owl", rarity: .Uncommon, set: set, number: 206)
        arcanistsOwl.setManaCost("{W/U}{W/U}{W/U}{W/U}")
        arcanistsOwl.setType(.Artifact, .Creature, .Owl)
        arcanistsOwl.flying = true
        arcanistsOwl.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { arcanistsOwl.getController().chooseCard(
                from: Array(arcanistsOwl.getController().getLibrary().suffix(4)),
                restriction: { $0.isType(.Artifact) || $0.isType(.Enchantment) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    arcanistsOwl.getController().putOnBottomOfLibrary(&rest, random: true)
            })
        })
        arcanistsOwl.power = 3
        arcanistsOwl.toughness = 3
        return arcanistsOwl
    }
    // 207 Covetous Urge
    // 208
    // 209 Elite Headhunter
    static func FirebornKnight() -> Card {
        let firebornKnight = Card(name: "Fireborn Knight", rarity: .Uncommon, set: set, number: 210)
        firebornKnight.setManaCost("{R/W}{R/W}{R/W}{R/W}")
        firebornKnight.setType(.Creature, .Human, .Knight)
        firebornKnight.doubleStrike = true
        firebornKnight.addActivatedAbility(
            string: "{R/W}{R/W}{R/W}{R/W}: ~ gets +1/+1 until end of turn.",
            cost: Cost.Mana("{R/W}{R/W}{R/W}{R/W}"),
            effect: { firebornKnight.pump(1, 1) })
        firebornKnight.setFlavorText("He endured the white-hot blaze of the Circle and the sweltering heat of the Ironcrag, and he emerged victorious.")
        firebornKnight.power = 2
        firebornKnight.toughness = 3
        return firebornKnight
    }
    // 211
    // 212 Oakhame Ranger
    // 213
    // 214
    static func ThunderousSnapper() -> Card {
        let thunderousSnapper = Card(name: "Thunderous Snapper", rarity: .Uncommon, set: set, number: 215)
        thunderousSnapper.setManaCost("{G/U}{G/U}{G/U}{G/U}")
        thunderousSnapper.setType(.Creature, .Turtle, .Hydra)
        thunderousSnapper.addTriggeredAbility(
            trigger: .YouCastSpellCMCFiveOrGreater,
            effect: { thunderousSnapper.getController().drawCard() })
        thunderousSnapper.setFlavorText("While humans hear only a deafening roar, the fae hear music of breathtaking beauty.")
        thunderousSnapper.power = 4
        thunderousSnapper.toughness = 4
        return thunderousSnapper
    }
    // 216
    // 217
    // 218 Enchanted Carriage
    // 219 Gingerbrute
    static func GoldenEgg() -> Card {
        let goldenEgg = Card(name: "Golden Egg", rarity: .Common, set: set, number: 220)
        goldenEgg.setManaCost("2")
        goldenEgg.setType(.Artifact, .Food)
        goldenEgg.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { goldenEgg.getController().drawCard() })
        goldenEgg.addActivatedAbility(
            string: "{1}, {T}, Sacrifice ~: Add {W}.",
            cost: Cost.Mana("1").Tap().Sacrifice(),
            effect: { goldenEgg.getController().addMana(color: .White) })
        goldenEgg.addActivatedAbility(
            string: "{1}, {T}, Sacrifice ~: Add {U}.",
            cost: Cost.Mana("1").Tap().Sacrifice(),
            effect: { goldenEgg.getController().addMana(color: .Blue) })
        goldenEgg.addActivatedAbility(
            string: "{1}, {T}, Sacrifice ~: Add {B}.",
            cost: Cost.Mana("1").Tap().Sacrifice(),
            effect: { goldenEgg.getController().addMana(color: .Black) })
        goldenEgg.addActivatedAbility(
            string: "{1}, {T}, Sacrifice ~: Add {R}.",
            cost: Cost.Mana("1").Tap().Sacrifice(),
            effect: { goldenEgg.getController().addMana(color: .Red) })
        goldenEgg.addActivatedAbility(
            string: "{1}, {T}, Sacrifice ~: Add {G}.",
            cost: Cost.Mana("1").Tap().Sacrifice(),
            effect: { goldenEgg.getController().addMana(color: .Green) })
        goldenEgg.addActivatedAbility(
            string: "{2}, {T}, Sacrifice ~: You gain 3 life.",
            cost: Cost.Mana("2").Tap().Sacrifice(),
            effect: { goldenEgg.getController().gainLife(3) })
        return goldenEgg
    }
    // 221
    // 222 Heraldic Banner
    // 223 Inquisitive Puppet
    static func JoustingDummy() -> Card {
        let joustingDummy = Card(name: "Jousting Dummy", rarity: .Common, set: set, number: 224)
        joustingDummy.setManaCost("2")
        joustingDummy.setType(.Artifact, .Creature, .Scarecrow, .Knight)
        joustingDummy.addActivatedAbility(
            string: "{3}: ~ gets +1/+0 until end of turn.",
            cost: Cost.Mana("3"),
            effect: { joustingDummy.pump(1, 0) })
        joustingDummy.setFlavorText("\"Don't let it fool you. Most of us got our first scars from Syr Nobody.\"\n--Syr Layne, knight of Embereth")
        joustingDummy.power = 2
        joustingDummy.toughness = 1
        return joustingDummy
    }
    // 225
    // 226
    // 227
    static func RovingKeep() -> Card {
        let rovingKeep = Card(name: "Roving Keep", rarity: .Common, set: set, number: 228)
        rovingKeep.setManaCost("7")
        rovingKeep.setType(.Artifact, .Creature, .Wall)
        rovingKeep.defender = true
        rovingKeep.addActivatedAbility(
            string: "{7}: ~ gets +2/+0 and gains trample until end of turn. It can attack this turn as though it didn't have defender.",
            cost: Cost.Mana("7"),
            effect: {
                rovingKeep.pump(2, 0)
                rovingKeep.giveKeywordUntilEndOfTurn(.Trample)
                rovingKeep.giveKeywordUntilEndOfTurn(.CanAttackWithDefender)
        })
        rovingKeep.setFlavorText("\"It wandered slowly across the landscape, calling out in its lonely voice, but no other castles answered its cries.\"\n--Beyond the Great Henge")
        rovingKeep.power = 5
        rovingKeep.toughness = 7
        return rovingKeep
    }
    // 229
    // 230
    // 231
    // 232
    // 233 Sorcerous Spyglass
    // 234 Spinning Wheel
    // 235
    // 236
    // 237 Witch's Oven
    
    // 248 Tournament Grounds
    // 249 Witch's Cottage
    
    
    static func Human() -> Token {
        let human = Token(name: "Human", set: set, number: -1 /*todo*/)
        human.colors = [Color.White]
        human.setType(.Creature, .Human)
        human.power = 1
        human.toughness = 1
        return human
    }
    static func Knight() -> Token {
        let knight = Token(name: "Knight", set: set, number: -1 /*todo*/)
        knight.colors = [Color.White]
        knight.setType(.Creature, .Knight)
        knight.vigilance = true
        knight.power = 2
        knight.toughness = 2
        return knight;
    }
    static func Boar() -> Token {
        let boar = Token(name: "Boar", set: set, number: -1 /*todo*/)
        boar.colors = [.Green]
        boar.setType(.Creature, .Boar)
        boar.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { boar.getController().createToken(Food()) })
        boar.power = 1
        boar.toughness = 1
        return boar
    }
    static func HumanCleric() -> Token {
        let humanCleric = Token(name: "Human Cleric", set: set, number: 11)
        humanCleric.colors = [.Red, .White]
        humanCleric.setType(.Creature, .Human, .Cleric)
        humanCleric.lifelink = true
        humanCleric.haste = true
        humanCleric.power = 2
        humanCleric.toughness = 1
        return humanCleric
    }
    static func HumanRogue() -> Token {
        let humanRogue = Token(name: "Human Rogue", set: set, number: 12)
        humanRogue.colors = [.Red, .White]
        humanRogue.setType(.Creature, .Human, .Rogue)
        humanRogue.haste = true
        humanRogue.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { humanRogue.damage(to: $0, 1) }))
        humanRogue.power = 1
        humanRogue.toughness = 2
        return humanRogue
    }
    static func HumanWarrior() -> Token {
        let humanWarrior = Token(name: "Human Warrior", set: set, number: 13)
        humanWarrior.colors = [.Red, .White]
        humanWarrior.setType(.Creature, .Human, .Warrior)
        humanWarrior.trample = true
        humanWarrior.haste = true
        humanWarrior.power = 3
        humanWarrior.toughness = 1
        return humanWarrior
    }
    static func Wolf() -> Token {
        let wolf = Token(name: "Wolf", set: set, number: -1 /*todo*/)
        wolf.colors = [.Black, .Green]
        wolf.setType(.Creature, .Wolf)
        wolf.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { wolf.getController().getPermanents().filter({ $0.isType(.Garruk) }).forEach({ $0.addCounter(.Loyalty) }) })
        wolf.power = 2
        wolf.toughness = 2
        return wolf
    }
    
    static func Food() -> Token {
        let r = Int.random(in: 15 ... 18)
        return makeFood(number: r)
    }
    private static func makeFood(number: Int) -> Token {
        let food = Token(name: "Food", set: set, number: number)
        food.setType(.Artifact, .Food)
        food.addActivatedAbility(
            string: "{2}, {T}, Sacrifice ~: You gain 3 life.",
            cost: Cost.Mana("2").Tap().Sacrifice(),
            effect: { food.getController().gainLife(3) })
        return food
    }
    
    static func GarrukEmblem() -> Object {
        let garrukEmblem = Emblem(set: set, number: -1 /*todo*/)
        garrukEmblem.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(source: garrukEmblem),
            effects: [
                ({ $0.pumped(3, 3) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.Trample) }, .AbilityAddingOrRemoving),
            ])
        return garrukEmblem
    }
}
