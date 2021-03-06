import Foundation

enum GRN {
    static var set = "grn"
    static var count = 259

    static let cards = [
        BladeInstructor, BountyAgent, CandlelightVigil, CitywideBust, CollarTheCulprit, /* ConclaveTribunal, */ /* CrushContraband, */ /* DawnOfHope, */ Demotion, /* DivineVisitation, */ /* FlightOfEquenauts, */ GirdForBattle, /* HaazdaMarshal, */ HealersHawk, HuntedWitness, InspiringUnicorn, IntrusivePackbeast, /* LedevGuardian, */ LightOfTheLegion, /* LoxodonRestorer, */ LuminousBonds, ParhelionPatrol, RighteousBlow, RocCharger, /* SkylineScout, */ SunhomeStalwart, SwornCompanions, TakeHeart, TenthDistrictGuard, /* Venerated Loxodon, */ /* CaptureSphere, */ /* Chemister's Insight, */ /* Citywatch Sphinx, */ /* Dazzling Lights, */ /* DeviousCoverUp, */ /* DimirInformant, */ DisdainfulStroke, /* DreamEater, */ DrownedSecrets, /* EnhancedSurveillance, */ /* GuildSummit, */ Leapfrog, /* MaximizeAltitude, */ /* MissionBriefing, */ MurmuringMystic, MuseDrake, /* Narcomoeba, */ /* NightveilSprite, */ /* OmnispellAdept, */ PasswallAdept, /* Quasiduplicate, */ /* RadicalIdea, */ /* SelectiveSnare, */ /* SinisterSabotage, */ /* ThoughtboundPhantasm, */ /* UnexplainedDisappearance, */ VedalkenMesmerist, WallOfMist, /* WatcherInTheMist, */ WishcoinCrab, /* BarrierOfBones, */ BartizanBats, /* BloodOperative, */ BurglarRat, ChildOfNight, /* CreepingChill, */ DeadWeight, /* DeadlyVisit, */ /* DoomWhisperer, */ DouserOfLights, /* GruesomeMenagerie, */ HiredPoisoner, /* KraulSwarm, */ LotlethGiant, MausoleumSecrets, /* MephiticVapors, */ MidnightReaper, /* MoodmarkPainter, */ /* NecroticWound, */ NeverHappened, PilferingImp, /* Plaguecrafter, */ /* PriceOfFame, */ RitualOfSoot, /* SeveredStrands, */ SpinalCentipede, /* UndercityNecrolisk, */ VeiledShade, ViciousRumors, /* WhisperingSnitch, */ ArclightPhoenix, BargingSergeant, /* BookDevourer, */ CommandTheStorm, /* CosmotronicWave, */ /* DirectCurrent, */ ElectrostaticField, /* ErraticCyclops, */ /* ExperimentalFrenzy, */ FearlessHalberdier, FireUrchin, GoblinBanneret, /* GoblinCratermaker, */ /* GoblinLocksmith, */ /* GraviticPunch, */ HellkiteWhelp, InescapableBlaze, /* LavaCoil, */ /* LegionWarboss, */ ManiacalRage, /* MaximizeVelocity, */ /* OrneryGoblin, */ /* RiskFactor, */ RubblebeltBoar, RunawaySteamKin, SmeltWardMinotaur, StreetRiot, SureStrike, TorchCourier, /* WojekBodyguard, */ AffectionateIndrik, /* AboretumElemental, */ BeastWhisperer, BountyOfMight, /* CurcuitousRoute, */ /* CrushingCanopy, */ DevkarinDissident, DistrictGuide, GenerousStray, GolgariRaiders, GrapplingSundew, HatcherySpider, HitchclawRecluse, IronshellBeetle, KraulForagers, /* KraulHarpooner, */ MightOfTheMasses, /* NullhideFerox, */ /* PacksFavor, */ /* PauseForReflection, */ /* PeltCollector, */ /* PortcullisVine, */ PreyUpon, /* SiegeWurm, */ /* SproutingRenewal, */ /* UrbanUtopia, */ /* VigorsporeWurm, */ /* VividRevival, */ WaryOkapi, WildCeratok, /* ArtfulTakedown, */ /* AssassinsTrophy, */ AureliaExemplarOfJustice, /* BeaconBolt, */ /* BeamsplitterMage, */ BorosChallenger, Camaraderie, CentaurPeacemaker, /* ChanceForGlory, */ /* CharnelTroll, */ ConclaveCavalier, ConclaveGuildmage, CracklingDrake, /* DarkbladeAgent, */ /* DeafeningClarion, */ /* DimirSpybug, */ /* DisinformationCampaign, */ EmmaraSoulOfTheAccord, /* ErstwhileTrooper, */ /* EtrataTheSilencer, */ FiremindsResearch, GarrisonSergeant, /* GlowsporeShaman, */ GoblinElectromancer, /* GolgariFindbroker, */ HammerDropper, /* HouseGuildmage, */ /* Hypothesizzle, */ Ionize, /* IzoniThousandEyed, */ JoinShields, JusticeStrike, /* KnightOfAutumn, */ /* LazavTheMultifarious, */ /* LeagueGuildmage, */ /* LedevChampion, */ LegionGuildmage, /* MarchOfTheMultitudes, */ /* MnemonicBetrayal, */ /* Molderhulk, */ NightveilPredator, NivMizzetParun, /* NotionRain, */ /* OchranAssassin, */ /* RalIzzetViceroy, */ RhizomeLurcher, /* RosemaneCentaur, */ SkyknightLegionnaire, /* SonicAssault, */ SumalaWoodshaper, /* SwarmGuildmage, */ SwathcutterGiant, SwiftbladeVindicator, /* TajicLegionsEdge, */ /* ThiefOfSanity, */ /* ThoughtErasure, */ /* ThousandYearStorm, */ /* TrostaniDiscordant, */ /* TruefireCaptain, */ UndercityUprising, /* UnderrealmLich, */ /* UnmooredEgo, */ /* VraskaGolgariQueen, */ WeeDragonauts, /* WorldsoulColossus, */ FreshFacedRecruit, PistonFistCyclops, PitilessGorgon, VernadiShieldmate, /* WhisperAgent, */ /* AssureAssemble, */ /* ConniveConcoct, */ /* DiscoveryDispersal, */ /* ExpansionExplosion, */ /* FindFinality, */ /* FlowerFlourish, */ /* IntegrityIntervention, */ /* InvertInvent, */ /* ResponseResurgence, */ /* StatusStatue, */ BorosLocket, /* ChamberSentry, */ /* ChromaticLantern, */ DimirLocket, GatekeeperGargoyle, /* GlaiveOfTheGuildpact, */ GolgariLocket, IzzetLocket, RampagingMonument, SelesnyaLocket, SilentDart, /* WandOfVertebrae, */ BorosGuildgate243, BorosGuildgate244, DimirGuildgate245, DimirGuildgate246, /* GatewayPlaza, */ GolgariGuildgate248, GolgariGuildgate249, /* GuildmagesForum, */ IzzetGuildgate251, IzzetGuildgate252, /* OvergrownTomb, */ /* SacredFoundry, */ SelesnyaGuildgate255, SelesnyaGuildgate256, /* SteamVents, */ /* TempleGarden, */ /* WateryGrave, */ Plains, Island, Swamp, Mountain, Forest,

    ]
    // Impervious Greatwurm

    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }

    static func Mentor(_ source: Object) -> TriggeredAbility {
        return TargetedTriggeredAbility(
            source: source,
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.isAttacking && $0.getPower() < source.getPower() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
    }

    static func BladeInstructor() -> Card {
        let bladeInstructor = Card(name: "Blade Instructor", rarity: .Common, set: set, number: 1)
        bladeInstructor.setManaCost("2W")
        bladeInstructor.setType(.Creature, .Human, .Soldier)
        bladeInstructor.triggeredAbilities.append(Mentor(bladeInstructor));
        bladeInstructor.setFlavorText("\"Watch carefully. The gap between death and victory is thinner than your blade.\"")
        bladeInstructor.power = 3
        bladeInstructor.toughness = 1
        return bladeInstructor
    }
    static func BountyAgent() -> Card {
        let bountyAgent = Card(name: "Bounty Agent", rarity: .Rare, set: set, number: 2)
        bountyAgent.setManaCost("1W")
        bountyAgent.setType(.Creature, .Human, .Soldier)
        bountyAgent.vigilance = true
        bountyAgent.addActivatedAbility(
            string: "{T}, Sacrifice ~: Destroy target legendary permanent that's an artifact, creature, or enchantment.",
            cost: Cost.Tap().Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Legendary) && $0.isPermanent() && ($0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Enchantment)) },
                    zones: [.Battlefield]),
                effect: { let _ = $0.destroy() }))
        bountyAgent.setFlavorText("\"Lately I've seen the biggest bounties of my career--and for the biggest names.\"")
        bountyAgent.power = 2
        bountyAgent.toughness = 2
        return bountyAgent
    }
    static func CandlelightVigil() -> Card {
        let candlelightVigil = Card(name: "Candlelight Vigil", rarity: .Common, set: set, number: 3)
        candlelightVigil.setManaCost("3W")
        candlelightVigil.setType(.Enchantment, .Aura)
        candlelightVigil.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effects: [
                ({ return $0.pumped(3, 2) }, .PowerToughnessChanging),
                ({ return $0.withKeyword(.Vigilance) }, .AbilityAddingOrRemoving),
            ])
        candlelightVigil.setFlavorText("Selesnya guildmages do not sleep so the rest of the Conclave can.")
        return candlelightVigil
    }
    static func CitywideBust() -> Card {
        let citywideBust = Card(name: "Citywide Bust", rarity: .Rare, set: set, number: 4)
        citywideBust.setManaCost("1WW")
        citywideBust.setType(.Sorcery)
        citywideBust.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getToughness() >= 4 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }
        citywideBust.setFlavorText("\"Oh, you fellas are going to love the lockup. Excellent gruel. Very low ceilings.\"\n--Libuse, Boros sergeant")
        return citywideBust
    }
    static func CollarTheCulprit() -> Card {
        let collarTheCulprit = Card(name: "Collar the Culprit", rarity: .Common, set: set, number: 5)
        collarTheCulprit.setManaCost("3W")
        collarTheCulprit.setType(.Instant)
        collarTheCulprit.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
                zones: [.Battlefield]),
            effect: { target in let _ = target.destroy() }))
        collarTheCulprit.setFlavorText("\"Reports of Gruul rioters in four districts. Start with the big ones and work your way up.\"\n--Libuse, Boros sergeant")
        return collarTheCulprit
    }
    // 6 Conclave Tribunal
    // 7 Crush Contraband
    // 8 Dawn of Hope
    static func Demotion() -> Card {
        let demotion = Card(name: "Demotion", rarity: .Uncommon, set: set, number: 9)
        demotion.setManaCost("W")
        demotion.setType(.Enchantment, .Aura)
        demotion.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effects: [
                ({ return $0.withKeyword(.CantBlock) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantActivateAbilities) }, .AbilityAddingOrRemoving),
            ])
        demotion.setFlavorText("There's no greater honor than joining your chosen guild, and no greater shame than failing it.")
        return demotion
    }
    // 10 Divine Visitation
    // 11 Flight of Equenauts
    static func GirdForBattle() -> Card {
        let girdForBattle = Card(name: "Gird for Battle", rarity: .Uncommon, set: set, number: 12)
        girdForBattle.setManaCost("W")
        girdForBattle.setType(.Sorcery)
        girdForBattle.addEffect(TargetedEffect.MultiObject(
            restrictions: [TargetingRestriction.TargetCreature(optional: true),
                           TargetingRestriction.TargetCreature(optional: true)],
            effect: { targets in
                for target in targets {
                    target?.addCounter(.PlusOnePlusOne)
                }
            },
            distinctTargets: true))
        girdForBattle.setFlavorText("\"You won't need the sword drills, your shields, or my blessing. You'll fight for Sunhome with the truth in your heat.\"\n--Aurelia.")
        return girdForBattle
    }
    // 13 Haazda Marshal
    static func HealersHawk() -> Card {
        let healersHawk = Card(name: "Healer's Hawk", rarity: .Common, set: set, number: 14)
        healersHawk.setManaCost("W")
        healersHawk.setType(.Creature, .Bird)
        healersHawk.flying = true
        healersHawk.lifelink = true
        healersHawk.setFlavorText("The wounded see the glow of its vials long before they see its wings diving out of the clouds.")
        healersHawk.power = 1
        healersHawk.toughness = 1
        return healersHawk
    }
    static func HuntedWitness() -> Card {
        let huntedWitness = Card(name: "Hunted Witness", rarity: .Common, set: set, number: 15)
        huntedWitness.setManaCost("W")
        huntedWitness.setType(.Creature, .Human)
        huntedWitness.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { huntedWitness.getController().createToken(Soldier()) })
        huntedWitness.setFlavorText("He ferried weapons, spells, exotic animals--but his most dangerous cargo was the truth.")
        huntedWitness.power = 1
        huntedWitness.toughness = 1
        return huntedWitness
    }
    static func InspiringUnicorn() -> Card {
        let inspiringUnicorn = Card(name: "Inspiring Unicorn", rarity: .Uncommon, set: set, number: 16)
        inspiringUnicorn.setManaCost("2WW")
        inspiringUnicorn.setType(.Creature, .Unicorn)
        inspiringUnicorn.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                inspiringUnicorn.getController().getCreatures().forEach({ creature in
                    creature.pump(1, 1)
                })
            })
        inspiringUnicorn.setFlavorText("There are two lives: the life you live before you see a unicorn, and the life you live after.")
        inspiringUnicorn.power = 2
        inspiringUnicorn.toughness = 2
        return inspiringUnicorn
    }
    static func IntrusivePackbeast() -> Card {
        let intrusivePackbeast = Card(name: "Intrusive Packbeast", rarity: .Common, set: set, number: 17)
        intrusivePackbeast.setManaCost("4W")
        intrusivePackbeast.setType(.Creature, .Beast)
        intrusivePackbeast.vigilance = true
        intrusivePackbeast.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.MultiObject(
                restrictions: [
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Creature) && $0.getController() !== intrusivePackbeast.getController() },
                        zones: [.Battlefield],
                        optional: true
                    ),
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Creature) && $0.getController() !== intrusivePackbeast.getController() },
                        zones: [.Battlefield],
                        optional: true
                    )
                ],
                effect: { targets in
                    for target in targets {
                        target?.tap()
                    }
                },
                distinctTargets: true))
        intrusivePackbeast.setFlavorText("Good at carrying things. Really good at knocking them down.")
        intrusivePackbeast.power = 3
        intrusivePackbeast.toughness = 3
        return intrusivePackbeast
    }
    // 18 Ledev Guardian
    static func LightOfTheLegion() -> Card {
        let lightOfTheLegion = Card(name: "Light of the Legion", rarity: .Rare, set: set, number: 19)
        lightOfTheLegion.setManaCost("4WW")
        lightOfTheLegion.setType(.Creature, .Angel)
        lightOfTheLegion.flying = true
        lightOfTheLegion.triggeredAbilities.append(Mentor(lightOfTheLegion))
        lightOfTheLegion.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { lightOfTheLegion.getController().getCreatures().filter({ $0.isColor(.White) }).forEach({ $0.addCounter(.PlusOnePlusOne)} )})
        lightOfTheLegion.power = 5
        lightOfTheLegion.toughness = 5
        return lightOfTheLegion
    }
    // 20 Loxodon Recruiter
    static func LuminousBonds() -> Card {
        let luminousBonds = Card(name: "Luminous Bonds", rarity: .Common, set: set, number: 21)
        luminousBonds.setManaCost("2W")
        luminousBonds.setType(.Enchantment, .Aura)
        luminousBonds.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effects: [
                ({ return $0.withKeyword(.CantAttack) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantBlock) }, .AbilityAddingOrRemoving)
            ])
        luminousBonds.setFlavorText("\"Article 5.8.2 Ensure proper restraint of any and all arms, legs, claws, jaws, tails, tentacles, and tendrils as appropriate.\"\n--Azorius Arrester Procedure, Appendix B")
        return luminousBonds
    }
    static func ParhelionPatrol() -> Card {
        let parhelionPatrol = Card(name: "Parhelion Patrol", rarity: .Common, set: set, number: 22)
        parhelionPatrol.setManaCost("3W")
        parhelionPatrol.setType(.Creature, .Human, .Knight)
        parhelionPatrol.flying = true
        parhelionPatrol.vigilance = true
        parhelionPatrol.triggeredAbilities.append(Mentor(parhelionPatrol))
        parhelionPatrol.setFlavorText("\"Too many have disappeared in these dark days. I am the light that will lead them home.\"")
        parhelionPatrol.power = 2
        parhelionPatrol.toughness = 3
        return parhelionPatrol
    }
    static func RighteousBlow() -> Card {
        let righteousBlow = Card(name: "Righteous Blow", rarity: .Common, set: set, number: 23)
        righteousBlow.setManaCost("W")
        righteousBlow.setType(.Instant)
        righteousBlow.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && ($0.isAttacking || $0.blocking) },
                zones: [.Battlefield]),
            effect: { target in righteousBlow.damage(to: target, 2) }))
        righteousBlow.setFlavorText("\"The Golgari believe they should be given what they deserve. On this we agree.\"\n--Tajic")
        return righteousBlow
    }
    static func RocCharger() -> Card {
        let rocCharger = Card(name: "Roc Charger", rarity: .Uncommon, set: set, number: 24)
        rocCharger.setManaCost("2W")
        rocCharger.setType(.Creature, .Bird)
        rocCharger.flying = true
        rocCharger.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isAttacking && $0.isType(.Creature) && !$0.flying },
                    zones: [.Battlefield]),
                effect: { $0.giveKeywordUntilEndOfTurn(.Flying) }))
        rocCharger.setFlavorText("Rocs' innate fearlessness makes them ideal mounts for emergency response.")
        rocCharger.power = 1
        rocCharger.toughness = 3
        return rocCharger
    }
    // 25 Skyline Scout
    static func SunhomeStalwart() -> Card {
        let sunhomeStalwart = Card(name: "Sunhome Stalwart", rarity: .Uncommon, set: set, number: 26)
        sunhomeStalwart.setManaCost("1W")
        sunhomeStalwart.setType(.Creature, .Human, .Soldier)
        sunhomeStalwart.firstStrike = true
        sunhomeStalwart.triggeredAbilities.append(Mentor(sunhomeStalwart))
        sunhomeStalwart.setFlavorText("\"Before I let you wield one of these, let's see you dodge one!\"")
        sunhomeStalwart.power = 2
        sunhomeStalwart.toughness = 2
        return sunhomeStalwart
    }
    static func SwornCompanions() -> Card {
        let swornCompanions = Card(name: "Sworn Companions", rarity: .Common, set: set, number: 27)
        swornCompanions.setManaCost("2W")
        swornCompanions.setType(.Sorcery)
        swornCompanions.addEffect({
            swornCompanions.getController().createToken(Soldier())
            swornCompanions.getController().createToken(Soldier())
        })
        swornCompanions.setFlavorText("\"The trouble with youths these days is that, in outright defiance of their elders, they refuse to be bought.\"\n--Karlov of the Ghost Council")
        return swornCompanions
    }
    static func TakeHeart() -> Card {
        let takeHeart = Card(name: "Take Heart", rarity: .Common, set: set, number: 28)
        takeHeart.setManaCost("W")
        takeHeart.setType(.Instant)
        takeHeart.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(2, 2)
                takeHeart.getController().gainLife(takeHeart.getController().getCreatures().filter({ $0.isAttacking }).count)
        }))
        takeHeart.setFlavorText("In the quiet before a battle, Boros soldiers whisper prayers that steady their nerves and focus their minds.")
        return takeHeart
    }
    static func TenthDistrictGuard() -> Card {
        let tenthDistrictGuard = Card(name: "Tenth District Guard", rarity: .Common, set: set, number: 29)
        tenthDistrictGuard.setManaCost("1W")
        tenthDistrictGuard.setType(.Creature, .Human, .Soldier)
        tenthDistrictGuard.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.pump(0, 1) }))
        tenthDistrictGuard.setFlavorText("\"The Tenth has always been my home. This city is constantly embroiled in one crisis or another, but I'm determined to protect my piece.\"")
        tenthDistrictGuard.power = 2
        tenthDistrictGuard.toughness = 2
        return tenthDistrictGuard
    }
    // 30 Venerated Loxodon
    // 31 Capture Sphere
    // 32 Chemister's Insight
    // 33 Citywatch Sphinx
    // 34 Dazzling Lights
    // 35 Devious Cover-Up
    // 36 Dimir Informant
    static func DisdainfulStroke() -> Card {
        let disdainfulStroke = Card(name: "Disdainful Stroke", rarity: .Common, set: set, number: 37)
        disdainfulStroke.setManaCost("1U")
        disdainfulStroke.setType(.Instant)
        disdainfulStroke.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isSpell() && $0.getConvertedManaCost() >= 4 },
                zones: [.Stack]),
            effect: { $0.counter() }))
        disdainfulStroke.setFlavorText("\"Laws apply only to those who lack the vision to see past them.\"")
        return disdainfulStroke
    }
    // 38 Dream Eater
    static func DrownedSecrets() -> Card {
        let drownedSecrets = Card(name: "Drowned Secrets", rarity: .Rare, set: set, number: 39)
        drownedSecrets.setManaCost("1U")
        drownedSecrets.setType(.Enchantment)
        drownedSecrets.addTriggeredAbility(
            trigger: .YouCastBlueSpell,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { $0.mill(2) }
        ))
        drownedSecrets.setFlavorText("Beneath Ravnica's streets runs a layer of tunnels, then caverns and waterways, then terrors and nightmares.")
        return drownedSecrets
    }
    // 40 Enhanced Surveillance
    // 41 Guild Summit
    static func Leapfrog() -> Card {
        let leapfrog = Card(name: "Leapfrog", rarity: .Common, set: set, number: 42)
        leapfrog.setManaCost("2U")
        leapfrog.setType(.Creature, .Frog)
        leapfrog.addStaticAbility(
            requirement: AbilityRequirement.This(leapfrog),
            effect: { return $0.getController().numberInstantsOrSorceriesCastThisTurn > 0 ? $0.withKeyword(.Flying) : $0 },
            layer: .AbilityAddingOrRemoving)
        leapfrog.setFlavorText("\"Most compete for insects at street level. Some dwell near Izzet laboratories and ride the thermal updrafts.\"\n--Yolov, Simic bioengineer")
        leapfrog.power = 3
        leapfrog.toughness = 1
        return leapfrog
    }
    // 43 Maximize Altitude
    // 44 Mission Briefing
    static func MurmuringMystic() -> Card {
        let murmuringMystic = Card(name: "Murmuring Mystic", rarity: .Uncommon, set: set, number: 45)
        murmuringMystic.setManaCost("3U")
        murmuringMystic.setType(.Creature, .Human, .Wizard)
        murmuringMystic.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { murmuringMystic.getController().createToken(BirdIllusion()) })
        murmuringMystic.setFlavorText("Rumors float through the city like crows, alighting on citizens seemingly at random.")
        murmuringMystic.power = 1
        murmuringMystic.toughness = 5
        return murmuringMystic
    }
    static func MuseDrake() -> Card {
        let museDrake = Card(name: "Muse Drake", rarity: .Common, set: set, number: 46)
        museDrake.setManaCost("3U")
        museDrake.setType(.Creature, .Drake)
        museDrake.flying = true
        museDrake.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { museDrake.getController().drawCard() })
        museDrake.setFlavorText("A composer wrote a symphony based on the drakes screeching outside her window. Reviews were mixed--except among the drakes.")
        museDrake.power = 1
        museDrake.toughness = 3
        return museDrake
    }
    // 47 Narcomeba
    // 48 Nightveil Sprite
    // 49 Omnispell Adept
    static func PasswallAdept() -> Card {
        let passwallAdept = Card(name: "Passwall Adept", rarity: .Common, set: set, number: 50)
        passwallAdept.setManaCost("1U")
        passwallAdept.setType(.Creature, .Human, .Wizard)
        passwallAdept.addActivatedAbility(
            string: "{2}{U}: Target creature can't be blocked this turn.",
            cost: Cost.Mana("2U"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.giveKeywordUntilEndOfTurn(.Unblockable) }))
        passwallAdept.setFlavorText("\"My doors are called trespassing, my signatures, forgeries. They don't respect my talents, and I don't respect their labels.\"")
        passwallAdept.power = 1
        passwallAdept.toughness = 3
        return passwallAdept
    }
    // 51 Quasiduplicate
    // 52 Radical Idea
    // 53 Selective Snare
    // 54 Sinister Sabotage
    // 55 Thoughtbound Phantasm
    // 56 Unexplained Disappearance
    static func VedalkenMesmerist() -> Card {
        let vedalkenMesmerist = Card(name: "Vedalken Mesmerist", rarity: .Common, set: set , number: 57)
        vedalkenMesmerist.setManaCost("1U")
        vedalkenMesmerist.setType(.Creature, .Vedalken, .Wizard)
        vedalkenMesmerist.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { return $0.isType(.Creature) && $0.getController() !== vedalkenMesmerist.getController()},
                    zones: [.Battlefield]),
                effect: { $0.pump(-2, 0) }))
        vedalkenMesmerist.setFlavorText("\"There's no need to sound the alarm. You are minding your post admirably. I am authorized. All is well.\"")
        vedalkenMesmerist.power = 2
        vedalkenMesmerist.toughness = 1
        return vedalkenMesmerist
    }
    static func WallOfMist() -> Card {
        let wallOfMist = Card(name: "Wall of Mist", rarity: .Common, set: set, number: 58)
        wallOfMist.setManaCost("1U")
        wallOfMist.setType(.Creature, .Wall)
        wallOfMist.defender = true
        wallOfMist.setFlavorText("Fog haunts the streets, rendering the familiar otherworldly, changing neighbors into shadows, and muffling cries for help.")
        wallOfMist.power = 0
        wallOfMist.toughness = 5
        return wallOfMist
    }
    // 59 Watcher in the Mist
    static func WishcoinCrab() -> Card {
        let wishcoinCrab = Card(name: "Wishcoin Crab", rarity: .Common, set: set, number: 60)
        wishcoinCrab.setManaCost("3U")
        wishcoinCrab.setType(.Creature, .Crab)
        wishcoinCrab.setFlavorText("\"What wishes do they grant? Mostly pinching-related ones.\"\n--Omik, superintendant of waterworks")
        wishcoinCrab.power = 2
        wishcoinCrab.toughness = 5
        return wishcoinCrab
    }
    // 61 Barrier of Bones
    static func BartizanBats() -> Card {
        let bartizanBats = Card(name: "Bartizan Bats", rarity: .Common, set: set, number: 62)
        bartizanBats.setManaCost("3B")
        bartizanBats.setType(.Creature, .Bat)
        bartizanBats.flying = true
        bartizanBats.setFlavorText("\"Bats are welcome to eat thousands of my pets. I have multitudes more that will ultimately eat the bats.\"\n--Izoni")
        bartizanBats.power = 3
        bartizanBats.toughness = 1
        return bartizanBats
    }
    // 63 Blood Operative
    static func BurglarRat() -> Card {
        let burglarRat = Card(name: "Burglar Rat", rarity: .Common, set: set, number: 64)
        burglarRat.setManaCost("1B")
        burglarRat.setType(.Creature, .Rat)
        burglarRat.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { burglarRat.eachOpponent({ $0.discard() }) })
        burglarRat.setFlavorText("\"Even rats hoard their treasures. Are your precious things so different?\"\n--Izoni")
        burglarRat.power = 1
        burglarRat.toughness = 1
        return burglarRat
    }
    static func ChildOfNight() -> Card {
        let childOfNight = Card(name: "Child of Night", rarity: .Common, set: set, number: 65)
        childOfNight.setManaCost("1B")
        childOfNight.setType(.Creature, .Vampire)
        childOfNight.lifelink = true
        childOfNight.setFlavorText("No guilds -- that is her rule. The House vampires unnerve her. The Combine would dissect her, the Legion burn her, the Conclave \"cure\" her. The shadows are all the family she needs.")
        childOfNight.power = 2
        childOfNight.toughness = 1
        return childOfNight
    }
    // 66 Creeping Chill
    static func DeadWeight() -> Card {
        let deadWeight = Card(name: "Dead Weight", rarity: .Common, set: set, number: 67)
        deadWeight.setManaCost("B")
        deadWeight.setType(.Enchantment, .Aura)
        deadWeight.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { return $0.pumped(-2, -2) },
            layer: .PowerToughnessChanging)
        deadWeight.setFlavorText("All things considered, his first day on patrol could have gone better.")
        return deadWeight
    }
    // 68 Deadly Visit
    // 69 Doom Whisperer
    static func DouserOfLights() -> Card {
        let douserOfLights = Card(name: "Douser of Lights", rarity: .Common, set: set, number: 70)
        douserOfLights.setManaCost("4B")
        douserOfLights.setType(.Creature, .Horror)
        douserOfLights.setFlavorText("The party of Rakdos revelers cackled and capered as the thing approached. It hissed, and they jabbed their torches at it, giggling when it recoiled. Then, one by one, the torches went out -- and the screaming began.")
        douserOfLights.power = 4
        douserOfLights.toughness = 5
        return douserOfLights
    }
    // 71 Gruesome Menagerie
    static func HiredPoisoner() -> Card {
        let hiredPoisoner = Card(name: "Hired Poisoner", rarity: .Common, set: set, number: 72)
        hiredPoisoner.setManaCost("B")
        hiredPoisoner.setType(.Creature, .Human, .Assassin)
        hiredPoisoner.deathtouch = true
        hiredPoisoner.setFlavorText("\"They don't even feel the cut. I'm ordering a drink in a nearby tavern before anyone notices something's wrong.\"")
        hiredPoisoner.power = 1
        hiredPoisoner.toughness = 1
        return hiredPoisoner
    }
    // 73 Kraul Swarm
    static func LotlethGiant() -> Card {
        let lotlethGiant = Card(name: "Lotleth Giant", rarity: .Common, set: set, number: 74)
        lotlethGiant.setManaCost("6B")
        lotlethGiant.setType(.Creature, .Zombie, .Giant)
        lotlethGiant.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== lotlethGiant.getController() }),
                effect: { target in
                    let creaturesInGraveyard = lotlethGiant.getController().getGraveyard().filter({ $0.isType(.Creature) }).count
                    lotlethGiant.damage(to: target, creaturesInGraveyard)
        }))
        lotlethGiant.setFlavorText("\"I prefer the big and looming to the small and skittering.\"\n--Cevraya, Golgari shaman")
        lotlethGiant.power = 6
        lotlethGiant.toughness = 5
        return lotlethGiant
    }
    static func MausoleumSecrets() -> Card {
        let mausoleumSecrets = Card(name: "Mausoleum Secrets", rarity: .Rare, set: set, number: 75)
        mausoleumSecrets.setManaCost("1B")
        mausoleumSecrets.setType(.Instant)
        mausoleumSecrets.addEffect({
            mausoleumSecrets.getController().chooseCard(
                from: mausoleumSecrets.getController().getLibrary(),
                restriction: { object in
                    let numCreaturesInGraveyard = mausoleumSecrets.getController().getGraveyard().filter({ $0.isType(.Creature) }).count
                    return object.isColor(.Black) && object.getConvertedManaCost() <= numCreaturesInGraveyard
                },
                action: { chosen, rest in chosen?.putIntoHand() })
            mausoleumSecrets.getController().shuffleLibrary()
        })
        return mausoleumSecrets
    }
    // 76 Mephitic Vapors
    static func MidnightReaper() -> Card {
        let midnightReaper = Card(name: "Midnight Reaper", rarity: .Rare, set: set, number: 77)
        midnightReaper.setManaCost("2B")
        midnightReaper.setType(.Creature, .Zombie, .Knight)
        midnightReaper.addTriggeredAbility(
            trigger: .NontokenCreatureYouControlDies,
            effect: {
                // TODO: Should use last known information to get controller if midnight reaper is the one dying
                midnightReaper.damage(to: midnightReaper.getController(), 1)
                midnightReaper.getController().drawCard()
        })
        midnightReaper.setFlavorText("No one welcomes his visit, yet all must grant him tribute.")
        midnightReaper.power = 3
        midnightReaper.toughness = 2
        return midnightReaper
    }
    // 78 Moodmark Painter
    // 79 Necrotic Wound
    static func NeverHappened() -> Card {
        let neverHappened = Card(name: "Never Happened", rarity: .Common, set: set, number: 80)
        neverHappened.setManaCost("2B")
        neverHappened.setType(.Sorcery)
        neverHappened.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.SinglePlayer(
                restriction: { $0 !== neverHappened.getController() }),
            effect: { target in
                neverHappened.getController().chooseCard(
                    from: target.getHand() + target.getGraveyard(),
                    restriction: { !$0.isType(.Land) },
                    action: { chosen, rest in chosen?.exile() })
        }))
        neverHappened.setFlavorText("Dimir assassins have the precision to slay a single memory.")
        return neverHappened
    }
    static func PilferingImp() -> Card {
        let pilferingImp = Card(name: "Pilfering Imp", rarity: .Uncommon, set: set, number: 81)
        pilferingImp.setManaCost("B")
        pilferingImp.setType(.Creature, .Imp)
        pilferingImp.flying = true
        pilferingImp.addActivatedAbility(
            string: "{1}{B}, {T}, Sacrifice ~: Target opponent reveals their hand. You choose a nonland card from it. That player discards that card. Activate this ability only any time you could cast a sorcery.",
            cost: Cost.Mana("1B").Tap().Sacrifice(),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== pilferingImp.getController() }),
                effect: { target in
                    pilferingImp.getController().chooseCard(
                        from: target.getHand(),
                        restriction: { !$0.isType(.Land) },
                        action: { chosen, rest in chosen?.discard() })
                }),
            manaAbility: false,
            sorcerySpeed: true)
        pilferingImp.power = 1
        pilferingImp.toughness = 1
        return pilferingImp
    }
    // 82 Plaguecrafter
    // 83 Price of Fame
    static func RitualOfSoot() -> Card {
        let ritualOfSoot = Card(name: "Ritual of Soot", rarity: .Rare, set: set, number: 84)
        ritualOfSoot.setManaCost("2BB")
        ritualOfSoot.setType(.Sorcery)
        ritualOfSoot.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getConvertedManaCost() <= 3 {
                        _ = creature.destroy()
                    }
                }
            })
        }
        ritualOfSoot.setFlavorText("Only the patrol's armor was found, so tainted with the acrid smell of sudden death that it could never be worn again.")
        return ritualOfSoot
    }
    // 85 Severed Strands
    static func SpinalCentipede() -> Card {
        let spinalCentipede = Card(name: "Spinal Centipede", rarity: .Common, set: set, number: 86)
        spinalCentipede.setManaCost("2B")
        spinalCentipede.setType(.Creature, .Insect)
        spinalCentipede.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === spinalCentipede.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        spinalCentipede.setFlavorText("The Golgari adorn themselves with the exoskeletons of iridescent insects. It's only fair the insects do likewise.")
        spinalCentipede.power = 3
        spinalCentipede.toughness = 2
        return spinalCentipede
    }
    // 87 Undercity Necrolisk
    static func VeiledShade() -> Card {
        let veiledShade = Card(name: "Veiled Shade", rarity: .Common, set: set, number: 88)
        veiledShade.setManaCost("2B")
        veiledShade.setType(.Creature, .Shade)
        veiledShade.addActivatedAbility(
            string: "{1}{B}: ~ gets +1/+1 until end of turn.",
            cost: Cost.Mana("1B"),
            effect: { veiledShade.pump(1, 1) })
        veiledShade.setFlavorText("\"I sang songs of sorrow for my lost love. Imagine my horror when, one night, they were answered.\"\n--Milana, Orzgov prelate")
        veiledShade.power = 2
        veiledShade.toughness = 2
        return veiledShade
    }
    static func ViciousRumors() -> Card {
        let viciousRumors = Card(name: "Vicious Rumors", rarity: .Common, set: set, number: 89)
        viciousRumors.setManaCost("B")
        viciousRumors.setType(.Sorcery)
        viciousRumors.addEffect({
            viciousRumors.eachOpponent({ opponent in
                viciousRumors.damage(to: opponent, 1)
                opponent.discard()
                opponent.mill(1)
            })
            viciousRumors.getController().gainLife(1)
        })
        viciousRumors.setFlavorText("\"The alliances were already frayed. All we do is find the loose threads and pluck.\"\n--Lazav")
        return viciousRumors
    }
    // 90 Whispering Snitch
    static func ArclightPhoenix() -> Card {
        let arclightPhoenix = Card(name: "Arclight Phoenix", rarity: .Mythic, set: set, number: 91)
        arclightPhoenix.setManaCost("3R")
        arclightPhoenix.setType(.Creature, .Phoenix)
        arclightPhoenix.flying = true
        arclightPhoenix.haste = true
        arclightPhoenix.addTriggeredAbility(
            trigger: .YourBeginCombat,
            effect: { arclightPhoenix.putOntoBattlefield() },
            restriction: { arclightPhoenix.getController().numberInstantsOrSorceriesCastThisTurn >= 3 &&  arclightPhoenix.getZone() == .Graveyard },
            triggersInGraveyard: true)
        arclightPhoenix.setFlavorText("Some storms never blow over.")
        arclightPhoenix.power = 3
        arclightPhoenix.toughness = 2
        return arclightPhoenix
    }
    static func BargingSergeant() -> Card {
        let bargingSergeant = Card(name: "Barging Sergeant", rarity: .Common, set: set, number: 92)
        bargingSergeant.setManaCost("4R")
        bargingSergeant.setType(.Creature, .Minotaur, .Soldier)
        bargingSergeant.haste = true
        bargingSergeant.triggeredAbilities.append(Mentor(bargingSergeant))
        bargingSergeant.setFlavorText("\"Don't stop till your horns come out their back.\"")
        bargingSergeant.power = 4
        bargingSergeant.toughness = 2
        return bargingSergeant
    }
    // 93 Book Devourer
    static func CommandTheStorm() -> Card {
        let commandTheStorm = Card(name: "Command the Storm", rarity: .Common, set: set, number: 94)
        commandTheStorm.setManaCost("4R")
        commandTheStorm.setType(.Instant)
        commandTheStorm.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in commandTheStorm.damage(to: target, 5) }))
        commandTheStorm.setFlavorText("In the wake of Niv-Mizzet's disappearance, Ral found himself leading the guild. He had dreamed of this day, but couldn't help feeling like a pawn in someone else's game.")
        return commandTheStorm
    }
    // 95 Cosmotronic Wave
    // 96 Direct Current
    static func ElectrostaticField() -> Card {
        let electrostaticField = Card(name: "Electrostatic Field", rarity: .Uncommon, set: set, number: 97)
        electrostaticField.setManaCost("1R")
        electrostaticField.setType(.Creature, .Wall)
        electrostaticField.defender = true
        electrostaticField.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { electrostaticField.eachOpponent({ electrostaticField.damage(to: $0, 1) }) })
        electrostaticField.setFlavorText("\"It's both an ingress-denial mechanism and an attractive hallway light!\"\n--Daxiver, Izzet electromancer")
        electrostaticField.power = 0
        electrostaticField.toughness = 4
        return electrostaticField
    }
    // 98 Erratic Cyclops
    // 99 Experimental Frenzy
    static func FearlessHalberdier() -> Card {
        let fearlessHalberdier = Card(name: "Fearless Halberdier", rarity: .Common, set: set, number: 100)
        fearlessHalberdier.setManaCost("2R")
        fearlessHalberdier.setType(.Creature, .Human, .Warrior)
        fearlessHalberdier.setFlavorText("\"I spent some time in the Legion, but I'm done taking orders all  day.\"")
        fearlessHalberdier.power = 3
        fearlessHalberdier.toughness = 2
        return fearlessHalberdier
    }
    static func FireUrchin() -> Card {
        let fireUrchin = Card(name: "Fire Urchin", rarity: .Common, set: set, number: 101)
        fireUrchin.setManaCost("1R")
        fireUrchin.setType(.Creature, .Elemental)
        fireUrchin.trample = true
        fireUrchin.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { fireUrchin.pump(1, 0) })
        fireUrchin.setFlavorText("Rain runoff in the Smelting District is known to spontaneously burst into flame.")
        fireUrchin.power = 1
        fireUrchin.toughness = 3
        return fireUrchin
    }
    static func GoblinBanneret() -> Card {
        let goblinBanneret = Card(name: "Goblin Banneret", rarity: .Uncommon, set: set, number: 102)
        goblinBanneret.setManaCost("R")
        goblinBanneret.setType(.Creature, .Goblin, .Soldier)
        goblinBanneret.triggeredAbilities.append(Mentor(goblinBanneret))
        goblinBanneret.addActivatedAbility(
            string: "{1}{R}: ~ gets +2/+0 until end of turn.",
            cost: Cost.Mana("1R"),
            effect: { goblinBanneret.pump(2, 0) })
        goblinBanneret.setFlavorText("The Boros banner stands tall even if its bearer doesn't.")
        goblinBanneret.power = 1
        goblinBanneret.toughness = 1
        return goblinBanneret
    }
    // 103 Golin Cratermaker
    // 104 Goblin Locksmith
    // 105 Gravitic Punch
    static func HellkiteWhelp() -> Card {
        let hellkiteWhelp = Card(name: "Hellkite Whelp", rarity: .Uncommon, set: set, number: 106)
        hellkiteWhelp.setManaCost("4R")
        hellkiteWhelp.setType(.Creature, .Dragon)
        hellkiteWhelp.flying = true
        hellkiteWhelp.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { return $0.isType(.Creature) && $0.getController() !== hellkiteWhelp.getController() },
                    zones: [.Battlefield]),
                effect: { target in hellkiteWhelp.damage(to: target, 1) }))
        hellkiteWhelp.setFlavorText("\"They play by spitting fire at each other. Don't be offended if one gives you a love-scorch.\"\n--Esfir, Rakdos drangon wrangler")
        hellkiteWhelp.power = 3
        hellkiteWhelp.toughness = 3
        return hellkiteWhelp
    }
    static func InescapableBlaze() -> Card {
        let inescapableBlaze = Card(name: "Inescapable Blaze", rarity: .Uncommon, set: set, number: 107)
        inescapableBlaze.setManaCost("4RR")
        inescapableBlaze.setType(.Instant)
        inescapableBlaze.uncounterable = true
        inescapableBlaze.addEffect(TargetedEffect(
            restriction: TargetingRestriction.AnyTarget(),
            effect: { inescapableBlaze.damage(to: $0, 6) }))
        inescapableBlaze.setFlavorText("\"The Izzet are blamed for every little disaster, which is unfair because we only cause most of them.\"\n--Mizzix of the Izmagnus")
        return inescapableBlaze
    }
    // 108 Lava Coil
    // 109 Legion Warboss
    static func ManiacalRage() -> Card {
        let maniacalRage = Card(name: "Maniacal Rage", rarity: .Common, set: set, number: 110)
        maniacalRage.setManaCost("1R")
        maniacalRage.setType(.Enchantment, .Aura)
        maniacalRage.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effects: [
                ({ return $0.pumped(2, 2) }, .PowerToughnessChanging),
                ({ return $0.withKeyword(.CantBlock) }, .AbilityAddingOrRemoving)
            ])
        maniacalRage.setFlavorText("\"They tell us the wilds are ours, then they brick them over. They can lie to our faces but not to our fists.\"\n--Ghut Rak, Gruul guildmage")
        return maniacalRage
    }
    // 111 Maximize Velocity
    // 112 Ornery Goblin
    // 113 Risk Factor
    static func RubblebeltBoar() -> Card {
        let rubblebeltBoar = Card(name: "Rubblebelt Boar", rarity: .Common, set: set, number: 114)
        rubblebeltBoar.setManaCost("3R")
        rubblebeltBoar.setType(.Creature, .Boar)
        rubblebeltBoar.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.pump(2, 0) }))
        rubblebeltBoar.setFlavorText("Some Gruul druis believe that boars are spawn of the great Illharg, the mighty Raze-Boar who will one day rise and level the city.")
        rubblebeltBoar.power = 3
        rubblebeltBoar.toughness = 3
        return rubblebeltBoar
    }
    static func RunawaySteamKin() -> Card {
        let runawaySteamKin = Card(name: "Runaway Steam-Kin", rarity: .Rare, set: set, number: 115)
        runawaySteamKin.setManaCost("1R")
        runawaySteamKin.setType(.Creature, .Elemental)
        runawaySteamKin.addTriggeredAbility(
            trigger: .YouCastRedSpell,
            effect: { runawaySteamKin.addCounter(.PlusOnePlusOne) },
            restriction: { runawaySteamKin.getCounters(.PlusOnePlusOne) < 3 })
        runawaySteamKin.addActivatedAbility(
            string: "Remove three +1/+1 counters from ~: Add {R}{R}{R}.",
            cost: Cost.RemoveCounters(.PlusOnePlusOne, 3),
            effect: { runawaySteamKin.getController().addMana(color: .Red) })
        runawaySteamKin.power = 1
        runawaySteamKin.toughness = 1
        return runawaySteamKin
    }
    static func SmeltWardMinotaur() -> Card {
        let smeltWardMinotaur = Card(name: "Smelt-Ward Minotaur", rarity: .Uncommon, set: set, number: 116)
        smeltWardMinotaur.setManaCost("2R")
        smeltWardMinotaur.setType(.Creature, .Minotaur, .Warrior)
        smeltWardMinotaur.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== smeltWardMinotaur.getController() },
                    zones: [.Battlefield]),
                effect: { $0.giveKeywordUntilEndOfTurn(.CantBlock) }))
        smeltWardMinotaur.setFlavorText("\"Don't arrest him--enlist him!\"\n--Commander Yaszen")
        smeltWardMinotaur.power = 2
        smeltWardMinotaur.toughness = 3
        return smeltWardMinotaur
    }
    static func StreetRiot() -> Card {
        let streetRiot = Card(name: "Street Riot", rarity: .Uncommon, set: set, number: 117)
        streetRiot.setManaCost("4R")
        streetRiot.setType(.Enchantment)
        let condition: (Object) -> Bool = { $0.getController().active }
        streetRiot.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(source: streetRiot),
            effects: [
                ({ return condition($0) ? $0.pumped(1, 0) : $0 }, .PowerToughnessChanging),
                ({ return condition($0) ? $0.withKeyword(.Trample) : $0 }, .AbilityAddingOrRemoving),
            ])
        streetRiot.setFlavorText("\"They said obey and you'll be happy. They said you'll be safe. But we're not safe. We're not happy. And we will not obey.\"\n--Domri Rade")
        return streetRiot
    }
    static func SureStrike() -> Card {
        let sureStrike = Card(name: "Sure Strike", rarity: .Common, set: set, number: 118)
        sureStrike.setManaCost("1R")
        sureStrike.setType(.Instant)
        sureStrike.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(3, 0)
                target.giveKeywordUntilEndOfTurn(.FirstStrike)
        }))
        sureStrike.setFlavorText("\"I packed three more electroconduits into each test wand. You'll experiene a brief tingling sensation.\"")
        return sureStrike
    }
    static func TorchCourier() -> Card {
        let torchCourier = Card(name: "Torch Courier", rarity: .Common, set: set, number: 119)
        torchCourier.setManaCost("R")
        torchCourier.setType(.Creature, .Goblin)
        torchCourier.haste = true
        torchCourier.addActivatedAbility(
            string: "Sacrifice ~: Another target creature gains haste until end of turn.",
            cost: Cost.Tap().Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != torchCourier && $0.isType(.Creature) },
                    zones: [.Battlefield]),
                effect: { $0.giveKeywordUntilEndOfTurn(.Haste) }))
        torchCourier.setFlavorText("\"Light a torch and deliver this letter\" were his instructions, which he unfortunately reversed.")
        torchCourier.power = 1
        torchCourier.toughness = 1
        return torchCourier
    }
    // 120 Wojek Bodyguard
    static func AffectionateIndrik() -> Card {
        let affectionateIndrik = Card(name: "Affectionate Indrik", rarity: .Uncommon, set: set, number: 121)
        affectionateIndrik.setManaCost("5G")
        affectionateIndrik.setType(.Creature, .Beast)
        affectionateIndrik.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== affectionateIndrik.getController() },
                    zones: [.Battlefield],
                    optional: true),
                effect: { affectionateIndrik.fight($0) }))
        affectionateIndrik.setFlavorText("The problem isn't the indrik's enthusiasm, it's Ravnica's lack of guardrails.")
        affectionateIndrik.power = 4
        affectionateIndrik.toughness = 4
        return affectionateIndrik
    }
    // 122 Arboretum Elemental
    static func BeastWhisperer() -> Card {
        let beastWhisperer = Card(name: "Beast Whisperer", rarity: .Rare, set: set, number: 123)
        beastWhisperer.setManaCost("2GG")
        beastWhisperer.setType(.Creature, .Elf, .Druid)
        beastWhisperer.addTriggeredAbility(
            trigger: .YouCastCreatureSpell,
            effect: { beastWhisperer.getController().drawCard() })
        beastWhisperer.setFlavorText("\"The tiniest mouse speaks louder to me than all the festival crowds on Tin Street.\"")
        beastWhisperer.power = 2
        beastWhisperer.toughness = 3
        return beastWhisperer
    }
    static func BountyOfMight() -> Card {
        let bountyOfMight = Card(name: "Bounty of Might", rarity: .Rare, set: set, number: 124)
        bountyOfMight.setManaCost("4GG")
        bountyOfMight.setType(.Instant)
        bountyOfMight.addEffect(TargetedEffect.MultiObject(
            restrictions: [TargetingRestriction.TargetCreature(), TargetingRestriction.TargetCreature(), TargetingRestriction.TargetCreature()],
            effect: { targets in
                for target in targets {
                    target?.pump(3, 3)
                }
            }))
        bountyOfMight.setFlavorText("\"I am the very soul of battle, but even I would never advise open war with the Conclave.\"\n--Aurelia")
        return bountyOfMight
    }
    // 125 Circuitous Route
    // 126 Crushing Canopy
    static func DevkarinDissident() -> Card {
        let devkarinDissident = Card(name: "Devkarin Dissident", rarity: .Common, set: set, number: 127)
        devkarinDissident.setManaCost("1G")
        devkarinDissident.setType(.Creature, .Elf, .Warrior)
        devkarinDissident.addActivatedAbility(
            string: "{4}{G}: ~ gets +2/+2 until end of turn.",
            cost: Cost.Mana("4G"),
            effect: { devkarinDissident.pump(2, 2) })
        devkarinDissident.setFlavorText("\"This is Mileva, in the Tenth. We've got an elf in the plaza with a chip on her shoulder. Actually, it's more of a morningstar.\"")
        devkarinDissident.power = 2
        devkarinDissident.toughness = 2
        return devkarinDissident
    }
    static func DistrictGuide() -> Card {
        let districtGuide = Card(name: "District Guide", rarity: .Uncommon, set: set, number: 128)
        districtGuide.setManaCost("2G")
        districtGuide.setType(.Creature, .Elf, .Scout)
        districtGuide.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { districtGuide.getController().chooseCard(
                from: districtGuide.getController().getLibrary(),
                restriction: { $0.isBasicLand() || $0.isType(.Gate) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    districtGuide.getController().shuffleLibrary()
                })
            },
            effectOptional: true)
        districtGuide.setFlavorText("\"The route is direct but challenging. Incidentally, how are you with heights?\"")
        districtGuide.power = 2
        districtGuide.toughness = 2
        return districtGuide
    }
    static func GenerousStray() -> Card {
        let generousStray = Card(name: "Generous Stray", rarity: .Common, set: set, number: 129)
        generousStray.setManaCost("2G")
        generousStray.setType(.Creature, .Cat)
        generousStray.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { generousStray.getController().drawCard() })
        generousStray.setFlavorText("Cats place their gifts with care, so that a bare foot will step on them in the middle of the night.")
        generousStray.power = 1
        generousStray.toughness = 2
        return generousStray
    }
    static func GolgariRaiders() -> Card {
        let golgariRaiders = Card(name: "Golgari Raiders", rarity: .Uncommon, set: set, number: 130)
        golgariRaiders.setManaCost("3G")
        golgariRaiders.setType(.Creature, .Elf, .Warrior)
        golgariRaiders.haste = true
        golgariRaiders.addReplacementEffect(
            event: .ThisETB,
            effect: {
                let undergrowthCount = golgariRaiders.getController().getGraveyard().filter({ $0.isType(.Creature) }).count
                golgariRaiders.addCounters(.PlusOnePlusOne, undergrowthCount)
        })
        golgariRaiders.setFlavorText("What the Golgari can't claim through patient undercity expansion, they seize in brazen topside sorties.")
        golgariRaiders.power = 0
        golgariRaiders.toughness = 0
        return golgariRaiders
    }
    static func GrapplingSundew() -> Card {
        let grapplingSundew = Card(name: "Grappling Sundew", rarity: .Uncommon, set: set, number: 131)
        grapplingSundew.setManaCost("1G")
        grapplingSundew.setType(.Creature, .Plant)
        grapplingSundew.defender = true
        grapplingSundew.reach = true
        grapplingSundew.addActivatedAbility(
            string: "{4}{G}: ~ gains indestructible until end of turn.",
            cost: Cost.Mana("4G"),
            effect: { grapplingSundew.giveKeywordUntilEndOfTurn(.Indestructible) })
        grapplingSundew.setFlavorText("Some rooftop gardens attract bees; others capture dragons.")
        grapplingSundew.power = 0
        grapplingSundew.toughness = 4
        return grapplingSundew
    }
    static func HatcherySpider() -> Card {
        let hatcherySpider = Card(name: "Hatchery Spider", rarity: .Rare, set: set, number: 132)
        hatcherySpider.setManaCost("5GG")
        hatcherySpider.setType(.Creature, .Spider)
        hatcherySpider.reach = true
        hatcherySpider.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let undergrowth = hatcherySpider.getController().getGraveyard().filter({ $0.isType(.Creature) }).count
                hatcherySpider.getController().chooseCard(
                    from: Array(hatcherySpider.getController().getLibrary().suffix(undergrowth)),
                    restriction: { $0.isColor(.Green) && $0.isPermanent() && $0.getConvertedManaCost() <= undergrowth },
                    action: { chosen, rest in
                        chosen?.putOntoBattlefield()
                        hatcherySpider.getController().putOnBottomOfLibrary(&rest, random: true)
                })
        })
        hatcherySpider.power = 5
        hatcherySpider.toughness = 7
        return hatcherySpider
    }
    static func HitchclawRecluse() -> Card {
        let hitchlawRecluse = Card(name: "Hitchclaw Recluse", rarity: .Common, set: set, number: 133)
        hitchlawRecluse.setManaCost("2G")
        hitchlawRecluse.setType(.Creature, .Spider)
        hitchlawRecluse.reach = true
        hitchlawRecluse.setFlavorText("Nearly invisible strands of web reach far beyond its lair to alert it of the approach of prey.")
        hitchlawRecluse.power = 1
        hitchlawRecluse.toughness = 4
        return hitchlawRecluse
    }
    static func IronshellBeetle() -> Card {
        let ironshellBeetle = Card(name: "Ironshell Beetle", rarity: .Common, set: set, number: 134)
        ironshellBeetle.setManaCost("1G")
        ironshellBeetle.setType(.Creature, .Insect)
        ironshellBeetle.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        ironshellBeetle.setFlavorText("\"Please don't feed the beetles.\"\n--Promenade warning sign")
        ironshellBeetle.power = 1
        ironshellBeetle.toughness = 1
        return ironshellBeetle
    }
    static func KraulForagers() -> Card {
        let kraulForagers = Card(name: "Kraul Foragers", rarity: .Common, set: set, number: 135)
        kraulForagers.setManaCost("4G")
        kraulForagers.setType(.Creature, .Insect, .Scout)
        kraulForagers.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let creaturesInGraveyard = kraulForagers.getController().getGraveyard().filter({$0.isType(.Creature)}).count
                kraulForagers.getController().gainLife(creaturesInGraveyard)
            })
        kraulForagers.setFlavorText("Feed on food, you eventually rot. Feed on rot, you live forever.\n--Kraul saying")
        kraulForagers.power = 4
        kraulForagers.toughness = 4
        return kraulForagers
    }
    // 136 Kraul Harpooner
    static func MightOfTheMasses() -> Card {
        let mightOfTheMasses = Card(name: "Might of the Masses", rarity: .Uncommon, set: set, number: 137)
        mightOfTheMasses.setManaCost("G")
        mightOfTheMasses.setType(.Instant)
        mightOfTheMasses.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                let x = mightOfTheMasses.getController().getCreatures().count
                target.pump(x, x)
        }))
        mightOfTheMasses.setFlavorText("\"There is nothing stronger than many hearts united for a single cause.\"\n--Emmara")
        return mightOfTheMasses
    }
    // 138 Nullhide Ferox
    // 139 Pack's Favor
    // 140 Pause for Reflection
    // 141 Pelt Collector
    // 142 Portcullis Vine
    static func PreyUpon() -> Card {
        let preyUpon = Card(name: "Prey Upon", rarity: .Common, set: set, number: 143)
        preyUpon.setManaCost("G")
        preyUpon.setType(.Sorcery)
        preyUpon.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === preyUpon.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== preyUpon.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                if let myCreature = targets[0], let theirCreature = targets[1] {
                    myCreature.fight(theirCreature)
                }
        }))
        preyUpon.setFlavorText("\"Light up the dark to find your way, and the dark may seek you out.\"\n--Zalin the Gutter Bard")
        return preyUpon
    }
    // 144 Siege Wurm
    // 145 Sprouting Renewal
    // 146 Urban Utopia
    // 147 Vigorspore Wurm
    // 148 Vivid Revival
    static func WaryOkapi() -> Card {
        let waryOkapi = Card(name: "Wary Okapi", rarity: .Common, set: set, number: 149)
        waryOkapi.setManaCost("2G")
        waryOkapi.setType(.Creature, .Antelope)
        waryOkapi.vigilance = true
        waryOkapi.setFlavorText("\"Be like the grazers of the Saruli. Keep your herd close, and stay alert for encroaching danger.\"\n--Lalia, Selesnya dryad")
        waryOkapi.power = 3
        waryOkapi.toughness = 2
        return waryOkapi
    }
    static func WildCeratok() -> Card {
        let wildCeratok = Card(name: "Wild Ceratok", rarity: .Common, set: set, number: 150)
        wildCeratok.setManaCost("3G")
        wildCeratok.setType(.Creature, .Rhino)
        wildCeratok.setFlavorText("Once part of a wealthy merchant's private zoo, the herd roams feral throughout the Tenth, where it will remain until the guilds can agree to relocate, cull, or befriend it.")
        wildCeratok.power = 4
        wildCeratok.toughness = 3
        return wildCeratok
    }
    // 151 Artful Takedown
    // 152 Assassin's Trophy
    static func AureliaExemplarOfJustice() -> Card {
        let aurelia = Card(name: "Aurelia, Exemplar of Justice", rarity: .Mythic, set: set, number: 153)
        aurelia.setManaCost("2RW")
        aurelia.setType(.Legendary, .Creature, .Angel)
        aurelia.flying = true
        aurelia.triggeredAbilities.append(Mentor(aurelia))
        aurelia.addTriggeredAbility(
            trigger: .YourBeginCombat,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === aurelia.getController() },
                    zones: [.Battlefield],
                    optional: true),
                effect: { target in
                    target.pump(2, 0)
                    if target.isColor(.Red) {
                        target.giveKeywordUntilEndOfTurn(.Trample)
                    }
                    if target.isColor(.White) {
                        target.giveKeywordUntilEndOfTurn(.Vigilance)
                    }
        }))
        aurelia.power = 2
        aurelia.toughness = 5
        return aurelia
    }
    // 154 Beacon Bolt
    // 155 Beamsplitter Mage
    static func BorosChallenger() -> Card {
        let borosChallenger = Card(name: "Boros Challenger", rarity: .Uncommon, set: set, number: 156)
        borosChallenger.setManaCost("RW")
        borosChallenger.setType(.Creature, .Human, .Soldier)
        borosChallenger.triggeredAbilities.append(Mentor(borosChallenger))
        borosChallenger.addActivatedAbility(
            string: "{2}{R}{W}: ~ gets +1/+1 until end of turn.",
            cost: Cost.Mana("2RW"),
            effect: { borosChallenger.pump(1, 1) })
        borosChallenger.setFlavorText("\"Send your champion. I could use a light workout.\"")
        borosChallenger.power = 2
        borosChallenger.toughness = 3
        return borosChallenger
    }
    static func Camaraderie() -> Card {
        let camaraderie = Card(name: "Camaraderie", rarity: .Rare, set: set, number: 157)
        camaraderie.setManaCost("4GW")
        camaraderie.setType(.Sorcery)
        camaraderie.addEffect {
            let numCreatures = camaraderie.getController().getCreatures().count
            camaraderie.getController().gainLife(numCreatures)
            camaraderie.getController().drawCards(numCreatures)
            camaraderie.getController().getCreatures().forEach({ $0.pump(1, 1) })
        }
        camaraderie.setFlavorText("\"Within the song of Mat'Selesnya, one becomes all.\"\n--Heruj, Selesnya hierophant")
        return camaraderie
    }
    static func CentaurPeacemaker() -> Card {
        let centaurPeacemaker = Card(name: "Centaur Peacemaker", rarity: .Common, set: set, number: 158)
        centaurPeacemaker.setManaCost("1GW")
        centaurPeacemaker.setType(.Creature, .Centaur, .Cleric)
        centaurPeacemaker.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { Game.shared.bothPlayers({$0.gainLife(4)}) })
        centaurPeacemaker.setFlavorText("\"Please accept this offering. I sincerely hope to leave my mace at my side.\"")
        centaurPeacemaker.power = 3
        centaurPeacemaker.toughness = 3
        return centaurPeacemaker
    }
    // 159 Chance for Glory
    // 160 Charnel Troll
    static func ConclaveCavalier() -> Card {
        let conclaveCavalier = Card(name: "ConclaveCavalier", rarity: .Uncommon, set: set, number: 161)
        conclaveCavalier.setManaCost("GGWW")
        conclaveCavalier.setType(.Creature, .Centaur, .Knight)
        conclaveCavalier.vigilance = true
        conclaveCavalier.addTriggeredAbility(
            trigger: .ThisDies,
            effect: {
                conclaveCavalier.getController().createToken(ElfKnight())
                conclaveCavalier.getController().createToken(ElfKnight())
            })
        conclaveCavalier.setFlavorText("\"Just as leaves fall and the tree blooms again, one day I will fall and the Conclave will endure.\"")
        conclaveCavalier.power = 4
        conclaveCavalier.toughness = 4
        return conclaveCavalier
    }
    static func ConclaveGuildmage() -> Card {
        let conclaveGuildmage = Card(name: "Conclave Guildmage", rarity: .Uncommon, set: set, number: 162)
        conclaveGuildmage.setManaCost("GW")
        conclaveGuildmage.setType(.Creature, .Elf, .Cleric)
        conclaveGuildmage.addActivatedAbility(
            string: "{G}, {T}: Creatures you control gain trample until end of turn.",
            cost: Cost.Mana("G").Tap(),
            effect: { conclaveGuildmage.getController().getCreatures().forEach({ creature in
                creature.giveKeywordUntilEndOfTurn(.Trample)
            })
        })
        conclaveGuildmage.addActivatedAbility(
            string: "{5}{W}, {T}: Create a 2/2 green and white Elf Knight creature token with vigilance.",
            cost: Cost.Mana("5W").Tap(),
            effect: { conclaveGuildmage.getController().createToken(ElfKnight()) })
        conclaveGuildmage.power = 2
        conclaveGuildmage.toughness = 2
        return conclaveGuildmage
    }
    static func CracklingDrake() -> Card {
        let cracklingDrake = Card(name: "Crackling Drake", rarity: .Uncommon, set: set, number: 163)
        cracklingDrake.setManaCost("UURR")
        cracklingDrake.setType(.Creature, .Drake)
        cracklingDrake.flying = true
        cracklingDrake.addStaticAbility(
            requirement: AbilityRequirement.This(cracklingDrake),
            effect: { object in
                let instSorcInGraveyard = object.getController().getGraveyard().filter({ $0.isType(.Instant) || $0.isType(.Sorcery) }).count
                let instSorcInExile = Game.shared.exile.filter({ $0.getOwner() === object.getController() }).count
                object.power = instSorcInGraveyard + instSorcInExile
                return object
            },
            layer: .PowerToughnessCDA,
            allZones: true)
        cracklingDrake.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { cracklingDrake.getController().drawCard() })
        cracklingDrake.toughness = 4
        return cracklingDrake
    }
    // 164 Darkblade Agent
    // 165 Deafening Clarion
    // 166 Dimir Spybug
    // 167 Disinformation Campaign
    static func EmmaraSoulOfTheAccord() -> Card {
        let emmara = Card(name: "Emmara, Soul of the Accord", rarity: .Rare, set: set, number: 168)
        emmara.setManaCost("GW")
        emmara.setType(.Legendary, .Creature, .Elf, .Cleric)
        emmara.addTriggeredAbility(
            trigger: .ThisBecomesTapped,
            effect: { emmara.getController().createToken(Soldier()) })
        emmara.setFlavorText("\"Whatever hatred destroys, a single act of trust can revive.\"")
        emmara.power = 2
        emmara.toughness = 2
        return emmara
    }
    // 169 Erstwhile Trooper
    // 170 Etrata, the Silencer
    static func FiremindsResearch() -> Card {
        let firemindsResearch = Card(name: "Firemind's Research", rarity: .Rare, set: set, number: 171)
        firemindsResearch.setManaCost("UR")
        firemindsResearch.setType(.Enchantment)
        firemindsResearch.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { firemindsResearch.addCounter(.Charge) })
        firemindsResearch.addActivatedAbility(
            string: "{1}{U}, Remove two charge counters from ~: Draw a card",
            cost: Cost.Mana("1U").RemoveCounters(.Charge, 2),
            effect: { firemindsResearch.getController().drawCard() })
        firemindsResearch.addActivatedAbility(
            string: "{1}{R}, Remove five charge counters from ~: It deals 5 damage to any target.",
            cost: Cost.Mana("1R").RemoveCounters(.Charge, 5),
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { firemindsResearch.damage(to: $0, 5) }))
        return firemindsResearch
    }
    static func GarrisonSergeant() -> Card {
        let garrisonSergeant = Card(name: "Garrison Sergeant", rarity: .Common, set: set, number: 172)
        garrisonSergeant.setManaCost("3RW")
        garrisonSergeant.setType(.Creature, .Viashino, .Soldier)
        garrisonSergeant.addStaticAbility(
            requirement: AbilityRequirement.This(garrisonSergeant),
            effect: { object in
                let controlsGate = !object.getController().getPermanents().filter({ $0.isType(.Gate) }).isEmpty
                if controlsGate {
                    object.doubleStrike = true
                }
                return object
            },
            layer: .AbilityAddingOrRemoving)
        garrisonSergeant.setFlavorText("In the Legion, no flagpole is merely decorative, and every ceremonial sword bears an edge.")
        garrisonSergeant.power = 3
        garrisonSergeant.toughness = 3
        return garrisonSergeant
    }
    // 173 Glowspore Shaman
    static func GoblinElectromancer() -> Card {
        let goblinElectromancer = Card(name: "Goblin Electromancer", rarity: .Common, set: set, number: 174)
        goblinElectromancer.setManaCost("UR")
        goblinElectromancer.setType(.Creature, .Goblin, .Wizard)
        goblinElectromancer.addStaticAbility(
            requirement: AbilityRequirement.InstantAndSorcerySpellsYouCast(source: goblinElectromancer),
            effect: { object in
                object.castingCost = object.getBaseCastingCost().reducedBy(1)
                return object
            },
            layer: .CostReduction)
        goblinElectromancer.setFlavorText("\"Result 752: Rapid mass redistribution.\n\"Result 753: Calamitous reverse synthesis.\n\"Result 754: Acute disarrayment.\"\n--Izzet research notes")
        goblinElectromancer.power = 2
        goblinElectromancer.toughness = 2
        return goblinElectromancer
    }
    // 175 Golgari Findbroker
    static func HammerDropper() -> Card {
        let hammerDropper = Card(name: "Hammer Dropper", rarity: .Common, set: set, number: 176)
        hammerDropper.setManaCost("2RW")
        hammerDropper.setType(.Creature, .Giant, .Soldier)
        hammerDropper.triggeredAbilities.append(Mentor(hammerDropper))
        hammerDropper.setFlavorText("Giants know a solid hit is one part strength, four parts leverage.")
        hammerDropper.power = 5
        hammerDropper.toughness = 2
        return hammerDropper
    }
    // 177 House Guildmage
    // 178 Hypothesizzle
    static func Ionize() -> Card {
        let ionize = Card(name: "Ionize", rarity: .Rare, set: set, number: 179)
        ionize.setManaCost("1UR")
        ionize.setType(.Instant)
        ionize.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetSpell(),
            effect: { target in
                let controller = target.getController()
                target.counter()
                ionize.damage(to: controller, 2)
        }))
        ionize.setFlavorText("\"Countermagic is a simple process of breaking matter into its elementary particles.\"")
        return ionize
    }
    // 180 Izoni, Thousand-Eyed
    static func JoinShields() -> Card {
        let joinShields = Card(name: "Join Shields", rarity: .Uncommon, set: set, number: 181)
        joinShields.setManaCost("3GW")
        joinShields.setType(.Instant)
        joinShields.addEffect({
            joinShields.getController().getCreatures().forEach({ creature in
                creature.untap()
                creature.giveKeywordUntilEndOfTurn(.Hexproof)
                creature.giveKeywordUntilEndOfTurn(.Indestructible)
            })
        })
        joinShields.setFlavorText("\"We are the shield that never breaks, the bough that never burns, the song that can never be silenced.\"")
        return joinShields
    }
    static func JusticeStrike() -> Card {
        let justiceStrike = Card(name: "Justice Strike", rarity: .Uncommon, set: set, number: 182)
        justiceStrike.setManaCost("RW")
        justiceStrike.setType(.Instant)
        justiceStrike.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in target.damage(to: target, target.getPower()) }))
        justiceStrike.setFlavorText("\"Those who show no mercy to the weak deserve no mercy from the strong.\"\n--Firemane Kavrova")
        return justiceStrike
    }
    // 183 Knight of Autumn
    // 184 Lazav, the Multifarious
    // 185 League Guildmage
    // 186 Ledev Champion
    static func LegionGuildmage() -> Card {
        let legionGuildmage = Card(name: "Legion Guildmage", rarity: .Uncommon, set: set, number: 187)
        legionGuildmage.setManaCost("RW")
        legionGuildmage.setType(.Creature, .Human, .Wizard)
        legionGuildmage.addActivatedAbility(
            string: "{5}{R}, {T}: ~ deals 3 damage to each opponent.",
            cost: Cost.Mana("5R").Tap(),
            effect: { legionGuildmage.eachOpponent({ legionGuildmage.damage(to: $0, 3) }) })
        legionGuildmage.addActivatedAbility(
            string: "{2}{W}, {T}: Tap another target creature.",
            cost: Cost.Mana("2W").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0 != legionGuildmage },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        legionGuildmage.power = 2
        legionGuildmage.toughness = 2
        return legionGuildmage
    }
    // 188 March of the Multitudes
    // 189 Mnemonic Betrayal
    // 190 Molderhulk
    static func NightveilPredator() -> Card {
        let nightveilPredator = Card(name: "Nightveil Predator", rarity: .Uncommon, set: set, number: 191)
        nightveilPredator.setManaCost("UUBB")
        nightveilPredator.setType(.Creature, .Vampire)
        nightveilPredator.flying = true
        nightveilPredator.deathtouch = true
        nightveilPredator.hexproof = true
        nightveilPredator.setFlavorText("\"Three daggers left in an angel's back, three enforcers with memory loss, three keys stolen from my own belt--and you talk of peace?\"\n--Tajic, to Aurelia")
        nightveilPredator.power = 3
        nightveilPredator.toughness = 3
        return nightveilPredator
    }
    static func NivMizzetParun() -> Card {
        let nivMizzet = Card(name: "Niv-Mizzet, Parun", rarity: .Rare, set: set, number: 192)
        nivMizzet.setManaCost("UUURRR")
        nivMizzet.setType(.Legendary, .Creature, .Dragon, .Wizard)
        nivMizzet.uncounterable = true
        nivMizzet.flying = true
        nivMizzet.addTriggeredAbility(
            trigger: .YouDrawCard,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { nivMizzet.damage(to: $0, 1) }))
        nivMizzet.addTriggeredAbility(
            trigger: .APlayerCastsInstantOrSorcery,
            effect: { nivMizzet.getController().drawCard() })
        nivMizzet.power = 5
        nivMizzet.toughness = 5
        return nivMizzet
    }
    // 193 Notion Rain
    // 194 Ochran Assassin
    // 195 Ral, Izzet Viceroy
    static func RhizomeLurcher() -> Card {
        let rhizomeLurcher = Card(name: "Rhizome Lurcher", rarity: .Common, set: set, number: 196)
        rhizomeLurcher.setManaCost("2BG")
        rhizomeLurcher.setType(.Creature, .Fungus, .Zombie)
        rhizomeLurcher.addReplacementEffect(
            event: .ThisETB,
            effect: {
                let creaturesInGraveyard = rhizomeLurcher.getController().getGraveyard().filter({$0.isType(.Creature)}).count
                rhizomeLurcher.addCounters(.PlusOnePlusOne, creaturesInGraveyard)
        })
        rhizomeLurcher.setFlavorText("\"The dead gain new purpose here. What is strange in the eyes of other guilds is harmonious in ours.\"\n--Devesh, Golgari shaman")
        rhizomeLurcher.power = 2
        rhizomeLurcher.toughness = 2
        return rhizomeLurcher
    }
    // 197 Rosemane Centaur
    static func SkyknightLegionnaire() -> Card {
        let skyknightLegionnaire = Card(name: "Skyknight Legionnaire", rarity: .Common, set: set, number: 198)
        skyknightLegionnaire.setManaCost("1RW")
        skyknightLegionnaire.setType(.Creature, .Human, .Knight)
        skyknightLegionnaire.flying = true
        skyknightLegionnaire.haste = true
        skyknightLegionnaire.setFlavorText("Squadrons of skyknights are available for deployment around the clock, capable of reaching any district in the city within minutes.")
        skyknightLegionnaire.power = 2
        skyknightLegionnaire.toughness = 2
        return skyknightLegionnaire
    }
    // 199 Sonic Assault
    static func SumalaWoodshaper() -> Card {
        let sumalaWoodshaper = Card(name: "Sumala Woodshaper", rarity: .Common, set: set, number: 200)
        sumalaWoodshaper.setManaCost("2GW")
        sumalaWoodshaper.setType(.Creature, .Elf, .Druid)
        sumalaWoodshaper.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { sumalaWoodshaper.getController().chooseCard(
                from: Array(sumalaWoodshaper.getController().getLibrary().suffix(4)),
                restriction: { $0.isType(.Creature) || $0.isType(.Enchantment) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    sumalaWoodshaper.getController().putOnBottomOfLibrary(&rest, random: true)
            })
        })
        sumalaWoodshaper.power = 2
        sumalaWoodshaper.toughness = 1
        return sumalaWoodshaper
    }
    // 201 Swarm Guildmage
    static func SwathcutterGiant() -> Card {
        let swathcutterGiant = Card(name: "Swathcutter Giant", rarity: .Uncommon, set: set, number: 202)
        swathcutterGiant.setManaCost("4RW")
        swathcutterGiant.setType(.Creature, .Giant, .Soldier)
        swathcutterGiant.vigilance = true
        swathcutterGiant.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { swathcutterGiant.eachOpponent({ $0.getCreatures().forEach({ swathcutterGiant.damage(to: $0, 1) }) }) })
        swathcutterGiant.setFlavorText("\"Now do you understand what we meant when we said disperse?\"\n--Eksari, Boros patrol leader")
        swathcutterGiant.power = 5
        swathcutterGiant.toughness = 5
        return swathcutterGiant
    }
    static func SwiftbladeVindicator() -> Card {
        let swiftbladeVindicator = Card(name: "Swiftblade Vindicator", rarity: .Rare, set: set, number: 203)
        swiftbladeVindicator.setManaCost("RW")
        swiftbladeVindicator.setType(.Creature, .Human, .Soldier)
        swiftbladeVindicator.doubleStrike = true
        swiftbladeVindicator.vigilance = true
        swiftbladeVindicator.trample = true
        swiftbladeVindicator.setFlavorText("A swiftblade is an artist, each fiery trail of their blades a fleeting masterpiece traced on the air.")
        swiftbladeVindicator.power = 1
        swiftbladeVindicator.toughness = 1
        return swiftbladeVindicator
    }
    // 204 Tajic, Legion's Edge
    // 205 Thief of Sanity
    // 206 Thought Erasure
    // 207 Thousand-Year Storm
    // 208 Trostani Discordant
    // 209 Truefire Captain
    static func UndercityUprising() -> Card {
        let undercityUprising = Card(name: "Undercity Uprising", rarity: .Common, set: set, number: 210)
        undercityUprising.setManaCost("2BG")
        undercityUprising.setType(.Sorcery)
        undercityUprising.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === undercityUprising.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== undercityUprising.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                undercityUprising.getController().getCreatures().forEach({ creature in
                    creature.giveKeywordUntilEndOfTurn(.Deathtouch)
                })
                if let myCreature = targets[0], let theirCreature = targets[1] {
                    myCreature.fight(theirCreature)
                }
        }))
        undercityUprising.setFlavorText("\"Now it's your turn to hide.\"\n--Vraska")
        return undercityUprising
    }
    // 211 Underrealm Lich
    // 212 Unmoored Ego
    // 213 Vraska, Golgari Queen
    static func WeeDragonauts() -> Card {
        let weeDragonauts = Card(name: "Wee Dragonauts", rarity: .Uncommon, set: set, number: 214)
        weeDragonauts.setManaCost("1UR")
        weeDragonauts.setType(.Creature, .Faerie, .Wizard)
        weeDragonauts.flying = true
        weeDragonauts.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { weeDragonauts.pump(2, 0) })
        weeDragonauts.setFlavorText("\"Something's causing electrospheric disruption in the blazekite's spire-vanes. Find the cause, and tell them to keep it up!\"\n--Juzba, Izzet tinker.")
        weeDragonauts.power = 1
        weeDragonauts.toughness = 3
        return weeDragonauts
    }
    // 215 Worldsoul Colossus
    static func FreshFacedRecruit() -> Card {
        let freshFacedRecruit = Card(name: "Fresh-Faced Recruit", rarity: .Common, set: set, number: 216)
        freshFacedRecruit.setManaCost("1{R/W}")
        freshFacedRecruit.setType(.Creature, .Human, .Soldier)
        freshFacedRecruit.addStaticAbility(
            requirement: AbilityRequirement.This(freshFacedRecruit),
            effect: { return $0.getController().active ? $0.withKeyword(.FirstStrike) : $0 },
            layer: .AbilityAddingOrRemoving)
        freshFacedRecruit.setFlavorText("\"Hold on to your ideals! They'll be tested more than your armor or the edge of your blade.\"\n--Tajic")
        freshFacedRecruit.power = 2
        freshFacedRecruit.toughness = 1
        return freshFacedRecruit
    }
    static func PistonFistCyclops() -> Card {
        let pistonFistCyclops = Card(name: "Piston-Fist Cyclops", rarity: .Common, set: set, number: 217)
        pistonFistCyclops.setManaCost("1{U/R}{U/R}")
        pistonFistCyclops.setType(.Creature, .Cyclops)
        pistonFistCyclops.defender = true
        pistonFistCyclops.addStaticAbility(
            requirement: AbilityRequirement.This(pistonFistCyclops),
            effect: { $0.canAttackWithDefender = $0.getController().numberInstantsOrSorceriesCastThisTurn > 0; return $0 },
            layer: .AbilityAddingOrRemoving)
        pistonFistCyclops.setFlavorText("Its hyperpneumatics can punch through a wall and the spy on the other side.")
        pistonFistCyclops.power = 4
        pistonFistCyclops.toughness = 3
        return pistonFistCyclops
    }
    static func PitilessGorgon() -> Card {
        let pitilessGorgon = Card(name: "Pitiless Gorgon", rarity: .Common, set: set, number: 218)
        pitilessGorgon.setManaCost("1{B/G}{B/G}")
        pitilessGorgon.setType(.Creature, .Gorgon)
        pitilessGorgon.deathtouch = true
        pitilessGorgon.setFlavorText("\"The reign of the Swarm begins. Let us rise now and dress ourselves in vengeance.\"")
        pitilessGorgon.power = 2
        pitilessGorgon.toughness = 2
        return pitilessGorgon
    }
    static func VernadiShieldmate() -> Card {
        let vernadiShieldmate = Card(name: "Vernadi Shieldmate", rarity: .Common, set: set, number: 219)
        vernadiShieldmate.setManaCost("1{G/W}")
        vernadiShieldmate.setType(.Creature, .Human, .Soldier)
        vernadiShieldmate.vigilance = true
        vernadiShieldmate.setFlavorText("\"Selesnya's soil is sacred, and you're about to meet it with your face.\"")
        vernadiShieldmate.power = 2
        vernadiShieldmate.toughness = 2
        return vernadiShieldmate
    }
    // 220 Whisper Agent
    // 221 Assure // Assemble
    // 222 Connive // Concoct
    // 223 Discovery // Dispersal
    // 224 Expansion // Explosion
    // 225 Find // Finality
    // 226 Flower // Flourish
    // 227 Integrity // Intervention
    // 228 Invert // Invent
    // 229 Response // Resurgence
    // 230 Status // Statue
    static func BorosLocket() -> Card {
        let borosLocket = Card(name: "Boros Locket", rarity: .Uncommon, set: set, number: 231)
        borosLocket.setManaCost("3")
        borosLocket.setType(.Artifact)
        borosLocket.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { borosLocket.getController().addMana(color: .Red) },
            manaAbility: true)
        borosLocket.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { borosLocket.getController().addMana(color: .White) },
            manaAbility: true)
        borosLocket.addActivatedAbility(
            string: "{R/W}{R/W}{R/W}{R/W}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{R/W}{R/W}{R/W}{R/W}").Tap().Sacrifice(),
            effect: { borosLocket.getController().drawCards(2) })
        borosLocket.setFlavorText("\"We pass these along to our fellow soldiers to recognize deeds of valor. It won't stay with you for long.\"\n--Alovnek, Boros guildmage")
        return borosLocket
    }
    // 232 Chamber Sentry
    // 233 Chromatic Lantern
    static func DimirLocket() -> Card {
        let dimirLocket = Card(name: "Dimir Locket", rarity: .Uncommon, set: set, number: 234)
        dimirLocket.setManaCost("3")
        dimirLocket.setType(.Artifact)
        dimirLocket.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { dimirLocket.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirLocket.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { dimirLocket.getController().addMana(color: .Black) },
            manaAbility: true)
        dimirLocket.addActivatedAbility(
            string: "{U/B}{U/B}{U/B}{U/B}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{U/B}{U/B}{U/B}{U/B}").Tap().Sacrifice(),
            effect: { dimirLocket.getController().drawCards(2) })
        dimirLocket.setFlavorText("\"Wear this, and take your place among the shadows--wise, lethal, and unseen.\"\n--Ivrelya, Dimir spymaster")
        return dimirLocket
    }
    static func GatekeeperGargoyle() -> Card {
        let gatekeeperGargoyle = Card(name: "Gatekeeper Gargoyle", rarity: .Uncommon, set: set, number: 235)
        gatekeeperGargoyle.setManaCost("6")
        gatekeeperGargoyle.setType(.Artifact, .Creature, .Gargoyle)
        gatekeeperGargoyle.flying = true
        gatekeeperGargoyle.addReplacementEffect(
            event: .ThisETB,
            effect: {
                let numGates = gatekeeperGargoyle.getController().getPermanents().filter({ $0.isType(.Gate) }).count
                gatekeeperGargoyle.addCounters(.PlusOnePlusOne, numGates)
        })
        gatekeeperGargoyle.setFlavorText("Each night it visits a different guildgate around the city, digging its talons into fresh stone.")
        gatekeeperGargoyle.power = 3
        gatekeeperGargoyle.toughness = 3
        return gatekeeperGargoyle
    }
    // 236 Glaive of the Guildpact
    static func GolgariLocket() -> Card {
        let golgariLocket = Card(name: "Golgari Locket", rarity: .Uncommon, set: set, number: 237)
        golgariLocket.setManaCost("3")
        golgariLocket.setType(.Artifact)
        golgariLocket.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { golgariLocket.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariLocket.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { golgariLocket.getController().addMana(color: .Green) },
            manaAbility: true)
        golgariLocket.addActivatedAbility(
            string: "{B/G}{B/G}{B/G}{B/G}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{B/G}{B/G}{B/G}{B/G}").Tap().Sacrifice(),
            effect: { golgariLocket.getController().drawCards(2) })
        golgariLocket.setFlavorText("\"Wear it at all times. It will guide our reanimators to your corpse.\"\n--Mazirek, kraul death priest")
        return golgariLocket
    }
    static func IzzetLocket() -> Card {
        let izzetLocket = Card(name: "Izzet Locket", rarity: .Uncommon, set: set, number: 238)
        izzetLocket.setManaCost("3")
        izzetLocket.setType(.Artifact)
        izzetLocket.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { izzetLocket.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetLocket.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { izzetLocket.getController().addMana(color: .Red) },
            manaAbility: true)
        izzetLocket.addActivatedAbility(
            string: "{U/R}{U/R}{U/R}{U/R}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{U/R}{U/R}{U/R}{U/R}").Tap().Sacrifice(),
            effect: { izzetLocket.getController().drawCards(2) })
        izzetLocket.setFlavorText("\"Remember to discharge your locket every seven hours. Unless you prefer the spontaneous aether overload, of course.\"\n--Daxiver, Izzet electromancer")
        return izzetLocket
    }
    static func RampagingMonument() -> Card {
        let rampagingMonument = Card(name: "Rampaging Monument", rarity: .Uncommon, set: set, number: 239)
        rampagingMonument.setManaCost("4")
        rampagingMonument.setType(.Artifact, .Creature, .Cleric)
        rampagingMonument.trample = true
        rampagingMonument.addReplacementEffect(
            event: .ThisETB,
            effect: { rampagingMonument.addCounters(.PlusOnePlusOne, 3) })
        rampagingMonument.addTriggeredAbility(
            trigger: .YouCastMulticoloredSpell,
            effect: { rampagingMonument.addCounter(.PlusOnePlusOne) })
        rampagingMonument.setFlavorText("\"Be advised: suspect is nine stories tall, marble hair, answers to Saint Gusztav.\"")
        rampagingMonument.power = 0
        rampagingMonument.toughness = 0
        return rampagingMonument
    }
    static func SelesnyaLocket() -> Card {
        let selesnyaLocket = Card(name: "Selesnya Locket", rarity: .Uncommon, set: set, number: 240)
        selesnyaLocket.setManaCost("3")
        selesnyaLocket.setType(.Artifact)
        selesnyaLocket.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { selesnyaLocket.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaLocket.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { selesnyaLocket.getController().addMana(color: .White) },
            manaAbility: true)
        selesnyaLocket.addActivatedAbility(
            string: "{G/W}{G/W}{G/W}{G/W}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{G/W}{G/W}{G/W}{G/W}").Tap().Sacrifice(),
            effect: { selesnyaLocket.getController().drawCards(2) })
        selesnyaLocket.setFlavorText("\"Think of the locket as a seed you bear, spreading life from Vitu-Ghazi across all of Ravnica.\"\n--Heruj, Selesnya hierophant")
        return selesnyaLocket
    }
    static func SilentDart() -> Card {
        let silentDart = Card(name: "Silent Dart", rarity: .Uncommon, set: set, number: 241)
        silentDart.setManaCost("1")
        silentDart.setType(.Artifact)
        silentDart.addActivatedAbility(
            string: "{4}, {T}, Sacrifice ~: It deals 3 damage to target creature.",
            cost: Cost.Mana("4").Tap().Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { silentDart.damage(to: $0, 3) }))
        silentDart.setFlavorText("\"These terms are acceptable to House Dimir. Shall we shake on it?\"")
        return silentDart
    }
    // 242 Wand of Verterae
    static func BorosGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? BorosGuildgate243() : BorosGuildgate244()
    }
    static func BorosGuildgate243() -> Card {
        let borosGuildgate = Card(name: "Boros Guildgate", rarity: .Common, set: set, number: 243)
        borosGuildgate.setManaCost("")
        borosGuildgate.setType(.Land, .Gate)
        borosGuildgate.entersTapped = true
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { borosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { borosGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        borosGuildgate.setFlavorText("\"The more trust breaks down, the more we must throw open the front gates.\"\n--Aurelia")
        return borosGuildgate
    }
    static func BorosGuildgate244() -> Card {
        let borosGuildgate = Card(name: "Boros Guildgate", rarity: .Common, set: set, number: 244)
        borosGuildgate.setManaCost("")
        borosGuildgate.setType(.Land, .Gate)
        borosGuildgate.entersTapped = true
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { borosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { borosGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        borosGuildgate.setFlavorText("\"It is our duty to protect all those in need. But the other guilds have never shown themselves worthy of that protection.\"\n--Tajic")
        return borosGuildgate
    }
    static func DimirGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? DimirGuildgate245() : DimirGuildgate246()
    }
    static func DimirGuildgate245() -> Card {
        let dimirGuildgate = Card(name: "Dimir Guildgate", rarity: .Common, set: set, number: 245)
        dimirGuildgate.setManaCost("")
        dimirGuildgate.setType(.Land, .Gate)
        dimirGuildgate.entersTapped = true
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { dimirGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { dimirGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        dimirGuildgate.setFlavorText("\"Every guild dreads infiltration. I should know--I've been a member of all of them.\"\n--Lazav")
        return dimirGuildgate
    }
    static func DimirGuildgate246() -> Card {
        let dimirGuildgate = Card(name: "Dimir Guildgate", rarity: .Common, set: set, number: 246)
        dimirGuildgate.setManaCost("")
        dimirGuildgate.setType(.Land, .Gate)
        dimirGuildgate.entersTapped = true
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { dimirGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { dimirGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        dimirGuildgate.setFlavorText("\"You've found this place only because you were summoned. Pray you're worthy of the invitation.\"\n--Etrata")
        return dimirGuildgate
    }
    // 247 Gateway Plaza
    static func GolgariGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? GolgariGuildgate248() : GolgariGuildgate249()
    }
    static func GolgariGuildgate248() -> Card {
        let golgariGuildgate = Card(name: "Golgari Guildgate", rarity: .Common, set: set, number: 248)
        golgariGuildgate.setManaCost("")
        golgariGuildgate.setType(.Land, .Gate)
        golgariGuildgate.entersTapped = true
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { golgariGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { golgariGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        golgariGuildgate.setFlavorText("\"Shut the gates. In the Underrealm we will outlast the coming doom.\"\n--Vraska")
        return golgariGuildgate
    }
    static func GolgariGuildgate249() -> Card {
        let golgariGuildgate = Card(name: "Golgari Guildgate", rarity: .Common, set: set, number: 249)
        golgariGuildgate.setManaCost("")
        golgariGuildgate.setType(.Land, .Gate)
        golgariGuildgate.entersTapped = true
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { golgariGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { golgariGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        golgariGuildgate.setFlavorText("\"Jarad was a friend of the Devkarin. Now we slink through neglected tunnels, befriending those who crawl them.\"\n--Izoni")
        return golgariGuildgate
    }
    // 250 Guildmages' Forum
    static func IzzetGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? IzzetGuildgate251() : IzzetGuildgate252()
    }
    static func IzzetGuildgate251() -> Card {
        let izzetGuildgate = Card(name: "Izzet Guildgate", rarity: .Common, set: set, number: 251)
        izzetGuildgate.setManaCost("")
        izzetGuildgate.setType(.Land, .Gate)
        izzetGuildgate.entersTapped = true
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { izzetGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { izzetGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        izzetGuildgate.setFlavorText("Every laboratory buzzes with new experiments, each a piece of Ral's ambitious project.")
        return izzetGuildgate
    }
    static func IzzetGuildgate252() -> Card {
        let izzetGuildgate = Card(name: "Izzet Guildgate", rarity: .Common, set: set, number: 252)
        izzetGuildgate.setManaCost("")
        izzetGuildgate.setType(.Land, .Gate)
        izzetGuildgate.entersTapped = true
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { izzetGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { izzetGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        izzetGuildgate.setFlavorText("\"Yesterday I didn't recognize my own guild. Today I see why. And for tomorrow I must be prepared.\"\n--Niv-Mizzet")
        return izzetGuildgate
    }
    // 253 Overgrown Tomb
    // 254 Sacred Foundary
    static func SelesnyaGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? SelesnyaGuildgate255() : SelesnyaGuildgate256()
    }
    static func SelesnyaGuildgate255() -> Card {
        let selesnyaGuildgate = Card(name: "Selesnya Guildgate", rarity: .Common, set: set, number: 255)
        selesnyaGuildgate.setManaCost("")
        selesnyaGuildgate.setType(.Land, .Gate)
        selesnyaGuildgate.entersTapped = true
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { selesnyaGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { selesnyaGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        selesnyaGuildgate.setFlavorText("\"Everyone who crosses that threshold is our most cherished friend. Everyone who crosses it again is our bitterest enemy.\"\n--Trostani")
        return selesnyaGuildgate
    }
    static func SelesnyaGuildgate256() -> Card {
        let selesnyaGuildgate = Card(name: "Selesnya Guildgate", rarity: .Common, set: set, number: 256)
        selesnyaGuildgate.setManaCost("")
        selesnyaGuildgate.setType(.Land, .Gate)
        selesnyaGuildgate.entersTapped = true
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { selesnyaGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { selesnyaGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        selesnyaGuildgate.setFlavorText("\"We leave our gardens open, so all may know wonder, but guarded, so all may know peace.\"\n--Emmara")
        return selesnyaGuildgate
    }
    // 257 Steam Vents
    // 258 Temple Garden
    // 259 Watery Grave
    static func Plains() -> Card {
        let plains = Card(name: "Plains", rarity: .Common, set: set, number: 260)
        plains.setManaCost("")
        plains.setType(.Basic, .Land, .Plains)
        plains.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { plains.getController().addMana(color: .White) },
            manaAbility: true)
        return plains
    }
    static func Island() -> Card {
        let island = Card(name: "Island", rarity: .Common, set: set, number: 261)
        island.setManaCost("")
        island.setType(.Basic, .Land, .Island)
        island.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { island.getController().addMana(color: .Blue) },
            manaAbility: true)
        return island
    }
    static func Swamp() -> Card {
        let swamp = Card(name: "Swamp", rarity: .Common, set: set, number: 262)
        swamp.setManaCost("")
        swamp.setType(.Basic, .Land, .Swamp)
        swamp.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { swamp.getController().addMana(color: .Black) },
            manaAbility: true)
        return swamp
    }
    static func Mountain() -> Card {
        let mountain = Card(name: "Mountain", rarity: .Common, set: set, number: 263)
        mountain.setManaCost("")
        mountain.setType(.Basic, .Land, .Mountain)
        mountain.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { mountain.getController().addMana(color: .Red) },
            manaAbility: true)
        return mountain;
    }
    static func Forest() -> Card {
        let forest = Card(name: "Forest", rarity: .Common, set: set, number: 264)
        forest.setManaCost("")
        forest.setType(.Basic, .Land, .Forest)
        forest.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { forest.getController().addMana(color: .Green) },
            manaAbility: true)
        return forest;
    }

    // t1 Angel
    static func Soldier() -> Token {
        let soldier = Token(name: "Soldier", set: set, number: 2)
        soldier.colors = [Color.White]
        soldier.setType(.Creature, .Soldier)
        soldier.lifelink = true
        soldier.power = 1
        soldier.toughness = 1
        return soldier
    }
    static func BirdIllusion() -> Token {
        let birdIllusion = Token(name: "Bird Illusion", set: set, number: 3)
        birdIllusion.colors = [.Blue]
        birdIllusion.setType(.Creature, .Bird, .Illusion)
        birdIllusion.flying = true
        birdIllusion.power = 1
        birdIllusion.toughness = 1
        return birdIllusion
    }
    // t4 Gobblin
    // t5 Insect
    static func ElfKnight() -> Token {
        let elfKnight = Token(name: "Elf Knight", set: set, number: 6)
        elfKnight.colors = [Color.Green, Color.White]
        elfKnight.setType(.Creature, .Elf, .Knight)
        elfKnight.vigilance = true
        elfKnight.power = 2
        elfKnight.toughness = 2
        return elfKnight;
    }
    // t7 Ral Emblem
    // t8 Vraska Emblem
}
