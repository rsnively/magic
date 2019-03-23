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
            effect: {
                for _ in 0..<amount {
                    self.getController().createToken(RNA.Spirit())
                }
        })
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
        ImpassionedOrator,
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
        ClearTheMind,
        CodeOfConstraint,
        CoralCommando,
        EssenceCapture,
//        EyesEverywhere,
        FaerieDuelist,
        GatewaySneak,
        Humongulus,
//        MassManipulation,
//        MesmerizingBenthid,
//        PersistentPetitioners,
//        PrecognitivePerception,
        PryingEyes,
//        Pteramander,
//        Quench,
//        SagesRowSavant,
        SenateCourier,
        ShimmerOfPossibility,
        SkatewingSpy,
        SkitterEel,
        Slimebind,
//        SphinxOfForesight,
//        SwirlingTorrent,
        ThoughtCollapse,
//        VerityCircle,
        WallOfLostThoughts,
        WindstormDrake,
        AwakenTheErstwhile,
//        BankruptInBlood,
//        BladeJuggler,
        Bladebrand,
//        BloodmistInfiltrator,
//        CarrionImp,
        CatacombCrocodile,
        ClearTheStage,
        ConsignToThePit,
//        CryOfTheCarnarium,
//        DeadRevels,
        DebtorsTransport,
//        DrillBit,
//        FontOfAgonies,
        GrotesqueDemise,
//        Gutterbones,
        IllGottenInheritance,
        NoxiousGroodion,
        OrzhovEnforcer,
//        OrzhovRacketeers,
//        PestilentSpirit,
        PlagueWight,
//        PriestOfForgottenGods,
//        RakdosTrumpeter,
//        SpawnOfMayhem,
        SpireMangler,
        ThirstingShade,
//        UndercityScavenger,
//        UndercitysEmbrace,
        VindictiveVampire,
//        ActOfTreason,
//        Amplifire,
        BurnBright,
//        BurningTreeVandal,
//        CavalcadeOfCalamity,
//        ClamorShaman,
        DaggerCaster,
//        Deface,
//        Electrodominance,
        FeralMaaka,
        FlamesOfTheRazeBoar,
        GatesAblaze,
//        GhorClanWrecker,
        GoblinGathering,
        GravelHideGoblin,
//        ImmolationShaman,
//        LightUpTheStage,
//        MirrorMarch,
//        RixMaadiReveler,
//        RubbleReading,
//        RubblebeltRecluse,
        RumblingRuin,
//        Scorchmark,
//        SkarrganHellkite,
//        SkewerTheCritics,
//        SmeltWardIgnus,
        SpearSpewer,
//        SpikewheelAcrobat,
//        StormStrike,
//        TinStreetDodger,
        AxebaneBeast,
        BiogenicOoze,
//        BiogenicUpgrade,
        EndRazeForerunners,
        EnragedCeratok,
        GatebreakerRam,
        GiftOfStrength,
        GrowthChamberGuardian,
//        GruulBeastmaster,
//        GuardianProject,
//        IncubationDruid,
        MammothSpider,
        OpenTheGates,
        RampageOfTheClans,
//        RampagingRendhorn,
        Regenesis,
//        RootSnare,
        SagittarsVolley,
//        SaruliCaretaker,
        SauroformHybrid,
        SilhanaWayfinder,
        SteepleCreeper,
        StonyStrength,
        SylvanBrushstrider,
//        TerritorialBoar,
//        TitanicBrawl,
        TowerDefense,
        TrollbredGuardian,
        WildernessReclamation,
//        WreckingBeast,
        Absorb,
        Aeromunculus,
//        AppliedBiomancy,
        AzoriusKnightArbiter,
        AzoriusSkyguard,
        BasilicaBellHaunt,
        Bedevil,
//        BiomancersFamiliar,
//        BolracClanCrusher,
//        CaptiveAudience,
//        Cindervines,
//        ClanGuildmage,
//        CombineGuildmage,
        CultGuildmage,
//        DeputyOfDetention,
//        DomriChaosBringer,
//        DovinGrandArbiter,
        DovinsAcuity,
//        EmergencyPowers,
        EtherealAbsolution,
//        FinalPayment,
//        FirebladeArtist,
//        FrenziedArynx,
        FrilledMystic,
//        GallopingLizrog,
//        GetThePoint,
        GraspingThrull,
        GrowthSpiral,
//        GruulSpellbreaker,
        GyreEngineer,
//        Hackrobat,
//        HighAlert,
//        HydroidKrasis,
        ImperiousOligarch,
        JudithTheScourgeDiva,
        KayaOrzhovUsurper,
        KayasWrath,
//        KnightOfTheLastBreath,
//        LaviniaAzoriusRenegade,
        LawmagesBinding,
//        MacabreMockery,
        Mortify,
//        NikyaOfTheOldWays,
//        PitilessPontiff,
//        PrimeSpeakerVannifar,
//        RafterDemon,
        RakdosFirewheeler,
        RakdosRoustabout,
        RakdosTheShowstopper,
//        RavagerWurm,
//        RhythmOfTheWild,
        RubblebeltRunner,
        SavageSmash,
        SenateGuildmage,
        SeraphOfTheScales,
        Sharktocrab,
//        SimicAscendancy,
//        SphinxOfNewPrahv,
        SphinxsInsight,
//        SunderShaman,
        SyndicateGuildmage,
//        TeysaKarlov,
//        TheaterOfHorrors,
        ZeganaUtopianSpeaker,
//        ZhurTaaGoblin,
        FootlightFiend,
        RubbleSlinger,
        Scuttlegator,
//        SenateGriffin,
        VizkopaVampire,
//        BedeckBedazzle,
//        CarnivalCarnage,
//        CollisionColossus,
//        ConsecrateConsume,
//        DeposeDeploy,
//        IncubationIncongruity,
//        RepudiateReplicate,
//        RevivalRevenge,
//        ThrashThreat,
//        WarrantWarden,
        AzoriusLocket,
//        GateColossus,
        GlassOfTheGuildpact,
        GruulLocket,
        Junktroller,
        OrzhovLocket,
        RakdosLocket,
//        ScrabblingClaws,
//        ScreamingShield,
        SimicLocket,
//        SphinxOfTheGuildpact,
        TomeOfTheGuildpact,
        AzoriusGuildgate243,
        AzoriusGuildgate244,
//        BloodCrypt,
//        BreedingPool,
//        GatewayPlaza,
//        GodlessShrine,
        GruulGuildgate249,
        GruulGuildgate250,
//        HallowedFountain,
        OrzhovGuildgate252,
        OrzhovGuildgate253,
//        PlazaOfHarmony,
        RakdosGuildgate255,
        RakdosGuildgate256,
        SimicGuildgate257,
        SimicGuildgate258,
//        StompingGround,
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
    static func ImpassionedOrator() -> Card {
        let impassionedOrator = Card(name: "Impassioned Orator", rarity: .Common, set: set, number: 12)
        impassionedOrator.setManaCost("1W")
        impassionedOrator.setType(.Creature, .Human, .Cleric)
        impassionedOrator.addTriggeredAbility(
            trigger: .AnotherCreatureEntersBattlefieldUnderYourControl,
            effect: { impassionedOrator.getController().gainLife(1) })
        impassionedOrator.setFlavorText("In times of unrest, the crowd is eager for the comfort of strong convictions.")
        impassionedOrator.power = 2
        impassionedOrator.toughness = 2
        return impassionedOrator
    }
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
            if object != spiritOfTheSpires && object.isType(.Creature) && object.getBaseFlying() && object.getController() === spiritOfTheSpires.getController() {
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
    static func ClearTheMind() -> Card {
        let clearTheMind = Card(name: "Clear the Mind", rarity: .Common, set: set, number: 34)
        clearTheMind.setManaCost("2U")
        clearTheMind.setType(.Sorcery)
        clearTheMind.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.TargetPlayer(),
            effect: { target in
                target.shuffleGraveyardIntoLibrary()
                clearTheMind.getController().drawCard()
        }))
        clearTheMind.setFlavorText("\"The best way to keep a secret is to forget it.\"\n--Lazav")
        return clearTheMind
    }
    static func CodeOfConstraint() -> Card {
        let codeOfConstraint = Card(name: "Code of Constraint", rarity: .Uncommon, set: set, number: 35)
        codeOfConstraint.setManaCost("2U")
        codeOfConstraint.setType(.Instant)
        codeOfConstraint.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(-4, 0)
                codeOfConstraint.getController().drawCard()
                if codeOfConstraint.addendum() {
                    target.tap()
                    target.untapsDuringNextUntapStep = false
                }
        }))
        return codeOfConstraint
    }
    static func CoralCommando() -> Card {
        let coralCommando = Card(name: "Coral Commando", rarity: .Common, set: set, number: 36)
        coralCommando.setManaCost("2U")
        coralCommando.setType(.Creature, .Merfolk, .Warrior)
        coralCommando.setFlavorText("Few Ravnicans are aware of the vast reefs in their world's hidden ocean. Far beneath the great sinkholes, where the light is blue and dim, merfolk tend the coral labyrinths that feed the bebnthic ecosystems.")
        coralCommando.power = 3
        coralCommando.toughness = 2
        return coralCommando
    }
    static func EssenceCapture() -> Card {
        let essenceCapture = Card(name: "Essence Capture", rarity: .Uncommon, set: set, number: 37)
        essenceCapture.setManaCost("UU")
        essenceCapture.setType(.Instant)
        essenceCapture.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.TargetCreatureSpell(),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === essenceCapture.getController() },
                    zones: [.Battlefield],
                    optional: true),
            ],
            effect: { targets in
                if let spell = targets[0] {
                    spell.counter()
                }
                if let creature = targets[1] {
                    creature.addCounter(.PlusOnePlusOne)
                }
        }))
        essenceCapture.setFlavorText("\"It's not enough to defeat our foes. We must learn from them, too.\"\n--Vannifar")
        return essenceCapture
    }
    // 38 Eyes Everywhere
    static func FaerieDuelist() -> Card {
        let faereDuelist = Card(name: "Faerie Duelist", rarity: .Common, set: set, number: 39)
        faereDuelist.setManaCost("1U")
        faereDuelist.setType(.Creature, .Faerie, .Rogue)
        faereDuelist.flash = true
        faereDuelist.flying = true
        faereDuelist.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== faereDuelist.getController() },
                    zones: [.Battlefield]),
                effect: { $0.pump(-2, 0) }))
        faereDuelist.setFlavorText("Faeries are easily offended and quick to exact a quirky revenge.")
        faereDuelist.power = 1
        faereDuelist.toughness = 2
        return faereDuelist
    }
    static func GatewaySneak() -> Card {
        let gatewaySneak = Card(name: "Gateway Sneak", rarity: .Uncommon, set: set, number: 40)
        gatewaySneak.setManaCost("2U")
        gatewaySneak.setType(.Creature, .Vedalken, .Rogue)
        gatewaySneak.addTriggeredAbility(
            trigger: .GateEntersBattlefieldUnderYourControl,
            effect: { gatewaySneak.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.unblockable = true; return $0 }) )} )
        gatewaySneak.addTriggeredAbility(
            trigger: .ThisDealsCombatDamageToPlayer,
            effect: { gatewaySneak.getController().drawCard() })
        gatewaySneak.setFlavorText("\"I've been through every guildgate in this city, and no one sees me come or go.\"")
        gatewaySneak.power = 1
        gatewaySneak.toughness = 3
        return gatewaySneak
    }
    static func Humongulus() -> Card {
        let humongulus = Card(name: "Humongulus", rarity: .Uncommon, set: set, number: 41)
        humongulus.setManaCost("4U")
        humongulus.setType(.Creature, .Homunculus)
        humongulus.hexproof = true
        humongulus.setFlavorText("Searching the city for Fblthp felt like sifting the rain for a single drop of blood.")
        humongulus.power = 2
        humongulus.toughness = 5
        return humongulus
    }
    // 42 Mass Manipulation
    // 43 Mesmerizing Benthid
    // 44 Persistent Petitioners
    // 45 Precognitive Perception
    static func PryingEyes() -> Card {
        let pryingEyes = Card(name: "Prying Eyes", rarity: .Common, set: set, number: 46)
        pryingEyes.setManaCost("4UU")
        pryingEyes.setType(.Instant)
        pryingEyes.addEffect({
            pryingEyes.getController().drawCards(4)
            pryingEyes.getController().discard(2)
        })
        pryingEyes.setFlavorText("\"Citizen! Your crime has been recorded. Cease movement and await arrest, or further penalties will be immediately imposed.\"")
        return pryingEyes
    }
    // 47 Pteramander
    // 48 Quench
    // 49 Sage's Row Savant
    static func SenateCourier() -> Card {
        let senateCourier = Card(name: "Senate Courier", rarity: .Common, set: set, number: 50)
        senateCourier.setManaCost("2U")
        senateCourier.setType(.Creature, .Bird)
        senateCourier.flying = true
        senateCourier.addActivatedAbility(
            string: "{1}{W}: ~ gains vigilance until end of turn.",
            cost: Cost.Mana("1W"),
            effect: { senateCourier.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.vigilance = true; return $0 }) )})
        senateCourier.setFlavorText("\"This Dovin Baan came from nowhere. Watch him. Read his letters. He is more than he appears.\"\n--Lazav")
        senateCourier.power = 1
        senateCourier.toughness = 4
        return senateCourier
    }
    static func ShimmerOfPossibility() -> Card {
        let shimmerOfPossibility = Card(name: "Shimmer of Possibility", rarity: .Common, set: set, number: 51)
        shimmerOfPossibility.setManaCost("1U")
        shimmerOfPossibility.setType(.Sorcery)
        shimmerOfPossibility.addEffect({
            shimmerOfPossibility.getController().chooseCard(
                from: Array(shimmerOfPossibility.getController().getLibrary().suffix(4)),
                restriction: { _ in return true },
                action: { chosenCard, rest in
                    chosenCard?.reveal()
                    chosenCard?.putIntoHand()
                    shimmerOfPossibility.getController().putOnBottomOfLibrary(&rest, random: true)
            })
        })
        shimmerOfPossibility.setFlavorText("\"There's something peculiar about the rain today.\"\n--Janoc, Tin Street tinker")
        return shimmerOfPossibility
    }
    static func SkatewingSpy() -> Card {
        let skatewingSpy = Card(name: "Skatewing Spy", rarity: .Uncommon, set: set, number: 52)
        skatewingSpy.setManaCost("3U")
        skatewingSpy.setType(.Creature, .Vedalken, .Rogue, .Mutant)
        skatewingSpy.adapt(2, Cost.Mana("5U"))
        skatewingSpy.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === skatewingSpy.getController() && object.hasCounter(.PlusOnePlusOne) {
                object.flying = true
            }
            return object
        })
        skatewingSpy.setFlavorText("\"A better Ravnica begins with a better Simic.\"\n--Vannifar")
        skatewingSpy.power = 2
        skatewingSpy.toughness = 3
        return skatewingSpy
    }
    static func SkitterEel() -> Card {
        let skitterEel = Card(name: "Skitter Eel", rarity: .Common, set: set, number: 53)
        skitterEel.setManaCost("3U")
        skitterEel.setType(.Creature, .Fish, .Crab)
        skitterEel.adapt(2, Cost.Mana("2U"))
        skitterEel.setFlavorText("\"Life has no mistakes, only experiments.\"\n--Yolov, Siminc bioengineer")
        skitterEel.power = 3
        skitterEel.toughness = 3
        return skitterEel
    }
    static func Slimebind() -> Card {
        let slimebind = Card(name: "Slimebind", rarity: .Common, set: set, number: 54)
        slimebind.setManaCost("1U")
        slimebind.setType(.Enchantment, .Aura)
        slimebind.flash = true
        slimebind.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() - 4
                return object
        })
        slimebind.setFlavorText("\"Relax. It's quite harmless. And it will dissolve completely in a month or two.\"\n--Navona, Simic field tester")
        return slimebind
    }
    // 55 Sphinx of Foresight
    // 56 Swirling Torrent
    static func ThoughtCollapse() -> Card {
        let thoughtCollapse = Card(name: "Thought Collapse", rarity: .Common, set: set, number: 57)
        thoughtCollapse.setManaCost("1UU")
        thoughtCollapse.setType(.Instant)
        thoughtCollapse.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetSpell(),
            effect: { target in
                target.counter()
                target.getController().mill(3)
        }))
        thoughtCollapse.setFlavorText("\"I can think of no greater punishment than answering your question in full.\"\n--Lazav")
        return thoughtCollapse
    }
    static func VerityCircle() -> Card {
        let verityCircle = Card(name: "Verity Circle", rarity: .Rare, set: set, number: 58)
        verityCircle.setManaCost("2U")
        verityCircle.setType(.Enchantment)
        verityCircle.addTriggeredAbility(
            trigger: .CreatureOpponentControlsBecomesTappedBesidesAttacking,
            effect: { verityCircle.getController().drawCard() },
            effectOptional: true)
        verityCircle.addActivatedAbility(
            string: "{4}{U}: Tap target creature without flying.",
            cost: Cost.Mana("4U"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && !$0.flying },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        verityCircle.setFlavorText("\"Here, there is only truth.\"\n--Barvisa, Azorius emissary")
        return verityCircle
    }
    static func WallOfLostThoughts() -> Card {
        let wallOfLostThougts = Card(name: "Wall of Lost Thoughts", rarity: .Uncommon, set:set, number: 59)
        wallOfLostThougts.setManaCost("1U")
        wallOfLostThougts.setType(.Creature, .Wall)
        wallOfLostThougts.defender = true
        wallOfLostThougts.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { $0.mill(4) }))
        wallOfLostThougts.setFlavorText("Those who intrude upon the Dimir seldom remember that they have done so.")
        wallOfLostThougts.power = 0
        wallOfLostThougts.toughness = 4
        return wallOfLostThougts
    }
    static func WindstormDrake() -> Card {
        let windstormDrake = Card(name: "Windstorm Drake", rarity: .Uncommon, set: set, number: 60)
        windstormDrake.setManaCost("4U")
        windstormDrake.setType(.Creature, .Drake)
        windstormDrake.flying = true
        windstormDrake.addStaticAbility({ object in
            if object != windstormDrake && object.isType(.Creature) && object.getBaseFlying() && object.getController() === windstormDrake.getController() {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        windstormDrake.setFlavorText("Drakes become especially voracious as they prepare for their autumn migration, hunting the city's thoroughfares from dawn to dusk.")
        windstormDrake.power = 3
        windstormDrake.toughness = 3
        return windstormDrake
    }
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
    static func Bladebrand() -> Card {
        let bladebrand = Card(name: "Bladebrand", rarity: .Common, set: set, number: 64)
        bladebrand.setManaCost("1B")
        bladebrand.setType(.Instant)
        bladebrand.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0 }))
                bladebrand.getController().drawCard()
        }))
        bladebrand.setFlavorText("\"The pain of searing iron and razor edges pales beside the pleasure of performance.\"\n--Judith")
        return bladebrand
    }
    // 65 Bloodmist Infiltrator
    // 66 Carrion Imp
    static func CatacombCrocodile() -> Card {
        let catacombCrocodile = Card(name: "Catacomb Crocodile", rarity: .Common, set: set, number: 67)
        catacombCrocodile.setManaCost("4B")
        catacombCrocodile.setType(.Creature, .Crocodile)
        catacombCrocodile.setFlavorText("\"I am sewer-king!\" said Rat. \"I am quick and cunning and I know every tunnel.\"\n\"No, I am king!\" said Zombie. \"I am cold and deadly and no rot can harm me.\"\nThen Croc came and ate them both.")
        catacombCrocodile.power = 3
        catacombCrocodile.toughness = 7
        return catacombCrocodile
    }
    static func ClearTheStage() -> Card {
        let clearTheStage = Card(name: "Clear the Stage", rarity: .Uncommon, set: set, number: 68)
        clearTheStage.setManaCost("4B")
        clearTheStage.setType(.Instant)
        clearTheStage.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.TargetCreature(),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === clearTheStage.getController() },
                    zones: [.Graveyard],
                    optional: true)
            ],
            effect: { targets in
                if let creatureOnBattlefield = targets[0] {
                    creatureOnBattlefield.pump(-3, -3)
                }
                let controlCreatureWithPower4OrGreater = !clearTheStage.getController().getCreatures().filter({ $0.getPower() >= 4 }).isEmpty
                if let creatureInGraveyard = targets[1], controlCreatureWithPower4OrGreater {
                    creatureInGraveyard.putIntoHand()
                }
        }))
        clearTheStage.setFlavorText("\"Make way! It's time for the final act!")
        return clearTheStage
    }
    static func ConsignToThePit() -> Card {
        let consignToThePit = Card(name: "Consign to the Pit", rarity: .Common, set: set, number: 69)
        consignToThePit.setManaCost("5B")
        consignToThePit.setType(.Sorcery)
        consignToThePit.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                let controller = target.getController()
                _ = target.destroy()
                controller.loseLife(2)
        }))
        consignToThePit.setFlavorText("First your whole life flashes before your eyes. Then you have considerable time to reflect on every regret as you plummet.")
        return consignToThePit
    }
    // 70 Cry of the Carnarium
    // 71 Dead Revels
    static func DebtorsTransport() -> Card {
        let debtorsTransport = Card(name: "Debtors' Transport", rarity: .Common, set: set, number: 72)
        debtorsTransport.setManaCost("5B")
        debtorsTransport.setType(.Creature, .Thrull)
        debtorsTransport.afterlife(2)
        debtorsTransport.setFlavorText("By design, the sarcophagus muffles the debtors' moans but does not silence them.")
        debtorsTransport.power = 5
        debtorsTransport.toughness = 3
        return debtorsTransport
    }
    // 73 Drill Bit
    // 74 Font of Agonies
    static func GrotesqueDemise() -> Card {
        let grotesqueDemise = Card(name: "Grotesque Demise", rarity: .Common, set: set, number: 75)
        grotesqueDemise.setManaCost("2B")
        grotesqueDemise.setType(.Instant)
        grotesqueDemise.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() <= 3 },
                zones: [.Battlefield]),
            effect: { $0.exile() }))
        grotesqueDemise.setFlavorText("\"A debtor's soul has little value, except as a warning to others who might consider defaulting on their loans.\"\n--Ubea, Orzhov ministrant")
        return grotesqueDemise
    }
    // 76 Gutterbones
    static func IllGottenInheritance() -> Card {
        let illGottenInheritance = Card(name: "Ill-Gotten Inheritance", rarity: .Common, set: set, number: 77)
        illGottenInheritance.setManaCost("3B")
        illGottenInheritance.setType(.Enchantment)
        illGottenInheritance.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: {
                illGottenInheritance.getController().eachOpponent({ opponent in
                    illGottenInheritance.damage(to: opponent, 1)
                })
                illGottenInheritance.getController().gainLife(1)
        })
        illGottenInheritance.addActivatedAbility(
            string: "{5}{B}, Sacrifice ~: It deals 4 damage to target opponent and you gain 4 life.",
            cost: Cost.Mana("5B").Sacrifice(),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== illGottenInheritance.getController() }),
                effect: { target in
                    illGottenInheritance.damage(to: target, 4)
                    illGottenInheritance.getController().gainLife(4)
        }))
        illGottenInheritance.setFlavorText("\"The suffering of others is not my concern.\"")
        return illGottenInheritance
    }
    static func NoxiousGroodion() -> Card {
        let noxiousGroodion = Card(name: "Noxious Groodion", rarity: .Common, set: set, number: 78)
        noxiousGroodion.setManaCost("2B")
        noxiousGroodion.setType(.Creature, .Beast)
        noxiousGroodion.deathtouch = true
        noxiousGroodion.setFlavorText("\"Behold the groodion! Ichor-slurper, oozing fiend. Foulest wonder underground. Grandest vermin of them all!\"\n--Zalin the Gutter Bard")
        noxiousGroodion.power = 2
        noxiousGroodion.toughness = 2
        return noxiousGroodion
    }
    static func OrzhovEnforcer() -> Card {
        let orzhovEnforcer = Card(name: "Orzhov Enforcer", rarity: .Uncommon, set: set, number: 79)
        orzhovEnforcer.setManaCost("1B")
        orzhovEnforcer.setType(.Creature, .Human, .Rogue)
        orzhovEnforcer.deathtouch = true
        orzhovEnforcer.afterlife(1)
        orzhovEnforcer.setFlavorText("\"You'll pay for what you owe, with your money or your life.\"")
        orzhovEnforcer.power = 1
        orzhovEnforcer.toughness = 2
        return orzhovEnforcer
    }
    // 80 Orzhov Racketeers
    // 81 Pestilent Spirit
    static func PlagueWight() -> Card {
        let plagueWight = Card(name: "Plague Wight", rarity: .Common, set: set, number: 82)
        plagueWight.setManaCost("1B")
        plagueWight.setType(.Creature, .Zombie)
        plagueWight.addTriggeredAbility(
            trigger: .ThisBecomesBlocked,
            effect: { plagueWight.blockers.forEach({ $0.pump(-1, -1) }) })
        plagueWight.setFlavorText("For some goods, the best couriers are the dead.")
        plagueWight.power = 2
        plagueWight.toughness = 1
        return plagueWight
    }
    // 83 Priest of Forgotten Gods
    // 84 Rakdos Trumpeter
    // 85 Spawn of Mayhem
    static func SpireMangler() -> Card {
        let spireMangler = Card(name: "Spire Mangler", rarity: .Uncommon, set: set, number: 86)
        spireMangler.setManaCost("2B")
        spireMangler.setType(.Creature, .Insect)
        spireMangler.flash = true
        spireMangler.flying = true
        spireMangler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.flying && $0.getController() === spireMangler.getController() },
                    zones: [.Battlefield]),
                effect: { $0.pump(2, 0)} ))
        spireMangler.setFlavorText("Its mandibles can leave a rider in the clouds astride a headless griffin.")
        spireMangler.power = 2
        spireMangler.toughness = 1
        return spireMangler
    }
    static func ThirstingShade() -> Card {
        let thirstingShade = Card(name: "Thirsting Shade", rarity: .Common, set: set, number: 87)
        thirstingShade.setManaCost("B")
        thirstingShade.setType(.Creature, .Shade)
        thirstingShade.lifelink = true
        thirstingShade.addActivatedAbility(
            string: "{2}{B}: ~ gets +1/+1 until end of turn.",
            cost: Cost.Mana("2B"),
            effect: { thirstingShade.pump(1, 1) })
        thirstingShade.setFlavorText("\"Your life is a blinding light, your breath a gale, your pulse a deafening drum. Be still. Be still.\"\n--Dahlya Trul, \"Irbitov Lament\"")
        thirstingShade.power = 1
        thirstingShade.toughness = 1
        return thirstingShade
    }
    // 88 Undercity Scavenger
    // 89 Undercity's Embrace
    static func VindictiveVampire() -> Card {
        let vindictiveVampire = Card(name: "Vindictive Vampire", rarity: .Uncommon, set: set, number: 90)
        vindictiveVampire.setManaCost("3B")
        vindictiveVampire.setType(.Creature, .Vampire)
        vindictiveVampire.addTriggeredAbility(
            trigger: .AnotherCreatureYouControlDies,
            effect: {
                vindictiveVampire.eachOpponent({ vindictiveVampire.damage(to: $0, 1) })
                vindictiveVampire.getController().gainLife(1)
        })
        vindictiveVampire.setFlavorText("In theory, the Guildpact keeps guild feuds from spiraling out of control. Personal feuds, however, are not covered.")
        vindictiveVampire.power = 2
        vindictiveVampire.toughness = 3
        return vindictiveVampire
    }
    // 91 Act of Treason
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
    static func DaggerCaster() -> Card {
        let daggerCaster = Card(name: "Dagger Caster", rarity: .Uncommon, set: set, number: 97)
        daggerCaster.setManaCost("3R")
        daggerCaster.setType(.Creature, .Viashino, .Rogue)
        daggerCaster.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                daggerCaster.eachOpponent({ opponent in
                    daggerCaster.damage(to: opponent, 1)
                    opponent.getCreatures().forEach({ daggerCaster.damage(to: $0, 1) })
                })
        })
        daggerCaster.setFlavorText("\"Keep coming. I have knives enough for everyone.\"")
        daggerCaster.power = 2
        daggerCaster.toughness = 3
        return daggerCaster
    }
    // 98 Deface
    // 99 Electrodominance
    static func FeralMaaka() -> Card {
        let feralMaaka = Card(name: "Feral Maaka", rarity: .Common, set: set, number: 100)
        feralMaaka.setManaCost("1R")
        feralMaaka.setType(.Creature, .Cat)
        feralMaaka.setFlavorText("\"Lost are the lush meadows and verdant forests, where maaka prowled and lammasu soared. Lost are the wilds, where our hearts were free.\"\n--Daiva, Gruul storyteller")
        feralMaaka.power = 2
        feralMaaka.toughness = 2
        return feralMaaka
    }
    static func FlamesOfTheRazeBoar() -> Card {
        let flamesOfTheRazeBoar = Card(name: "Flames of the Raze-Boar", rarity: .Uncommon, set: set, number: 101)
        flamesOfTheRazeBoar.setManaCost("5R")
        flamesOfTheRazeBoar.setType(.Instant)
        flamesOfTheRazeBoar.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() !== flamesOfTheRazeBoar.getController() },
                zones: [.Battlefield]),
            effect: { target in
                flamesOfTheRazeBoar.damage(to: target, 4)
                if !flamesOfTheRazeBoar.getController().getCreatures().filter({ $0.getPower() >= 4 }).isEmpty {
                    target.getController().getCreatures().filter({ $0 != target }).forEach({ creature in
                        flamesOfTheRazeBoar.damage(to: creature, 2)
                    })
                }
        }))
        flamesOfTheRazeBoar.setFlavorText("\"Fire will cure a multitude of ills.\"")
        return flamesOfTheRazeBoar
    }
    static func GatesAblaze() -> Card {
        let gatesAblaze = Card(name: "Gates Ablaze", rarity: .Uncommon, set: set, number: 102)
        gatesAblaze.setManaCost("2R")
        gatesAblaze.setType(.Sorcery)
        gatesAblaze.addEffect({
            let numGates = gatesAblaze.getController().getPermanents().filter({ $0.isType(.Gate) }).count
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ creature in
                    gatesAblaze.damage(to: creature, numGates)
                })
            })
        })
        gatesAblaze.setFlavorText("When the Izzet's spirit of invention extends to the city's infrastructure, the results are sometimes explosive.")
        return gatesAblaze
    }
    // 103 Ghor-Clan Wrecker
    static func GoblinGathering() -> Card {
        let name = "Goblin Gathering"
        let goblinGathering = Card(name: name, rarity: .Common, set: set, number: 104)
        goblinGathering.setManaCost("2R")
        goblinGathering.setType(.Sorcery)
        goblinGathering.addEffect({
            let numGatherings = goblinGathering.getController().getGraveyard().filter({ $0.getName() == name }).count
            let numGoblins = 2 + numGatherings
            for _ in 0 ..< numGoblins {
                goblinGathering.getController().createToken(Goblin())
            }
        })
        goblinGathering.setFlavorText("Two's a party. Three's a felony.")
        return goblinGathering
    }
    static func GravelHideGoblin() -> Card {
        let gravelHideGoblin = Card(name: "Gravel-Hide Goblin", rarity: .Common, set: set, number: 105)
        gravelHideGoblin.setManaCost("1R")
        gravelHideGoblin.setType(.Creature, .Goblin, .Shaman)
        gravelHideGoblin.addActivatedAbility(
            string: "{3}{G}: ~ gets +2/+2 until end of turn.",
            cost: Cost.Mana("3G"),
            effect: { gravelHideGoblin.pump(2, 2) })
        gravelHideGoblin.setFlavorText("\"No peace accord will save Ravnica. You don't build on rot. You burn it down and start again.\"\n--Domri Rade")
        gravelHideGoblin.power = 2
        gravelHideGoblin.toughness = 1
        return gravelHideGoblin
    }
    // 106 Immolation Shaman
    // 107 Light Up the Stage
    // 108 Mirror March
    // 109 Rix Maadi Reveler
    // 110 Rubble Reading
    // 111 RubblebeltRecluse
    static func RumblingRuin() -> Card {
        let rumblingRuin = Card(name: "Rumbling Ruin", rarity: .Uncommon, set: set, number: 112)
        rumblingRuin.setManaCost("5R")
        rumblingRuin.setType(.Creature, .Elemental)
        rumblingRuin.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                var numCounters: Int = 0
                rumblingRuin.getController().getCreatures().forEach({ creature in
                    numCounters += creature.getCounters(.PlusOnePlusOne)
                })
                rumblingRuin.eachOpponent({ $0.getCreatures().forEach({ creature in
                    if creature.getPower() <= numCounters {
                        creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.cantBlock = true; return $0 }))
                    }
                })})
        })
        rumblingRuin.setFlavorText("The Rubblebelt grows restless.")
        rumblingRuin.power = 6
        rumblingRuin.toughness = 6
        return rumblingRuin
    }
    // 113 Scorchmark
    // 114 Skarrgan Hellkite
    // 115 Skewer the Critics
    // 116 Smelt-Ward Ignus
    static func SpearSpewer() -> Card {
        let spearSpewer = Card(name: "Spear Spewer", rarity: .Common, set: set, number: 117)
        spearSpewer.setManaCost("R")
        spearSpewer.setType(.Creature, .Goblin, .Warrior)
        spearSpewer.defender = true
        spearSpewer.addActivatedAbility(
            string: "{T}: ~ deals 1 damage to each player.",
            cost: Cost.Tap(),
            effect: {
                Game.shared.bothPlayers({ player in
                    spearSpewer.damage(to: player, 1)
                })
        })
        spearSpewer.setFlavorText("\"Don't waste time aiming, you lazy gob-slug! Fire!\"\n--Krenko, mob boss")
        spearSpewer.power = 0
        spearSpewer.toughness = 2
        return spearSpewer
    }
    // 118 Spikewheel Acrobat
    // 119 Storm Strike
    // 120 Tin-Street Dodger
    static func AxebaneBeast() -> Card {
        let axebaneBeast = Card(name: "Axebane Beast", rarity: .Common, set: set, number: 121)
        axebaneBeast.setManaCost("3G")
        axebaneBeast.setType(.Creature, .Beast)
        axebaneBeast.setFlavorText("\"Imagine a gigantic pine cone that's extremely territorial and always in a foul mood.\"\n--Zhosmir, urban huntmaster")
        axebaneBeast.power = 3
        axebaneBeast.toughness = 4
        return axebaneBeast
    }
    static func BiogenicOoze() -> Card {
        let biogenicOoze = Card(name: "Biogenic Ooze", rarity: .Mythic, set: set, number: 122)
        biogenicOoze.setManaCost("3GG")
        biogenicOoze.setType(.Creature, .Ooze)
        biogenicOoze.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { biogenicOoze.getController().createToken(Ooze()) })
        biogenicOoze.addTriggeredAbility(
            trigger: .YourEndStep,
            effect: {
                biogenicOoze.getController().getCreatures().filter({ $0.isType(.Ooze) }).forEach({ creature in
                    creature.addCounter(.PlusOnePlusOne)
                })
        })
        biogenicOoze.addActivatedAbility(
            string: "{1}{G}{G}{G}: Create a 2/2 green Ooze creature token.",
            cost: Cost.Mana("1GGG"),
            effect: { biogenicOoze.getController().createToken(Ooze()) })
        biogenicOoze.power = 2
        biogenicOoze.toughness = 2
        return biogenicOoze
    }
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
    static func EnragedCeratok() -> Card {
        let enragedCeratok = Card(name: "Enraged Ceratok", rarity: .Uncommon, set: set, number: 125)
        enragedCeratok.setManaCost("2GG")
        enragedCeratok.setType(.Creature, .Rhino)
        enragedCeratok.blockabilityRequirements.append({ object in
            return object.getPower() > 2
        })
        enragedCeratok.setFlavorText("\"There's no time to calm it down! Run!\"")
        enragedCeratok.power = 4
        enragedCeratok.toughness = 4
        return enragedCeratok
    }
    static func GatebreakerRam() -> Card {
        let gatebreakerRam = Card(name: "Gatebreaker Ram", rarity: .Uncommon, set: set, number: 126)
        gatebreakerRam.setManaCost("2G")
        gatebreakerRam.setType(.Creature, .Sheep)
        gatebreakerRam.addStaticAbility({ object in
            if object == gatebreakerRam {
                let numGates = gatebreakerRam.getController().getPermanents().filter({ $0.isType(.Gate) }).count
                gatebreakerRam.power = gatebreakerRam.getBasePower() + numGates
                gatebreakerRam.toughness = gatebreakerRam.getBaseToughness() + numGates
                if numGates >= 2 {
                    // TODO Layers
                    gatebreakerRam.vigilance = true
                    gatebreakerRam.trample = true
                }
            }
            return object
        })
        gatebreakerRam.setFlavorText("So-called \"battering rams\" pale in comparison to the real thing.")
        gatebreakerRam.power = 2
        gatebreakerRam.toughness = 2
        return gatebreakerRam
    }
    static func GiftOfStrength() -> Card {
        let giftOfStrength = Card(name: "Gift of Strength", rarity: .Common, set: set, number: 127)
        giftOfStrength.setManaCost("1G")
        giftOfStrength.setType(.Instant)
        giftOfStrength.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: {
                $0.pump(3, 3)
                $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.reach = true; return $0 }))
        }))
        giftOfStrength.setFlavorText("\"When the sky screams, when the ground groans, the End-Raze will soon begin.\"\n--Nikya of the Old Ways")
        return giftOfStrength
    }
    static func GrowthChamberGuardian() -> Card {
        let name = "Growth-Chamber Guardian"
        let growthChamberGuardian = Card(name: name, rarity: .Rare, set: set, number: 128)
        growthChamberGuardian.setManaCost("1G")
        growthChamberGuardian.setType(.Creature, .Elf, .Crab, .Warrior)
        growthChamberGuardian.adapt(2, Cost.Mana("2G"))
        growthChamberGuardian.addTriggeredAbility(
            trigger: .ThisGetsPlusOnePlusOneCounter,
            effect: {
                growthChamberGuardian.getController().chooseCard(
                    from: growthChamberGuardian.getController().getLibrary(),
                    restriction: { $0.getName() == name },
                    action: { chosenCard, rest in
                        chosenCard?.reveal()
                        chosenCard?.putIntoHand()
                        growthChamberGuardian.getController().shuffleLibrary()
                    })
            },
            effectOptional: true)
        growthChamberGuardian.power = 2
        growthChamberGuardian.toughness = 2
        return growthChamberGuardian
    }
    // 129 Gruul Beastmaster
    // 130 Guardian Project
    // 131 Incubation Druid
    static func MammothSpider() -> Card {
        let mammothSpider = Card(name: "Mammoth Spider", rarity: .Common, set: set, number: 132)
        mammothSpider.setManaCost("4G")
        mammothSpider.setType(.Creature, .Spider)
        mammothSpider.reach = true
        mammothSpider.setFlavorText("\"The good news is that the migrating drakes are no longer a problem.\"\n--Bell Migellic, Azorius hussar")
        mammothSpider.power = 3
        mammothSpider.toughness = 5
        return mammothSpider
    }
    static func OpenTheGates() -> Card {
        let openTheGates = Card(name: "Open the Gates", rarity: .Common, set: set, number: 133)
        openTheGates.setManaCost("G")
        openTheGates.setType(.Sorcery)
        openTheGates.addEffect({
            openTheGates.getController().chooseCard(
                from: openTheGates.getController().getLibrary(),
                restriction: { $0.isBasicLand() || $0.isType(.Gate) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    openTheGates.getController().shuffleLibrary()
            })
        })
        openTheGates.setFlavorText("\"If you don't have a destination in mind, the route is all that matters.\"\n--Tamina, district guide")
        return openTheGates
    }
    static func RampageOfTheClans() -> Card {
        let rampageOfTheClans = Card(name: "Rampage of the Clans", rarity: .Rare, set: set, number: 134)
        rampageOfTheClans.setManaCost("3G")
        rampageOfTheClans.setType(.Instant)
        rampageOfTheClans.addEffect({
            Game.shared.bothPlayers({ player in
                player.getArtifactsAndEnchantments().forEach({ object in
                    let destroyed = object.destroy()
                    if destroyed {
                        player.createToken(Centaur())
                    }
                })
            })
        })
        rampageOfTheClans.setFlavorText("\"Rage! Rage until the whole world burns!\"")
        return rampageOfTheClans
    }
    // 135 Rampaging Rendhorn
    static func Regenesis() -> Card {
        let regenesis = Card(name: "Regenesis", rarity: .Uncommon, set: set, number: 136)
        regenesis.setManaCost("3GG")
        regenesis.setType(.Instant)
        let targetingRestriction = TargetingRestriction.SingleObject(
            restriction: { $0.isPermanent() && $0.getController() === regenesis.getController() },
            zones: [.Graveyard],
            optional: true)
        regenesis.addEffect(TargetedEffect.MultiObject(
            restrictions: [ targetingRestriction, targetingRestriction ],
            effect: { targets in
                for target in targets {
                    target?.putIntoHand()
                }
        }))
        regenesis.setFlavorText("\"When you get right down to it, the difference between death and life is just a membrane-enclosed environment maintained by a metabolic process.\"\n--Gulistan, Simic biomancer")
        return regenesis
    }
    // 137 Root Snare
    static func SagittarsVolley() -> Card {
        let sagittarsVolley = Card(name: "Sagittars' Volley", rarity: .Common, set: set, number: 138)
        sagittarsVolley.setManaCost("2G")
        sagittarsVolley.setType(.Instant)
        sagittarsVolley.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.flying },
                zones: [.Battlefield]),
            effect: { target in
                _ = target.destroy()
                sagittarsVolley.eachOpponent({ opponent in
                    opponent.getCreatures().filter({ $0.flying }).forEach({ sagittarsVolley.damage(to: $0, 1) })
                })
        }))
        sagittarsVolley.setFlavorText("\"My bowstring hums in tune with the song of the Worldsoul.\"\n--Alcarus, Selesnya sagittar")
        return sagittarsVolley
    }
    // 139 Saruli Caretaker
    static func SauroformHybrid() -> Card {
        let sauroformHybrid = Card(name: "Sauroform Hybrid", rarity: .Common, set: set, number: 140)
        sauroformHybrid.setManaCost("1G")
        sauroformHybrid.setType(.Creature, .Human, .Lizard, .Warrior)
        sauroformHybrid.adapt(4, Cost.Mana("4GG"))
        sauroformHybrid.setFlavorText("\"Within each of us, the potential for great power waits to be released.\"\n--Zija, Simic mutationist")
        sauroformHybrid.power = 2
        sauroformHybrid.toughness = 2
        return sauroformHybrid
    }
    static func SilhanaWayfinder() -> Card {
        let silhanaWayfinder = Card(name: "Silhana Wayfinder", rarity: .Uncommon, set: set, number: 141)
        silhanaWayfinder.setManaCost("1G")
        silhanaWayfinder.setType(.Creature, .Elf, .Scout)
        silhanaWayfinder.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { silhanaWayfinder.getController().chooseCard(
                from: Array(silhanaWayfinder.getController().getLibrary().suffix(4)),
                restriction: { $0.isType(.Creature) || $0.isType(.Land) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putOnTopOfLibrary()
                    silhanaWayfinder.getController().putOnBottomOfLibrary(&rest, random: true)
            })
        })
        silhanaWayfinder.power = 2
        silhanaWayfinder.toughness = 1
        return silhanaWayfinder
    }
    static func SteepleCreeper() -> Card {
        let steepleCreeper = Card(name: "Steeple Creeper", rarity: .Common, set: set, number: 142)
        steepleCreeper.setManaCost("2G")
        steepleCreeper.setType(.Creature, .Frog, .Snake)
        steepleCreeper.addActivatedAbility(
            string: "{3}{U}: ~ gains flying until end of turn.",
            cost: Cost.Mana("3U"),
            effect: { steepleCreeper.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.flying = true; return $0 }) )})
        steepleCreeper.setFlavorText("\"If the Fin Claade cannot produce a reliable venomous krasis, mobile in both air and water, then the Guardian Project will absorb its resources.\"\n--Vannifar")
        steepleCreeper.power = 4
        steepleCreeper.toughness = 2
        return steepleCreeper
    }
    static func StonyStrength() -> Card {
        let stonyStrength = Card(name: "Stony Strength", rarity: .Common, set: set, number: 143)
        stonyStrength.setManaCost("G")
        stonyStrength.setType(.Instant)
        stonyStrength.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() === stonyStrength.getController() },
                zones: [.Battlefield]),
            effect: { target in
                target.addCounter(.PlusOnePlusOne)
                target.untap()
        }))
        stonyStrength.setFlavorText("\"What you build, we will destroy... and bury you in the rubble!\"")
        return stonyStrength
    }
    static func SylvanBrushstrider() -> Card {
        let sylvanBrushstrider = Card(name: "Sylvan Brushstrider", rarity: .Common, set: set, number: 144)
        sylvanBrushstrider.setManaCost("2G")
        sylvanBrushstrider.setType(.Creature, .Beast)
        sylvanBrushstrider.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { sylvanBrushstrider.getController().gainLife(2) })
        sylvanBrushstrider.setFlavorText("The mournful lowing of brushstriders warns of changing weather and ill winds.")
        sylvanBrushstrider.power = 3
        sylvanBrushstrider.toughness = 2
        return sylvanBrushstrider
    }
    // 145 Territorial Boar
    // 146 Titanic Brawl
    static func TowerDefense() -> Card {
        let towerDefense = Card(name: "Tower Defense", rarity: .Uncommon, set: set, number: 147)
        towerDefense.setManaCost("1G")
        towerDefense.setType(.Instant)
        towerDefense.addEffect({
            towerDefense.getController().getCreatures().forEach({ creature in
                creature.pump(0, 5)
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.reach = true; return $0 }))
            })
        })
        towerDefense.setFlavorText("\"We've been practicing for this all our lives. This is the final test.\"\n--Korun Nar, Rubblebelt hunter")
        return towerDefense
    }
    static func TrollbredGuardian() -> Card {
        let trollbredGuardian = Card(name: "Trollbred Guardian", rarity: .Uncommon, set: set, number: 148)
        trollbredGuardian.setManaCost("4G")
        trollbredGuardian.setType(.Creature, .Troll, .Frog, .Warrior)
        trollbredGuardian.adapt(2, Cost.Mana("2G"))
        trollbredGuardian.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === trollbredGuardian.getController() && object.hasCounter(.PlusOnePlusOne) {
                object.trample = true
            }
            return object
        })
        trollbredGuardian.setFlavorText("His favorite food is kraul.")
        trollbredGuardian.power = 5
        trollbredGuardian.toughness = 5
        return trollbredGuardian
    }
    static func WildernessReclamation() -> Card {
        let wildernessReclamation = Card(name: "Wilderness Reclamation", rarity: .Uncommon, set: set, number: 149)
        wildernessReclamation.setManaCost("3G")
        wildernessReclamation.setType(.Enchantment)
        wildernessReclamation.addTriggeredAbility(
            trigger: .YourEndStep,
            effect: {
                wildernessReclamation.getController().getLands().forEach({ $0.untap() })
        })
        wildernessReclamation.setFlavorText("\"Walls crack. Buildings fall. Always the wilds return.\"\n--Domri Rade")
        return wildernessReclamation
    }
    // 150 Wrecking Beast
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
    // 153 Applied Biomancy
    static func AzoriusKnightArbiter() -> Card {
        let azoriusKnightAribter = Card(name: "Azorius Knight-Arbiter", rarity: .Common, set: set, number: 154)
        azoriusKnightAribter.setManaCost("3WU")
        azoriusKnightAribter.setType(.Creature, .Human, .Knight)
        azoriusKnightAribter.vigilance = true
        azoriusKnightAribter.unblockable = true
        azoriusKnightAribter.setFlavorText("Thanks to the magic in his Writ of Passage, alms beasts lumbered aside, anarchs bowed their heads, and even Rakdos acrobats rolled their spikewheels out of his way.")
        azoriusKnightAribter.power = 2
        azoriusKnightAribter.toughness = 5
        return azoriusKnightAribter
    }
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
                basilicaBellHaunt.eachOpponent({ $0.discard() })
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
    // 161 Cindervines
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
    static func DovinsAcuity() -> Card {
        let dovinsAcuity = Card(name: "Dovin's Acuity", rarity: .Uncommon, set: set, number: 168)
        dovinsAcuity.setManaCost("1WU")
        dovinsAcuity.setType(.Enchantment)
        dovinsAcuity.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                dovinsAcuity.getController().gainLife(2)
                dovinsAcuity.getController().drawCard()
        })
        dovinsAcuity.addTriggeredAbility(
            trigger: .YouCastInstantSpell,
            effect: { dovinsAcuity.putIntoHand() },
            restriction: { dovinsAcuity.addendum() })
        dovinsAcuity.setFlavorText("Dovin ticked the Planeswalkers off on his fingers: himself, Domri, Kaya, Ral, Vraska... and Bolas made an even six.")
        return dovinsAcuity
    }
    // 169 Emergency Powers
    static func EtherealAbsolution() -> Card {
        let etherealAbsolution = Card(name: "Ethereal Absolution", rarity: .Rare, set: set, number: 170)
        etherealAbsolution.setManaCost("4WB")
        etherealAbsolution.setType(.Enchantment)
        etherealAbsolution.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === etherealAbsolution.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        etherealAbsolution.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() !== etherealAbsolution.getController() {
                object.power = object.getBasePower() - 1
                object.toughness = object.getBaseToughness() - 1
            }
            return object
        })
        etherealAbsolution.addActivatedAbility(
            string: "{2}{W}{B}: Exile target card from an opponent's graveyard. If it was a creature card, you create a 1/1 white and black Spirit creature token with flying.",
            cost: Cost.Mana("2WB"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== etherealAbsolution.getController() },
                    zones: [.Graveyard]),
                effect: { target in
                    let wasCreature = target.isType(.Creature)
                    target.exile()
                    if wasCreature {
                        etherealAbsolution.getController().createToken(Spirit())
                    }
            }))
        etherealAbsolution.setFlavorText("\"Time to let the dead be dead.\"\n--Kaya, to Teysa")
        return etherealAbsolution
    }
    // 171 Final Payment
    // 172 Fireblade Artist
    // 173 Frenzied Arynx
    static func FrilledMystic() -> Card {
        let frilledMystic = Card(name: "Frilled Mystic", rarity: .Uncommon, set: set, number: 174)
        frilledMystic.setManaCost("GGUU")
        frilledMystic.setType(.Creature, .Elf, .Lizard, .Wizard)
        frilledMystic.flash = true
        frilledMystic.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetSpell(),
                effect: { $0.counter() },
                effectOptional: true))
        frilledMystic.setFlavorText("\"Your arrival was expected... and unwelcome.\"")
        frilledMystic.power = 3
        frilledMystic.toughness = 2
        return frilledMystic
    }
    // 175 Galloping Lizrog
    // 176 Get the Point
    static func GraspingThrull() -> Card {
        let graspingThrull = Card(name: "Grasping Thrull", rarity: .Common, set: set, number: 177)
        graspingThrull.setManaCost("3WB")
        graspingThrull.setType(.Creature, .Thrull)
        graspingThrull.flying = true
        graspingThrull.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                graspingThrull.eachOpponent({ graspingThrull.damage(to: $0, 2) })
                graspingThrull.getController().gainLife(2)
        })
        graspingThrull.setFlavorText("\"Debt due! Debt due!\" The thrull's screeching makes children flinch and debtors quail. \"Debt due!\"")
        graspingThrull.power = 3
        graspingThrull.toughness = 3
        return graspingThrull
    }
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
    static func GyreEngineer() -> Card {
        let gyreEngineer = Card(name: "Gyre Engineer", rarity: .Uncommon, set: set, number: 180)
        gyreEngineer.setManaCost("1GU")
        gyreEngineer.setType(.Creature, .Vedalken, .Wizard)
        gyreEngineer.addActivatedAbility(
            string: "{T}: Add {G}{U}.",
            cost: Cost.Tap(),
            effect: {
                gyreEngineer.getController().addMana(color: .Green)
                gyreEngineer.getController().addMana(color: .Blue)
            },
            manaAbility: true)
        gyreEngineer.setFlavorText("\"As I contemplate what is, I dive ever deeper into the depths of possibility. Then I set an experiment in motion and watch the truth rise to the surface.\"")
        gyreEngineer.power = 1
        gyreEngineer.toughness = 1
        return gyreEngineer
    }
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
    static func KayaOrzhovUsurper() -> Card {
        let kaya = Card(name: "Kaya, Orzhov Usurper", rarity: .Mythic, set: set, number: 186)
        kaya.setManaCost("1WB")
        kaya.setType(.Legendary, .Planeswalker, .Kaya)
        kaya.addActivatedAbility(
            string: "{+1}: Exile up to two target cards from a single graveyard. You gain 2 life if at least one creature card was exiled this way.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: TargetedEffect.MultiObject(
                restrictions: [
                    TargetingRestriction.SingleObject(
                        restriction: { _ in return true },
                        zones: [.Graveyard],
                        optional: true),
                    TargetingRestriction.SingleObject(
                        restriction: { _ in return true },
                        zones: [.Graveyard],
                        optional: true),
                ],
                effect: { targets in
                    let atLeastOneCreature = targets.contains(where: {
                        if let target = $0 {
                            return target.isType(.Creature)
                        }
                        return false
                    })
                    targets.forEach({ $0?.exile() })
                    if atLeastOneCreature {
                        kaya.getController().gainLife(2)
                    }
            }),
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        kaya.addActivatedAbility(
            string: "{-1}: Exile target nonland permanent with converted mana cost 1 or less.",
            cost: Cost.RemoveCounters(.Loyalty, 1),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { !$0.isType(.Land) && $0.isPermanent() && $0.getConvertedManaCost() <= 1},
                    zones: [.Battlefield]),
                effect: { $0.exile() }),
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        kaya.addActivatedAbility(
            string: "{-5}: ~ deals damage to target player equal to the number of cards that player owns in exile and you gain that much life.",
            cost: Cost.RemoveCounters(.Loyalty, 5),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { target in
                    let amount = target.getCardsInExile().count
                    kaya.damage(to: target, amount)
                    kaya.getController().gainLife(amount)
            }),
            manaAbility: false,
            sorcerySpeed: false,
            loyaltyAbility: false)
        kaya.startingLoyalty = 3
        return kaya
    }
    static func KayasWrath() -> Card {
        let kayasWrath = Card(name: "Kaya's Wrath", rarity: .Rare, set: set, number: 187)
        kayasWrath.setManaCost("WWBBB")
        kayasWrath.setType(.Sorcery)
        kayasWrath.addEffect({
            kayasWrath.eachOpponent({ opponent in
                opponent.getCreatures().forEach({ _ = $0.destroy() })
            })
            var creaturesYouControlledDestroyed = 0
            kayasWrath.getController().getCreatures().forEach({ creature in
                if creature.destroy() {
                    creaturesYouControlledDestroyed += 1
                }
            })
            kayasWrath.getController().gainLife(creaturesYouControlledDestroyed)
        })
        kayasWrath.setFlavorText("Teysa convened the meeting of the Obzedat. Kaya ended it.")
        return kayasWrath
    }
    // 188 Knight of the Last Breath
    // 189 Lavinia, Azorius Renegade
    static func LawmagesBinding() -> Card {
        let lawmagesBinding = Card(name: "Lawmage's Binding", rarity: .Common, set: set, number: 190)
        lawmagesBinding.setManaCost("1WU")
        lawmagesBinding.setType(.Enchantment, .Aura)
        lawmagesBinding.flash = true
        lawmagesBinding.addEnchantAbility(
            restriction: .TargetCreature(),
            effect: { object in
                object.cantAttack = true
                object.cantBlock = true
                object.cantActivateAbilities = true
                return object
        })
        return lawmagesBinding
    }
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
    static func RakdosRoustabout() -> Card {
        let rakdosRoustabout = Card(name: "Rakdos Roustabout", rarity: .Common, set: set, number: 198)
        rakdosRoustabout.setManaCost("1BR")
        rakdosRoustabout.setType(.Creature, .Ogre, .Warrior)
        rakdosRoustabout.addTriggeredAbility(
            trigger: .ThisBecomesBlocked,
            effect: { rakdosRoustabout.damage(to: rakdosRoustabout.getAttackTarget()!, 1) })
        rakdosRoustabout.setFlavorText("\"That one has a bright future--perfect instincts for the rhythm of mayhem.\"\n--Judith")
        rakdosRoustabout.power = 3
        rakdosRoustabout.toughness = 2
        return rakdosRoustabout
    }
    static func RakdosTheShowstopper() -> Card {
        let rakdosTheShowstopper = Card(name: "Rakdos, the Showstopper", rarity: .Mythic, set: set, number: 199)
        rakdosTheShowstopper.setManaCost("4BR")
        rakdosTheShowstopper.setType(.Legendary, .Creature, .Demon)
        rakdosTheShowstopper.flying = true
        rakdosTheShowstopper.trample = true
        rakdosTheShowstopper.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                Game.shared.bothPlayers({ player in
                    player.getCreatures().forEach({ creature in
                        if !(creature.isType(.Demon) || creature.isType(.Devil) || creature.isType(.Imp)) {
                            if Coin.flip().tails {
                                _ = creature.destroy()
                            }
                        }
                    })
                })
        })
        rakdosTheShowstopper.setFlavorText("\"Entertain me.\"")
        rakdosTheShowstopper.power = 6
        rakdosTheShowstopper.toughness = 6
        return rakdosTheShowstopper
    }
    // 200 Ravager Wurm
    // 201 Rhythm of the Wild
    static func RubblebeltRunner() -> Card {
        let rubblebeltRunner = Card(name: "Rubblebelt Runner", rarity: .Common, set: set, number: 202)
        rubblebeltRunner.setManaCost("1RG")
        rubblebeltRunner.setType(.Creature, .Viashino, .Warrior)
        rubblebeltRunner.blockabilityRequirements.append({ object in
            return !(object.isType(.Creature) && object.isToken())
        })
        rubblebeltRunner.setFlavorText("The sly, stealthy warriors of the Slizt Clan survive by hiding in high ground and ambushing their enemies. Other Gruul call them skulkers and cowards, but only from a safe distance.")
        rubblebeltRunner.power = 3
        rubblebeltRunner.toughness = 3
        return rubblebeltRunner
    }
    static func SavageSmash() -> Card {
        let savageSmash = Card(name: "Savage Smash", rarity: .Common, set: set, number: 203)
        savageSmash.setManaCost("1RG")
        savageSmash.setType(.Sorcery)
        savageSmash.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === savageSmash.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== savageSmash.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                if let myCreature = targets[0] {
                    myCreature.pump(2, 2)
                    if let theirCreature = targets[1] {
                        myCreature.fight(theirCreature)
                    }
                }
        }))
        savageSmash.setFlavorText("A Gruul berserker is never unarmed.")
        return savageSmash
    }
    static func SenateGuildmage() -> Card {
        let senateGuildmage = Card(name: "Senate Guildmage", rarity: .Uncommon, set: set, number: 204)
        senateGuildmage.setManaCost("WU")
        senateGuildmage.setType(.Creature, .Human, .Wizard)
        senateGuildmage.addActivatedAbility(
            string: "{W}, {T}: You gain 2 life.",
            cost: Cost.Mana("W").Tap(),
            effect: { senateGuildmage.getController().gainLife(2) })
        senateGuildmage.addActivatedAbility(
            string: "{U}, {T}: Draw a card, then discard a card.",
            cost: Cost.Mana("U").Tap(),
            effect: {
                senateGuildmage.getController().drawCard()
                senateGuildmage.getController().discard()
        })
        senateGuildmage.power = 2
        senateGuildmage.toughness = 2
        return senateGuildmage
    }
    static func SeraphOfTheScales() -> Card {
        let seraphOfTheScales = Card(name: "Seraph of the Scales", rarity: .Mythic, set: set, number: 205)
        seraphOfTheScales.setManaCost("2WB")
        seraphOfTheScales.setType(.Creature, .Angel)
        seraphOfTheScales.flying = true
        seraphOfTheScales.addActivatedAbility(
            string: "{W}: ~ gains vigilance until end of turn.",
            cost: Cost.Mana("W"),
            effect: { seraphOfTheScales.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.vigilance = true; return $0 }) )})
        seraphOfTheScales.addActivatedAbility(
            string: "{B}: ~ gains deathtouch until end of turn.",
            cost: Cost.Mana("B"),
            effect: { seraphOfTheScales.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0 }) )})
        seraphOfTheScales.afterlife(2)
        seraphOfTheScales.power = 4
        seraphOfTheScales.toughness = 3
        return seraphOfTheScales
    }
    static func Sharktocrab() -> Card {
        let sharktocrab = Card(name: "Sharktocrab", rarity: .Uncommon, set: set, number: 206)
        sharktocrab.setManaCost("2GU")
        sharktocrab.setType(.Creature, .Fish, .Octopus, .Crab)
        sharktocrab.adapt(1, Cost.Mana("2GU"))
        sharktocrab.addTriggeredAbility(
            trigger: .ThisGetsPlusOnePlusOneCounter,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== sharktocrab.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    target.tap()
                    target.untapsDuringNextUntapStep = false
            }))
        sharktocrab.power = 4
        sharktocrab.toughness = 4
        return sharktocrab
    }
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
    static func SyndicateGuildmage() -> Card {
        let syndicateGuildmage = Card(name: "Syndicate Guildmage", rarity: .Uncommon, set: set, number: 211)
        syndicateGuildmage.setManaCost("WB")
        syndicateGuildmage.setType(.Creature, .Human, .Cleric)
        syndicateGuildmage.addActivatedAbility(
            string: "{1}{W}, {T}: Tap target creature with power 4 or greater.",
            cost: Cost.Mana("1W").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getPower() >= 4 },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        syndicateGuildmage.addActivatedAbility(
            string: "{4}{B}, {T}: ~ deals 2 damage to target opponent or planeswalker.",
            cost: Cost.Mana("4B").Tap(),
            effect: TargetedEffect(
                restriction: TargetingRestriction(
                    restriction: { targetable in
                        if let playerTarget = targetable as? Player {
                            return playerTarget !== syndicateGuildmage.getController()
                        }
                        if let objectTarget = targetable as? Object {
                            return objectTarget.isType(.Planeswalker)
                        }
                        return false
                    },
                    zones: [.Battlefield]),
                effect: { syndicateGuildmage.damage(to: $0, 2) }))
        syndicateGuildmage.power = 2
        syndicateGuildmage.toughness = 2
        return syndicateGuildmage
    }
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
    static func FootlightFiend() -> Card {
        let footlightFiend = Card(name: "Footlight Fiend", rarity: .Common, set: set, number: 216)
        footlightFiend.setManaCost("{B/R}")
        footlightFiend.setType(.Creature, .Devil)
        footlightFiend.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { footlightFiend.damage(to: $0, 1) }))
        footlightFiend.setFlavorText("\"This footlight's broken. Get me a stagehand!\"\n--Judith")
        footlightFiend.power = 1
        footlightFiend.toughness = 1
        return footlightFiend
    }
    static func RubbleSlinger() -> Card {
        let rubbleSlinger = Card(name: "Rubble Slinger", rarity: .Common, set: set, number: 217)
        rubbleSlinger.setManaCost("2{R/G}")
        rubbleSlinger.setType(.Creature, .Human, .Warrior)
        rubbleSlinger.reach = true
        rubbleSlinger.setFlavorText("\"Tear down the city, lie by lie. Then throw it back at the liars, stone by stone.\"\n--Domri Rade")
        rubbleSlinger.power = 2
        rubbleSlinger.toughness = 3
        return rubbleSlinger
    }
    static func Scuttlegator() -> Card {
        let scuttlegator = Card(name: "Scuttlegator", rarity: .Common, set: set, number: 218)
        scuttlegator.setManaCost("4{G/U}{G/U}")
        scuttlegator.setType(.Creature, .Crab, .Turtle, .Crocodile)
        scuttlegator.defender = true
        scuttlegator.adapt(3, Cost.Mana("6{G/U}{G/U}"))
        scuttlegator.addStaticAbility({ object in
            if object == scuttlegator && object.hasCounter(.PlusOnePlusOne) {
                object.canAttackWithDefender = true
            }
            return object
        })
        scuttlegator.power = 6
        scuttlegator.toughness = 6
        return scuttlegator
    }
    // 219 Senate Griffin
    static func VizkopaVampire() -> Card {
        let vizkopaVampire = Card(name: "Vizkopa Vampire", rarity: .Common, set: set, number: 220)
        vizkopaVampire.setManaCost("2{W/B}")
        vizkopaVampire.setType(.Creature, .Vampire)
        vizkopaVampire.lifelink = true
        vizkopaVampire.setFlavorText("Orzhov vampires look for allies in unlikely places in case their new guildmaster turns on them. The fate of the Obzedat is proof of Kaya's power and her hatred of the living dead.")
        vizkopaVampire.power = 3
        vizkopaVampire.toughness = 1
        return vizkopaVampire
    }
    // 221 Bedeck // Bedazzle
    // 222 Carnival // Carnage
    // 223 Collision // Colossus
    // 224 Consecrate // Consume
    // 225 Depose // Deploy
    // 226 Incubation // Incongruity
    // 227 Repudiate // Replicate
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
            string: "{W/U}{W/U}{W/U}{W/U}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{W/U}{W/U}{W/U}{W/U}").Tap().Sacrifice(),
            effect: { azoriusLocket.getController().drawCards(2) })
        azoriusLocket.setFlavorText("\"Mandatory lockets enable the tracking of all Senate personnel for improved security and efficiency.\"\n--Dovin Baan")
        return azoriusLocket
    }
    // 232 Gate Colossus
    static func GlassOfTheGuildpact() -> Card {
        let glassOfTheGuildpact = Card(name: "Glass of the Guildpact", rarity: .Rare, set: set, number: 233)
        glassOfTheGuildpact.setManaCost("2")
        glassOfTheGuildpact.setType(.Artifact)
        glassOfTheGuildpact.addStaticAbility({ object in
            if object.isMulticolored() && object.isType(.Creature) && object.getController() === glassOfTheGuildpact.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        glassOfTheGuildpact.setFlavorText("\"Counterbalanced forces sustain this city. No faction above others. A beautiful idea.\"\n--Emmara")
        return glassOfTheGuildpact
    }
    static func GruulLocket() -> Card {
        let gruulLocket = Card(name: "Gruul Locket", rarity: .Uncommon, set: set, number: 234)
        gruulLocket.setManaCost("3")
        gruulLocket.setType(.Artifact)
        gruulLocket.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { gruulLocket.getController().addMana(color: .Red) },
            manaAbility: true)
        gruulLocket.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { gruulLocket.getController().addMana(color: .Green) },
            manaAbility: true)
        gruulLocket.addActivatedAbility(
            string: "{R/G}{R/G}{R/G}{R/G}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{R/G}{R/G}{R/G}{R/G}").Tap().Sacrifice(),
            effect: { gruulLocket.getController().drawCards(2) })
        gruulLocket.setFlavorText("\"In life, it was a cunning survivor, fearless and quick. May its power pass to you as you wear its skull.\"\n--Gna, Gruul shaman")
        return gruulLocket
    }
    static func Junktroller() -> Card {
        let junktroller = Card(name: "Junktroller", rarity: .Uncommon, set: set, number: 235)
        junktroller.setManaCost("4")
        junktroller.setType(.Artifact, .Creature, .Golem)
        junktroller.defender = true
        junktroller.addActivatedAbility(
            string: "{T}: Put target card from a graveyard on the bottom of its owner's library.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { _ in return true },
                    zones: [.Graveyard]),
                effect: { $0.putOnBottomOfLibrary()} ))
        junktroller.setFlavorText("\"Hey, wait! That's my boot!\"\n--Darijo, Ivy Street ruffian")
        junktroller.power = 0
        junktroller.toughness = 6
        return junktroller
    }
    static func OrzhovLocket() -> Card {
        let orzhovLocket = Card(name: "Orzhov Locket", rarity: .Uncommon, set: set, number: 236)
        orzhovLocket.setManaCost("3")
        orzhovLocket.setType(.Artifact)
        orzhovLocket.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { orzhovLocket.getController().addMana(color: .White) },
            manaAbility: true)
        orzhovLocket.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { orzhovLocket.getController().addMana(color: .Black) },
            manaAbility: true)
        orzhovLocket.addActivatedAbility(
            string: "{W/B}{W/B}{W/B}{W/B}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{W/B}{W/B}{W/B}{W/B}").Tap().Sacrifice(),
            effect: { orzhovLocket.getController().drawCards(2) })
        orzhovLocket.setFlavorText("\"It looks expensive, doesn't it? You have no idea...\"\n--Milana, Orzhov prelate")
        return orzhovLocket
    }
    static func RakdosLocket() -> Card {
        let rakdosLocket = Card(name: "Rakdos Locket", rarity: .Uncommon, set: set, number: 237)
        rakdosLocket.setManaCost("3")
        rakdosLocket.setType(.Artifact)
        rakdosLocket.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { rakdosLocket.getController().addMana(color: .Black) },
            manaAbility: true)
        rakdosLocket.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { rakdosLocket.getController().addMana(color: .Red) },
            manaAbility: true)
        rakdosLocket.addActivatedAbility(
            string: "{B/R}{B/R}{B/R}{B/R}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{B/R}{B/R}{B/R}{B/R}").Tap().Sacrifice(),
            effect: { rakdosLocket.getController().drawCards(2) })
        rakdosLocket.setFlavorText("\"This trinket will gain you admittance to some painfully exclusive gatherings.\"\n--Exava, blood witch")
        return rakdosLocket
    }
    // 238 Scrabbling Claws
    // 239 Screaming Shield
    static func SimicLocket() -> Card {
        let simicLocket = Card(name: "Simic Locket", rarity: .Uncommon, set: set, number: 240)
        simicLocket.setManaCost("3")
        simicLocket.setType(.Artifact)
        simicLocket.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { simicLocket.getController().addMana(color: .Green) },
            manaAbility: true)
        simicLocket.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { simicLocket.getController().addMana(color: .Blue) },
            manaAbility: true)
        simicLocket.addActivatedAbility(
            string: "{G/U}{G/U}{G/U}{G/U}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{G/U}{G/U}{G/U}{G/U}").Tap().Sacrifice(),
            effect: { simicLocket.getController().drawCards(2) })
        simicLocket.setFlavorText("\"Like our guild itself, this locket can stand for many things. You must discern what it means for yourself.\"\n--Vannifar")
        return simicLocket
    }
    // 241 Sphinx of the Guildpact
    static func TomeOfTheGuildpact() -> Card {
        let tomeOfTheGuildpact = Card(name: "Tome of the Guildpact", rarity: .Rare, set: set, number: 242)
        tomeOfTheGuildpact.setManaCost("5")
        tomeOfTheGuildpact.setType(.Artifact)
        tomeOfTheGuildpact.addTriggeredAbility(
            trigger: .YouCastMulticoloredSpell,
            effect: { tomeOfTheGuildpact.getController().drawCard() })
        tomeOfTheGuildpact.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { tomeOfTheGuildpact.getController().addMana(color: .White) },
            manaAbility: true)
        tomeOfTheGuildpact.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { tomeOfTheGuildpact.getController().addMana(color: .Blue) },
            manaAbility: true)
        tomeOfTheGuildpact.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { tomeOfTheGuildpact.getController().addMana(color: .Black) },
            manaAbility: true)
        tomeOfTheGuildpact.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { tomeOfTheGuildpact.getController().addMana(color: .Red) },
            manaAbility: true)
        tomeOfTheGuildpact.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { tomeOfTheGuildpact.getController().addMana(color: .Green) },
            manaAbility: true)
        tomeOfTheGuildpact.setFlavorText("\"Reading it has given me a glimpse of what makes this deeply flawed city so very magnificent.\"\n--Dovin Baan")
        return tomeOfTheGuildpact
    }
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
    // 247 Gateway Plaza
    // 248 Godless Shrine
    static func GruulGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? GruulGuildgate249() : GruulGuildgate250()
    }
    static func GruulGuildgate249() -> Card {
        let gruulGuildgate = Card(name: "Gruul Guildgate", rarity: .Common, set: set, number: 249)
        gruulGuildgate.setManaCost("")
        gruulGuildgate.setType(.Land, .Gate)
        gruulGuildgate.entersTapped = true
        gruulGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { gruulGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        gruulGuildgate.addActivatedAbility(
            string: "{T}: Add {UG.",
            cost: Cost.Tap(),
            effect: { gruulGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        gruulGuildgate.setFlavorText("\"Beyond this gate there are no citizens, only predators and prey.\"\n--Domri Rade")
        return gruulGuildgate
    }
    static func GruulGuildgate250() -> Card {
        let gruulGuildgate = Card(name: "Gruul Guildgate", rarity: .Common, set: set, number: 250)
        gruulGuildgate.setManaCost("")
        gruulGuildgate.setType(.Land, .Gate)
        gruulGuildgate.entersTapped = true
        gruulGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { gruulGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        gruulGuildgate.addActivatedAbility(
            string: "{T}: Add {UG.",
            cost: Cost.Tap(),
            effect: { gruulGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        gruulGuildgate.setFlavorText("\"Old turf. Powerful turf. Much good blood spilled here.\"\n--Ruric Thar")
        return gruulGuildgate
    }
    // 251 Hallowed Fountain
    static func OrzhovGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? OrzhovGuildgate252() : OrzhovGuildgate253()
    }
    static func OrzhovGuildgate252() -> Card {
        let orzhovGuildgate = Card(name: "Orzhov Guildgate", rarity: .Common, set: set, number: 252)
        orzhovGuildgate.setManaCost("")
        orzhovGuildgate.setType(.Land, .Gate)
        orzhovGuildgate.entersTapped = true
        orzhovGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { orzhovGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        orzhovGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { orzhovGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        orzhovGuildgate.setFlavorText("\"So much wealth. So much splendor. So much temptation to believe the gilded lie.\"\n--Kaya")
        return orzhovGuildgate
    }
    static func OrzhovGuildgate253() -> Card {
        let orzhovGuildgate = Card(name: "Orzhov Guildgate", rarity: .Common, set: set, number: 253)
        orzhovGuildgate.setManaCost("")
        orzhovGuildgate.setType(.Land, .Gate)
        orzhovGuildgate.entersTapped = true
        orzhovGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { orzhovGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        orzhovGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { orzhovGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        orzhovGuildgate.setFlavorText("\"If you think the cathedral is impressive, you should see what's down below.\"\n--Teysa")
        return orzhovGuildgate
    }
    // 254 Plaza of Harmony
    static func RakdosGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? RakdosGuildgate255() : RakdosGuildgate256()
    }
    static func RakdosGuildgate255() -> Card {
        let rakdosGuildgate = Card(name: "Rakdos Guildgate", rarity: .Common, set: set, number: 255)
        rakdosGuildgate.setManaCost("")
        rakdosGuildgate.setType(.Land, .Gate)
        rakdosGuildgate.entersTapped = true
        rakdosGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { rakdosGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        rakdosGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { rakdosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        rakdosGuildgate.setFlavorText("\"My servants take pains for your pleasure, and take pleasure in your pain.\"\n--Rakdos")
        return rakdosGuildgate
    }
    static func RakdosGuildgate256() -> Card {
        let rakdosGuildgate = Card(name: "Rakdos Guildgate", rarity: .Common, set: set, number: 256)
        rakdosGuildgate.setManaCost("")
        rakdosGuildgate.setType(.Land, .Gate)
        rakdosGuildgate.entersTapped = true
        rakdosGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { rakdosGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        rakdosGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { rakdosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        rakdosGuildgate.setFlavorText("\"Slip in the back if you don't want to be recognized. Don't worry--we'll make sure you're never found.\"\n--Judith")
        return rakdosGuildgate
    }
    static func SimicGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? SimicGuildgate257() : SimicGuildgate258()
    }
    static func SimicGuildgate257() -> Card {
        let simicGuildgate = Card(name: "Simic Guildgate", rarity: .Common, set: set, number: 257)
        simicGuildgate.setManaCost("")
        simicGuildgate.setType(.Land, .Gate)
        simicGuildgate.entersTapped = true
        simicGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { simicGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        simicGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { simicGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        simicGuildgate.setFlavorText("\"Mystery is beauty. Within the unknown we plumb revelation.\"\n--Vannifar")
        return simicGuildgate
    }
    static func SimicGuildgate258() -> Card {
        let simicGuildgate = Card(name: "Simic Guildgate", rarity: .Common, set: set, number: 258)
        simicGuildgate.setManaCost("")
        simicGuildgate.setType(.Land, .Gate)
        simicGuildgate.entersTapped = true
        simicGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { simicGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        simicGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { simicGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        simicGuildgate.setFlavorText("\"When the Prime Speaker goes too far, I will be here in the safety of the deeps to correct her.\"\n--Vannifar")
        return simicGuildgate
    }
    // 259 Stomping Ground
    // Basics
    
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
    static func Goblin() -> Token {
        let goblin = Token(name: "Goblin", set: set, number: 4)
        goblin.colors = [.Red]
        goblin.setType(.Creature, .Goblin)
        goblin.power = 1
        goblin.toughness = 1
        return goblin
    }
    static func Centaur() -> Token {
        let centaur = Token(name: "Centaur", set: set, number: 5)
        centaur.colors = [.Green]
        centaur.setType(.Creature, .Centaur)
        centaur.power = 3
        centaur.toughness = 3
        return centaur
    }
    // T6 Frog Lizard
    static func Ooze() -> Token {
        let ooze = Token(name: "Ooze", set: set, number: 7)
        ooze.colors = [.Green]
        ooze.setType(.Creature, .Ooze)
        ooze.power = 2
        ooze.toughness = 2
        return ooze
    }
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
