import Foundation

enum GRN {
    static var set = "grn"
    static var count = 259
    
    private static let cards = [
        BladeInstructor, BountyAgent, CandlelightVigil, CitywideBust, CollarTheCulprit, /* ConclaveTribunal, */ /* CrushContraband, */ /* DawnOfHope, */ /* Demotion, */ /* DivineVisitation, */ /* FlightOfEquenauts, */ GirdForBattle, /* HaazdaMarshal, */ HealersHawk, HuntedWitness, InspiringUnicorn, /* IntrusivePackbeast, */ /* LedevGuardian, */ LightOfTheLegion, /* LoxodonRestorer, */ LuminousBonds, ParhelionPatrol, RighteousBlow, RocCharger, /* SkylineScout, */ SunhomeStalwart, SwornCompanions, TakeHeart, TenthDistrictGuard, /* Venerated Loxodon, */ /* CaptureSphere, */ /* Chemister's Insight, */ /* Citywatch Sphinx, */ /* Dazzling Lights, */ /* DeviousCoverUp, */ /* DimirInformant, */ /* DisdainfulStroke, */ /* DreamEater, */ DrownedSecrets, /* EnhancedSurveillance, */ /* GuildSummit, */ /* Leapfrog, */ /* MaximizeAltitude, */ /* MissionBriefing, */ MurmuringMystic, MuseDrake, /* Narcomoeba, */ /* NightveilSprite, */ /* OmnispellAdept, */ PasswallAdept, /* Quasiduplicate, */ /* RadicalIdea, */ /* SelectiveSnare, */ /* SinisterSabotage, */ /* ThoughtboundPhantasm, */ /* UnexplainedDisappearance, */ VedalkenMesmerist, WallOfMist, /* WatcherInTheMist, */ WishcoinCrab, /* BarrierOfBones, */ BartizanBats, /* BloodOperative, */ BurglarRat, ChildOfNight, /* CreepingChill, */ DeadWeight, /* DeadlyVisit, */ /* DoomWhisperer, */ DouserOfLights, /* GruesomeMenagerie, */ HiredPoisoner, /* KraulSwarm, */ LotlethGiant, /* MausoleumSecrets, */ /* MephiticVapors, */ /* MidnightReaper, */ /* MoodmarkPainter, */ /* NecroticWound, */ /* NeverHappened, */ /* PilferingImp, */ /* Plaguecrafter, */ /* PriceOfFame, */ RitualOfSoot, /* SeveredStrands, */ SpinalCentipede, /* UndercityNecrolisk, */ VeiledShade, ViciousRumors, /* WhisperingSnitch, */ /* ArclightPhoenix, */ BargingSergeant, /* BookDevourer, */ CommandTheStorm, /* CosmotronicWave, */ /* DirectCurrent, */ ElectrostaticField, /* ErraticCyclops, */ /* ExperimentalFrenzy, */ FearlessHalberdier, FireUrchin, GoblinBanneret, /* GoblinCratermaker, */ /* GoblinLocksmith, */ /* GraviticPunch, */ HellkiteWhelp, /* InescapableBlaze, */ /* LavaCoil, */ /* LegionWarboss, */ ManiacalRage, /* MaximizeVelocity, */ /* OrneryGoblin, */ /* RiskFactor, */ RubblebeltBoar, /* RunawaySteamKin, */ SmeltWardMinotaur, StreetRiot, SureStrike, TorchCourier, /* WojekBodyguard, */ /* AffectionateIndrik, */ /* AboretumElemental, */ BeastWhisperer, BountyOfMight, /* CurcuitousRoute, */ /* CrushingCanopy, */ DevkarinDissident, /* DistrictGuide, */ GenerousStray, GolgariRaiders, GrapplingSundew, /* HatcherySpider, */ HitchclawRecluse, IronshellBeetle, KraulForagers, /* KraulHarpooner, */ MightOfTheMasses, /* NullhideFerox, */ /* PacksFavor, */ /* PauseForReflection, */ /* PeltCollector, */ /* PortcullisVine, */ PreyUpon, /* SiegeWurm, */ /* SproutingRenewal, */ /* UrbanUtopia, */ /* VigorsporeWurm, */ /* VividRevival, */ WaryOkapi, WildCeratok, /* ArtfulTakedown, */ /* AssassinsTrophy, */ AureliaExemplarOfJustice, /* BeaconBolt, */ /* BeamsplitterMage, */ BorosChallenger, Camaraderie, CentaurPeacemaker, /* ChanceForGlory, */ /* CharnelTroll, */ ConclaveCavalier, ConclaveGuildmage, /* CracklingDrake, */ /* DarkbladeAgent, */ /* DeafeningClarion, */ /* DimirSpybug, */ /* DisinformationCampaign, */ EmmaraSoulOfTheAccord, /* ErstwhileTrooper, */ /* EtrataTheSilencer, */ /* FiremindsResearch, */ GarrisonSergeant, /* GlowsporeShaman, */ /* GoblinElectromancer, */ /* GolgariFindbroker, */ HammerDropper, /* HouseGuildmage, */ /* Hypothesizzle, */ /* Ionize, */ /* IzoneThousandEyed, */ /* JoinShields, */ JusticeStrike, /* KnightOfAutumn, */ /* LazavTheMultifarious, */ /* LeagueGuildmage, */ /* LedevChampion, */ LegionGuildmage, /* MarchOfTheMultitudes, */ /* MnemonicBetrayal, */ /* Molderhulk, */ /* NightveilPredator, */ /* NivMizzetParun, */ /* NotionRain, */ /* OchranAssassin, */ /* RalIzzetViceroy, */ /* RhizomeLurcher, */ /* RosemaneCentaur, */ SkyknightLegionnaire, /* SonicAssault, */ /* SumalaWoodshaper, */ /* SwarmGuildmage, */ SwathcutterGiant, SwiftbladeVindicator, /* TajicLegionsEdge, */ /* ThiefOfSanity, */ /* ThoughtErasure, */ /* ThousandYearStorm, */ /* TrostaniDiscordant, */ /* TruefireCaptain, */ UndercityUprising, /* UnderrealmLich, */ /* UnmooredEgo, */ /* VraskaGolgariQueen, */ WeeDragonauts, /* WorldsoulColossus, */ /* FreshFacedRecruit, */ /* PistonFistCyclops, */ /* PitilessGorgon, */ /* VernadiShieldmate, */ /* WhisperAgent, */ /* AssureAssemble, */ /* ConniveConcoct, */ /* DiscoveryDispersal, */ /* ExpansionExplosion, */ /* FindFinality, */ /* FlowerFlourish, */ /* IntegrityIntervention, */ /* InvertInvent, */ /* ResponseResurgence, */ /* StatusStatue, */ /* BorosLocket, */ /* ChamberSentry, */ /* ChromaticLantern, */ /* DimirLocket, */ GatekeeperGargoyle, /* GlaiveOfTheGuildpact, */ /* GolgariLocket, */ /* IzzetLocket, */ RampagingMonument, /* SelesnyaLocket, */ SilentDart, /* WandOfVertebrae, */ BorosGuildgate243, BorosGuildgate244, DimirGuildgate245, DimirGuildgate246, /* GatewayPlaza, */ GolgariGuildgate248, GolgariGuildgate249, /* GuildmagesForum, */ IzzetGuildgate251, IzzetGuildgate252, /* OvergrownTomb, */ /* SacredFoundry, */ SelesnyaGuildgate255, SelesnyaGuildgate256, /* SteamVents, */ /* TempleGarden, */ /* WateryGrave, */ Plains, Island, Swamp, Mountain, Forest,
        
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
                restriction: { $0.isType(.Creature) && $0.attacking && $0.getPower() < source.getPower() },
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
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Legendary) && $0.isPermanent() && ($0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Enchantment)) },
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
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.power = object.getBasePower() + 3
                object.toughness = object.getBaseToughness() + 2
                // TODO: These should apply in different layers
                object.vigilance = true
                return object
        })
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
            restriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
            effect: { target in let _ = target.destroy() }))
        collarTheCulprit.setFlavorText("\"Reports of Gruul rioters in four districts. Start with the big ones and work your way up.\"\n--Libuse, Boros sergeant")
        return collarTheCulprit
    }
    // 6 Conclave Tribunal
    // 7 Crush Contraband
    // 8 Dawn of Hope
    // 9 Demotion
    // 10 Divine Visitation
    // 11 Flight of Equenauts
    static func GirdForBattle() -> Card {
        let girdForBattle = Card(name: "Gird for Battle", rarity: .Uncommon, set: set, number: 12)
        girdForBattle.setManaCost("W")
        girdForBattle.setType(.Sorcery)
        girdForBattle.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) },
                           { $0.isType(.Creature) }],
            effect: { targets in
                for target in targets {
                    target.addCounter(.PlusOnePlusOne)
                }
            },
            requiredTargets: 0))
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
                restrictions: [{ $0.isType(.Creature) && $0.getController() !== intrusivePackbeast.getController() },
                               { $0.isType(.Creature) && $0.getController() !== intrusivePackbeast.getController() }],
                effect: { $0.forEach({ $0.tap() }) },
                requiredTargets: 0))
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
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.cantAttack = true
                object.cantBlock = true
                return object
        })
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
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking) },
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
                restriction: { $0.attacking && $0.isType(.Creature) && !$0.flying },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.flying = true
                    return object
                }))
            }))
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
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.pump(2, 2)
                takeHeart.getController().gainLife(takeHeart.getController().getCreatures().filter({$0.attacking}).count)
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
                restriction: { return $0.isType(.Creature) },
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
    // 37 Disdainful Stroke
    // 38 Dream Eater
    static func DrownedSecrets() -> Card {
        let drownedSecrets = Card(name: "Drowned Secrets", rarity: .Rare, set: set, number: 39)
        drownedSecrets.setManaCost("1U")
        drownedSecrets.setType(.Enchantment)
        drownedSecrets.addTriggeredAbility(
            trigger: .YouCastBlueSpell,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetedEffect.AnyPlayer,
                effect: { $0.mill(2) }
        ))
        drownedSecrets.setFlavorText("Beneath Ravnica's streets runs a layer of tunnels, then caverns and waterways, then terrors and nightmares.")
        return drownedSecrets
    }
    // 40 Enhanced Surveillance
    // 41 Guild Summit
    // 42 Leapfrog
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
            cost: Cost("2U"),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.unblockable = true; return $0 }))}
        ))
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
                restriction: { return $0.isType(.Creature) &&  $0.getController() !== vedalkenMesmerist.getController()},
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
            effect: { burglarRat.getOpponent().discard() })
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
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.power = object.getBasePower() - 2
                object.toughness = object.getBaseToughness() - 2
                return object
        })
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
                restriction: { $0 !== lotlethGiant.getController() },
                effect: { target in
                    let creaturesInGraveyard = lotlethGiant.getController().getGraveyard().filter({ $0.isType(.Creature) }).count
                    lotlethGiant.damage(to: target, creaturesInGraveyard)
        }))
        lotlethGiant.setFlavorText("\"I prefer the big and looming to the small and skittering.\"\n--Cevraya, Golgari shaman")
        lotlethGiant.power = 6
        lotlethGiant.toughness = 5
        return lotlethGiant
    }
    // 75 Mausoleum Secrets
    // 76 Mephitic Vapors
    // 77 Midnight Repear
    // 78 Moodmark Painter
    // 79 Necrotic Wound
    // 80 Never Happened
    // 81 Pilfering Imp
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
                        player.destroyPermanent(creature)
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
                restriction: { $0.isType(.Creature) && $0.getController() === spinalCentipede.getController() },
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
            cost: Cost("1B"),
            effect: { veiledShade.pump(1, 1) })
        veiledShade.setFlavorText("\"I sang songs of sorrow for my lost love. Imagine my horror when, one night, they were answered.\"\n--Milana, Orzgov prelate")
        veiledShade.power = 2
        veiledShade.toughness = 2
        return veiledShade
    }
    static func ViciousRumors() -> Card {
        let viciousRumors = Card(name: "Vicious Rumors", rarity: .Common, set: set, number: 91)
        viciousRumors.setManaCost("B")
        viciousRumors.setType(.Sorcery)
        viciousRumors.addEffect({
            viciousRumors.damage(to: viciousRumors.getOpponent(), 1)
            viciousRumors.getOpponent().discard()
            viciousRumors.getOpponent().mill(1)
            viciousRumors.getController().gainLife(1)
        })
        viciousRumors.setFlavorText("\"The alliances were already frayed. All we do is find the loose threads and pluck.\"\n--Lazav")
        return viciousRumors
    }
    // 90 Whispering Snitch
    // 91 Arclight Phoenix
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
            restriction: { return $0.isType(.Creature) },
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
            effect: { electrostaticField.damage(to: electrostaticField.getOpponent(), 1) })
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
            cost: Cost("1R"),
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
                restriction: { return $0.getController() !== hellkiteWhelp.getController() },
                effect: { target in hellkiteWhelp.damage(to: target, 1) }))
        hellkiteWhelp.setFlavorText("\"They play by spitting fire at each other. Don't be offended if one gives you a love-scorch.\"\n--Esfir, Rakdos drangon wrangler")
        hellkiteWhelp.power = 3
        hellkiteWhelp.toughness = 3
        return hellkiteWhelp
    }
    // 107 Inescapable Blaze
    // 108 Lava Coil
    // 109 Legion Warboss
    static func ManiacalRage() -> Card {
        let maniacalRage = Card(name: "Maniacal Rage", rarity: .Common, set: set, number: 110)
        maniacalRage.setManaCost("1R")
        maniacalRage.setType(.Enchantment, .Aura)
        maniacalRage.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
                // TODO: These should be applied in different layers
                object.cantBlock = true
                return object
        })
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
                restriction: { return $0.isType(.Creature) },
                effect: { $0.pump(2, 0) }))
        rubblebeltBoar.setFlavorText("Some Gruul druis believe that boars are spawn of the great Illharg, the mighty Raze-Boar who will one day rise and level the city.")
        rubblebeltBoar.power = 3
        rubblebeltBoar.toughness = 3
        return rubblebeltBoar
    }
    // 115 Runaway Steam-Kin
    static func SmeltWardMinotaur() -> Card {
        let smeltWardMinotaur = Card(name: "Smelt-Ward Minotaur", rarity: .Uncommon, set: set, number: 116)
        smeltWardMinotaur.setManaCost("2R")
        smeltWardMinotaur.setType(.Creature, .Minotaur, .Warrior)
        smeltWardMinotaur.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() !== smeltWardMinotaur.getController() },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.cantBlock = true; return $0 }))}))
        smeltWardMinotaur.setFlavorText("\"Don't arrest him--enlist him!\"\n--Commander Yaszen")
        smeltWardMinotaur.power = 2
        smeltWardMinotaur.toughness = 3
        return smeltWardMinotaur
    }
    static func StreetRiot() -> Card {
        let streetRiot = Card(name: "Street Riot", rarity: .Uncommon, set: set, number: 117)
        streetRiot.setManaCost("4R")
        streetRiot.setType(.Enchantment)
        streetRiot.addStaticAbility({ object in
            if streetRiot.getController().active && object.isType(.Creature) && object.getController() === streetRiot.getController() {
                streetRiot.power = streetRiot.getBasePower() + 1
                // TODO: These should be in different layers
                streetRiot.trample = true
            }
            return streetRiot
        })
        streetRiot.setFlavorText("\"They said obey and you'll be happy. They said you'll be safe. But we're not safe. We're not happy. And we will not obey.\"\n--Domri Rade")
        return streetRiot
    }
    static func SureStrike() -> Card {
        let sureStrike = Card(name: "Sure Strike", rarity: .Common, set: set, number: 118)
        sureStrike.setManaCost("1R")
        sureStrike.setType(.Instant)
        sureStrike.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(3, 0)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.firstStrike = true; return $0 }))
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
            cost: Cost("", tap: false, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.id != torchCourier.id && $0.isType(.Creature) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.haste = true; return $0 }))
        }))
        torchCourier.setFlavorText("\"Light a torch and deliver this letter\" were his instructions, which he unfortunately reversed.")
        torchCourier.power = 1
        torchCourier.toughness = 1
        return torchCourier
    }
    // 120 Wojek Bodyguard
    // 121 Affectionate Indrik
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
            restrictions: [{ $0.isType(.Creature) }, { $0.isType(.Creature) }, { $0.isType(.Creature) }],
            effect: { targets in
                for target in targets {
                    target.pump(3, 3)
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
            cost: Cost("4G"),
            effect: { devkarinDissident.pump(2, 2) })
        devkarinDissident.setFlavorText("\"This is Mileva, in the Tenth. We've got an elf in the plaza with a chip on her shoulder. Actually, it's more of a morningstar.\"")
        devkarinDissident.power = 2
        devkarinDissident.toughness = 2
        return devkarinDissident
    }
    // 128 District Guide
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
            cost: Cost("4G"),
            effect: { grapplingSundew.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.indestructible = true; return $0 }))})
        grapplingSundew.setFlavorText("Some rooftop gardens attract bees; others capture dragons.")
        grapplingSundew.power = 0
        grapplingSundew.toughness = 4
        return grapplingSundew
    }
    // 132 Hatchery Spider
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
                restriction: { $0.isType(.Creature) },
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
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    let x = mightOfTheMasses.getController().getCreatures().count
                    object.power = object.getBasePower() + x
                    object.toughness = object.getBaseToughness() + x
                    return object
                }))
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
            restrictions: [{ $0.isType(.Creature) && $0.getController() === preyUpon.getController() },
                           { $0.isType(.Creature) && $0.getController() !== preyUpon.getController() }],
            effect: { targets in targets[0].fight(targets[1]) }))
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
                restriction: { $0.isType(.Creature) && $0.getController() === aurelia.getController() },
                effect: { target in
                    target.pump(2, 0)
                    if target.isColor(.Red) {
                        target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
                    }
                    if target.isColor(.White) {
                        target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.vigilance = true; return $0 }))
                    }
                },
                optional: true))
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
            cost: Cost("2RW"),
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
            cost: Cost("G", tap: true),
            effect: { conclaveGuildmage.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
            })})
        conclaveGuildmage.addActivatedAbility(
            string: "{5}{W}, {T}: Create a 2/2 green and white Elf Knight creature token with vigilance.",
            cost: Cost("5W", tap: true),
            effect: { conclaveGuildmage.getController().createToken(ElfKnight()) })
        conclaveGuildmage.power = 2
        conclaveGuildmage.toughness = 2
        return conclaveGuildmage
    }
    // 163 Crackling Drake
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
    // 171 Firemind's Research
    static func GarrisonSergeant() -> Card {
        let garrisonSergeant = Card(name: "Garrison Sergeant", rarity: .Common, set: set, number: 172)
        garrisonSergeant.setManaCost("3RW")
        garrisonSergeant.setType(.Creature, .Viashino, .Soldier)
        garrisonSergeant.addStaticAbility({ object in
            if object.id == garrisonSergeant.id {
                let controlsGate = !object.getController().getPermanents().filter({ $0.isType(.Gate) }).isEmpty
                if controlsGate {
                    object.doubleStrike = true
                }
            }
            return object
        })
        garrisonSergeant.setFlavorText("In the Legion, no flagpole is merely decorative, and every ceremonial sword bears an edge.")
        garrisonSergeant.power = 3
        garrisonSergeant.toughness = 3
        return garrisonSergeant
    }
    // 173 Glowspore Shaman
    // 174 Goblin Electromancer
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
    // 179 Ionize
    // 180 Izoni, Thousand-Eyed
    // 181 Join Shields
    static func JusticeStrike() -> Card {
        let justiceStrike = Card(name: "Justice Strike", rarity: .Uncommon, set: set, number: 182)
        justiceStrike.setManaCost("RW")
        justiceStrike.setType(.Instant)
        justiceStrike.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
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
            cost: Cost("5R", tap: true),
            effect: { legionGuildmage.damage(to: legionGuildmage.getOpponent(), 3) })
        legionGuildmage.addActivatedAbility(
            string: "{2}{W}, {T}: Tap another target creature.",
            cost: Cost("2W", tap: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.id != legionGuildmage.id },
                effect: { $0.tap() }))
        legionGuildmage.power = 2
        legionGuildmage.toughness = 2
        return legionGuildmage
    }
    // 188 March of the Multitudes
    // 189 Mnemonic Betrayal
    // 190 Molderhulk
    // 191 Nightveil Predator
    // 192 Niv-Mizzet, Parun
    // 193 Notion Rain
    // 194 Ochran Assassin
    // 195 Ral, Izzet Viceroy
    // 196 Rhizome Lurcher
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
    // 200 Sumala Woodshaper
    // 201 Swarm Guildmage
    static func SwathcutterGiant() -> Card {
        let swathcutterGiant = Card(name: "Swathcutter Giant", rarity: .Uncommon, set: set, number: 202)
        swathcutterGiant.setManaCost("4RW")
        swathcutterGiant.setType(.Creature, .Giant, .Soldier)
        swathcutterGiant.vigilance = true
        swathcutterGiant.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { swathcutterGiant.getOpponent().getCreatures().forEach({ swathcutterGiant.damage(to: $0, 1) }) })
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
            restrictions: [{ $0.isType(.Creature) && $0.getController() === undercityUprising.getController() },
                           { $0.isType(.Creature) && $0.getController() !== undercityUprising.getController() }],
            effect: { targets in
                undercityUprising.getController().getCreatures().forEach({ creature in
                    creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                        object.deathtouch = true
                        return object
                    }))
                })
                targets[0].fight(targets[1])
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
    // 216 Fresh-Faced Recruit
    // 217 Piston-Fist Cyclops
    // 218 Pitiless Gorgon
    // 219 Vernadi Shieldmate
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
    // 231 Boros Locket
    // 232 Chamber Sentry
    // 233 Chromatic Lantern
    // 234 Dimir Locket
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
    // 237 Golgari Locket
    // 238 Izzet Locket
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
    // 240 Selsnya Locket
    static func SilentDart() -> Card {
        let silentDart = Card(name: "Silent Dart", rarity: .Uncommon, set: set, number: 241)
        silentDart.setManaCost("1")
        silentDart.setType(.Artifact)
        silentDart.addActivatedAbility(
            string: "{4}, {T}, Sacrifice ~: It deals 3 damage to target creature.",
            cost: Cost("4", tap: true, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
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
            cost: Cost("", tap: true),
            effect: { borosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { borosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { dimirGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { dimirGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { golgariGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { golgariGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { izzetGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { izzetGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { selesnyaGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
            effect: { selesnyaGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
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
            cost: Cost("", tap: true),
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
