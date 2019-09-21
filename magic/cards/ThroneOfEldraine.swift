import Foundation

enum ELD {
    static var set = "eld"
    static var count = 269
    
    static let cards = [
        AcclaimedContender,
        AllThatGliters,
//        ArchonOfAbsolution,
//        ArdenvalePaladin,
//        ArdenvaleTactician,
//        BarteredCow,
        BelovedPrincess,
//        CharmingPrince,
        TheCircleOfLoyalty,
//        DeafeningSilence,
//        FaerieGodmother,
        Flutterfox,
        FortifyingProvisions,
//        Giant Killer,
//        GlassCasket,
//        HappilyEverAfter,
        HarmoniousArchon,
//        Hushbringer,
        KnightOfTheKeep,
        LindenTheSteadfastQueen,
//        LonesomeUnicorn,
//        MysteriousPathlighter,
        Outflank,
        PrizedGriffin,
//        RallyForTheThrone,
//        RealmCloakedGiant,
        Righteousness,
//        ShepherdOfTheFlock,
        ShiningArmor,
//        SilverflameRitual,
//        SilverflameSquire,
        SyrAlinTheLionsClaw,
        TrappedInTheTower,
        TrueLovesKiss,
        VenerableKnight,
        WorthyKnight,
        YouthfulKnight,
//        AnimatingFaerie,
//        BrazenBorrower,
        CharmedSleep,
        CorridorMonitor,
        DidntSayPlease,
//        EmryLurkerOfTheLoch,
//        FaeOfWishes,
        FaerieVandal,
//        FolioOfFancies,
//        Frogify,
//        Gadwick, the Wizened,
//        HypnoticSprite,
        IntoTheStory,
//        TheMagicMirror,
        MantleOfTides,
//        MerfolkSecretkeeper,
        MidnightClock,
//        Mirrormade,
        MistfordRiverTurtle,
        MoonlitScavengers,
//        MysticalDispute,
//        Opt,
//        OverwhelmedApprentice,
//        QueenOfIce,
//        RunAwayTogether,
//        SageOfTheFalls,
        SoTiny,
        SteelgazeGriffin,
//        StolenByTheFae,
//        SyrElenoraTheDiscerning,
        TomeRaider,
//        TurnIntoAPumpkin,
//        UnexplainedVision,
//        VantressGargoyle,
//        VantressPaladin,
//        WishfulMerfolk,
//        WitchingWell,
//        AyaraFirstOfLocthwain,
        BakeIntoAPie,
        BarrowWitches,
//        BelleOfTheBrawl,
        BlacklanceParagon,
//        BogNaughty,
//        CauldronFamiliar,
//        TheCauldronOfEternity,
//        CauldronsGift,
//        ClackbridgeTroll,
        EpicDownfall,
        EyeCollector,
        FestiveFuneral,
//        ForebodingFruit,
//        ForeverYoung,
//        FoulmireKnight,
//        GiantsSkewer,
        LashOfThorns,
//        LocthwainPaladin,
//        LostLegion,
//        MalevolentNoble,
//        MemoryTheft,
//        MurderousRider,
//        OathswornKnight,
//        OrderOfMidnight,
//        PiperOfTheSwarm,
//        RankleMasterOfPranks,
//        ReaperOfNight
        ReaveSoul,
//        RevengeOfRavens,
//        SmittenSwordmaster,
//        SpectersShriek,
//        SyrKonradTheGrim,
//        TemptingWitch,
        WickedGuardian,
//        WishclawTalisman,
//        WitchsVengeance,
        BargeIn,
//        BloodhazeWolverine,
        BlowYourHouseDown,
//        BonecrusherGiant,
        BrimstoneTrebuchet,
        BurningYardTrainer,
//        ClaimTheFirstborn,
        CrystalSlipper,
        Embercleave,
//        EmberethPaladin,
//        EmberethShieldbreaker,
        FerocityOfTheWilds,
//        FerventChampion,
//        FiresOfInvention,
//        Fling,
//        IrencragFeat,
//        IrencragPyromancer,
        Joust,
//        MadRatter,
//        MerchantOfTheVale,
//        OgreErrant,
//        OpportunisticDragon,
        RagingRedcap,
//        RedcapMelee,
//        RedcapRaiders,
//        RimrockKnight,
//        RobberOfTheRich,
//        ScorchingDragonfire,
//        SearingBarrage,
//        SevenDwarves,
//        SkullknockerOgre,
//        SlayingFire,
//        SunderingStroke,
//        SyrCarahTheBold,
//        TorbranThaneOfRedFell,
        WeaselbackRedcap,
//        BeanstalkGiant,
//        CuriousPair,
//        EdgewallInnkeeper,
//        FeastingTrollKing,
        FellThePheasant,
        FierceWitchstalker,
//        FlaxenIntruder,
//        GarenbrigCarver,
//        GarenbrigPaladin,
//        GarenbrigSquire,
//        GiantOpportunity,
//        GildedGoose,
//        TheGreatHenge,
//        InsatiableAppetite,
//        KeeperOfFables,
//        KenrithsTransformation,
//        LovestruckBeast,
//        ManaleafRider,
        OakhameAdversary,
//        OnceAndFuture,
//        OnceUponATime,
//        Outmuscle,
//        QuestingBeast,
//        ReturnOfTheWildspeaker,
//        ReturnToNature,
//        RosethornAcolyte,
        RosethornHalberd,
        SporecapSpider,
        SyrFarenTheHengehammer,
        TallAsABeanstalk,
//        TrailOfCrumbs,
//        TuinvaleTreefolk,
//        WickedWolf,
//        WildbornPreserver,
        WildwoodTracker,
        WolfsQuarry,
//        YorvoLordOfGarenbrig,
//        DanceOfTheManse,
//        DoomForetold,
//        DrownInTheLoch,
//        EscapeToTheWilds,
        FaeburrowElder,
        GarrukCursedHuntsman,
//        GrumgullyTheGenerous,
//        ImprobableAlliance,
        InspiringVeteran,
//        LochmereSerpent,
        MaraleafPixie,
//        OkoThiefOfCrowns,
        OutlawsMerriment,
//        TheRoyalScions,
//        SavvyHunter,
        Shinechaser,
        SteelclawLance,
//        StormfistCrusader,
//        Wandermare,
        WintermoorCommander,
        ArcanistsOwl,
//        CovetousUrge,
//        DeathlessKnight,
//        EliteHeadhunter,
        FirebornKnight,
//        LochDragon,
//        OakhameRanger,
        RampartSmasher,
        ResoluteRider,
        ThunderousSnapper,
//        ClockworkServant,
        CrashingDrawbridge,
//        EnchantedCarriage,
//        Gingerbrute,
        GoldenEgg,
//        HengeWalker,
//        HeraldicBanner,
//        InquisitivePuppet,
        JoustingDummy,
        LocthwainGargoyle,
//        LuckyClover,
//        ProphetOfThePeak,
        RovingKeep,
        ScaldingCauldron,
        ShamblingSuit,
        SignpostScarecrow,
//        SorcerersBroom,
//        SorcerousSpyglass,
        SpinningWheel,
//        StonecoilSerpent,
        WeaponRack,
//        WitchsOven,
        CastleArdenvale,
        CastleEmbereth,
//        CastleGarenbrig,
        CastleLocthwain,
//        CastleVantress,
        DwarvenMine,
//        FabledPassage,
        GingerbreadCabin,
        IdyllicGrange,
        MysticSanctuary,
//        TournamentGrounds,
        WitchsCottage,
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    static func AcclaimedContender() -> Card {
        let acclaimedContender = Card(name: "Acclaimed Contender", rarity: .Rare, set: set, number: 1)
        acclaimedContender.setManaCost("2W")
        acclaimedContender.setType(.Creature, .Human, .Knight)
        acclaimedContender.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                acclaimedContender.getController().chooseCard(
                    from: Array(acclaimedContender.getController().getLibrary().suffix(5)),
                    restriction: { $0.isType(.Knight) || $0.isType(.Aura) || $0.isType(.Equipment ) || ($0.isType(.Legendary) && $0.isType(.Artifact)) },
                    action: { chosenCard, rest in
                        chosenCard?.reveal()
                        chosenCard?.putIntoHand()
                        acclaimedContender.getController().putOnBottomOfLibrary(&rest, random: true)
                })
            })
        acclaimedContender.power = 3
        acclaimedContender.toughness = 3
        return acclaimedContender
    }
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
    // 3 Archon of Absolution
    // 4 Ardenvale Paladin
    // 5 Ardenvale Tactician
    // 6 Bartered Cow
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
    // 10 Deafening Silence
    // 11 Faerie Godmother
    static func Flutterfox() -> Card {
        let flutterfox = Card(name: "Flutterfox", rarity: .Common, set: set, number: 12)
        flutterfox.setManaCost("1W")
        flutterfox.setType(.Creature, .Fox)
        flutterfox.addStaticAbility(
            requirement: AbilityRequirement.This(flutterfox),
            effect: { $0.getController().getArtifactsAndEnchantments().isEmpty ? $0.withKeyword(.Flying) : $0 },
            layer: .AbilityAddingOrRemoving)
        flutterfox.setFlavorText("\"The white fox grinned. 'How about a bet, dragon? If I win, the skies are mine.' After he stopped laughing, the dragon agreed.\"\n--Tales of the Fae")
        flutterfox.power = 2
        flutterfox.toughness = 2
        return flutterfox
    }
    static func FortifyingProvisions() -> Card {
        let fortifyingProvisions = Card(name: "Fortifying Provisions", rarity: .Common, set: set, number: 13)
        fortifyingProvisions.setManaCost("2W")
        fortifyingProvisions.setType(.Enchantment)
        fortifyingProvisions.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(source: fortifyingProvisions),
            effect: { $0.pumped(0, 1) },
            layer: .PowerToughnessChanging)
        fortifyingProvisions.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { fortifyingProvisions.getController().createToken(Food()) })
        fortifyingProvisions.setFlavorText("\"To the king, to the Circle, and to the realm! And to not dying.\"")
        return fortifyingProvisions
    }
    // 14 Giant Killer
    // 15 Glass Casket
    // 16 Happily Ever After
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
    // 18 Hushbringer
    static func KnightOfTheKeep() -> Card {
        let knightOfTheKeep = Card(name: "Knight of the Keep", rarity: .Common, set: set, number: 19)
        knightOfTheKeep.setManaCost("2W")
        knightOfTheKeep.setType(.Creature, .Human, .Knight)
        knightOfTheKeep.setFlavorText("\"What good is loyalty to the crown if we are not also in service to those less fortunate? I fight for all of us.\"")
        knightOfTheKeep.power = 3
        knightOfTheKeep.toughness = 2
        return knightOfTheKeep
    }
    static func LindenTheSteadfastQueen() -> Card {
        let linden = Card(name: "Linden, the Steadfast Queen", rarity: .Uncommon, set: set, number: 20)
        linden.setManaCost("WWW")
        linden.setType(.Legendary, .Creature, .Human, .Noble)
        linden.vigilance = true
        linden.addTriggeredAbility(
            trigger: .WhiteCreatureYouControlAttacks,
            effect: { linden.getController().gainLife(1) })
        linden.setFlavorText("\"Until my last breath, I will defend the realm.\"")
        linden.power = 3
        linden.toughness = 3
        return linden
    }
    // 21 Lonesome Unicorn
    // 22 Mysterious Pathlighter
    static func Outflank() -> Card {
        let outflank = Card(name: "Outflank", rarity: .Common, set: set, number: 23)
        outflank.setManaCost("W")
        outflank.setType(.Instant)
        outflank.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { ($0.isAttacking || $0.blocking) && $0.isType(.Creature) },
                zones: [.Battlefield]),
            effect: { target in
                let amt = outflank.getController().getCreatures().count
                outflank.damage(to: target, amt)
            }))
        outflank.setFlavorText("\"With the drum of hooves and a flash of blades, the monster's terrifying roar changed to a cry of fear.\"\n--Legend of the Gilded Knights")
        return outflank
    }
    static func PrizedGriffin() -> Card {
        let prizedGriffin = Card(name: "Prized Griffin", rarity: .Common, set: set, number: 24)
        prizedGriffin.setManaCost("4W")
        prizedGriffin.setType(.Creature, .Griffin)
        prizedGriffin.flying = true
        prizedGriffin.setFlavorText("\"I wrote these tales with a quill made from a griffin's feather. And the winning of that feather is quite a tale itself.\"\n--Chulane, Teller of Tales")
        prizedGriffin.power = 3
        prizedGriffin.toughness = 4
        return prizedGriffin
    }
    // 25 Rally for the Throne
    // 26 Realm-Cloaked Giant
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
    // 28 Shepherd of the Flock
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
    // 31 Silverflame Squire
    static func SyrAlinTheLionsClaw() -> Card {
        let syrAlin = Card(name: "Syr Alin, the Lion's Claw", rarity: .Uncommon, set: set, number: 32)
        syrAlin.setManaCost("3WW")
        syrAlin.setType(.Legendary, .Creature, .Human, .Knight)
        syrAlin.firstStrike = true
        syrAlin.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { syrAlin.getController().getCreatures().filter({ $0 != syrAlin }).forEach({ $0.pump(1, 1) }) })
        syrAlin.setFlavorText("\"The realm must never yield to the chaos of the wilds.\"")
        syrAlin.power = 4
        syrAlin.toughness = 4
        return syrAlin
    }
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
    static func YouthfulKnight() -> Card {
        let youthfulKnight = Card(name: "Youthful Knight", rarity: .Common, set: set, number: 37)
        youthfulKnight.setManaCost("1W")
        youthfulKnight.setType(.Creature, .Human, .Knight)
        youthfulKnight.firstStrike = true
        youthfulKnight.setFlavorText("\"In the wilds, your true training will begin.\"\n--Syr Alin, the Lion's Claw")
        youthfulKnight.power = 2
        youthfulKnight.toughness = 1
        return youthfulKnight
    }
    // 38 Animating Faerie
    // 39 Brazen Borrower
    static func CharmedSleep() -> Card {
        let charmedSleep = Card(name: "Charmed Sleep", rarity: .Common, set: set, number: 40)
        charmedSleep.setManaCost("1UU")
        charmedSleep.setType(.Enchantment, .Aura)
        charmedSleep.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { charmedSleep.attachedTo?.tap() })
        charmedSleep.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.withoutKeyword(.UntapsDuringUntapStep)},
            layer: .AbilityAddingOrRemoving)
        return charmedSleep
    }
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
    static func DidntSayPlease() -> Card {
        let didntSayPlease = Card(name: "Didn't Say Please", rarity: .Common, set: set, number: 42)
        didntSayPlease.setManaCost("1UU")
        didntSayPlease.setType(.Instant)
        didntSayPlease.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetSpell(),
            effect: { target in
                target.counter()
                target.getController().mill(3)
        }))
        didntSayPlease.setFlavorText("\"If you're in our home, we expect you to mind your manners.\"")
        return didntSayPlease
    }
    // 43 Emry, Lurker of the Loch
    // 44 Fae of Wishes
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
    // 46 Folio of Fancies
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
    // 51 The Magic Mirror
    static func MantleOfTides() -> Card {
        let mantleOfTides = Card(name: "Mantle of Tides", rarity: .Common, set: set, number: 52)
        mantleOfTides.setManaCost("U")
        mantleOfTides.setType(.Artifact, .Equipment)
        mantleOfTides.addEquipAbility(
            string: "{3}: Equip.",
            cost: Cost.Mana("3"),
            effect: { $0.pumped(1, 2) },
            layer: .PowerToughnessChanging)
        mantleOfTides.addTriggeredAbility(
            trigger: .YouDrawSecondCard,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === mantleOfTides.getController() },
                    zones: [.Battlefield]),
                effect: { mantleOfTides.attachTo($0) }))
        return mantleOfTides
    }
    // 53 Merfolk Secretkeeper
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
    // 55 Mirrormade
    static func MistfordRiverTurtle() -> Card {
        let mistfordRiverTurtle = Card(name: "Mistford River Turtle", rarity: .Common, set: set, number: 56)
        mistfordRiverTurtle.setManaCost("3U")
        mistfordRiverTurtle.setType(.Creature, .Turtle)
        mistfordRiverTurtle.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != mistfordRiverTurtle && $0.isAttacking && !$0.isType(.Human) && $0.isType(.Creature) },
                    zones: [.Battlefield]),
                effect: { $0.giveKeywordUntilEndOfTurn(.Unblockable) }))
        mistfordRiverTurtle.setFlavorText("The fae raised the turtle from a tiny hatchling. They taught it whom to ferry--and whom to drown.")
        mistfordRiverTurtle.power = 1
        mistfordRiverTurtle.toughness = 5
        return mistfordRiverTurtle
    }
    static func MoonlitScavengers() -> Card {
        let moonlitScavengers = Card(name: "Moonlit Scavengers", rarity: .Common, set: set, number: 57)
        moonlitScavengers.setManaCost("5U")
        moonlitScavengers.setType(.Creature, .Merfolk, .Rogue)
        moonlitScavengers.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== moonlitScavengers.getController() },
                    zones: [.Battlefield]),
                effect: { $0.bounce() }),
            restriction: { !moonlitScavengers.getController().getArtifactsAndEnchantments().isEmpty })
        moonlitScavengers.setFlavorText("They comb the shallows of Lochmere for relics of a bygone era. And if they happen upon a lone traveler, all the better.")
        moonlitScavengers.power = 4
        moonlitScavengers.toughness = 5
        return moonlitScavengers
    }
    // 58 Mystical Dispute
    // 59 Opt
    // 60 Overwhelmed Apprentice
    // 61 Queen of Ice
    // 62 Run Away Together
    // 63 Sage of the Falls
    static func SoTiny() -> Card {
        let soTiny = Card(name: "So Tiny", rarity: .Common, set: set, number: 64)
        soTiny.setManaCost("U")
        soTiny.setType(.Enchantment, .Aura)
        soTiny.flash = true
        soTiny.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                let amount = object.getController().getGraveyard().count < 7 ? -2 : -6
                return object.pumped(amount, 0)
            },
            layer: .PowerToughnessChanging)
        soTiny.setFlavorText("His sword sounded like a silver chime on the glass jar, and the sprite laughed with delight.")
        return soTiny
    }
    static func SteelgazeGriffin() -> Card {
        let steelgazeGriffin = Card(name: "Steelgaze Griffin", rarity: .Common, set: set, number: 65)
        steelgazeGriffin.setManaCost("4U")
        steelgazeGriffin.setType(.Creature, .Griffin)
        steelgazeGriffin.flying = true
        steelgazeGriffin.addTriggeredAbility(
            trigger: .YouDrawSecondCard,
            effect: { steelgazeGriffin.pump(2, 0) })
        steelgazeGriffin.setFlavorText("\"If we didn't guard our secrets, they wouldn't remain secrets for long.\"\n--Gadwick, the Wizened")
        steelgazeGriffin.power = 2
        steelgazeGriffin.toughness = 4
        return steelgazeGriffin
    }
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
    // 70 Unexplained Vision
    // 71 Vantress Gargoyle
    // 72 Vantress Paladin
    // 73 Wishful Merfolk
    // 74 Witching Well
    // 75 Ayara, First of Locthwain
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
    static func BarrowWitches() -> Card {
        let barrowWitches = Card(name: "Barrow Witches", rarity: .Common, set: set, number: 77)
        barrowWitches.setManaCost("4B")
        barrowWitches.setType(.Creature, .Human, .Warlock)
        barrowWitches.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Knight) && $0.getController() === barrowWitches.getController() },
                    zones: [.Graveyard]),
                effect: { $0.putIntoHand() }))
        barrowWitches.setFlavorText("\"Taste the sweetness, breath for breath. Keep the balance, death for death.\"\n--Barrow witch incantation")
        barrowWitches.power = 3
        barrowWitches.toughness = 4
        return barrowWitches
    }
    // 78 Belle of the Brawl
    static func BlacklanceParagon() -> Card {
        let blacklanceParagon = Card(name: "Blacklance Paragon", rarity: .Rare, set: set, number: 79)
        blacklanceParagon.setManaCost("1B")
        blacklanceParagon.setType(.Creature, .Human, .Knight)
        blacklanceParagon.flash = true
        blacklanceParagon.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Knight) },
                    zones: [.Battlefield]),
                effect: { target in
                    target.giveKeywordUntilEndOfTurn(.Deathtouch)
                    target.giveKeywordUntilEndOfTurn(.Lifelink)
            }))
        blacklanceParagon.setFlavorText("The Blacklances travel deep into the wilds, sometimes for years at a time, in search of the lost Cauldron of Eternity.")
        blacklanceParagon.power = 3
        blacklanceParagon.toughness = 1
        return blacklanceParagon
    }
    // 80 Bog Naughty
    // 81 Cauldron Familiar
    // 82 The Cauldron of Eternity
    // 83 Cauldron's Gift
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
    static func FestiveFuneral() -> Card {
        let festiveFuneral = Card(name: "Festive Funeral", rarity: .Common, set: set, number: 87)
        festiveFuneral.setManaCost("4B")
        festiveFuneral.setType(.Instant)
        festiveFuneral.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                let amount = -1 * festiveFuneral.getController().getGraveyard().count
                target.pump(amount, amount)
            }))
        festiveFuneral.setFlavorText("\"Even as we mourn the last, we look to the next with joy. Hopefully, my new suitor will bring the Cauldron home.\"\n--Ayala, First of Locthwain")
        return festiveFuneral
    }
    // 88 Foreboding Fruit
    // 89 Forever Young
    // 90 Foulmire Knight
    // 91 Giant's Skewer
    static func LashOfThorns() -> Card {
        let lashOfThorns = Card(name: "Lash of Thorns", rarity: .Common, set: set, number: 92)
        lashOfThorns.setManaCost("B")
        lashOfThorns.setType(.Instant)
        lashOfThorns.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(2, 1)
                target.giveKeywordUntilEndOfTurn(.Deathtouch)
            }))
        lashOfThorns.setFlavorText("\"Another angry mob? When will they learn to leave me be?\"\n--Terryn, Edgewall outcast")
        return lashOfThorns
    }
    // 93 Locthwain Paladin
    // 94 Lost Legion
    // 95 Malevolent Noble
    // 96 Memory Theft
    // 97 Murderous Rider
    // 98 Oathsworn Knight
    // 99 Order of Midnight
    // 100 Piper of the Swarm
    // 101 Rankle, Master of Pranks
    // 102 Reaper of Night
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
    // 104 Revenge of Ravens
    // 105 Smitten Swordmaster
    // 106 Specter's Shriek
    // 107 Syr Konrad, the Grim
    // 108 Tempting Witch
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
    static func BargeIn() -> Card {
        let bargeIn = Card(name: "Barge In", rarity: .Common, set: set, number: 112)
        bargeIn.setManaCost("R")
        bargeIn.setType(.Instant)
        bargeIn.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isAttacking && $0.isType(.Creature) },
                zones: [.Battlefield]),
            effect: { target in
                target.pump(2, 2)
                Game.shared.bothPlayers({ player in
                    player.getCreatures().filter({ $0.isAttacking && !$0.isType(.Human) }).forEach({ creature in
                        creature.giveKeywordUntilEndOfTurn(.Trample)
                    })
                })
        }))
        bargeIn.setFlavorText("The giant had heard of locks, but he had yet to discover a door he couldn't open.")
        return bargeIn
    }
    // 113 Bloodhaze Wolverine
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
    // 115 Bonecrusher Giant
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
    static func FerocityOfTheWilds() -> Card {
        let ferocityOfTheWilds = Card(name: "Ferocity of the Wilds", rarity: .Uncommon, set: set, number: 123)
        ferocityOfTheWilds.setManaCost("2R")
        ferocityOfTheWilds.setType(.Enchantment)
        ferocityOfTheWilds.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(
                source: ferocityOfTheWilds,
                additionalRequirement: { $0.isAttacking && !$0.isType(.Human) }),
            effects: [
                ({ $0.pumped(1, 0) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.Trample) }, .AbilityAddingOrRemoving)
            ])
        ferocityOfTheWilds.setFlavorText("Knights who excel in tournaments sometimes underestimate thereats beyond the realm.")
        return ferocityOfTheWilds
    }
    // 124 Fervent Champion
    // 125 Fires of Invention
    // 126 Fling
    // 127 Irencrag Feat
    // 128 Irencrag Pyromancer
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
    // 130 Mad Ratter
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
    // 136 Redcap Raiders
    // 137 Rimrock Knight
    // 138 Robber of the Rich
    // 139 Scorching Dragonfire
    // 140 Searing Barrage
    // 141 Seven Dwarves
    // 142 Skullknocker Ogre
    // 143 Slaying Fire
    // 144 Sundering Stroke
    // 145 Syr Carah, the Bold
    // 146 Thrill of Possibility
    // 147 Torbran, Thane of Red Fell
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
    // 156 Garenbrig Carver
    // 157 Garenbrig Paladin
    // 158 Garenbrig Squire
    // 159 Giant Opportunity
    // 160 Gilded Goose
    // 161 The Great Henge
    // 162 Insatiable Appetite
    // 163 Keeper of Fables
    // 164 Kenrith's Transformation
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
    // 172 Return of the Wildspeaker
    // 173 Return to Nature
    // 174 Rosethorn Acolyte
    static func RosethornHalberd() -> Card {
        let rosethornHalberd = Card(name: "Rosethorn Halberd", rarity: .Common, set: set, number: 175)
        rosethornHalberd.setManaCost("G")
        rosethornHalberd.setType(.Artifact, .Equipment)
        rosethornHalberd.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { !$0.isType(.Human) && $0.isType(.Creature) && $0.getController() === rosethornHalberd.getController() },
                    zones: [.Battlefield]),
                effect: { rosethornHalberd.attachTo($0) }))
        rosethornHalberd.addEquipAbility(
            string: "{5}: Equip",
            cost: Cost.Mana("5"),
            effect: { $0.pumped(2, 1) },
            layer: .PowerToughnessChanging)
        return rosethornHalberd
    }
    static func SporecapSpider() -> Card {
        let sporecapSpider = Card(name: "Sporecap Spider", rarity: .Common, set: set, number: 176)
        sporecapSpider.setManaCost("2G")
        sporecapSpider.setType(.Creature, .Spider)
        sporecapSpider.reach = true
        sporecapSpider.setFlavorText("After years of taunts and aerial assaults from Rankle's minions, the witches of Maraleaf Forest acquired new familiars.")
        sporecapSpider.power = 1
        sporecapSpider.toughness = 5
        return sporecapSpider
    }
    static func SyrFarenTheHengehammer() -> Card {
        let syrFaren = Card(name: "Syr Faren, the Hengehammer", rarity: .Uncommon, set: set, number: 177)
        syrFaren.setManaCost("GG")
        syrFaren.setType(.Legendary, .Creature, .Human, .Knight)
        syrFaren.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != syrFaren && $0.isAttacking && $0.isType(.Creature) },
                    zones: [.Battlefield]),
                effect: { $0.pump(syrFaren.getPower(), syrFaren.getPower()) }))
        syrFaren.setFlavorText("\"Words are pointless. It's what you do with your hammer that counts.\"")
        syrFaren.power = 2
        syrFaren.toughness = 2
        return syrFaren
    }
    static func TallAsABeanstalk() -> Card {
        let tallAsABeanstalk = Card(name: "Tall as a Beanstalk", rarity: .Common, set: set, number: 178)
        tallAsABeanstalk.setManaCost("3G")
        tallAsABeanstalk.setType(.Enchantment, .Aura)
        tallAsABeanstalk.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effects: [
                ({ $0.pumped(3, 3) }, .PowerToughnessChanging),
                ({ $0.withType(.Giant) }, .TypeChanging)
            ])
        tallAsABeanstalk.setFlavorText("He realized a bit late that he was supposed to <i>plant</i> the magic beans.")
        return tallAsABeanstalk
    }
    // 179 Trail of Crumbs
    // 180 Tuinvale Treefolk
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
    // 185 Yorvo, Lord of Garenbrig
    // 186 Dance of the Manse
    // 187 Doom Foretold
    // 188 Drown in the Loch
    // 189 Escape to the Wilds
    static func FaeburrowElder() -> Card {
        let faeburrowElder = Card(name: "Faeburrow Elder", rarity: .Rare, set: set, number: 190)
        faeburrowElder.setManaCost("1GW")
        faeburrowElder.setType(.Creature, .Treefolk, .Druid)
        faeburrowElder.vigilance = true
        faeburrowElder.addStaticAbility(
            requirement: AbilityRequirement.This(faeburrowElder),
            effect: { object in
                var numColors = 0
                for color in Color.allCases {
                    if !object.getController().getPermanents().filter({ $0.isColor(color) }).isEmpty {
                        numColors += 1
                    }
                }
                return object.pumped(numColors, numColors)
            },
            layer: .PowerToughnessChanging)
        faeburrowElder.addActivatedAbility(
            string: "{T}: For each color among permanents you control, add one mana of that color.",
            cost: Cost.Tap(),
            effect: {
                for color in Color.allCases {
                    if !faeburrowElder.getController().getPermanents().filter({ $0.isColor(color) }).isEmpty {
                        faeburrowElder.getController().addMana(color: color)
                    }
                }
        })
        faeburrowElder.setFlavorText("Its wide-reaching roots draw more than water.")
        faeburrowElder.power = 0
        faeburrowElder.toughness = 0
        return faeburrowElder
    }
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
    // 192 Grumgully, the Generous
    // 193 Improbable Alliance
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
    // 203 Stormfist Crusader
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
    // 208 Deathless Knight
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
        firebornKnight.setFlavorText("He endured the white-hot blaze of the Circle and the sweltering heat of the Irencrag, and he emerged victorious.")
        firebornKnight.power = 2
        firebornKnight.toughness = 3
        return firebornKnight
    }
    // 211 Loch Dragon
    // 212 Oakhame Ranger
    static func RampartSmasher() -> Card {
        let rampartSmasher = Card(name: "Rampart Smasher", rarity: .Uncommon, set: set, number: 213)
        rampartSmasher.setManaCost("{R/G}{R/G}{R/G}{R/G}")
        rampartSmasher.setType(.Creature, .Giant)
        rampartSmasher.blockabilityRequirements.append({ object in
            return !(object.isType(.Knight) || object.isType(.Wall))
        })
        rampartSmasher.setFlavorText("\"He has strength and courage--just way, way too much of both.\"\n--Syr Faren, the Hengehammer")
        rampartSmasher.power = 5
        rampartSmasher.toughness = 5
        return rampartSmasher
    }
    static func ResoluteRider() -> Card {
        let resoluteRider = Card(name: "Resolute Rider", rarity: .Uncommon, set: set, number: 214)
        resoluteRider.setManaCost("{W/B}{W/B}{W/B}{W/B}")
        resoluteRider.setType(.Creature, .Human, .Knight)
        resoluteRider.addActivatedAbility(
            string: "{W/B}{W/B}: ~ gains lifelink until end of turn.",
            cost: Cost.Mana("{W/B}{W/B}"),
            effect: { resoluteRider.giveKeywordUntilEndOfTurn(.Lifelink) })
        resoluteRider.addActivatedAbility(
            string: "{W/B}{W/B}{W/B}{W/B}: ~ gains indestructible until end of turn.",
            cost: Cost.Mana("{W/B}{W/B}{W/B}{W/B}"),
            effect: { resoluteRider.giveKeywordUntilEndOfTurn(.Indestructible) })
        resoluteRider.setFlavorText("\"Respect the wilds? Certainly. Fear them? No.\"")
        resoluteRider.power = 4
        resoluteRider.toughness = 2
        return resoluteRider
    }
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
    // 216 Clockwork Servant
    static func CrashingDrawbridge() -> Card {
        let crashingDrawbridge = Card(name: "Crashing Drawbridge", rarity: .Common, set: set, number: 217)
        crashingDrawbridge.setManaCost("2")
        crashingDrawbridge.setType(.Artifact, .Creature, .Wall)
        crashingDrawbridge.defender = true
        crashingDrawbridge.addActivatedAbility(
            string: "{T}: Creatures you control gain haste until end of turn.",
            cost: Cost.Tap(),
            effect: { crashingDrawbridge.getController().getCreatures().forEach({ $0.giveKeywordUntilEndOfTurn(.Haste) }) })
        crashingDrawbridge.setFlavorText("\"The Northern Beacon flared, and even before the drawbridge finished its descent, the knights charged out.\"\n--Legend of the Gilded Knights")
        crashingDrawbridge.power = 0
        crashingDrawbridge.toughness = 4
        return crashingDrawbridge
    }
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
    // 221 Henge Walker
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
    static func LocthwainGargoyle() -> Card {
        let locthwainGargoyle = Card(name: "Locthwain Gargoyle", rarity: .Common, set: set, number: 225)
        locthwainGargoyle.setManaCost("1")
        locthwainGargoyle.setType(.Artifact, .Creature, .Gargoyle)
        locthwainGargoyle.addActivatedAbility(
            string: "{4}: ~ gets +2/+0 and gains flying until end of turn.",
            cost: Cost.Mana("4"),
            effect: {
                locthwainGargoyle.pump(2, 0)
                locthwainGargoyle.giveKeywordUntilEndOfTurn(.Flying)
            })
        locthwainGargoyle.setFlavorText("\"As the traitor hurried across the courtyard, its eyes snapped open. It was time to pay the queen a visit.\"\n--Beyond the Great Henge")
        locthwainGargoyle.power = 0
        locthwainGargoyle.toughness = 3
        return locthwainGargoyle
    }
    // 226 Lucky Clover
    // 227 Prophet of the Peak
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
    static func ScaldingCauldron() -> Card {
        let scaldingCauldron = Card(name: "Scalding Cauldron", rarity: .Common, set: set, number: 229)
        scaldingCauldron.setManaCost("1")
        scaldingCauldron.setType(.Artifact)
        scaldingCauldron.addActivatedAbility(
            string: "{3}, {T}, Sacrifice ~: It deals 3 damagge to target creature.",
            cost: Cost.Mana("3").Tap().Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { scaldingCauldron.damage(to: $0, 3) }))
        scaldingCauldron.setFlavorText("\"It's a witch's trick, this cauldron full of pain. I wouldn't dump it on any but the wicked.\"")
        return scaldingCauldron
    }
    static func ShamblingSuit() -> Card {
        let shamblingSuit = Card(name: "Shambling Suit", rarity: .Uncommon, set: set, number: 230)
        shamblingSuit.setManaCost("3")
        shamblingSuit.setType(.Artifact, .Creature, .Construct)
        shamblingSuit.addStaticAbility(
            requirement: AbilityRequirement.This(shamblingSuit),
            effect: { object in
                let numArtifactsAndOrEnchantments = shamblingSuit.getController().getPermanents().filter({ $0.isType(.Artifact) || $0.isType(.Enchantment) }).count
                object.power = numArtifactsAndOrEnchantments
                return object
            },
            layer: .PowerToughnessCDA,
            allZones: true)
        shamblingSuit.setFlavorText("\"The young squire gripped her sword as the clanking stranger emerged. It was no knight that had come to challenge her.\"\n--Beyond the Great Henge")
        shamblingSuit.toughness = 3
        return shamblingSuit
    }
    static func SignpostScarecrow() -> Card {
        let signpostScarecrow = Card(name: "Signpost Scarecrow", rarity: .Common, set: set, number: 231)
        signpostScarecrow.setManaCost("4")
        signpostScarecrow.setType(.Artifact, .Creature, .Scarecrow)
        signpostScarecrow.vigilance = true
        Color.allCases.forEach({ color in
            signpostScarecrow.addActivatedAbility(
                string: "{2}: Add {" + String(color.rawValue) + "}.",
                cost: Cost.Mana("2"),
                effect: { signpostScarecrow.getController().addMana(color: color) })
        })
        signpostScarecrow.setFlavorText("\"Accursed scarecrow! Sendink folk in every direction is the same as sending them nowhere at all.\"\n--Corliss the Wanderer")
        signpostScarecrow.power = 2
        signpostScarecrow.toughness = 4
        return signpostScarecrow
    }
    // 232 Sorcerer's Broom
    // 233 Sorcerous Spyglass
    static func SpinningWheel() -> Card {
        let spinningWheel = Card(name: "Spinning Wheel", rarity: .Uncommon, set: set, number: 234)
        spinningWheel.setManaCost("3")
        spinningWheel.setType(.Artifact)
        Color.allCases.forEach({ color in
            spinningWheel.addActivatedAbility(
                string: "{T}: Add {" + String(color.rawValue) + "}.",
                cost: Cost.Tap(),
                effect: { spinningWheel.getController().addMana(color: color) })
        })
        spinningWheel.addActivatedAbility(
            string: "{5}, {T}: Tap target creature.",
            cost: Cost.Mana("5").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.tap() }))
        spinningWheel.setFlavorText("\"Though long forgotten, the wheel continued to turn, spinning fate from a dusty attic.\"\n--Beyond the Great Henge")
        return spinningWheel
    }
    // 235 Stonecoil Serpent
    static func WeaponRack() -> Card {
        let weaponRack = Card(name: "Weapon Rack", rarity: .Common, set: set, number: 236)
        weaponRack.setManaCost("4")
        weaponRack.setType(.Artifact)
        weaponRack.addReplacementEffect(
            event: .ThisETB,
            effect: { weaponRack.addCounters(.PlusOnePlusOne, 3) })
        weaponRack.addActivatedAbility(
            string: "{T}: Move a +1/+1 counter from ~ onto target creature. Activate this ability only any time you could cast a sorcery.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { target in
                    if weaponRack.hasCounter(.PlusOnePlusOne) {
                        weaponRack.removeCounter(.PlusOnePlusOne)
                        target.addCounter(.PlusOnePlusOne)
                    }
                }),
            manaAbility: false,
            sorcerySpeed: true)
        weaponRack.setFlavorText("No weapon stays on the rack for long in the Burning Yard.")
        return weaponRack
    }
    // 237 Witch's Oven
    static func CastleArdenvale() -> Card {
        let castleArdenvale = Card(name: "Castle Ardenvale", rarity: .Rare, set: set, number: 238)
        castleArdenvale.setManaCost("")
        castleArdenvale.setType(.Land)
        castleArdenvale.addStaticAbility(
            requirement: AbilityRequirement.This(castleArdenvale),
            effect: { object in
                if castleArdenvale.getController().getPermanents().filter({ $0.isType(.Plains) }).isEmpty {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        castleArdenvale.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { castleArdenvale.getController().addMana(color: .White) },
            manaAbility: true )
        castleArdenvale.addActivatedAbility(
            string: "{2}{W}{W}, {T}: Create a 1/1 white Human creature token.",
            cost: Cost.Mana("2WW").Tap(),
            effect: { castleArdenvale.getController().createToken(Human()) })
        castleArdenvale.setFlavorText("Without Ardenvale's loyalty, the realm would greedily devour itself.")
        return castleArdenvale
    }
    static func CastleEmbereth() -> Card {
        let castleEmbereth = Card(name: "Castle Embereth", rarity: .Rare, set: set, number: 239)
        castleEmbereth.setManaCost("")
        castleEmbereth.setType(.Land)
        castleEmbereth.addStaticAbility(
            requirement: AbilityRequirement.This(castleEmbereth),
            effect: { object in
                if castleEmbereth.getController().getPermanents().filter({ $0.isType(.Mountain) }).isEmpty {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        castleEmbereth.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { castleEmbereth.getController().addMana(color: .Red) },
            manaAbility: true )
        castleEmbereth.addActivatedAbility(
            string: "{1}{R}{R}, {T}: Creatures you control get +1/+0 until end of turn.",
            cost: Cost.Mana("1RR").Tap(),
            effect: {
                castleEmbereth.getController().getCreatures().forEach({ $0.pump(1, 0) })
        })
        castleEmbereth.setFlavorText("Without Embereth's courage, the realm would falter and fall.")
        return castleEmbereth
    }
    // 240 Castle Garenbrig
    static func CastleLocthwain() -> Card {
        let castleLocthwain = Card(name: "Castle Locthwain", rarity: .Rare, set: set, number: 241)
        castleLocthwain.setManaCost("")
        castleLocthwain.setType(.Land)
        castleLocthwain.addStaticAbility(
            requirement: AbilityRequirement.This(castleLocthwain),
            effect: { object in
                if castleLocthwain.getController().getPermanents().filter({ $0.isType(.Swamp) }).isEmpty {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        castleLocthwain.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { castleLocthwain.getController().addMana(color: .Black) },
            manaAbility: true )
        castleLocthwain.addActivatedAbility(
            string: "{1}{B}{B}, {T}: Draw a card, then you lose life equal to the number of cards in your hand.",
            cost: Cost.Mana("1BB").Tap(),
            effect: {
                castleLocthwain.getController().drawCard()
                castleLocthwain.getController().loseLife(castleLocthwain.getController().getHand().count)
        })
        castleLocthwain.setFlavorText("Without Locthwain's persistence, the realm would stagnate and die.")
        return castleLocthwain
    }
    // 242 Castle Vantress
    static func DwarvenMine() -> Card {
        let dwarvenMine = Card(name: "Dwarven Mine", rarity: .Common, set: set, number: 243)
        dwarvenMine.setManaCost("")
        dwarvenMine.setType(.Land, .Mountain)
        dwarvenMine.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { dwarvenMine.getController().addMana(color: .Red) },
            manaAbility: true )
        dwarvenMine.addStaticAbility(
            requirement: AbilityRequirement.This(dwarvenMine),
            effect: { object in
                let numOtherMountains = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Mountain) }).count
                if numOtherMountains < 3 {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        dwarvenMine.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { dwarvenMine.getController().createToken(Dwarf()) },
            restriction: { !dwarvenMine.isTapped })
        return dwarvenMine
    }
    // 244 Fabled Passage
    static func GingerbreadCabin() -> Card {
        let gingerbreadCabin = Card(name: "Gingerbread Cabin", rarity: .Common, set: set, number: 245)
        gingerbreadCabin.setManaCost("")
        gingerbreadCabin.setType(.Land, .Forest)
        gingerbreadCabin.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { gingerbreadCabin.getController().addMana(color: .Green) },
            manaAbility: true )
        gingerbreadCabin.addStaticAbility(
            requirement: AbilityRequirement.This(gingerbreadCabin),
            effect: { object in
                let numOtherForests = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Forest) }).count
                if numOtherForests < 3 {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        gingerbreadCabin.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { gingerbreadCabin.getController().createToken(Food()) },
            restriction: { !gingerbreadCabin.isTapped })
        return gingerbreadCabin
    }
    static func IdyllicGrange() -> Card {
        let idyllicGrange = Card(name: "Idyllic Grange", rarity: .Common, set: set, number: 246)
        idyllicGrange.setManaCost("")
        idyllicGrange.setType(.Land, .Plains)
        idyllicGrange.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { idyllicGrange.getController().addMana(color: .White) },
            manaAbility: true )
        idyllicGrange.addStaticAbility(
            requirement: AbilityRequirement.This(idyllicGrange),
            effect: { object in
                let numOtherPlains = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Plains) }).count
                if numOtherPlains < 3 {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        idyllicGrange.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === idyllicGrange.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }),
            restriction: { !idyllicGrange.isTapped })
        idyllicGrange.setFlavorText("Every hero's journey starts somewhere.")
        return idyllicGrange
    }
    static func MysticSanctuary() -> Card {
        let mysticSanctuary = Card(name: "Mystic Sanctuary", rarity: .Common, set: set, number: 247)
        mysticSanctuary.setManaCost("")
        mysticSanctuary.setType(.Land, .Island)
        mysticSanctuary.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { mysticSanctuary.getController().addMana(color: .Blue) },
            manaAbility: true )
        mysticSanctuary.addStaticAbility(
            requirement: AbilityRequirement.This(mysticSanctuary),
            effect: { object in
                let numOtherIslands = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Island) }).count
                if numOtherIslands < 3 {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        mysticSanctuary.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { ($0.isType(.Instant) || $0.isType(.Sorcery)) && $0.getController() === mysticSanctuary.getController() },
                    zones: [.Graveyard]),
                effect: { $0.putOnTopOfLibrary() },
                effectOptional: true),
            restriction: { !mysticSanctuary.isTapped })
        return mysticSanctuary
    }
    // 248 Tournament Grounds
    static func WitchsCottage() -> Card {
        let witchsCottage = Card(name: "Witch's Cottage", rarity: .Common, set: set, number: 249)
        witchsCottage.setManaCost("")
        witchsCottage.setType(.Land, .Swamp)
        witchsCottage.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { witchsCottage.getController().addMana(color: .Black) },
            manaAbility: true )
        witchsCottage.addStaticAbility(
            requirement: AbilityRequirement.This(witchsCottage),
            effect: { object in
                let numOtherSwamps = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Swamp) }).count
                if numOtherSwamps < 3 {
                    object.entersTapped = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        witchsCottage.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === witchsCottage.getController() },
                    zones: [.Graveyard]),
                effect: { $0.putOnTopOfLibrary() },
                effectOptional: true),
            restriction: { !witchsCottage.isTapped })
        return witchsCottage
    }
    
    static func Goat() -> Token {
        let goat = Token(name: "Goat", set: set, number: 1)
        goat.colors = [.White]
        goat.setType(.Creature, .Goat)
        goat.power = 0
        goat.toughness = 1
        return goat
    }
    static func Human() -> Token {
        let human = Token(name: "Human", set: set, number: 2)
        human.colors = [.White]
        human.setType(.Creature, .Human)
        human.power = 1
        human.toughness = 1
        return human
    }
    static func Knight() -> Token {
        let knight = Token(name: "Knight", set: set, number: 3)
        knight.colors = [.White]
        knight.setType(.Creature, .Knight)
        knight.vigilance = true
        knight.power = 2
        knight.toughness = 2
        return knight;
    }
    static func Mouse() -> Token {
        let mouse = Token(name: "Mouse", set: set, number: 4)
        mouse.colors = [.White]
        mouse.setType(.Creature, .Mouse)
        mouse.power = 1
        mouse.toughness = 1
        return mouse
    }
    static func Faerie() -> Token {
        let faerie = Token(name: "Faerie", set: set, number: 5)
        faerie.colors = [.Blue]
        faerie.setType(.Creature, .Faerie)
        faerie.flying = true
        faerie.power = 1
        faerie.toughness = 1
        return faerie
    }
    static func Rat() -> Token {
        let rat = Token(name: "Rat", set: set, number: 6)
        rat.colors = [.Black]
        rat.setType(.Creature, .Rat)
        rat.power = 1
        rat.toughness = 1
        return rat
    }
    static func Dwarf() -> Token {
        let dwarf = Token(name: "Dwarf", set: set, number: 7)
        dwarf.colors = [.Red]
        dwarf.setType(.Creature, .Dwarf)
        dwarf.power = 1
        dwarf.toughness = 1
        return dwarf
    }
    static func Bear() -> Token {
        let bear = Token(name: "Bear", set: set, number: 8)
        bear.colors = [.Green]
        bear.setType(.Creature, .Bear)
        bear.power = 2
        bear.toughness = 2
        return bear
    }
    static func Boar() -> Token {
        let boar = Token(name: "Boar", set: set, number: 9)
        boar.colors = [.Green]
        boar.setType(.Creature, .Boar)
        boar.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { boar.getController().createToken(Food()) })
        boar.power = 1
        boar.toughness = 1
        return boar
    }
    static func Giant() -> Token {
        let giant = Token(name: "Giant", set: set, number: 10)
        giant.colors = [.Green]
        giant.setType(.Creature, .Giant)
        giant.power = 7
        giant.toughness = 7
        return giant
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
        let wolf = Token(name: "Wolf", set: set, number: 14)
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
        let garrukEmblem = Emblem(set: set, number: 19)
        garrukEmblem.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(source: garrukEmblem),
            effects: [
                ({ $0.pumped(3, 3) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.Trample) }, .AbilityAddingOrRemoving),
            ])
        return garrukEmblem
    }
}
