import Foundation

extension Player {
    func devotion(_ color: Color) -> Int {
        return getPermanents().reduce(0, { result, object in result + object.pips(color) })
    }
}

extension Object {
    func pips(_ color: Color) -> Int {
        if let manaCost = manaCost {
            return manaCost.pips(color: color)
        }
        return 0
    }
}

enum THB {
    static var set = "thb"
    static var count = 254
    
    static let cards = [
//        AlseidOfLifesBounty,
//        ArchonOfFallingStars,
        ArchonOfSunsGrace,
//        BanishingLight,
        TheBirthOfMeletis,
        CaptivatingUnicorn,
//        CommandingPresence,
//        DawnEvangel,
        DaxosBlessedByTheSun,
        DaybreakChimera,
        DreadfulApathy,
//        EidolonOfObstruction,
//        ElspethConquersDeath,
//        ElspethSunsNemesis,
        FavoredOfIroas,
//        FlickerOfFate,
//        GloryBearers,
        HeliodSunCrowned,
//        HeliodsIntervention,
        HeliodsPilgrim,
//        HeliodsPunishment,
//        HeroOfThePride,
//        HeroOfTheWinds,
        IdyllicTutor,
        IndomitableWill,
        KarametrasBlessing,
        LagonnaBandStoryteller,
        LeoninOfTheLostPride,
        NyxbornCourser,
//        OmenOfTheSun,
        PhalanxTactics,
        PiousWayfarer,
        ReverentHoplite,
        RevokeExistence,
//        RumblingSentry,
//        SetinelsEyes,
        ShatterTheSky,
        SunmanePegasus,
        TaranikaAkroanVeteran,
        TranscendentEnvoy,
        TriumphantSurge,
        AliriosEnraptured,
//        AshioksErasure,
        BrineGiant,
//        CallapheBelovedOfTheSea,
//        ChainToMemory,
//        DenyTheDevine,
        EidolonOfPhilosophy,
        EliteInstructor,
//        GlimpseOfFreedom,
//        Ichthyomorphosis,
//        KioraBestsTheSeaGod,
//        MedomaisProphecy,
//        MemoryDrain,
//        NadirKraken,
        NaiadOfHiddenCoves,
        NyxbornSeaguard,
//        OmenOfTheSea,
        OneWithTheStars,
//        ProteanThaumaturge,
        RiptideTurtle,
        SageOfMysteries,
        SeaGodsScorn,
        ShimmerwingChimera,
        ShoalKraken,
//        SleepOfTheDead,
        StarlitMantle,
        SternDismissal,
//        StingingLionfish,
//        SweetOblivion,
//        ThassaDeepDwelling,
//        ThassasIntervention,
//        ThassasOracle,
//        ThirstForMeaning,
        ThrenodySinger,
        ThryxTheSuddenStorm,
//        ToweringWaveMystic,
        TritonWaverider,
        VexingGull,
        WavebreakHippocamp,
//        WhirlwindDenial,
//        WitnessOfTomorrow,
//        AgonizingRemorse,
//        AphemiaTheCacophony,
        AspectOfLamprey,
        BlightBreathCatoblepas,
//        ClingToDust,
        DiscordantPiper,
        DragToTheUnderworld,
//        EatToExtinction,
        ElspethsNightmare,
        EnemyOfEnlightenment,
//        ErebosBlackHearted,
//        ErebossIntervention,
        FinalDeath,
//        FruitOfTizerus,
        FuneralRites,
//        GravebreakerLamia,
//        GrayMerchantOfAsphodel,
        GrimPhysician,
//        HatefulEidolon,
//        InevitableEnd,
//        LampadOfDeathsVigil,
//        MinionsReturn,
        MireTriton,
        MiresGrasp,
//        MogissFavor,
//        NightmareShepherd,
        NyxbornMarauder,
//        OmenOfTheDead,
//        PharikasLibation,
//        PharikasSpawn,
        RageScarredBerserker,
        ScavengingHarpy,
//        SoulreaperOfMogis,
        TempleThief,
        TreacherousBlessing,
//        TymaretCallsTheDead,
//        TymaretChosenFromDeath,
//        UnderworldCharger,
//        UnderworldDreams,
        VenomousHierophant,
//        WoeStrider,
//        TheAkroanWar,
//        AnaxHardenedInTheForge,
//        ArenaTrickster,
//        AspectOfManticore,
//        BloodAspirant,
//        CarelessCelebrant,
//        DreamshaperShaman,
//        DreamstalkerManticore,
//        EscapeVelocity,
//        FatefulEnd,
//        FinalFlare,
//        FlummoxedCyclops,
//        FuriousRise,
//        HeroOfTheGames,
//        HeroesOfTheRevel,
//        ImpendingDoom,
//        IncendiaryOracle,
//        Infuriate,
//        IroassBlessing,
//        IrreverentRevelers,
//        NyxbornBrute,
//        OmenOfTheForge,
//        OreadOfMountainsBlaze,
//        OxOfAgonas,
//        PhoenixOfAsh,
//        PortentOfBetrayal,
//        PurphorosBronzeBlooded,
//        PurphorossIntervention,
//        SatyrsCunning,
//        SkophosMazeWarden,
//        SkophosWarleader,
//        StampedeRider,
//        StormHerald,
//        StormsWrath,
//        TectonicGiant,
//        ThrillOfPossibility,
//        TheTriumphOfAnax,
//        UnderworldBreach,
//        UnderworldFires,
//        UnderworldRageHound,
//        WrapInFlames,
    ]

    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    static private func Saga(_ object: Object) {
        object.addReplacementEffect(
            event: .ThisETB,
            effect: { object.addCounter(.Lore) })
        object.addReplacementEffect(
            event: .YourFirstMain,
            effect: { object.addCounter(.Lore) })
    }
        
    // 1 Alseid of Life's Bounty
    // 2 Archon of Falling Stars
    static func ArchonOfSunsGrace() -> Card {
        let archonOfSunsGrace = Card(name: "Archon of Sun's Grace", rarity: Rarity.Rare, set: set, number: 3)
        archonOfSunsGrace.setManaCost("2WW")
        archonOfSunsGrace.setType(.Creature, .Archon)
        archonOfSunsGrace.flying = true;
        archonOfSunsGrace.lifelink = true;
        archonOfSunsGrace.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: archonOfSunsGrace, subtype: .Pegasus),
            effect: { $0.withKeyword(.Lifelink) },
            layer: .AbilityAddingOrRemoving)
        archonOfSunsGrace.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: { archonOfSunsGrace.getController().createToken(Pegasus()) })
        archonOfSunsGrace.power = 3
        archonOfSunsGrace.toughness = 4
        return archonOfSunsGrace
    }
    // 4 Banishing Light
    static func TheBirthOfMeletis() -> Card {
        let theBirthOfMeletis = Card(name: "The Birth of Meletis", rarity: .Uncommon, set: set, number: 5)
        theBirthOfMeletis.setManaCost("1W")
        theBirthOfMeletis.setType(.Enchantment, .Saga)
        Saga(theBirthOfMeletis)
        theBirthOfMeletis.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: {
                let loreCounters = theBirthOfMeletis.getCounters(.Lore)
                if loreCounters == 1 {
                    theBirthOfMeletis.getController().chooseCard(
                        from: theBirthOfMeletis.getController().getLibrary(),
                        restriction: { $0.isType(.Basic) && $0.isType(.Plains) },
                        action: { chosen, rest in
                            chosen?.reveal()
                            chosen?.putIntoHand()
                            theBirthOfMeletis.getController().shuffleLibrary()
                    })
                }
                else if loreCounters == 2 {
                    theBirthOfMeletis.getController().createToken(Wall())
                }
                else if loreCounters == 3 {
                    theBirthOfMeletis.getController().gainLife(2)
                }

                if loreCounters >= 3 {
                    theBirthOfMeletis.sacrifice()
                }
        })
        return theBirthOfMeletis
    }
    static func CaptivatingUnicorn() -> Card {
        let captivatingUnicorn = Card(name: "Captivating Unicorn", rarity: .Common, set: set, number: 6)
        captivatingUnicorn.setManaCost("4W")
        captivatingUnicorn.setType(.Creature, .Unicorn)
        captivatingUnicorn.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureAnOpponentControl(source: captivatingUnicorn),
                effect: { $0.tap() }))
        captivatingUnicorn.setFlavorText("\"Gazing at the unicorn, I felt closer to the majesty of Nyx than I ever had before.\"\n--Oineus, traveling merchant")
        captivatingUnicorn.power = 4
        captivatingUnicorn.toughness = 4
        return captivatingUnicorn
    }
    // 7 CommandingPresence
    // 8 Dawn Evangel
    static func DaxosBlessedByTheSun() -> Card {
        let daxos = Card(name: "Daxos, Blessed by the Sun", rarity: .Uncommon, set: set, number: 9)
        daxos.setManaCost("WW")
        daxos.setType(.Legendary, .Enchantment, .Creature, .Demigod)
        daxos.addStaticAbility(
            requirement: AbilityRequirement.This(daxos),
            effect: { object in
                object.toughness = object.getController().devotion(.White)
                return object
            },
            layer: .PowerToughnessCDA,
            allZones: true)
        let effect = {
            daxos.getController().gainLife(1)
        }
        daxos.addTriggeredAbility(trigger: .AnotherCreatureEntersBattlefieldUnderYourControl, effect: effect)
        daxos.addTriggeredAbility(trigger: .AnotherCreatureYouControlDies, effect: effect)
        daxos.power = 2
        return daxos
    }
    static func DaybreakChimera() -> Card {
        let daybreakChimera = Card(name: "Daybreak Chimera", rarity: .Common, set: set, number: 10)
        daybreakChimera.setManaCost("3WW")
        daybreakChimera.setType(.Creature, .Chimera)
        daybreakChimera.addStaticAbility(
            requirement: AbilityRequirement.This(daybreakChimera),
            effect: { object in
                let amount = object.getController().devotion(.White)
                object.castingCost = object.getBaseCastingCost().reducedBy(amount)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        daybreakChimera.flying = true
        daybreakChimera.power = 3
        daybreakChimera.toughness = 3
        return daybreakChimera
    }
    static func DreadfulApathy() -> Card {
        let dreadfulApathy = Card(name: "Dreadful Apathy", rarity: .Common, set: set, number: 11)
        dreadfulApathy.setManaCost("2W")
        dreadfulApathy.setType(.Enchantment, .Aura)
        dreadfulApathy.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.withKeyword(.CantAttack).withKeyword(.CantBlock) },
            layer: .AbilityAddingOrRemoving)
        dreadfulApathy.addActivatedAbility(
            string: "{2}{W}: Exile enchanted creature.",
            cost: Cost.Mana("2W"),
            effect: { dreadfulApathy.attachedTo?.exile() })
        dreadfulApathy.setFlavorText("Those whose lives were uninspired are doomed to the wretched tedium of Phylias in death.")
        return dreadfulApathy
    }
    // 12 Eidolon of Obstruction
    // 13 Elspeth Conquers Death
    // 14 Elspeth, Sun's Nemesis
    static func FavoredOfIroas() -> Card {
        let favoredOfIroas = Card(name: "Favored of Iroas", rarity: .Uncommon, set: set, number: 15)
        favoredOfIroas.setManaCost("2W")
        favoredOfIroas.setType(.Creature, .Human, .Soldier)
        favoredOfIroas.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: { favoredOfIroas.giveKeywordUntilEndOfTurn(.DoubleStrike) })
        favoredOfIroas.setFlavorText("\"The promise of victory fills my heart. There is no room for fear.\"")
        favoredOfIroas.power = 2
        favoredOfIroas.toughness = 2
        return favoredOfIroas
    }
    // 16 Flicker of Fate
    // 17 Glory Bearers
    static func HeliodSunCrowned() -> Card {
        let heliod = Card(name: "Heliod, Sun-Crowned", rarity: .Mythic, set: set, number: 18)
        heliod.setManaCost("2W")
        heliod.setType(.Legendary, .Enchantment, .Creature, .God)
        heliod.indestructible = true
        heliod.addStaticAbility(
            requirement: AbilityRequirement.This(heliod),
            effect: { object in
                if object.getController().devotion(.White) < 5 {
                    return object.withoutType(.Creature)
                }
                return object
            },
            layer: .TypeChanging)
        heliod.addTriggeredAbility(
            trigger: .YouGainLife,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getController() === heliod.getController() && ($0.isType(.Creature) || $0.isType(.Enchantment)) },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        heliod.addActivatedAbility(
            string: "{1}{W}: Another target creature gains lifelink until end of turn.",
            cost: Cost.Mana("1W"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.AnotherTargetCreature(source: heliod),
                effect: { $0.giveKeywordUntilEndOfTurn(.Lifelink) }))
        heliod.power = 5
        heliod.toughness = 5
        return heliod
    }
    // 19 Heliod's Intervention
    static func HeliodsPilgrim() -> Card {
        let heliodsPilgrim = Card(name: "Heliod's Pilgrim", rarity: .Common, set: set, number: 20)
        heliodsPilgrim.setManaCost("2W")
        heliodsPilgrim.setType(.Creature, .Human, .Cleric)
        heliodsPilgrim.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                heliodsPilgrim.getController().chooseCard(
                    from: heliodsPilgrim.getController().getLibrary(),
                    restriction: { $0.isType(.Aura) },
                    action: { chosen, rest in
                        chosen?.reveal()
                        chosen?.putIntoHand()
                        heliodsPilgrim.getController().shuffleLibrary()
                })
            })
        heliodsPilgrim.power = 1
        heliodsPilgrim.toughness = 2
        return heliodsPilgrim
    }
    // 21 Heliod's Punishment
    // 22 Hero of the Pride
    // 23 Hero of the Winds
    static func IdyllicTutor() -> Card {
        let idyllicTutor = Card(name: "Idyllic Tutor", rarity: .Rare, set: set, number:  24)
        idyllicTutor.setManaCost("2W")
        idyllicTutor.setType(.Sorcery)
        idyllicTutor.addEffect({
            idyllicTutor.getController().chooseCard(
                from: idyllicTutor.getController().getLibrary(),
                restriction: { $0.isType(.Enchantment) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    idyllicTutor.getController().shuffleLibrary()
            })
        })
        idyllicTutor.setFlavorText("\"You are loved, child.\"")
        return idyllicTutor
    }
    static func IndomitableWill() -> Card {
        let indomitableWill = Card(name: "Indomitable Will", rarity: .Common, set: set, number: 25)
        indomitableWill.setManaCost("1W")
        indomitableWill.setType(.Enchantment, .Aura)
        indomitableWill.flash = true
        indomitableWill.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pumped(1, 2) },
            layer: .PowerToughnessChanging)
        indomitableWill.setFlavorText("\"Charge bravely. Fight selflessly. Act honorably. Iroas will watch over you.\"\n--Verenis, priest of Iroas")
        return indomitableWill
    }
    static func KarametrasBlessing() -> Card {
        let karametrasBlessing = Card(name: "Karametra's Blessing", rarity: .Common, set: set, number: 26)
        karametrasBlessing.setManaCost("W")
        karametrasBlessing.setType(.Instant)
        karametrasBlessing.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.pump(2, 2)
                if object.isType(.Enchantment) || object.isEnchanted() {
                    object.giveKeywordUntilEndOfTurn(.Hexproof)
                    object.giveKeywordUntilEndOfTurn(.Indestructible)
                }
        }))
        return karametrasBlessing
    }
    static func LagonnaBandStoryteller() -> Card {
        let lagonnaBandStoryteller = Card(name: "Lagonna-Band Storyteller", rarity: .Uncommon, set: set, number: 27)
        lagonnaBandStoryteller.setManaCost("3W")
        lagonnaBandStoryteller.setType(.Creature, .Centaur, .Advisor)
        lagonnaBandStoryteller.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getOwner() === lagonnaBandStoryteller.getController() && $0.isType(.Enchantment) },
                    zones: [.Graveyard]),
                effect: { object in
                    object.putOnTopOfLibrary()
                    lagonnaBandStoryteller.getController().gainLife(object.getConvertedManaCost())
                },
                effectOptional: true))
        lagonnaBandStoryteller.setFlavorText("\"Our stories are full of ancient wisdom; they tell us who we are.\"")
        lagonnaBandStoryteller.power = 3
        lagonnaBandStoryteller.toughness = 4
        return lagonnaBandStoryteller
    }
    static func LeoninOfTheLostPride() -> Card {
        let leoninOfTheLostPride = Card(name: "Leonin of the Lost Pride", rarity: .Common, set: set, number: 28)
        leoninOfTheLostPride.setManaCost("1W")
        leoninOfTheLostPride.setType(.Creature, .Cat, .Warrior)
        leoninOfTheLostPride.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getOwner() !== leoninOfTheLostPride.getController()},
                    zones: [.Graveyard]),
                effect: { $0.exile() }))
        leoninOfTheLostPride.setFlavorText("Leonin band together in the Underworld, taking solace in their strength until, at last, both pride and self are forgotten.")
        leoninOfTheLostPride.power = 3
        leoninOfTheLostPride.toughness = 1
        return leoninOfTheLostPride
    }
    static func NyxbornCourser() -> Card {
        let nyxbornCourser = Card(name: "Nyxborn Courser", rarity: .Common, set: set, number: 29)
        nyxbornCourser.setManaCost("1WW")
        nyxbornCourser.setType(.Enchantment, .Creature, .Centaur, .Scout)
        nyxbornCourser.setFlavorText("\"Storms drove them westward to Ketaphos; wide plains shimmered in starlight. Centaurs greeted them, offering gold-hued apples and grain-cakes.\"\n--The Callapheia")
        nyxbornCourser.power = 2
        nyxbornCourser.toughness = 4
        return nyxbornCourser
    }
    // 30 Omen of the Sun
    static func PhalanxTactics() -> Card {
        let phalanxTactics = Card(name: "Phalanx Tactics", rarity: .Uncommon, set: set, number: 31)
        phalanxTactics.setManaCost("1W")
        phalanxTactics.setType(.Instant)
        phalanxTactics.addEffect(TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureYouControl(source: phalanxTactics),
                effect: { target in
                    target.pump(2, 1)
                    phalanxTactics.getController().getCreatures().filter({ $0 != target }).forEach({ $0.pump(1, 1) })
                }))
        phalanxTactics.setFlavorText("Every soldier has a place to stand and a role to play.")
        return phalanxTactics
    }
    static func PiousWayfarer() -> Card {
        let piousWayfarer = Card(name: "Pious Wayfarer", rarity: .Common, set: set, number: 32)
        piousWayfarer.setManaCost("W")
        piousWayfarer.setType(.Creature, .Human, .Scout)
        piousWayfarer.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.pump(1, 1) }))
        piousWayfarer.setFlavorText("Every footstep is a prayer, every road a temple.")
        piousWayfarer.power = 1
        piousWayfarer.toughness = 2
        return piousWayfarer
    }
    static func ReverentHoplite() -> Card {
        let reverentHoplite = Card(name: "Reverent Hoplite", rarity: .Uncommon, set: set, number: 33)
        reverentHoplite.setManaCost("4W")
        reverentHoplite.setType(.Creature, .Human, .Soldier)
        reverentHoplite.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                for _ in 0..<reverentHoplite.getController().devotion(.White) {
                    reverentHoplite.getController().createToken(HumanSoldier())
                }
            })
        reverentHoplite.setFlavorText("\"Zeal is the sharpest blade, and piety the strongest shield.\"")
        reverentHoplite.power = 1
        reverentHoplite.toughness = 2
        return reverentHoplite
    }
    static func RevokeExistence() -> Card {
        let revokeExistence = Card(name: "Revoke Existence", rarity: .Common, set: set, number: 34)
        revokeExistence.setManaCost("1W")
        revokeExistence.setType(.Sorcery)
        revokeExistence.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { $0.exile() }))
        revokeExistence.setFlavorText("\"The time has come for us to throw off the chains of tyrannical gods and antiquated superstitions.\"\n--Tikaia, disciple of Uremides")
        return revokeExistence
    }
    // 35 Rumbling Sentry
    // 36 Sentinel's Eyes
    static func ShatterTheSky() -> Card {
        let shatterTheSky = Card(name: "Shatter the Sky", rarity: .Rare, set: set, number: 37)
        shatterTheSky.setManaCost("2WW")
        shatterTheSky.setType(.Sorcery)
        shatterTheSky.addEffect({
            Game.shared.bothPlayers({ player in
                if player.getCreatures().filter({ $0.getPower() >= 4 }).count > 0 {
                    player.drawCard()
                }
            })
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ _ = $0.destroy() })
            })
        })
        shatterTheSky.setFlavorText("When the gods go to war, mortals pay the highest price.")
        return shatterTheSky
    }
    static func SunmanePegasus() -> Card {
        let sunmanePegasus = Card(name: "Sunmane Pegasus", rarity: .Common, set: set, number: 38)
        sunmanePegasus.setManaCost("3W")
        sunmanePegasus.setType(.Creature, .Pegasus)
        sunmanePegasus.flying = true
        sunmanePegasus.addActivatedAbility(
            string: "{1}{W}: ~ gains vigilance and lifelink until end of turn.",
            cost: Cost.Mana("1W"),
            effect: {
                sunmanePegasus.giveKeywordUntilEndOfTurn(.Vigilance)
                sunmanePegasus.giveKeywordUntilEndOfTurn(.Lifelink)
        })
        sunmanePegasus.setFlavorText("Chosen by Heliod, Daxos approached the pegasus without fear, and rode it without saddle or reins.")
        sunmanePegasus.power = 2
        sunmanePegasus.toughness = 3
        return sunmanePegasus
    }
    static func TaranikaAkroanVeteran() -> Card {
        let taranika = Card(name: "Taranika, Akroan Veteran", rarity: .Rare, set: set, number: 39)
        taranika.setManaCost("1WW")
        taranika.setType(.Legendary, .Creature, .Human, .Soldier)
        taranika.vigilance = true
        taranika.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.AnotherTargetCreatureYouControl(source: taranika),
                effect: { target in
                    target.untap()
                    target.setBasePowerAndToughnessUntilEndOfTurn(4, 4)
                    target.giveKeywordUntilEndOfTurn(.Indestructible)
            }))
        taranika.setFlavorText("\"I like to think Kytheon keeps watch over all of us.\"")
        taranika.power = 3
        taranika.toughness = 3
        return taranika
    }
    static func TranscendentEnvoy() -> Card {
        let transcendentEnvoy = Card(name: "Transcendent Envoy", rarity: .Common, set: set, number: 40)
        transcendentEnvoy.setManaCost("1W")
        transcendentEnvoy.setType(.Enchantment, .Creature, .Griffin)
        transcendentEnvoy.flying = true
        transcendentEnvoy.addStaticAbility(
            requirement: AbilityRequirement.AuraSpellsYouCast(source: transcendentEnvoy),
            effect: { object in
                object.castingCost = object.getBaseCastingCost().reducedBy(1)
                return object
            },
            layer: .CostReduction)
        transcendentEnvoy.setFlavorText("\"The first griffins were made by the gods to capture falling stars; they were given the keenest eyes and the swiftest wings, and sent to keep watch above the clouds.\"\n--The Cosmogony")
        transcendentEnvoy.power = 2
        transcendentEnvoy.toughness = 1
        return transcendentEnvoy
    }
    static func TriumphantSurge() -> Card {
        let triumphantSurge = Card(name: "Triumphant Surge", rarity: .Common, set: set, number: 41)
        triumphantSurge.setManaCost("3W")
        triumphantSurge.setType(.Instant)
        triumphantSurge.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() >= 4 },
                zones: [.Battlefield]),
            effect: { target in
                _ = target.destroy()
                triumphantSurge.getController().gainLife(3)
        }))
        triumphantSurge.setFlavorText("Not even death can quench a hero's inner fire.")
        return triumphantSurge
    }
    static func AliriosEnraptured() -> Card {
        let alirios = Card(name: "Alirios, Enraptured", rarity: .Uncommon, set: set, number: 42)
        alirios.setManaCost("2U")
        alirios.setType(.Legendary, .Creature, .Human)
        alirios.entersTapped = true
        alirios.addStaticAbility(
            requirement: AbilityRequirement.This(alirios),
            effect: { object in
                if object.getController().getPermanents().filter({ $0.isType(.Reflection) }).count > 0 {
                    object.untapsDuringUntapStep = false
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        alirios.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { alirios.getController().createToken(Reflection()) })
        alirios.setFlavorText("\"Why would I ever want to look away?\"")
        alirios.power = 2
        alirios.toughness = 3
        return alirios
    }
    // 43 Ashiok's Erasure
    static func BrineGiant() -> Card {
        let brineGiant = Card(name: "Brine Giant", rarity: .Common, set: set, number: 44)
        brineGiant.setManaCost("6U")
        brineGiant.setType(.Creature, .Giant)
        brineGiant.addStaticAbility(
            requirement: AbilityRequirement.This(brineGiant),
            effect: { object in
                let amount = object.getController().getEnchantments().count
                object.castingCost = object.getBaseCastingCost().reducedBy(amount)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        brineGiant.setFlavorText("The oracles of Meletis foresaw neither its rise from the depths nor the destruction it would leave in its wake.")
        brineGiant.power = 5
        brineGiant.toughness = 6
        return brineGiant
    }
    // 45 Callaphe, Beloved of the Sea
    // 46 Chain to Memory
    // 47 Deny the Divine
    static func EidolonOfPhilosophy() -> Card {
        let eidolonOfPhilosophy = Card(name: "Eidolon of Philosophy", rarity: .Common, set: set, number: 48)
        eidolonOfPhilosophy.setManaCost("U")
        eidolonOfPhilosophy.setType(.Enchantment, .Creature, .Spirit)
        eidolonOfPhilosophy.addActivatedAbility(
            string: "{6}{U}, Sacrifice ~: Draw three cards.",
            cost: Cost.Mana("6U").Sacrifice(),
            effect: { eidolonOfPhilosophy.getController().drawCards(3) })
        eidolonOfPhilosophy.setFlavorText("\"And what did Erekatsos teach us is the nature of the soul?\"")
        eidolonOfPhilosophy.power = 1
        eidolonOfPhilosophy.toughness = 2
        return eidolonOfPhilosophy
    }
    static func EliteInstructor() -> Card {
        let eliteInstructor = Card(name: "Elite Instructor", rarity: .Common, set: set, number: 49)
        eliteInstructor.setManaCost("2U")
        eliteInstructor.setType(.Creature, .Human, .Wizard)
        eliteInstructor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                eliteInstructor.getController().drawCard()
                eliteInstructor.getController().discard()
        })
        eliteInstructor.setFlavorText("The greatest minds in Meletis study under the masters at the Dekatia, a renowned school of magic and philosophy.")
        eliteInstructor.power = 2
        eliteInstructor.toughness = 2
        return eliteInstructor
    }
    // 50 Glimpse of Freedom
    // 51 Ichthyomorphosis
    // 52 Kiora Bests the Sea God
    // 53 Medomai's Prohpecy
    // 54 Memory Drain
    // 55 Nadir Kraken
    static func NaiadOfHiddenCoves() -> Card {
        let naiadOfHiddenCoves = Card(name: "Naiad of Hidden Coves", rarity: .Uncommon, set: set, number: 56)
        naiadOfHiddenCoves.setManaCost("2U")
        naiadOfHiddenCoves.setType(.Enchantment, .Creature, .Nymph)
        naiadOfHiddenCoves.addStaticAbility(
            requirement: AbilityRequirement.SpellsYouCast(source: naiadOfHiddenCoves),
            effect: { object in
                if !object.getController().active {
                    object.castingCost = object.getBaseCastingCost().reducedBy(1)
                }
                return object
            },
            layer: .CostReduction)
        naiadOfHiddenCoves.setFlavorText("\"Wave-borne, he watches over the secrets of the shore.\"\n--Psemilla, Meletian poet.")
        naiadOfHiddenCoves.power = 2
        naiadOfHiddenCoves.toughness = 3
        return naiadOfHiddenCoves
    }
    static func NyxbornSeaguard() -> Card {
        let nyxbornSeaguard = Card(name: "Nyxborn Seaguard", rarity: .Common, set: set, number: 57)
        nyxbornSeaguard.setManaCost("2UU")
        nyxbornSeaguard.setType(.Enchantment, .Creature, .Merfolk, .Soldier)
        nyxbornSeaguard.setFlavorText("\"Storm-tossed and broken, Callaphe cried out to deep-dwelling Thassa.\nTritons came swiftly to save her, bringing her north to Lindus.\"\n--The Callapheia")
        nyxbornSeaguard.power = 2
        nyxbornSeaguard.toughness = 5
        return nyxbornSeaguard
    }
    // 58 Omen of the Sea
    static func OneWithTheStars() -> Card {
        let oneWithTheStars = Card(name: "One with the Stars", rarity: .Uncommon, set: set, number: 59)
        oneWithTheStars.setManaCost("3U")
        oneWithTheStars.setType(.Enchantment, .Aura)
        oneWithTheStars.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreatureOrEnchantment(),
            effect: { object in
                // TODO this should be smart about removing subtypes that aren't enchantment ones
                let isAura = object.subtypes.contains(.Aura)
                let isSaga = object.subtypes.contains(.Saga)
                object.setType(.Enchantment)
                if isAura {
                    object.addType(.Aura)
                }
                if isSaga {
                    object.addType(.Saga)
                }
                return object
            },
            layer: .TypeChanging)
        oneWithTheStars.setFlavorText("\"Take your place amongst the stars.\"\n--Kruphix, god of horizons")
        return oneWithTheStars
    }
    // 60 Protean Thaumaturge
    static func RiptideTurtle() -> Card {
        let riptideTurtle = Card(name: "Riptide Turtle", rarity: .Common, set: set, number: 61)
        riptideTurtle.setManaCost("1U")
        riptideTurtle.setType(.Creature, .Turtle)
        riptideTurtle.flash = true
        riptideTurtle.defender = true
        riptideTurtle.setFlavorText("\"As the storm waves crushed my sailors, I cried out to Thassa. The next time I saw them, hard shells encased them, and they swam away to safety.\"\n--Siona, captain of the Pyleas")
        riptideTurtle.power = 0
        riptideTurtle.toughness = 5
        return riptideTurtle
    }
    static func SageOfMysteries() -> Card {
        let sageOfMysteries = Card(name: "Sage of Mysteries", rarity: .Uncommon, set: set, number: 62)
        sageOfMysteries.setManaCost("U")
        sageOfMysteries.setType(.Creature, .Human, .Wizard)
        sageOfMysteries.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { $0.mill(2) }))
        sageOfMysteries.setFlavorText("\"I see destruction, suffering, and one tormented glimmer of hope.\"")
        sageOfMysteries.power = 0
        sageOfMysteries.toughness = 2
        return sageOfMysteries
    }
    static func SeaGodsScorn() -> Card {
        let seaGodsScorn = Card(name: "Sea God's Scorn", rarity: .Uncommon, set: set, number: 63)
        seaGodsScorn.setManaCost("4UU")
        seaGodsScorn.setType(.Sorcery)
        // TODO: Bug when bouncing only one thing, asked for cost even after paying
        seaGodsScorn.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.TargetCreatureOrEnchantment(optional: true),
                TargetingRestriction.TargetCreatureOrEnchantment(optional: true),
                TargetingRestriction.TargetCreatureOrEnchantment(optional: true)
            ],
            effect: { targets in
                targets.forEach({ $0?.bounce() })
            },
            distinctTargets: true))
        seaGodsScorn.setFlavorText("Instead of performing their daily devotions, Heliod's acolytes spent the morning picking strands of kelp off the altar.")
        return seaGodsScorn
    }
    static func ShimmerwingChimera() -> Card {
        let shimmerwingChimera = Card(name: "Shimmerwing Chimera", rarity: .Uncommon, set: set, number: 64)
        shimmerwingChimera.setManaCost("3U")
        shimmerwingChimera.setType(.Enchantment, .Creature, .Chimera)
        shimmerwingChimera.flying = true
        shimmerwingChimera.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.AnotherTargetEnchantmentYouControl(source: shimmerwingChimera, optional: true),
                effect: { $0.bounce() }))
        shimmerwingChimera.setFlavorText("It swims upon the winds and soars through the waves.")
        shimmerwingChimera.power = 3
        shimmerwingChimera.toughness = 2
        return shimmerwingChimera
    }
    static func ShoalKraken() -> Card {
        let shoalKraken = Card(name: "Shoal Kraken", rarity: .Uncommon, set: set, number: 65)
        shoalKraken.setManaCost("4U")
        shoalKraken.setType(.Creature, .Kraken)
        shoalKraken.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: {
                shoalKraken.getController().drawCard()
                shoalKraken.getController().discard()
            },
            effectOptional: true)
        shoalKraken.setFlavorText("It eats the things that eat the things that are drawn to the light.")
        shoalKraken.power = 3
        shoalKraken.toughness = 5
        return shoalKraken
    }
    // 66 Sleep of the Dead
    static func StarlitMantle() -> Card {
        let starlitMantle = Card(name: "Starlit Mantle", rarity: .Common, set: set, number: 67)
        starlitMantle.setManaCost("1U")
        starlitMantle.setType(.Enchantment, .Aura)
        starlitMantle.flash = true
        starlitMantle.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { starlitMantle.attachedTo?.giveKeywordUntilEndOfTurn(.Hexproof) })
        starlitMantle.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreatureYouControl(source: starlitMantle),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        return starlitMantle
    }
    static func SternDismissal() -> Card {
        let sternDismissal = Card(name: "Stern Dismissal", rarity: .Common, set: set, number: 68)
        sternDismissal.setManaCost("U")
        sternDismissal.setType(.Instant)
        sternDismissal.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { ($0.isCreature() || $0.isEnchanted()) && $0.getController() !== sternDismissal.getController() },
                zones: [.Battlefield]),
            effect: { $0.bounce() }))
        sternDismissal.setFlavorText("Cities offer tribute to Ephara and carve her image into their walls, imploring her to protect them from the dangers of the wild.")
        return sternDismissal
    }
    // 69 Stinging Lionfish
    // 70 Sweet Oblivion
    // 71 Thassa, Deep-Dwelling
    // 72 Thassa's Intervention
    // 73 Thassa's Oracle
    // 74 Thirst for Meaning
    static func ThrenodySinger() -> Card {
        let threnodySinger = Card(name: "Threnody Singer", rarity: .Uncommon, set: set, number: 75)
        threnodySinger.setManaCost("1U")
        threnodySinger.setType(.Creature, .Siren)
        threnodySinger.flash = true
        threnodySinger.flying = true
        threnodySinger.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureAnOpponentControl(source: threnodySinger),
                effect: { target in
                    let amount = -1 * threnodySinger.getController().devotion(.Blue)
                    target.pump(amount, 0)
                }))
        threnodySinger.power = 1
        threnodySinger.toughness = 3
        return threnodySinger
    }
    static func ThryxTheSuddenStorm() -> Card {
        let thryx = Card(name: "Thryx, the Sudden Storm", rarity: .Rare, set: set, number: 76)
        thryx.setManaCost("3UU")
        thryx.setType(.Legendary, .Creature, .Elemental, .Giant)
        thryx.flash = true
        thryx.flying = true
        // TODO Bug with abilities on stack?
        thryx.addStaticAbility(
            requirement: AbilityRequirement.SpellsYouCast(
                source: thryx,
                additionalRequirement: { $0.getConvertedManaCost() >= 5 }),
            effects: [
                ({ $0.castingCost = $0.getBaseCastingCost().reducedBy(1); return $0 }, .CostReduction),
                ({ $0.withKeyword(.Uncounterable) }, .AbilityAddingOrRemoving)
            ])
        thryx.setFlavorText("Even in their mountain fortresses, the Akroans have learned not to anger Thassa.")
        thryx.power = 4
        thryx.toughness = 5
        return thryx
    }
    // 77 Towering-Wave Mystic
    static func TritonWaverider() -> Card {
        let tritonWaverider = Card(name: "Triton Waverider", rarity: .Common, set: set, number: 78)
        tritonWaverider.setManaCost("3U")
        tritonWaverider.setType(.Creature, .Merfolk, .Wizard)
        tritonWaverider.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: { tritonWaverider.giveKeywordUntilEndOfTurn(.Flying) })
        tritonWaverider.setFlavorText("\"You can no more stop me than you can halt the tide.\"")
        tritonWaverider.power = 3
        tritonWaverider.toughness = 3
        return tritonWaverider
    }
    static func VexingGull() -> Card {
        let vexingGull = Card(name: "Vexing Gull", rarity: .Common, set: set, number: 79)
        vexingGull.setManaCost("2U")
        vexingGull.setType(.Creature, .Bird)
        vexingGull.flash = true
        vexingGull.flying = true
        vexingGull.setFlavorText("\"May the skies be clear of gales and gulls.\"\n--Meletian prayer")
        vexingGull.power = 2
        vexingGull.toughness = 2
        return vexingGull
    }
    static func WavebreakHippocamp() -> Card {
        let wavebreakHippocamp = Card(name: "Wavebreak Hippocamp", rarity: .Rare, set: set, number: 80)
        wavebreakHippocamp.setManaCost("2U")
        wavebreakHippocamp.setType(.Enchantment, .Creature, .Horse, .Fish)
        wavebreakHippocamp.addTriggeredAbility(
            trigger: .YouCastFirstSpellEachOpponentsTurn,
            effect: { wavebreakHippocamp.getController().drawCard() })
        wavebreakHippocamp.setFlavorText("Tritons search for omens in its wake.")
        wavebreakHippocamp.power = 2
        wavebreakHippocamp.toughness = 2
        return wavebreakHippocamp
    }
    // 81 Whirlwind Denial
    // 82 Witness of Tomorrows
    // 83 Agonizing Remorse
    // 84 Aphemia, the Cacophony
    static func AspectOfLamprey() -> Card {
        let aspectOfLamprey = Card(name: "Aspect of Lamprey", rarity: .Common, set: set, number: 85)
        aspectOfLamprey.setManaCost("3B")
        aspectOfLamprey.setType(.Enchantment, .Aura)
        aspectOfLamprey.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetOpponent(source: aspectOfLamprey),
                effect: { $0.discard(2) }))
        aspectOfLamprey.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreatureYouControl(source: aspectOfLamprey),
            effect: { $0.withKeyword(.Lifelink) },
            layer: .AbilityAddingOrRemoving)
        aspectOfLamprey.setFlavorText("\"Some aspire to be mighty like the lion or the hydra. I am the parasite that feeds on them all.\"")
        return aspectOfLamprey
    }
    static func BlightBreathCatoblepas() -> Card {
        let blightBreathCatoblepas = Card(name: "Blight-Breath Catoblepas", rarity: .Common, set: set, number: 86)
        blightBreathCatoblepas.setManaCost("4BB")
        blightBreathCatoblepas.setType(.Creature, .Beast)
        blightBreathCatoblepas.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureAnOpponentControl(source: blightBreathCatoblepas),
                effect: { target in
                    let amount = -1 * blightBreathCatoblepas.getController().devotion(.Black)
                    target.pump(amount, amount)
            }))
        blightBreathCatoblepas.setFlavorText("Wherever it walks, famine follows behind.")
        blightBreathCatoblepas.power = 3
        blightBreathCatoblepas.toughness = 2
        return blightBreathCatoblepas
    }
    // 87 Cling to Dust
    static func DiscordantPiper() -> Card {
        let discordantPiper = Card(name: "Discordant Piper", rarity: .Common, set: set, number: 88)
        discordantPiper.setManaCost("1B")
        discordantPiper.setType(.Creature, .Zombie, .Satyr)
        discordantPiper.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { discordantPiper.getController().createToken(Goat()) })
        discordantPiper.setFlavorText("The death of the party.")
        discordantPiper.power = 2
        discordantPiper.toughness = 1
        return discordantPiper
    }
    static func DragToTheUnderworld() -> Card {
        let dragToTheUnderworld = Card(name: "Drag to the Underworld", rarity: .Uncommon, set: set, number: 89)
        dragToTheUnderworld.setManaCost("2BB")
        dragToTheUnderworld.setType(.Instant)
        dragToTheUnderworld.addStaticAbility(
            requirement: AbilityRequirement.This(dragToTheUnderworld),
            effect: { object in
                let amount = object.getController().devotion(.Black)
                object.castingCost = object.getBaseCastingCost().reducedBy(amount)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        dragToTheUnderworld.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { _ = $0.destroy() }))
        dragToTheUnderworld.setFlavorText("The more you struggle against death, the tighter its grip becomes.")
        return dragToTheUnderworld
    }
    // 90 Eat to Extinction
    static func ElspethsNightmare() -> Card {
        let elspethsNightmare = Card(name: "Elspeth's Nightmare", rarity: .Uncommon, set: set, number: 91)
        elspethsNightmare.setManaCost("2B")
        elspethsNightmare.setType(.Enchantment, .Saga)
        Saga(elspethsNightmare)
        elspethsNightmare.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isCreature() && $0.getController() !== elspethsNightmare.getController() && $0.getPower() <= 2 },
                    zones: [.Battlefield]),
                effect: { _ = $0.destroy() }),
            restriction: { elspethsNightmare.getCounters(.Lore) == 1 })
        elspethsNightmare.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetOpponent(source: elspethsNightmare),
                effect: { target in
                    elspethsNightmare.getController().chooseCard(
                        from: target.getHand(),
                        restriction: { !$0.isType(.Creature) && !$0.isType(.Land) },
                        action: { chosen, rest in chosen?.discard()})
                }),
            restriction: { elspethsNightmare.getCounters(.Lore) == 2 })
        elspethsNightmare.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetOpponent(source: elspethsNightmare),
                effect: {
                    $0.exileGraveyard()
                    elspethsNightmare.sacrifice()
            }),
            restriction: { elspethsNightmare.getCounters(.Lore) == 3 })
        return elspethsNightmare
    }
    static func EnemyOfEnlightenment() -> Card {
        let enemyOfEnlightenment = Card(name: "Enemy of Enlightenment", rarity: .Uncommon, set: set, number: 92)
        enemyOfEnlightenment.setManaCost("5B")
        enemyOfEnlightenment.setType(.Enchantment, .Creature, .Demon)
        enemyOfEnlightenment.flying = true
        enemyOfEnlightenment.addStaticAbility(
            requirement: AbilityRequirement.This(enemyOfEnlightenment),
            effect: { object in
                let amount = -1 * object.getOpponent().getHand().count
                return object.pumped(amount, amount)
            },
            layer: .PowerToughnessChanging)
        enemyOfEnlightenment.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: { Game.shared.bothPlayers({ $0.discard() }) })
        enemyOfEnlightenment.setFlavorText("\"Evil flourishes where ignorance thrives.\"\n--Perisophia the philosopher")
        enemyOfEnlightenment.power = 5
        enemyOfEnlightenment.toughness = 5
        return enemyOfEnlightenment
    }
    // 93 Erebos, Bleak-Hearted
    // 94 Erebos's Intervention
    static func FinalDeath() -> Card {
        let finalDeath = Card(name: "Final Death", rarity: .Common, set: set, number: 95)
        finalDeath.setManaCost("4B")
        finalDeath.setType(.Instant)
        finalDeath.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.exile() }))
        finalDeath.setFlavorText("The Underworld erodes memory, identity, and eventually the physical form, leaving only crumbling statues called misera -- hollow monuments to mortal futility.")
        return finalDeath
    }
    // 96 Fruit of Tizerus
    static func FuneralRites() -> Card {
        let funeralRites = Card(name: "Funeral Rites", rarity: .Common, set: set, number: 97)
        funeralRites.setManaCost("2B")
        funeralRites.setType(.Sorcery)
        funeralRites.addEffect({
            funeralRites.getController().drawCards(2)
            funeralRites.getController().loseLife(2)
            funeralRites.getController().mill(2)
        })
        funeralRites.setFlavorText("Funerary masks help the newly dead resist the erosion of memory and identity in the Underworld.")
        return funeralRites
    }
    // 98 Gravebreaker Lamia
    // 99 Gray Merchant of Asphodel
    static func GrimPhysician() -> Card {
        let grimPhysician = Card(name: "Grim Physician", rarity: .Common, set: set, number: 100)
        grimPhysician.setManaCost("B")
        grimPhysician.setType(.Creature, .Zombie)
        grimPhysician.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureAnOpponentControl(source: grimPhysician),
                effect: { $0.pump(-1, -1) }))
        grimPhysician.setFlavorText("The Returned maintain no memory of their identities, but sometimes they mindlessly attempt familiar tasks.")
        grimPhysician.power = 1
        grimPhysician.toughness = 1
        return grimPhysician
    }
    // 101 Hateful Eidolon
    // 102 Inevitable End
    // 103 Lampad of Death's Vigil
    // 104 Minion's Return
    static func MireTriton() -> Card {
        let mireTriton = Card(name: "Mire Triton", rarity: .Uncommon, set: set, number: 105)
        mireTriton.setManaCost("1B")
        mireTriton.setType(.Creature, .Zombie, .Merfolk)
        mireTriton.deathtouch = true
        mireTriton.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                mireTriton.getController().mill(2)
                mireTriton.getController().gainLife(2)
        })
        mireTriton.setFlavorText("Caught between life and death, between land and sea, between thought and oblivion.")
        mireTriton.power = 2
        mireTriton.toughness = 1
        return mireTriton
    }
    static func MiresGrasp() -> Card {
        let miresGrasp = Card(name: "Mire's Grasp", rarity: .Common, set: set, number: 106)
        miresGrasp.setManaCost("1B")
        miresGrasp.setType(.Enchantment, .Aura)
        miresGrasp.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { return $0.pumped(-3, -3) },
            layer: .PowerToughnessChanging)
        miresGrasp.setFlavorText("Those caught attempting to escape the Underworld spend the rest of their existence trapped in the Mire of Punishment.")
        return miresGrasp
    }
    // 107 Mogis's Favor
    // 108 Nightmare Shepherd
    static func NyxbornMarauder() -> Card {
        let nyxbornMarauder = Card(name: "Nyxborn Marauder", rarity: .Common, set: set, number: 109)
        nyxbornMarauder.setManaCost("2BB")
        nyxbornMarauder.setType(.Enchantment, .Creature, .Minotaur)
        nyxbornMarauder.setFlavorText("\"Callaphe guided them into the darkness of Hetos, the bleak mire;\nBlood-horned minotaurs circled them, axes aglimmer in shadows.\"\n--The Callapheia")
        nyxbornMarauder.power = 4
        nyxbornMarauder.toughness = 3
        return nyxbornMarauder
    }
    // 110 Omen of the Dead
    // 111 Pharika's Libation
    // 112 Pharika's Spawn
    static func RageScarredBerserker() -> Card {
        let rageScarredBerserker = Card(name: "Rage-Scarred Berserker", rarity: .Common, set: set, number: 113)
        rageScarredBerserker.setManaCost("4B")
        rageScarredBerserker.setType(.Creature, .Minotaur, .Berserker)
        rageScarredBerserker.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureYouControl(source: rageScarredBerserker),
                effect: { target in
                    target.pump(1, 0)
                    target.giveKeywordUntilEndOfTurn(.Indestructible)
            }))
        rageScarredBerserker.setFlavorText("The fury of the slaughter god Mogis burns within him.")
        rageScarredBerserker.power = 5
        rageScarredBerserker.toughness = 4
        return rageScarredBerserker
    }
    static func ScavengingHarpy() -> Card {
        let scavengingHarpy = Card(name: "Scavenging Harpy", rarity: .Common, set: set, number: 114)
        scavengingHarpy.setManaCost("1B")
        scavengingHarpy.setType(.Creature, .Harpy)
        scavengingHarpy.flying = true
        scavengingHarpy.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getController() === scavengingHarpy.getOpponent() },
                    zones: [.Graveyard]),
                effect: { $0.exile() }))
        scavengingHarpy.setFlavorText("Desecrating the dead is a convenient way for harpies to expand their foul collections.")
        scavengingHarpy.power = 2
        scavengingHarpy.toughness = 1
        return scavengingHarpy
    }
    // 115 Soulreaper of Mogis
    static func TempleThief() -> Card {
        let templeThief = Card(name: "Temple Thief", rarity: .Common, set: set, number: 116)
        templeThief.setManaCost("1B")
        templeThief.setType(.Creature, .Human, .Rogue)
        templeThief.blockabilityRequirements.append({ object in
            return !(object.isEnchanted() || object.isEnchantment())
        })
        templeThief.setFlavorText("\"I don't know if the gods watch over their temples, but I figure it's best to be stealthy just in case.\"")
        templeThief.power = 2
        templeThief.toughness = 2
        return templeThief
    }
    static func TreacherousBlessing() -> Card {
        let treacherousBlessing = Card(name: "Treacherous Blessing", rarity: .Rare, set: set, number: 117)
        treacherousBlessing.setManaCost("2B")
        treacherousBlessing.setType(.Enchantment)
        treacherousBlessing.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { treacherousBlessing.getController().drawCards(3) })
        treacherousBlessing.addTriggeredAbility(
            trigger: .YouCastSpell,
            effect: { treacherousBlessing.getController().loseLife(1) })
        treacherousBlessing.addTriggeredAbility(
            trigger: .ThisBecomesTargetOfSpellOrAbility,
            effect: { treacherousBlessing.sacrifice() })
        treacherousBlessing.setFlavorText("Phenax is generous with gifts and unforgiving of debts.")
        return treacherousBlessing
    }
    // 118 Tymaret Calls the Dead
    // 119 Tymaret, Chosen from Death
    // 120 Underworld Charger
    // 121 Underworld Dreams
    static func VenomousHierophant() -> Card {
        let venomousHierophant = Card(name: "Venomous Hierophant", rarity: .Common, set: set, number: 122)
        venomousHierophant.setManaCost("3B")
        venomousHierophant.setType(.Creature, .Gorgon, .Cleric)
        venomousHierophant.deathtouch = true
        venomousHierophant.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { venomousHierophant.getController().mill(3) })
        venomousHierophant.setFlavorText("\"Many have sought snake-twined Pharika's panacea. Do you wish to share their fate?\"")
        venomousHierophant.power = 3
        venomousHierophant.toughness = 3
        return venomousHierophant
    }
    // 123 Woe Strider
    
    static func Goat() -> Token {
        let goat = Token(name: "Goat", set: set, number: 1)
        goat.colors = [.White]
        goat.setType(.Creature, .Goat)
        goat.power = 0
        goat.toughness = 1
        return goat
    }
    static func HumanSoldier() -> Token {
        let humanSoldier = Token(name: "Human Soldier", set: set, number: 2)
        humanSoldier.colors = [.White]
        humanSoldier.setType(.Creature, .Human, .Soldier)
        humanSoldier.power = 1
        humanSoldier.toughness = 1
        return humanSoldier
    }
    static func Pegasus() -> Token {
        let pegasus = Token(name: "Pegasus", set: set, number: 3)
        pegasus.colors = [.White]
        pegasus.setType(.Creature, .Pegasus)
        pegasus.flying = true
        pegasus.power = 2
        pegasus.toughness = 2
        return pegasus
    }
    static func Kraken() -> Token {
        let kraken = Token(name: "Kraken", set: set, number: 4)
        kraken.colors = [.Blue]
        kraken.setType(.Creature, .Kraken)
        kraken.hexproof = true
        kraken.power = 8
        kraken.toughness = 8
        return kraken
    }
    static func Reflection() -> Token {
        let reflection = Token(name: "Reflection", set: set, number: 5)
        reflection.colors = [.Blue]
        reflection.setType(.Creature, .Reflection)
        reflection.power = 3
        reflection.toughness = 2
        return reflection
    }
    static func Tentacle() -> Token {
        let tentacle = Token(name: "Tentacle", set: set, number: 6)
        tentacle.colors = [.Blue]
        tentacle.setType(.Creature, .Tentacle)
        tentacle.power = 1
        tentacle.toughness = 1
        return tentacle
    }
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 7)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Zombie)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    static func Elemental(power: Int) -> Token {
        let elemental = Token(name: "Elemental", set: set, number: 8)
        elemental.colors = [.Red]
        elemental.setType(.Creature, .Elemental)
        elemental.trample = true
        elemental.haste = true
        elemental.power = power
        elemental.toughness = 1
        return elemental
    }
    static func Satyr() -> Token {
        let satyr = Token(name: "Satyr", set: set, number: 9)
        satyr.colors = [.Red]
        satyr.setType(.Creature, .Satyr)
        satyr.cantBlock = true
        satyr.power = 1
        satyr.toughness = 1
        return satyr
    }
    static func Spider() -> Token {
        let spider = Token(name: "Spider", set: set, number: 10)
        spider.colors = [.Green]
        spider.setType(.Creature, .Spider)
        spider.reach = true
        spider.power = 1
        spider.toughness = 2
        return spider
    }
    static func Wolf() -> Token {
        let wolf = Token(name: "Wolf", set: set, number: 11)
        wolf.colors = [.Green]
        wolf.setType(.Creature, .Wolf)
        wolf.power = 2
        wolf.toughness = 2
        return wolf
    }
    static func Nightmare() -> Token {
        let nightmare = Token(name: "Nightmare", set: set, number: 12)
        nightmare.colors = [.Blue, .Black]
        nightmare.setType(.Creature, .Nightmare)
        let effect = {
            nightmare.eachOpponent({ $0.exileTopOfLibrary(2) })
        }
        nightmare.addTriggeredAbility(trigger: .ThisAttacks, effect: effect)
        nightmare.addTriggeredAbility(trigger: .ThisBlocks, effect: effect)
        nightmare.power = 2
        nightmare.toughness = 3
        return nightmare
    }
    static func Gold() -> Token {
        let gold = Token(name: "Gold", set: set, number: 13)
        gold.setType(.Artifact, .Gold)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {W}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .White) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {U}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Blue) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {B}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Black) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {R}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Red) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {G}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Green) },
            manaAbility: true)
        return gold
    }
    static func Wall() -> Token {
        let wall = Token(name: "Wall", set: set, number: 14)
        wall.setType(.Artifact, .Creature, .Wall)
        wall.defender = true
        wall.power = 0
        wall.toughness = 4
        return wall
    }
    
    

}

