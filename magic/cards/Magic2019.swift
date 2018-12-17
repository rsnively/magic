import Foundation

enum M19 {
    static var set = "m19"
    static var count = 280

    static let cards = [
        AegisOfTheHeavens, AethershieldArtificer, /* AjaniAdversaryOfTyrants, */ /* AjanisLastStand, */ AjanisPridemate, AjanisWelcome, AngelOfTheDawn, CavalryDrillmaster, /* CleansingNova, */ DaybreakChaplain, DwarvenPriest, GallantCavalry, HeraldOfFaith, /* HieromancersCage, */ InspiredCharge, InvokeTheDivine, Isolate, KnightOfTheTusk, KnightsPledge, KnightlyValor, LenaSelflessChampion, LeoninVanguard, LeoninWarleader, LoxodonLineBreaker, LuminousBonds, MakeAStand, /* MentorOfTheMeek, */ MightyLeap, MilitiaBugler, /* NoviceKnight, */ OreskosSwiftclaw, PegasusCourser, RemorsefulCleric, ResplendentAngel, Revitalize, RustwingFalcon, /* ShieldMare, */ StarCrownedStag, /* Suncleanser, */ TakeVengeance, /* TrustyPackbeast, */ ValiantKnight, AetherTunnel, /* Anticipate, */ AvenWindMage, AviationPioneer, /* BoneToAsh, */ /* Cancel, */ /* DepartedDeckhand, */ Disperse, Divination, /* DjinnOfWishes, */ /* Dwindle, */ /* EssenceScatter, */ ExclusionMage, FrilledSeaSerpent, GearsmithProdigy, /* Ghostform, */ /* HorizonScolar, */ /* MetamorphicAlteration, */ /* MirrorImage, */ /* Mistcaller, */ MysticArchaeologist, /* Omenspeaker, */ /* Omniscience, */ OneWithTheMachine, PatientRebuilding, PsychicCorrosion, /* SaiMasterThopterist, */ /* SalvagerOfSecrets, */ ScholarOfStars, Sift, /* SkilledAnimator, */ /* Sleep, */ SnappingDrake, SupremePhantom, /* SurgeMare, */ /* Switcheroo, */ /* TezzeretArtificeMaster, */ TolarianScholar, TotallyLost, UncomfortableChill, WallOfMist, WindreaderSphinx, /* AbnormalEndurance, */ /* BloodDivination, */ Bogstomper, /* BoneDragon, */ ChildOfNight, DeathBaron, /* DemonOfCatastrophes, */ DiregrafGhoul, DoomedDissenter, Duress, EpicureOfBlood, /* FellSpecter, */ /* FrayingOmnipotence, */ /* Gravedigger, */ /* GraveyardMarshal, */ HiredBlade, InfectiousHorror, InfernalReckoning, /* InfernalScarring, */ /* IsarethTheAwakener, */ LichsCaress, /* LilianaUntouchedByDeath, */ /* LilianasContract, */ /* MacabreWaltz, */ MindRot, Murder, NightmaresThirst, /* OpenTheGraves, */ /* PhylacteryLich, */ /* PlagueMare, */ /* RavenousHarpy, */ /* ReassemblingSkeleton, */ /* RiseFromTheGrave, */ SkeletonArcher, SkymarchBloodletter, SovereignsBite, StitchersSupplier, StranglingSpores, /* TwoHeadedZombie, */ VampireNeonate, VampireSovereign, WalkingCorpse, /* ActOfTreason, */ /* AlpineMoon, */ /* ApexOfPower, */ /* Banefire, */ /* BoggartBrute, */ CatalystElemental, CrashThrough, /* DarkDwellerOracle, */ /* DemandingDragon, */ /* DismissivePyromancer, */ /* Doublecast, */ DragonEgg, Electrify, FieryFinish, FireElemental, GoblinInstigator, GoblinMotivator, /* GoblinTrashmaster, */ Guttersnipe, HavocDevils, HostileMinotaur, /* InfernoHellion, */ /* LathlissDragonQueen, */ /* LavaAxe, */ /* LightningMare, */ LightningStrike, OnakkeOgre, /* SarkhanFireblood, */ /* SarkhansUnsealing, */ Shock, SiegebreakerGiant, Smelt, /* SparktongueDragon, */ /* SpitFlame, */SureStrike, /* TectonicRift, */ /* Thud, */ /* TormentingVoice, */ TrumpetBlast, /* ViashinoPyromancer, */ VolcanicDragon, VolleyVeteran, BlanchwoodArmor, /* BristlingBoar, */ CentaurCourser, ColossalDreadmaw, ColossalMajesty, DaggerbackBasilisk, /* DeclareDominance, */ /* DruidOfHorns, */ DruidOfTheCowl, /* DryadGreenseaker, */ ElvishClancaller, ElvishRejuvenator, /* GhastbarkTwins, */ /* GhirapurGuide, */ GiantSpider, /* GiftOfParadise, */ Gigantosaurus, /* GoreclawTerrorOfQalSisma, */ GreenwoodSentinel, HighlandGame, /* HungeringHydra, */ Naturalize, Oakenform, PelakkaWurm, Plummet, ProdigiousGrowth, RabidBite, /* ReclamationSage, */ /* Recollect, */ RhoxOracle, /* RootSnare, */ /* RunicArmasaur, */ /* Scapeshift, */ /* TalonsOfWildwood, */ /* ThornLieutenant, */ ThornhideWolves, TitanicGrowth, VigilantBaloth, /* VineMare, */ VivienReid, /* ViviensInvocation, */ WallOfVines, AerialEngineer, /* ArcadesTheStrategist, */ /* BrawlBashOgre, */ /* ChromiumTheMutable, */ DraconicDisciple, EnigmaDrake, HeroicReinforcements, /* NicolBolasTheRavager, */ PalladiaMorsTheRuiner, /* PoisonTipArcher, */ PsychicSymbiont, RegalBloodlord, SatyrEnchanter, /* SkyriderPatrol, */ /* VaevictisAsmadiTheDire, */ /* AmuletOfSafekeeping, */ ArcaneEncyclopedia, /* ChaosWand, */ /* CrucibleOfWorlds, */ /* DesecratedTomb, */ /* DiamondMare, */ DragonsHoard, ExplosiveApparatus, FieldCreeper, FountainOfRenewal, GargoyleSentinel, GearsmithGuardian, /* MagistratesScepter, */ Manalith, /* MaraudersAxe, */ MeteorGolem, Millstone, /* RoguesGloves, */ /* SigiledSwordOfValeron, */ Skyscanner, SuspiciousBookcase, TransmogrifyingWand, /* CinderBarrens, */ /* DetectionTower, */ /* ForsakenSanctuary, */ /* FoulOrchard, */ /* HighlandLake, */ /* MeanderingRiver, */ /* ReliquaryTower, */ /* RuptureSpire, */ /* StoneQuarry */ /* SubmergedBoneyard, */ /* TimberGorge, */ /* TranquilExpanse, */ /* WoodlandStream, */
    ]

    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }

    static func AegisOfTheHeavens() -> Card {
        let aegisOfTheHeavens = Card(name: "Aegis of the Heavens", rarity: .Uncommon, set: set, number: 1)
        aegisOfTheHeavens.setManaCost("1W")
        aegisOfTheHeavens.setType(.Instant)
        aegisOfTheHeavens.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pump(1, 7) }))
        aegisOfTheHeavens.setFlavorText("Inner strength is never seen until it makes all the difference.")
        return aegisOfTheHeavens
    }
    static func AethershieldArtificer() -> Card {
        let aethershieldArtificer = Card(name: "Aethershield Artificer", rarity: .Uncommon, set: set, number: 2)
        aethershieldArtificer.setManaCost("3W")
        aethershieldArtificer.setType(.Creature, .Dwarf, .Artificer)
        aethershieldArtificer.addTriggeredAbility(
            trigger: .YourBeginCombat,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Artifact) && $0.isType(.Creature) && $0.getController() === aethershieldArtificer.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    target.pump(2, 2)
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                        object.indestructible = true
                        return object
                    }))
        }))
        aethershieldArtificer.setFlavorText("Most smiths shape metal, but some prefer more delicate materials.")
        aethershieldArtificer.power = 3
        aethershieldArtificer.toughness = 3
        return aethershieldArtificer
    }
    // 3 Ajani, Adversary of Tyrants
    // 4 Ajani's Last Stand
    static func AjanisPridemate() -> Card {
        let ajanisPridemate = Card(name: "Ajani's Pridemate", rarity: .Uncommon, set: set, number: 5)
        ajanisPridemate.setManaCost("1W")
        ajanisPridemate.setType(.Creature, .Cat, .Soldier)
        ajanisPridemate.addTriggeredAbility(
            trigger: .YouGainLife,
            effect: { ajanisPridemate.addCounter(.PlusOnePlusOne) },
            effectOptional: true
        )
        ajanisPridemate.setFlavorText("\"When one of us prospers, the pride prospers.\"\n--Jazal Goldmane")
        ajanisPridemate.power = 2
        ajanisPridemate.toughness = 2
        return ajanisPridemate
    }
    static func AjanisWelcome() -> Card {
        let ajanisWelcome = Card(name: "Ajani's Welcome", rarity: .Uncommon, set: set, number: 6)
        ajanisWelcome.setManaCost("W")
        ajanisWelcome.setType(.Enchantment)
        ajanisWelcome.addTriggeredAbility(
            trigger: .CreatureEntersBattlefieldUnderYourControl,
            effect: { ajanisWelcome.getController().gainLife(1) })
        ajanisWelcome.setFlavorText("\"You cannot defend others if your own well-being is neglected.\"")
        return ajanisWelcome
    }
    static func AngelOfTheDawn() -> Card {
        let angelOfTheDawn = Card(name: "Angel of the Dawn", rarity: .Common, set: set, number: 7)
        angelOfTheDawn.setManaCost("4W")
        angelOfTheDawn.setType(.Creature, .Angel)
        angelOfTheDawn.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { angelOfTheDawn.getController().getCreatures().forEach({
                $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    // TODO these should be separate effects because they are applied in different layers
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                    object.vigilance = true
                    return object
                }))
            })
        })
        angelOfTheDawn.setFlavorText("She sings for all those who have been silenced.")
        angelOfTheDawn.power = 3
        angelOfTheDawn.toughness = 3
        return angelOfTheDawn
    }
    static func CavalryDrillmaster() -> Card {
        let cavalryDrillmaster = Card(name: "Cavalry Drillmaster", rarity: .Common, set: set, number: 8)
        cavalryDrillmaster.setManaCost("1W")
        cavalryDrillmaster.setType(.Creature, .Human, .Warrior)
        cavalryDrillmaster.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { target in
                    target.pump(2, 0)
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.firstStrike = true; return $0 }))
            }))
        cavalryDrillmaster.power = 2
        cavalryDrillmaster.toughness = 1
        return cavalryDrillmaster
    }
    // 9 Cleansing Nova
    static func DaybreakChaplain() -> Card {
        let daybreakChaplain = Card(name: "Daybreak Chaplain", rarity: .Common, set: set, number: 10)
        daybreakChaplain.setManaCost("1W")
        daybreakChaplain.setType(.Creature, .Human, .Cleric)
        daybreakChaplain.lifelink = true
        daybreakChaplain.setFlavorText("\"May the light shine through me to guide the lost.\"")
        daybreakChaplain.power = 1
        daybreakChaplain.toughness = 3
        return daybreakChaplain
    }
    static func DwarvenPriest() -> Card {
        let dwarvenPriest = Card(name: "Dwarven Priest", rarity: .Common, set: set, number: 11)
        dwarvenPriest.setManaCost("3W")
        dwarvenPriest.setType(.Creature, .Dwarf, .Cleric)
        dwarvenPriest.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { dwarvenPriest.getController().gainLife(dwarvenPriest.getController().getCreatures().count) })
        dwarvenPriest.setFlavorText("\"These storied halls are under my protection.\"")
        dwarvenPriest.power = 2
        dwarvenPriest.toughness = 4
        return dwarvenPriest
    }
    static func GallantCavalry() -> Card {
        let gallantCavalry = Card(name: "Gallant Cavalry", rarity: .Common, set: set, number: 12)
        gallantCavalry.setManaCost("3W")
        gallantCavalry.setType(.Creature, .Human, .Knight)
        gallantCavalry.vigilance = true
        gallantCavalry.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { gallantCavalry.getController().createToken(Knight()) })
        gallantCavalry.setFlavorText("\"Our duty does not stop on our borders.\"")
        gallantCavalry.power = 2
        gallantCavalry.toughness = 2
        return gallantCavalry
    }
    static func HeraldOfFaith() -> Card {
        let heraldOfFaith = Card(name: "Herald of Faith", rarity: .Uncommon, set: set, number: 13)
        heraldOfFaith.setManaCost("3WW")
        heraldOfFaith.setType(.Creature, .Angel)
        heraldOfFaith.flying = true
        heraldOfFaith.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { heraldOfFaith.getController().gainLife(2) })
        heraldOfFaith.setFlavorText("The clerics prayed for salvation. The soldiers prayed for victory. Both prayers were answered.")
        heraldOfFaith.power = 4
        heraldOfFaith.toughness = 3
        return heraldOfFaith
    }
    // 14 Hieromancer's Cage
    static func InspiredCharge() -> Card {
        let inspiredCharge = Card(name: "Inspired Charge", rarity: .Common, set: set, number: 15)
        inspiredCharge.setManaCost("2WW")
        inspiredCharge.setType(.Instant)
        inspiredCharge.addEffect {
            inspiredCharge.getController().getCreatures().forEach({ $0.pump(2, 1) })
        }
        inspiredCharge.setFlavorText("\"Impossible! How could they overwhelm us? We had barricades, war elephants, ... and they were barely a tenth of our number!\"\n--General Avitora")
        return inspiredCharge
    }
    static func InvokeTheDivine() -> Card {
        let invokeTheDivine = Card(name: "Invoke the Divine", rarity: .Common, set: set, number: 16)
        invokeTheDivine.setManaCost("2W")
        invokeTheDivine.setType(.Instant)
        invokeTheDivine.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { target in
                let _ = target.destroy()
                invokeTheDivine.getController().gainLife(4)
            }))
        invokeTheDivine.setFlavorText("\"Let go of all that harms you. Cast your burdens into the darkness, and build for the faithful a house of light.\"\n--<i>Song of All</i>, canto 1008")
        return invokeTheDivine
    }
    static func Isolate() -> Card {
        let isolate = Card(name: "Isolate", rarity: .Rare, set: set, number: 17)
        isolate.setManaCost("W")
        isolate.setType(.Instant)
        isolate.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isPermanent() && $0.getConvertedManaCost() == 1},
                zones: [.Battlefield]),
            effect: { $0.exile() }))
        isolate.setFlavorText("Threefold were his crimes, doubled were his pleas, singular was his fate.")
        return isolate
    }
    static func KnightOfTheTusk() -> Card {
        let knightOfTheTusk = Card(name: "Knight of the Tusk", rarity: .Common, set: set, number: 18)
        knightOfTheTusk.setManaCost("4WW")
        knightOfTheTusk.setType(.Creature, .Human, .Knight)
        knightOfTheTusk.vigilance = true
        knightOfTheTusk.setFlavorText("\"Horse? Who needs a horse?\"")
        knightOfTheTusk.power = 3
        knightOfTheTusk.toughness = 7
        return knightOfTheTusk
    }
    static func KnightsPledge() -> Card {
        let knightsPledge = Card(name: "Knight's Pledge", rarity: .Common, set: set, number: 19)
        knightsPledge.setManaCost("1W")
        knightsPledge.setType(.Enchantment, .Aura)
        knightsPledge.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
                return object
        })
        knightsPledge.setFlavorText("\"As long as my faith persists, so shall I.\"")
        return knightsPledge
    }
    static func KnightlyValor() -> Card {
        let knightlyValor = Card(name: "Knightly Valor", rarity: .Uncommon, set: set, number: 20)
        knightlyValor.setManaCost("4W")
        knightlyValor.setType(.Enchantment, .Aura)
        knightlyValor.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
                // TODO: Layers
                object.vigilance = true
                return object
        })
        knightlyValor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { knightlyValor.getController().createToken(Knight()) })
        return knightlyValor
    }
    static func LenaSelflessChampion() -> Card {
        let lena = Card(name: "Lena, Selfless Champion", rarity: .Rare, set: set, number: 21)
        lena.setManaCost("4WW")
        lena.setType(.Legendary, .Creature, .Human, .Knight)
        lena.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let numNontokenCreatures = lena.getController().getCreatures().filter({ !$0.isToken() }).count
                for _ in 1 ... numNontokenCreatures {
                    lena.getController().createToken(Soldier())
                }
        })
        lena.addActivatedAbility(
            string: "Sacrifice ~: Creature you control with power less than ~'s power gain indestructible until end of turn.",
            cost: Cost.Sacrifice(),
            // TODO: Should use last-known information when determining Lena's power
            effect: { lena.getController().getCreatures().forEach({ creature in
                if creature.getPower() < lena.getPower() {
                    creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.indestructible = true; return $0 }))
                }
            })
        })
        lena.setFlavorText("\"Those who do evil and those who do nothing are equally worthy of contempt.\"")
        lena.power = 3
        lena.toughness = 3
        return lena
    }
    static func LeoninVanguard() -> Card {
        let leoninVanguard = Card(name: "Leonin Vangaurd", rarity: .Uncommon, set: set, number: 22)
        leoninVanguard.setManaCost("W")
        leoninVanguard.setType(.Creature, .Cat, .Soldier)
        leoninVanguard.addTriggeredAbility(
            trigger: .YourBeginCombat,
            effect: {
                leoninVanguard.pump(1, 1)
                leoninVanguard.getController().gainLife(1)
            },
            restriction: { leoninVanguard.getController().getCreatures().count >= 3 })
        leoninVanguard.setFlavorText("The best fighters are skilled in both harming and healing.")
        leoninVanguard.power = 1
        leoninVanguard.toughness = 1
        return leoninVanguard
    }
    static func LeoninWarleader() -> Card {
        let leoninWarleader = Card(name: "Leonin Warleader", rarity: .Rare, set: set, number: 23)
        leoninWarleader.setManaCost("2WW")
        leoninWarleader.setType(.Creature, .Cat, .Soldier)
        leoninWarleader.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                let tokens: [Object] = [Cat(), Cat()]
                for token in tokens {
                    token.attack(token.getOpponent())
                    token.setTapped(true)
                    leoninWarleader.getController().createToken(token)
                }
        })
        leoninWarleader.setFlavorText("When one leonin hunts, many more are surely nearby.")
        leoninWarleader.power = 4
        leoninWarleader.toughness = 4
        return leoninWarleader
    }
    static func LoxodonLineBreaker() -> Card {
        let loxodonLineBreaker = Card(name: "Loxodon Line Breaker", rarity: .Common, set: set, number: 24)
        loxodonLineBreaker.setManaCost("2W")
        loxodonLineBreaker.setType(.Creature, .Elephant, .Soldier)
        loxodonLineBreaker.setFlavorText("Loxodons are firm in stature and spirit. No matter the odds, they are always first into battle.")
        loxodonLineBreaker.power = 3
        loxodonLineBreaker.toughness = 2
        return loxodonLineBreaker
    }
    static func LuminousBonds() -> Card {
        let luminousBonds = Card(name: "Luminous Bonds", rarity: .Common, set: set, number: 25)
        luminousBonds.setManaCost("2W")
        luminousBonds.setType(.Enchantment, .Aura)
        luminousBonds.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.cantAttack = true
                object.cantBlock = true
                return object
        })
        luminousBonds.setFlavorText("\"Your part in this fight is done, vampire. Get used to your thirst.\"")
        return luminousBonds
    }
    static func MakeAStand() -> Card {
        let makeAStand = Card(name: "Make a Stand", rarity: .Uncommon, set: set, number: 26)
        makeAStand.setManaCost("2W")
        makeAStand.setType(.Instant)
        makeAStand.addEffect {
            makeAStand.getController().getCreatures().forEach({ creature in
                creature.pump(1, 0)
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.indestructible = true
                    return object
                }))
            })
        }
        makeAStand.setFlavorText("For a moment they stood tall, all fear forgotten.")
        return makeAStand
    }
    // 27 Mentor of the Meek
    static func MightyLeap() -> Card {
        let mightyLeap = Card(name: "Mighty Leap", rarity: .Common, set: set, number: 28)
        mightyLeap.setManaCost("1W")
        mightyLeap.setType(.Instant)
        mightyLeap.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                // TODO these should be separate effects because they're applied in different layers
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
                object.flying = true
                return object
            }))
        }))
        mightyLeap.setFlavorText("\"I feel the presence of the God-Pharoah in the Second Sun, and I rise upon its rays.\"")
        return mightyLeap
    }
    static func MilitiaBugler() -> Card {
        let militaBugler = Card(name: "Militia Bugler", rarity: .Uncommon, set: set, number: 29)
        militaBugler.setManaCost("2W")
        militaBugler.setType(.Creature, .Human, .Soldier)
        militaBugler.vigilance = true
        militaBugler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { militaBugler.getController().chooseCard(
                from: Array(militaBugler.getController().getLibrary().suffix(4)),
                // TODO: Make sure static abilities aren't affecting cards in libraries
                restriction: { $0.isType(.Creature) && $0.getPower() <= 2 },
                action: { chosen, rest in
                    chosen?.putIntoHand()
                    militaBugler.getController().putOnBottomOfLibrary(&rest, random: true)
                })
        })
        militaBugler.power = 2
        militaBugler.toughness = 3
        return militaBugler
    }
    // 30 Novice Knight
    static func OreskosSwiftclaw() -> Card {
        let oreskosSwiftclaw = Card(name: "Oreskos Swifclaw", rarity: .Common, set: set, number: 31)
        oreskosSwiftclaw.setManaCost("1W")
        oreskosSwiftclaw.setType(.Creature, .Cat, .Warrior)
        oreskosSwiftclaw.setFlavorText("The leonin of Oreskos are quick to take offense -- not because they are thin-skinned, but because they are always ready for a fight.")
        oreskosSwiftclaw.power = 3
        oreskosSwiftclaw.toughness = 1
        return oreskosSwiftclaw
    }
    static func PegasusCourser() -> Card {
        let pegasusCourser = Card(name: "Pegasus Couser", rarity: .Common, set: set, number: 32)
        pegasusCourser.setManaCost("2W")
        pegasusCourser.setType(.Creature, .Pegasus)
        pegasusCourser.flying = true
        pegasusCourser.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != pegasusCourser && $0.isAttacking && $0.isType(.Creature) },
                    zones: [.Battlefield]),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.flying = true
                    return object
                }))
        }))
        pegasusCourser.setFlavorText("A pegasus chooses its rider, bearing the worthy into the clouds and tossing all others to the ground.")
        pegasusCourser.power = 1
        pegasusCourser.toughness = 3
        return pegasusCourser
    }
    static func RemorsefulCleric() -> Card {
        let remorsefulCleric = Card(name: "Remorseful Cleric", rarity: .Rare, set: set, number: 33)
        remorsefulCleric.setManaCost("1W")
        remorsefulCleric.setType(.Creature, .Spirit, .Cleric)
        remorsefulCleric.flying = true
        remorsefulCleric.addActivatedAbility(
            string: "Sacrifice ~: Exile all cards from target player's graveyard.",
            cost: Cost.Sacrifice(),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { target in
                    target.getGraveyard().forEach({ $0.exile() })
        }))
        remorsefulCleric.setFlavorText("A lifetime of keeping up appearances is not enough to earn an eternity of rest.")
        remorsefulCleric.power = 2
        remorsefulCleric.toughness = 1
        return remorsefulCleric
    }
    static func ResplendentAngel() -> Card {
        let resplendentAngel = Card(name: "Resplendent Angel", rarity: .Mythic, set: set, number: 34)
        resplendentAngel.setManaCost("1WW")
        resplendentAngel.setType(.Creature, .Angel)
        resplendentAngel.flying = true
        resplendentAngel.addTriggeredAbility(
            trigger: .EachEndStep,
            effect: { resplendentAngel.getController().createToken(Angel()) },
            restriction: { resplendentAngel.getController().lifeGainedThisTurn >= 5 })
        resplendentAngel.addActivatedAbility(
            string: "{3}{W}{W}{W}: Until end of turn, ~ gets +2/+2 and gains lifelink.",
            cost: Cost.Mana("3WWW"),
            effect: {
                resplendentAngel.pump(2, 2)
                resplendentAngel.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0 }))
        })
        resplendentAngel.power = 3
        resplendentAngel.toughness = 3
        return resplendentAngel
    }
    static func Revitalize() -> Card {
        let revitalize = Card(name: "Revitalize", rarity: .Common, set: set, number: 35)
        revitalize.setManaCost("1W")
        revitalize.setType(.Instant)
        revitalize.addEffect {
            revitalize.getController().gainLife(3)
            revitalize.getController().drawCard()
        }
        revitalize.setFlavorText("\"A potion is no substitute for a skilled surgeon, but it will hold your bits in.\"\n--Torricks, battlefield medic")
        return revitalize
    }
    static func RustwingFalcon() -> Card {
        let rustwingFalcon = Card(name: "Rustwing Falcon", rarity: .Common, set: set, number: 36)
        rustwingFalcon.setManaCost("W")
        rustwingFalcon.setType(.Creature, .Bird)
        rustwingFalcon.flying = true
        rustwingFalcon.setFlavorText("Native to wide prairies and scrublands, falcons occasionally roost in dragon skeletons.")
        rustwingFalcon.power = 1
        rustwingFalcon.toughness = 2
        return rustwingFalcon
    }
    // 37 Shield Mare
    static func StarCrownedStag() -> Card {
        let starCrownedStag = Card(name: "Star-Crowned Stag", rarity: .Common, set: set, number: 38)
        starCrownedStag.setManaCost("3W")
        starCrownedStag.setType(.Creature, .Elk)
        starCrownedStag.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== starCrownedStag.getController() },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        starCrownedStag.setFlavorText("White as starlight on snow, it appears only on the eve of the winter solstice.")
        starCrownedStag.power = 3
        starCrownedStag.toughness = 3
        return starCrownedStag
    }
    // 39 Suncleanser
    static func TakeVengeance() -> Card {
        let takeVengeance = Card(name: "Take Vengeance", rarity: .Common, set: set, number: 40)
        takeVengeance.setManaCost("1W")
        takeVengeance.setType(.Sorcery)
        takeVengeance.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.isTapped },
                zones: [.Battlefield]),
            effect: { target in let _ = target.destroy() }))
        takeVengeance.setFlavorText("\"Your death will be a balm, your passing a welcome revision, and all will sigh with peace to know your demise.\"")
        return takeVengeance
    }
    // 41 Trusty Packbeast
    static func ValiantKnight() -> Card {
        let valiantKnight = Card(name: "Valiant Knight", rarity: .Rare, set: set, number: 42)
        valiantKnight.setManaCost("3W")
        valiantKnight.setType(.Creature, .Human, .Knight)
        valiantKnight.addStaticAbility({ object in
            if object != valiantKnight && object.isType(.Knight) && object.getController() === valiantKnight.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        valiantKnight.addActivatedAbility(
            string: "{3}{W}{W}: Knights you control gain double strike until end of turn.",
            cost: Cost.Mana("3WW"),
            effect: { valiantKnight.getController().getPermanents().filter({ $0.isType(.Knight) }).forEach({ knight in
                knight.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.doubleStrike = true; return $0 }))
            })})
        valiantKnight.setFlavorText("\"Defeat is no reason for retreat. It is a sign we must redouble our efforts to win this fight.\"")
        valiantKnight.power = 3
        valiantKnight.toughness = 4
        return valiantKnight
    }
    static func AetherTunnel() -> Card {
        let aetherTunnel = Card(name: "Aether Tunnel", rarity: .Common, set: set, number: 43)
        aetherTunnel.setManaCost("1U")
        aetherTunnel.setType(.Enchantment, .Aura)
        aetherTunnel.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 1
                // TODO: Layers
                object.unblockable = true
                return object
        })
        aetherTunnel.setFlavorText("If you can't find a doorway, make one.")
        return aetherTunnel
    }
    // 44 Anticipate
    static func AvenWindMage() -> Card {
        let avenWindMage = Card(name: "Aven Wind Mage", rarity: .Common, set: set, number: 45)
        avenWindMage.setManaCost("2U")
        avenWindMage.setType(.Creature, .Bird, .Wizard)
        avenWindMage.flying = true
        avenWindMage.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { avenWindMage.pump(1, 1) })
        avenWindMage.setFlavorText("\"My skill sharpens with each beat of my wings.\"")
        avenWindMage.power = 2
        avenWindMage.toughness = 2
        return avenWindMage
    }
    static func AviationPioneer() -> Card {
        let aviationPioneer = Card(name: "Aviation Pioneer", rarity: .Common, set: set, number: 46)
        aviationPioneer.setManaCost("2U")
        aviationPioneer.setType(.Creature, .Human, .Artificer)
        aviationPioneer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { aviationPioneer.getController().createToken(Thopter()) })
        aviationPioneer.setFlavorText("\"They say perfection is unattainable, but they said that about flight too.\"")
        aviationPioneer.power = 1
        aviationPioneer.toughness = 2
        return aviationPioneer
    }
    // 47 Bone to Ash
    // 48 Cancel
    // 49 Departed Deckhand
    static func Disperse() -> Card {
        let disperse = Card(name: "Disperse", rarity: .Common, set: set, number: 50)
        disperse.setManaCost("1U")
        disperse.setType(.Instant)
        disperse.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetNonlandPermanent(),
            effect: { target in target.bounce() }))
        disperse.setFlavorText("It's pointless to hold on when you have nothing to hold on with.")
        return disperse
    }
    static func Divination() -> Card {
        let divination = Card(name: "Divination", rarity: .Common, set: set, number: 51)
        divination.setManaCost("2U")
        divination.setType(.Sorcery)
        divination.addEffect {
            divination.getController().drawCards(2)
        }
        divination.setFlavorText("\"The stars mark your destiny. May you accept the fate thus divulged.\"")
        return divination
    }
    // 52 Djinn of Wishes
    // 53 Dwindle
    // 54 Essence Scatter
    static func ExclusionMage() -> Card {
        let exclusionMage = Card(name: "Exclusion Mage", rarity: .Uncommon, set: set, number: 55)
        exclusionMage.setManaCost("2U")
        exclusionMage.setType(.Creature, .Human, .Wizard)
        exclusionMage.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== exclusionMage.getController() },
                    zones: [.Battlefield]),
                effect: { $0.bounce() }))
        exclusionMage.setFlavorText("Successful battles start with knowing who's worth fighting.")
        exclusionMage.power = 2
        exclusionMage.toughness = 2
        return exclusionMage
    }
    static func FrilledSeaSerpent() -> Card {
        let frilledSeaSerpent = Card(name: "Frilled Sea Serpent", rarity: .Common, set: set, number: 56)
        frilledSeaSerpent.setManaCost("4UU")
        frilledSeaSerpent.setType(.Creature, .Serpent)
        frilledSeaSerpent.addActivatedAbility(
            string: "{5}{U}{U}: ~ can't be blocked this turn.",
            cost: Cost.Mana("5UU"),
            effect: { frilledSeaSerpent.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.unblockable = true; return $0 }))
        })
        frilledSeaSerpent.setFlavorText("\"Reel it in. No, wait! Throw it back!\"\n--Gertrude, deep-sea angler")
        frilledSeaSerpent.power = 4
        frilledSeaSerpent.toughness = 6
        return frilledSeaSerpent
    }
    static func GearsmithProdigy() -> Card {
        let gearsmithProdigy = Card(name: "Gearsmith Prodigy", rarity: .Common, set: set, number: 57)
        gearsmithProdigy.setManaCost("U")
        gearsmithProdigy.setType(.Creature, .Human, .Artificer)
        gearsmithProdigy.addStaticAbility({ object in
            if object == gearsmithProdigy && !object.getController().getArtifacts().isEmpty {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        gearsmithProdigy.setFlavorText("Young artificers on Kaladesh let their imaginations run wild.")
        gearsmithProdigy.power = 1
        gearsmithProdigy.toughness = 2
        return gearsmithProdigy
    }
    // 58 Ghostform
    // 59 Horizon Scholar
    // 60 Metamorphic Alteration
    // 61 Mirror Image
    // 62 Mistcaller
    static func MysticArchaeologist() -> Card {
        let mysticArchaeologist = Card(name: "Mystic Archaeologist", rarity: .Rare, set: set, number: 63)
        mysticArchaeologist.setManaCost("1U")
        mysticArchaeologist.setType(.Creature, .Human, .Wizard)
        mysticArchaeologist.addActivatedAbility(
            string: "{3}{U}{U}: Draw two cards.",
            cost: Cost.Mana("3UU"),
            effect: { mysticArchaeologist.getController().drawCards(2) })
        mysticArchaeologist.setFlavorText("The delight of discovery drives the pursuit of knowledge.")
        mysticArchaeologist.power = 2
        mysticArchaeologist.toughness = 1
        return mysticArchaeologist
    }
    // 64 Omenspeaker
    // 65 Omniscience
    static func OneWithTheMachine() -> Card {
        let oneWithTheMachine = Card(name: "One with the Machine", rarity: .Rare, set: set, number: 66)
        oneWithTheMachine.setManaCost("3U")
        oneWithTheMachine.setType(.Sorcery)
        oneWithTheMachine.addEffect {
            let artifacts = oneWithTheMachine.getController().getArtifacts()
            let maxArtifactCMC = artifacts.map({ return $0.getConvertedManaCost() }).max()
            oneWithTheMachine.getController().drawCards(maxArtifactCMC ?? 0)
        }
        oneWithTheMachine.setFlavorText("\"When I grafted the Planar Bridge into myself I felt my Planeswalker spark flare beyond my body. The multiverse was my plaything. It felt... incredible.\"\n--Tezzeret")
        return oneWithTheMachine
    }
    static func PatientRebuilding() -> Card {
        let patientRebuilding = Card(name: "Patient Rebuilding", rarity: .Rare, set: set, number: 67)
        patientRebuilding.setManaCost("3UU")
        patientRebuilding.setType(.Enchantment)
        patientRebuilding.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { return $0 !== patientRebuilding.getController() }),
                effect: { target in
                    var cardsToDraw = 0
                    for _ in 0..<3 {
                        if !target.getLibrary().isEmpty {
                            let topOfLibrary = target.getLibrary().last!
                            target.mill(1)
                            if topOfLibrary == target.getGraveyard().last! && topOfLibrary.isType(.Land) {
                                cardsToDraw = cardsToDraw + 1
                            }
                        }
                    }
                    patientRebuilding.getController().drawCards(cardsToDraw)
        }))
        patientRebuilding.setFlavorText("Nicol Bolas would not rest until he was restored to his former glory.")
        return patientRebuilding
    }
    static func PsychicCorrosion() -> Card {
        let psychicCorrosion = Card(name: "Psychic Corrosion", rarity: .Uncommon, set: set, number: 68)
        psychicCorrosion.setManaCost("2U")
        psychicCorrosion.setType(.Enchantment)
        psychicCorrosion.addTriggeredAbility(
            trigger: .YouDrawCard,
            effect: { psychicCorrosion.getOpponent().mill(2) })
        psychicCorrosion.setFlavorText("\"To break another's mind is to deliver a fate worse than death. It is a terrifying power.\"\n--Jace Beleren")
        return psychicCorrosion
    }
    // 69 Sai, Master Thopterist
    // 70 Salvager of Secrets
    static func ScholarOfStars() -> Card {
        let scholarOfStars = Card(name: "Scholar of Stars", rarity: .Common, set: set, number: 71)
        scholarOfStars.setManaCost("3U")
        scholarOfStars.setType(.Creature, .Human, .Artificer)
        scholarOfStars.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { scholarOfStars.getController().drawCard() },
            restriction: { !scholarOfStars.getController().getArtifacts().isEmpty })
        scholarOfStars.setFlavorText("\"The path of the stars is as reliable as the instruments that measure them.\"")
        scholarOfStars.power = 3
        scholarOfStars.toughness = 2
        return scholarOfStars
    }
    static func Sift() -> Card {
        let sift = Card(name: "Sift", rarity: .Uncommon, set: set, number: 72)
        sift.setManaCost("3U")
        sift.setType(.Sorcery)
        sift.addEffect({
            sift.getController().drawCards(3)
            sift.getController().discard()
        })
        sift.setFlavorText("Dwell longest on the thoughts that shine brightest.")
        return sift
    }
    // 73 Skilled Animator
    // 74 Sleep
    static func SnappingDrake() -> Card {
        let snappingDrake = Card(name: "Snapping Drake", rarity: .Common, set: set, number: 75)
        snappingDrake.setManaCost("3U")
        snappingDrake.setType(.Creature, .Drake)
        snappingDrake.flying = true
        snappingDrake.setFlavorText("Foul-tempered, poorly trained, and mule-stubborn, the drake is the perfect test of the master's will.")
        snappingDrake.power = 3
        snappingDrake.toughness = 2
        return snappingDrake
    }
    static func SupremePhantom() -> Card {
        let supremePhantom = Card(name: "Supreme Phantom", rarity: .Rare, set: set, number: 76)
        supremePhantom.setManaCost("1U")
        supremePhantom.setType(.Creature, .Spirit)
        supremePhantom.flying = true
        supremePhantom.addStaticAbility({ object in
            if object != supremePhantom  && object.isType(.Spirit) && object.getController() === supremePhantom.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness()
            }
            return object
        })
        supremePhantom.setFlavorText("A king's knowledge does not vanish when the heart stops beating.")
        supremePhantom.power = 1
        supremePhantom.toughness = 3
        return supremePhantom
    }
    // 77 Surge Mare
    // 78 Switcheroo
    static func TezzeretArtificeMaster() -> Card {
        let tezzeret = Card(name: "Tezzeret, Artifice Master", rarity: .Mythic, set: set, number: 79)
        tezzeret.setManaCost("3UU")
        tezzeret.setType(.Legendary, .Planeswalker, .Tezzeret)
        tezzeret.addActivatedAbility(
            string: "{+1}: Create a 1/1 colorless Thopter artifact creature token with flying.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: { tezzeret.getController().createToken(Thopter()) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        tezzeret.addActivatedAbility(
            string: "{0}: Draw a card. If you control three or more artifacts, draw two cards instead.",
            cost: Cost.AddCounters(.Loyalty, 0),
            effect: {
                let numArtifacts = tezzeret.getController().getPermanents().filter({ $0.isType(.Artifact) }).count
                let numCards = numArtifacts >= 3 ? 2 : 1
                tezzeret.getController().drawCards(numCards)
            },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        tezzeret.addActivatedAbility(
            string: "{-9}: You get an emblem with \"At the beginning of your end step, search your library for a permanent card, put it onto the battlefield, then shuffle your library.\"",
            cost: Cost.RemoveCounters(.Loyalty, 9),
            effect: { tezzeret.getController().createEmblem(TezzeretArtificeMasterEmblem()) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        tezzeret.startingLoyalty = 5
        return tezzeret
    }
    static func TolarianScholar() -> Card {
        let tolarianScholar = Card(name: "Tolarian Scholar", rarity: .Common, set: set, number: 80)
        tolarianScholar.setManaCost("2U")
        tolarianScholar.setType(.Creature, .Human, .Wizard)
        tolarianScholar.setFlavorText("The Tolarian Academies embrace a tradition of study and research while discouraging the kinds of experiments that ruined the original island of Tolaria.")
        tolarianScholar.power = 2
        tolarianScholar.toughness = 3
        return tolarianScholar
    }
    static func TotallyLost() -> Card {
        let totallyLost = Card(name: "Totally Lost", rarity: .Common, set: set, number: 81)
        totallyLost.setManaCost("4U")
        totallyLost.setType(.Instant)
        totallyLost.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetNonlandPermanent(),
            effect: { $0.putOnTopOfLibrary() }))
        totallyLost.setFlavorText("Fblthp had always hated crowds.")
        return totallyLost
    }
    static func UncomfortableChill() -> Card {
        let uncomfortableChill = Card(name: "Uncomfortable Chill", rarity: .Common, set: set, number: 82)
        uncomfortableChill.setManaCost("2U")
        uncomfortableChill.setType(.Instant)
        uncomfortableChill.addEffect {
            uncomfortableChill.getOpponent().getCreatures().forEach({ $0.pump(-2, 0) })
            uncomfortableChill.getController().drawCard()
        }
        uncomfortableChill.setFlavorText("The cold slowed their movements until only their panicked eyeballs swiveled beneath the ice.")
        return uncomfortableChill
    }
    static func WallOfMist() -> Card {
        let wallOfMist = Card(name: "Wall of Mist", rarity: .Common, set: set, number: 83)
        wallOfMist.setManaCost("1U")
        wallOfMist.setType(.Creature, .Wall)
        wallOfMist.defender = true
        wallOfMist.setFlavorText("The seafloor is flecked with the bones of fools who dared to sail into the mist.")
        wallOfMist.power = 0
        wallOfMist.toughness = 5
        return wallOfMist
    }
    static func WindreaderSphinx() -> Card {
        let windreaderSphinx = Card(name: "Windreader Sphinx", rarity: .Rare, set: set, number: 84)
        windreaderSphinx.setManaCost("5UU")
        windreaderSphinx.setType(.Creature, .Sphinx)
        windreaderSphinx.flying = true
        windreaderSphinx.addTriggeredAbility(
            trigger: .CreatureWithFlyingAttacks,
            effect: { windreaderSphinx.getController().drawCard() },
            effectOptional: true)
        windreaderSphinx.setFlavorText("\"Your mind is too filled with foolish concerns to hear the subtle whispers that the breeze brings.\"")
        windreaderSphinx.power = 3
        windreaderSphinx.toughness = 7
        return windreaderSphinx
    }
    // 85 Abnormal Endurance
    // 86 Blood Divination
    static func Bogstomper() -> Card {
        let bogstomper = Card(name: "Bogstomper", rarity: .Common, set: set, number: 87)
        bogstomper.setManaCost("4BB")
        bogstomper.setType(.Creature, .Beast)
        bogstomper.setFlavorText("\"They are gental herbivores, despite their size. Approach cautiously, and hum a tune to let them know you mean no harm.\"\n--Vivien Reid")
        bogstomper.power = 6
        bogstomper.toughness = 5
        return bogstomper
    }
    // 88 Bone Dragon
    static func ChildOfNight() -> Card {
        let childOfNight = Card(name: "Child of Night", rarity: .Common, set: set, number: 89)
        childOfNight.setManaCost("1B")
        childOfNight.setType(.Creature, .Vampire)
        childOfNight.lifelink = true
        childOfNight.setFlavorText("Sins that would be too gruesome in the light of day are made more pleasing in the dark of night.")
        childOfNight.power = 2
        childOfNight.toughness = 1
        return childOfNight
    }
    static func DeathBaron() -> Card {
        let deathBaron = Card(name: "Death Baron", rarity: .Rare, set: set, number: 90)
        deathBaron.setManaCost("1BB")
        deathBaron.setType(.Creature, .Zombie, .Wizard)
        deathBaron.addStaticAbility({ object in
            if object.getController() === deathBaron.getController() && (object.isType(.Skeleton) || (object.isType(.Zombie) && object != deathBaron)) {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                // TODO: These should apply in different layers
                object.deathtouch = true
            }
            return object
        })
        deathBaron.setFlavorText("For the necromancer barons, killing and recruitment are one in the same.")
        deathBaron.power = 2
        deathBaron.toughness = 2
        return deathBaron
    }
    // 91 Demon of Catastrophes
    static func DiregrafGhoul() -> Card {
        let diregrafGhoul = Card(name: "Diregraf Ghoul", rarity: .Uncommon, set: set, number: 92)
        diregrafGhoul.setManaCost("B")
        diregrafGhoul.setType(.Creature, .Zombie)
        diregrafGhoul.entersTapped = true
        diregrafGhoul.setFlavorText("\"At least this one still has arms and legs. Well, most of its legs.\"\n--Enslow, ghoulcaller of Nephalia")
        diregrafGhoul.power = 2
        diregrafGhoul.toughness = 2
        return diregrafGhoul
    }
    static func DoomedDissenter() -> Card {
        let doomedDissenter = Card(name: "Doomed Dissenter", rarity: .Common, set: set, number: 93)
        doomedDissenter.setManaCost("1B")
        doomedDissenter.setType(.Creature, .Human)
        doomedDissenter.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { doomedDissenter.getController().createToken(Zombie()) })
        doomedDissenter.setFlavorText("There is only one fate left to those banished from the God-Pharoah's city.")
        doomedDissenter.power = 1
        doomedDissenter.toughness = 1
        return doomedDissenter
    }
    static func Duress() -> Card {
        let duress = Card(name: "Duress", rarity: .Common, set: set, number: 94)
        duress.setManaCost("B")
        duress.setType(.Sorcery)
        duress.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.SinglePlayer(
                restriction: { $0 !== duress.getController() }),
            effect: { target in
                duress.getController().chooseCard(
                    from: target.getHand(),
                    restriction: { !$0.isType(.Creature) && !$0.isType(.Land) },
                    action: { chosen, rest in chosen?.discard()})
        }))
        duress.setFlavorText("\"It hurts more if you think about it.\"\n--Hooks, Cabal torturer")
        return duress
    }
    static func EpicureOfBlood() -> Card {
        let epicureOfBlood = Card(name: "Epicure of Blood", rarity: .Common, set: set, number: 95)
        epicureOfBlood.setManaCost("4B")
        epicureOfBlood.setType(.Creature, .Vampire)
        epicureOfBlood.addTriggeredAbility(
            trigger: .YouGainLife,
            effect: { epicureOfBlood.getOpponent().loseLife(1) })
        epicureOfBlood.setFlavorText("\"Fleshy, with just a hint of leather. A fine vintage.\"")
        epicureOfBlood.power = 3
        epicureOfBlood.toughness = 3
        return epicureOfBlood
    }
    // 96 Fell Specter
    // 97 Fraying Omnipotence
    // 98 Gravedigger
    // 99 Graveyard Marshal
    static func HiredBlade() -> Card {
        let hiredBlade = Card(name: "Hired Blade", rarity: .Common, set: set, number: 100)
        hiredBlade.setManaCost("2B")
        hiredBlade.setType(.Creature, .Human, .Assassin)
        hiredBlade.flash = true
        hiredBlade.setFlavorText("\"If you want them dead, buy some poison. If you want them to have the worst day of their life before dying, then let's talk price.\"")
        hiredBlade.power = 3
        hiredBlade.toughness = 2
        return hiredBlade
    }
    static func InfectiousHorror() -> Card {
        let infectiousHorror = Card(name: "Infectious Horror", rarity: .Common, set: set, number: 101)
        infectiousHorror.setManaCost("3B")
        infectiousHorror.setType(.Creature, .Zombie, .Horror)
        infectiousHorror.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { infectiousHorror.getOpponent().loseLife(2) })
        infectiousHorror.setFlavorText("Not once in the history of Grixis has anyone died of old age.")
        infectiousHorror.power = 2
        infectiousHorror.toughness = 2
        return infectiousHorror
    }
    static func InfernalReckoning() -> Card {
        let infernalReckoning = Card(name: "Infernal Reckoning", rarity: .Rare, set: set, number: 102)
        infernalReckoning.setManaCost("B")
        infernalReckoning.setType(.Instant)
        infernalReckoning.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isColorless() && $0.isType(.Creature) },
                zones: [.Battlefield]),
            effect: { target in
                let power = target.getPower()
                target.exile()
                infernalReckoning.getController().gainLife(power)
        }))
        infernalReckoning.setFlavorText("\"When these intruders are gone, Zendikar will be my throne, my palace, my playground.")
        return infernalReckoning
    }
    // 103 Infernal Scarring
    // 104 Isareth the Awakener
    static func LichsCaress() -> Card {
        let lichsCaress = Card(name: "Lich's Caress", rarity: .Common, set: set, number: 105)
        lichsCaress.setManaCost("3BB")
        lichsCaress.setType(.Sorcery)
        lichsCaress.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                let _ = target.destroy()
                lichsCaress.getController().gainLife(3)
        }))
        lichsCaress.setFlavorText("A lich must consume mortal souls to feed its eternal life.")
        return lichsCaress
    }
    // 106 Liliana, Untouched by Death
    // 107 Liliana's Contract
    // 108 Macabre Waltz
    static func MindRot() -> Card {
        let mindRot = Card(name: "Mind Rot", rarity: .Common, set: set, number: 109)
        mindRot.setManaCost("2B")
        mindRot.setType(.Sorcery)
        mindRot.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.TargetPlayer(),
            effect: { $0.discard(2) }))
        mindRot.setFlavorText("Many an inventor has collapsed under the pressure to create a flawless design.")
        return mindRot
    }
    static func Murder() -> Card {
        let murder = Card(name: "Murder", rarity: .Uncommon, set: set, number: 110)
        murder.setManaCost("1BB")
        murder.setType(.Instant)
        murder.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in let _ = target.destroy() }))
        murder.setFlavorText("\"It's not work if you enjoy it.\"")
        return murder
    }
    static func NightmaresThirst() -> Card {
        let nightmaresThirst = Card(name: "Nightmare's Thirst", rarity: .Uncommon, set: set, number: 111)
        nightmaresThirst.setManaCost("B")
        nightmaresThirst.setType(.Instant)
        nightmaresThirst.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                nightmaresThirst.getController().gainLife(1)
                let amt = nightmaresThirst.getController().lifeGainedThisTurn * -1
                target.pump(amt, amt)
        }))
        nightmaresThirst.setFlavorText("That feeling of something on your chest is usually sleep paralysis. Occasionally, it's something else.")
        return nightmaresThirst
    }
    // 112 Open the Graves
    // 113 Phylactery Lich
    // 114 Plague Mare
    // 115 Ravenous Harpy
    // 116 Reassembling Skeleton
    // 117 Rise from the Grave
    static func SkeletonArcher() -> Card {
        let skeletonArcher = Card(name: "Skeleton Archer", rarity: .Common, set: set, number: 118)
        skeletonArcher.setManaCost("3B")
        skeletonArcher.setType(.Creature, .Skeleton, .Archer)
        skeletonArcher.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { skeletonArcher.damage(to: $0, 1) }))
        skeletonArcher.setFlavorText("\"When it comes to killing with precision, a soul is but a hindrance.\"\n--Izareth the Awakener")
        skeletonArcher.power = 3
        skeletonArcher.toughness = 3
        return skeletonArcher
    }
    static func SkymarchBloodletter() -> Card {
        let skymarchBloodletter = Card(name: "Skymarch Bloodletter", rarity: .Common, set: set, number: 119)
        skymarchBloodletter.setManaCost("2B")
        skymarchBloodletter.setType(.Creature, .Vampire, .Soldier)
        skymarchBloodletter.flying = true
        skymarchBloodletter.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== skymarchBloodletter.getController() }),
                effect: { target in
                    target.loseLife(1)
                    skymarchBloodletter.getController().gainLife(1)
            }))
        skymarchBloodletter.setFlavorText("From the perpetual shadowsmoke that hung above the ship, a silent form emerged, lips curled with malice and anticipation.")
        skymarchBloodletter.power = 2
        skymarchBloodletter.toughness = 2
        return skymarchBloodletter
    }
    static func SovereignsBite() -> Card {
        let sovereignsBite = Card(name: "Sovereign's Bite", rarity: .Common, set: set, number: 120)
        sovereignsBite.setManaCost("1B")
        sovereignsBite.setType(.Sorcery)
        sovereignsBite.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.TargetPlayer(),
            effect: { target in
                target.loseLife(3)
                sovereignsBite.getController().gainLife(3)
            }))
        sovereignsBite.setFlavorText("\"You have given all to your kingdom, dear knight. Serenity shall be your prize.\"\n--Queen Lian")
        return sovereignsBite
    }
    static func StitchersSupplier() -> Card {
        let stitchersSupplier = Card(name: "Sticher's Supplier", rarity: .Uncommon, set: set, number: 121)
        stitchersSupplier.setManaCost("B")
        stitchersSupplier.setType(.Creature, .Zombie)
        stitchersSupplier.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { stitchersSupplier.getController().mill(3) })
        stitchersSupplier.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { stitchersSupplier.getController().mill(3) })
        stitchersSupplier.setFlavorText("No part goes to waste.")
        stitchersSupplier.power = 1
        stitchersSupplier.toughness = 1
        return stitchersSupplier
    }
    static func StranglingSpores() -> Card {
        let stranglingSpores = Card(name: "Strangling Spores", rarity: .Common, set: set, number: 122)
        stranglingSpores.setManaCost("3B")
        stranglingSpores.setType(.Instant)
        stranglingSpores.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pump(-3, -3) }))
        stranglingSpores.setFlavorText("Imagine a thousand tiny mushrooms cropping up within your lungs.")
        return stranglingSpores
    }
    // 123 Two-Headed Zombie
    static func VampireNeonate() -> Card {
        let vampireNeonate = Card(name: "Vampire Neonate", rarity: .Common, set: set, number: 124)
        vampireNeonate.setManaCost("B")
        vampireNeonate.setType(.Creature, .Vampire)
        vampireNeonate.addActivatedAbility(
            string: "{2}, {T}: Each opponent loses 1 life and you gain 1 life.",
            cost: Cost.Mana("2").Tap(),
            effect: {
                vampireNeonate.getOpponent().loseLife(1)
                vampireNeonate.getController().gainLife(1)
        })
        vampireNeonate.setFlavorText("One day, they may be paragons of deadly elegance. For the moment, they possess nothing but thirst.")
        vampireNeonate.power = 0
        vampireNeonate.toughness = 3
        return vampireNeonate
    }
    static func VampireSovereign() -> Card {
        let vampireSovereign = Card(name: "Vampire Sovereign", rarity: .Uncommon, set: set, number: 125)
        vampireSovereign.setManaCost("3BB")
        vampireSovereign.setType(.Creature, .Vampire)
        vampireSovereign.flying = true
        vampireSovereign.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== vampireSovereign.getController() }),
                effect: { target in
                    target.loseLife(3)
                    vampireSovereign.getController().gainLife(3)
            }))
        vampireSovereign.setFlavorText("\"Your service shall be rewarded.\"\n--Queen Lian")
        vampireSovereign.power = 3
        vampireSovereign.toughness = 4
        return vampireSovereign
    }
    static func WalkingCorpse() -> Card {
        let walkingCorpse = Card(name: "Walking Corpse", rarity: .Common, set: set, number: 124)
        walkingCorpse.setManaCost("1B")
        walkingCorpse.setType(.Creature, .Zombie)
        walkingCorpse.setFlavorText("\"Feeding a normal army is a problem of logistics. With zombies, it is an asset. Feeding is why they fight. Feeding is why they are feared.\"\n--Jadar, ghoulcaller of Nephalia")
        walkingCorpse.power = 2
        walkingCorpse.toughness = 2
        return walkingCorpse
    }
    // 127 Act of Treason
    // 128 Alpine Moon
    // 129 Apex of Power
    // 130 Banefire
    // 131 Boggart Brute
    static func CatalystElemental() -> Card {
        let catalystElemental = Card(name: "Catalyst Elemental", rarity: .Common, set: set, number: 132)
        catalystElemental.setManaCost("2R")
        catalystElemental.setType(.Creature, .Elemental)
        catalystElemental.addActivatedAbility(
            string: "Sacrifice ~: Add {R}{R}.",
            cost: Cost.Sacrifice(),
            effect: { catalystElemental.getController().addMana(color: .Red, 2) })
        catalystElemental.setFlavorText("As the hyperstormic generator crept past redline, a being emerged from the arc.")
        catalystElemental.power = 2
        catalystElemental.toughness = 2
        return catalystElemental
    }
    static func CrashThrough() -> Card {
        let crashThrough = Card(name: "Crash Through", rarity: .Common, set: set, number: 133)
        crashThrough.setManaCost("R")
        crashThrough.setType(.Sorcery)
        crashThrough.addEffect({
            crashThrough.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
            })
            crashThrough.getController().drawCard()
        })
        return crashThrough
    }
    // 134 Dark-Dweller Oracle
    // 135 Demanding Dragon
    // 136 Dismissive Pyromancer
    // 137 Doublecast
    static func DragonEgg() -> Card {
        let dragonEgg = Card(name: "Dragon Egg", rarity: .Uncommon, set: set, number: 138)
        dragonEgg.setManaCost("2R")
        dragonEgg.setType(.Creature, .Dragon, .Egg)
        dragonEgg.defender = true
        dragonEgg.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { dragonEgg.getController().createToken(Dragon_Firebreathing()) })
        dragonEgg.setFlavorText("Dragon birth lairs are littered with treasure to entice the young from their eggs.")
        dragonEgg.power = 0
        dragonEgg.toughness = 2
        return dragonEgg
    }
    static func Electrify() -> Card {
        let electrify = Card(name: "Electrify", rarity: .Common, set: set, number: 139)
        electrify.setManaCost("3R")
        electrify.setType(.Instant)
        electrify.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in electrify.damage(to: target, 4) }))
        electrify.setFlavorText("\"Some hid from the storm. I embraced it and learned its name.\"")
        return electrify
    }
    static func FieryFinish() -> Card {
        let fieryFinish = Card(name: "Fiery Finish", rarity: .Uncommon, set: set, number: 140)
        fieryFinish.setManaCost("4RR")
        fieryFinish.setType(.Sorcery)
        fieryFinish.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in fieryFinish.damage(to: target, 7) }))
        fieryFinish.setFlavorText("Negotiations reached an abrupt conclusion.")
        return fieryFinish
    }
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: .Common, set: set, number: 141)
        fireElemental.setManaCost("3RR")
        fireElemental.setType(.Creature, .Elemental)
        fireElemental.setFlavorText("It treads on feet of coals and strikes with the force of a volcano.")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    static func GoblinInstigator() -> Card {
        let goblinInstigator = Card(name: "Goblin Instigator", rarity: .Common, set: set, number: 142)
        goblinInstigator.setManaCost("1R")
        goblinInstigator.setType(.Creature, .Goblin)
        goblinInstigator.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { goblinInstigator.getController().createToken(Goblin()) })
        goblinInstigator.setFlavorText("\"We can take 'em. You go first!\"")
        goblinInstigator.power = 1
        goblinInstigator.toughness = 1
        return goblinInstigator
    }
    static func GoblinMotivator() -> Card {
        let goblinMotivator = Card(name: "Goblin Motivator", rarity: .Common, set: set, number: 143)
        goblinMotivator.setManaCost("R")
        goblinMotivator.setType(.Creature, .Goblin, .Warrior)
        goblinMotivator.addActivatedAbility(
            string: "{T}: Target creature gains haste until end of turn.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { target in target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.haste = true
                    return object
                }))
            }))
        goblinMotivator.setFlavorText("Small words stoke large flames.")
        goblinMotivator.power = 1
        goblinMotivator.toughness = 1
        return goblinMotivator
    }
    // 144 Goblin Trashmaster
    static func Guttersnipe() -> Card {
        let guttersnipe = Card(name: "Guttersnipe", rarity: .Uncommon, set: set, number: 145)
        guttersnipe.setManaCost("2R")
        guttersnipe.setType(.Creature, .Goblin, .Shaman)
        guttersnipe.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { guttersnipe.damage(to: guttersnipe.getOpponent(), 2) })
        guttersnipe.setFlavorText("\"I found a new toy. Wanna play?\"")
        guttersnipe.power = 2
        guttersnipe.toughness = 2
        return guttersnipe
    }
    static func HavocDevils() -> Card {
        let havocDevils = Card(name: "Havoc Devils", rarity: .Common, set: set, number: 146)
        havocDevils.setManaCost("2RR")
        havocDevils.setType(.Creature, .Devil)
        havocDevils.trample = true
        havocDevils.setFlavorText("For devils, burning things is the highest form of comedy, diversion, and artistic expression.")
        havocDevils.power = 4
        havocDevils.toughness = 3
        return havocDevils
    }
    static func HostileMinotaur() -> Card {
        let hostileMinotaur = Card(name: "Hostile Minotaur", rarity: .Common, set: set, number: 147)
        hostileMinotaur.setManaCost("3R")
        hostileMinotaur.setType(.Creature, .Minotaur)
        hostileMinotaur.haste = true
        hostileMinotaur.setFlavorText("The bellow of a minotaur always translates to \"charge.\"")
        hostileMinotaur.power = 3
        hostileMinotaur.toughness = 3
        return hostileMinotaur
    }
    // 148 Inferno Hellion
    // 149 Lathliss, Dragon Queen
    // 150 Lava Axe
    // 151 Lightning Mare
    static func LightningStrike() -> Card {
        let lightningStrike = Card(name: "Lightning Strike", rarity: .Uncommon, set: set, number: 152)
        lightningStrike.setManaCost("1R")
        lightningStrike.setType(.Instant)
        lightningStrike.addEffect(TargetedEffect(
            restriction: TargetingRestriction.AnyTarget(),
            effect: { lightningStrike.damage(to: $0, 3) }))
        lightningStrike.setFlavorText("To wield lightning is to tame chaose.")
        return lightningStrike
    }
    static func OnakkeOgre() -> Card {
        let onakkeOgre = Card(name: "Onakke Ogre", rarity: .Common, set: set, number: 153)
        onakkeOgre.setManaCost("2R")
        onakkeOgre.setType(.Creature, .Ogre, .Warrior)
        onakkeOgre.setFlavorText("The ogres you know are nothing like the Onakke. Possessing both intellect and industry, they had brute strength without being brutish.")
        onakkeOgre.power = 4
        onakkeOgre.toughness = 2
        return onakkeOgre
    }
    // 154 Sarkhan, Fireblood
    // 155 Sarkhan's Unsealing
    static func Shock() -> Card {
        let shock = Card(name: "Shock", rarity: .Common, set: set, number: 156)
        shock.setManaCost("R");
        shock.setType(.Instant);
        shock.addEffect(TargetedEffect(
            restriction: TargetingRestriction.AnyTarget(),
            effect: { shock.damage(to: $0, 2) }))
        shock.setFlavorText("The tools of invention became the weapons of revolution.");
        return shock
    }
    static func SiegebreakerGiant() -> Card {
        let siegebreakerGiant = Card(name: "Siegebreaker Giant", rarity: .Uncommon, set: set, number: 157)
        siegebreakerGiant.setManaCost("3RR")
        siegebreakerGiant.setType(.Creature, .Giant, .Warrior)
        siegebreakerGiant.trample = true
        siegebreakerGiant.addActivatedAbility(
            string: "{3}{R}: Target creature can't block this turn.",
            cost: Cost.Mana("3R"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.cantBlock = true; return $0 }))}))
        siegebreakerGiant.setFlavorText("No rampart can withstand the fury of a giant.")
        siegebreakerGiant.power = 6
        siegebreakerGiant.toughness = 3
        return siegebreakerGiant
    }
    static func Smelt() -> Card {
        let smelt = Card(name: "Smelt", rarity: .Common, set: set, number: 158)
        smelt.setManaCost("R")
        smelt.setType(.Instant)
        smelt.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifact(),
            effect: { target in let _ = target.destroy() }))
        smelt.setFlavorText("The creation of new weapons demands the destruction of others.")
        return smelt
    }
    // 159 Sparktongue Dragon
    // 160 Spit Flame
    static func SureStrike() -> Card {
        let sureStrike = Card(name: "Sure Strike", rarity: .Common, set: set, number: 161)
        sureStrike.setManaCost("1R")
        sureStrike.setType(.Instant)
        sureStrike.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(3, 0)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.firstStrike = true; return $0 }))
        }))
        sureStrike.setFlavorText("To survive imminent doom, it sometimes takes a foolhardy soul who acts first and fears later.")
        return sureStrike
    }
    // 162 Tectonic Rift
    // 163 Thud
    // 164 Tormenting Voice
    static func TrumpetBlast() -> Card {
        let trumpetBlast = Card(name: "Trumpet Blast", rarity: .Common, set: set, number: 165)
        trumpetBlast.setManaCost("2R")
        trumpetBlast.setType(.Instant)
        trumpetBlast.addEffect {
            Game.shared.bothPlayers({ $0.getCreatures().filter({$0.isAttacking}).forEach({ $0.pump(2, 0) }) })
        }
        trumpetBlast.setFlavorText("The sound of the trumpets lights a fire in the hearts of the bold and snuffs the courage of the cowardly.")
        return trumpetBlast
    }
    // 166 Viashino Pyromancer
    static func VolcanicDragon() -> Card {
        let volcanicDragon = Card(name: "Volcanic Dragon", rarity: .Uncommon, set: set, number: 167)
        volcanicDragon.setManaCost("4RR")
        volcanicDragon.setType(.Creature, .Dragon)
        volcanicDragon.flying = true
        volcanicDragon.haste = true
        volcanicDragon.setFlavorText("Sometimes an eruption in Shiv produces something more dangerous than a mere river of molten rock.")
        volcanicDragon.power = 4
        volcanicDragon.toughness = 4
        return volcanicDragon
    }
    static func VolleyVeteran() -> Card {
        let volleyVeteran = Card(name: "Volley Veteran", rarity: .Uncommon, set: set, number: 168)
        volleyVeteran.setManaCost("3R")
        volleyVeteran.setType(.Creature, .Goblin, .Warrior)
        volleyVeteran.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== volleyVeteran.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    let numGoblins = volleyVeteran.getController().getPermanents().filter({ $0.isType(.Goblin) }).count
                    volleyVeteran.damage(to: target, numGoblins)
        }))
        volleyVeteran.setFlavorText("\"Fill the sky with stuff!\"")
        volleyVeteran.power = 4
        volleyVeteran.toughness = 2
        return volleyVeteran
    }
    static func BlanchwoodArmor() -> Card {
        let blanchwoodArmor = Card(name: "Blanchwood Armor", rarity: .Common, set: set, number: 169)
        blanchwoodArmor.setManaCost("2G")
        blanchwoodArmor.setType(.Enchantment, .Aura)
        blanchwoodArmor.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                let numForests = blanchwoodArmor.getController().getPermanents().filter({ $0.isType(.Forest) }).count
                object.power = object.getBasePower() + numForests
                object.toughness = object.getBaseToughness() + numForests
                return object
        })
        return blanchwoodArmor
    }
    // 170 Bristling Boar
    static func CentaurCourser() -> Card {
        let centaurCourser = Card(name: "Centaur Courser", rarity: .Common, set: set, number: 171)
        centaurCourser.setManaCost("2G")
        centaurCourser.setType(.Creature, .Centaur, .Warrior)
        centaurCourser.setFlavorText("\"The centaurs are truly free. Never will they be tamed by temptation or controlled by fear. They live in total harmony, a feat not yet achieved by our kind.\"\n--Ramal, sage of Westgate")
        centaurCourser.power = 3
        centaurCourser.toughness = 3
        return centaurCourser
    }
    static func ColossalDreadmaw() -> Card {
        let colossalDreadmaw = Card(name: "Colossal Dreadmaw", rarity: .Common, set: set, number: 172)
        colossalDreadmaw.setManaCost("4GG")
        colossalDreadmaw.setType(.Creature, .Dinosaur)
        colossalDreadmaw.trample = true
        colossalDreadmaw.setFlavorText("If you feel the ground quake, run. If you hear its bellow, flee. If you see its teeth, it's too late.")
        colossalDreadmaw.power = 6
        colossalDreadmaw.toughness = 6
        return colossalDreadmaw
    }
    static func ColossalMajesty() -> Card {
        let colossalMajesty = Card(name: "Colossal Majesty", rarity: .Uncommon, set: set, number: 173)
        colossalMajesty.setManaCost("2G")
        colossalMajesty.setType(.Enchantment)
        colossalMajesty.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: { colossalMajesty.getController().drawCard() },
            restriction: { !colossalMajesty.getController().getCreatures().filter({ $0.getPower() >= 4 }).isEmpty })
        colossalMajesty.setFlavorText("\"Might doesn't just build empires. It protects them.\"\n--Inti, Sun Empire knight")
        return colossalMajesty
    }
    static func DaggerbackBasilisk() -> Card {
        let daggerbackBasilisk = Card(name: "Daggerback Basilisk", rarity: .Common, set: set, number: 174)
        daggerbackBasilisk.setManaCost("2G")
        daggerbackBasilisk.setType(.Creature, .Basilisk)
        daggerbackBasilisk.deathtouch = true
        daggerbackBasilisk.setFlavorText("Its ventricles weep venom, and it consumes only poison.")
        daggerbackBasilisk.power = 2
        daggerbackBasilisk.toughness = 2
        return daggerbackBasilisk
    }
    // 175 Declare Dominance
    // 176 Druid of Horns
    static func DruidOfTheCowl() -> Card {
        let druidOfTheCowl = Card(name: "Druid of the Cowl", rarity: .Common, set: set, number: 177)
        druidOfTheCowl.setManaCost("1G")
        druidOfTheCowl.setType(.Creature, .Elf, .Druid)
        druidOfTheCowl.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { druidOfTheCowl.getController().addMana(color: .Green) },
            manaAbility: true)
        druidOfTheCowl.setFlavorText("\"The wild tangle of the Cowl provides sanctuary to life that watched the first buildings rise.\"")
        druidOfTheCowl.power = 1
        druidOfTheCowl.toughness = 3
        return druidOfTheCowl
    }
    // 178 Dryad Greenseeker
    static func ElvishClancaller() -> Card {
        let name = "Elvish Clancaller"
        let elvishClancaller = Card(name: name, rarity: .Rare, set: set, number: 179)
        elvishClancaller.setManaCost("GG")
        elvishClancaller.setType(.Creature, .Elf, .Druid)
        elvishClancaller.addStaticAbility({ object in
            if object != elvishClancaller && object.isType(.Elf) && object.getController() === elvishClancaller.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        elvishClancaller.addActivatedAbility(
            string: "{4}{G}{G}, {T}: Search your library for a card named Elvish Clancaller, put it onto the battlefield, then shuffle your library.",
            cost: Cost.Mana("4GG").Tap(),
            effect: { elvishClancaller.getController().chooseCard(
                from: elvishClancaller.getController().getLibrary(),
                restriction: { $0.name == name },
                action: { chosen, rest in chosen?.putOntoBattlefield() })
        })
        elvishClancaller.setFlavorText("No single root feeds the forest.")
        elvishClancaller.power = 1
        elvishClancaller.toughness = 1
        return elvishClancaller
    }
    static func ElvishRejuvenator() -> Card {
        let elvishRejuvenator = Card(name: "Elvish Rejuvenator", rarity: .Common, set: set, number: 180)
        elvishRejuvenator.setManaCost("2G")
        elvishRejuvenator.setType(.Creature, .Elf, .Druid)
        elvishRejuvenator.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { elvishRejuvenator.getController().chooseCard(
                from: Array(elvishRejuvenator.getController().getLibrary().suffix(5)),
                restriction: { $0.isType(.Land) },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield(tapped: true)
                    elvishRejuvenator.getController().putOnBottomOfLibrary(&rest, random: true)
            })
        })
        elvishRejuvenator.power = 1
        elvishRejuvenator.toughness = 1
        return elvishRejuvenator
    }
    // 181 Ghastbark Twins
    // 182 Ghirapur Guide
    static func GiantSpider() -> Card {
        let giantSpider = Card(name: "Giant Spider", rarity: .Common, set: set, number: 183)
        giantSpider.setManaCost("3G")
        giantSpider.setType(.Creature, .Spider)
        giantSpider.reach = true
        giantSpider.setFlavorText("\"After everything I've survived, it's hard to be frightened by anything anymore.\"\n--Vivien Reid")
        giantSpider.power = 2
        giantSpider.toughness = 4
        return giantSpider
    }
    // 184 Gift of Paradise
    static func Gigantosaurus() -> Card {
        let gigantosaurus = Card(name: "Gigantosaurus", rarity: .Rare, set: set, number: 185)
        gigantosaurus.setManaCost("GGGGG")
        gigantosaurus.setType(.Creature, .Dinosaur)
        gigantosaurus.setFlavorText("\"Each tooth is the length of a horse, and new ones grow in every sixteen days. Let's get a closer look!\"\n--Vivien Reid");
        gigantosaurus.power = 10
        gigantosaurus.toughness = 10
        return gigantosaurus
    }
    // 186 Goreclaw, Terror of Qal Sisma
    static func GreenwoodSentinel() -> Card {
        let greenwoodSentinel = Card(name: "Greenwood Sentinel", rarity: .Common, set: set, number: 187)
        greenwoodSentinel.setManaCost("1G")
        greenwoodSentinel.setType(.Creature, .Elf, .Scout)
        greenwoodSentinel.vigilance = true
        greenwoodSentinel.setFlavorText("Within a mile of the woodland, you will feel her eyes upon you. Within its borders, you will feel her blade.")
        greenwoodSentinel.power = 2
        greenwoodSentinel.toughness = 2
        return greenwoodSentinel
    }
    static func HighlandGame() -> Card {
        let highlandGame = Card(name: "Highland Game", rarity: .Common, set: set, number: 188)
        highlandGame.setManaCost("1G")
        highlandGame.setType(.Creature, .Elk)
        highlandGame.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { highlandGame.getController().gainLife(2) })
        highlandGame.setFlavorText("\"Bring down a stag and fix its horns upon Arel's head. She hears the wisdom of our ancestors.\"\n--Chianul, Who Whispers Twice")
        highlandGame.power = 2
        highlandGame.toughness = 1
        return highlandGame
    }
    // 189 Hungering Hydra
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 190)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { target in let _ = target.destroy() }))
        naturalize.setFlavorText("\"And if you threaten me again, your shiny steel trousers will be sprouting daggerthorn vines.\"\n--Iveta, rooftop runner")
        return naturalize
    }
    static func Oakenform() -> Card {
        let oakenform = Card(name: "Oakenform", rarity: .Common, set: set, number: 191)
        oakenform.setManaCost("2G")
        oakenform.setType(.Enchantment, .Aura)
        oakenform.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 3
                object.toughness = object.getBaseToughness() + 3
                return object
        })
        oakenform.setFlavorText("\"When the beast cloaks itself in the might oak, what good is a bow? When the oak wraps itself around the snarling beast, what good is a hatchet?\"\n--Dionus, elvish archdruid")
        return oakenform
    }
    static func PelakkaWurm() -> Card {
        let pelakkaWurm = Card(name: "Pelakka Wurm", rarity: .Rare, set: set, number: 192)
        pelakkaWurm.setManaCost("4GGG")
        pelakkaWurm.setType(.Creature, .Wurm)
        pelakkaWurm.trample = true
        pelakkaWurm.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { pelakkaWurm.getController().gainLife(7) })
        pelakkaWurm.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { pelakkaWurm.getController().drawCard() })
        pelakkaWurm.setFlavorText("It eats what it wants to eat--which is anything that moves.")
        pelakkaWurm.power = 7
        pelakkaWurm.toughness = 7
        return pelakkaWurm
    }
    static func Plummet() -> Card {
        let plummet = Card(name: "Plummet", rarity: .Common, set: set, number: 193)
        plummet.setManaCost("1G")
        plummet.setType(.Instant)
        plummet.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.flying },
                zones: [.Battlefield]),
            effect: { target in let _ = target.destroy() }))
        plummet.setFlavorText("\"Let nothing own the skies but the wind.\"\n--Dejara, Giltwood druid")
        return plummet
    }
    static func ProdigiousGrowth() -> Card {
        let prodigiousGrowth = Card(name: "Prodigious Growth", rarity: .Rare, set: set, number: 194)
        prodigiousGrowth.setManaCost("4GG")
        prodigiousGrowth.setType(.Enchantment, .Aura)
        prodigiousGrowth.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 7
                object.toughness = object.getBaseToughness() + 7
                // TODO: Layers
                object.trample = true
                return object
        })
        prodigiousGrowth.setFlavorText("\"Look how cute it is now!\"\n--Vivien Reid")
        return prodigiousGrowth
    }
    static func RabidBite() -> Card {
        let rabidBite = Card(name: "Rabid Bite", rarity: .Common, set: set, number: 195)
        rabidBite.setManaCost("1G")
        rabidBite.setType(.Sorcery)
        rabidBite.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === rabidBite.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== rabidBite.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                if let myCreature = targets[0], let theirCreature = targets[1] {
                    myCreature.fight(theirCreature)
                }
        }))
        rabidBite.setFlavorText("\"You should have seen the look on <i>both</i> their faces.\"\n--Morkamp, Lambholt innkeeper")
        return rabidBite
    }
    static func ReclamationSage() -> Card {
        let reclamationSage = Card(name: "Reclamation Sage", rarity: .Uncommon, set: set, number: 196)
        reclamationSage.setManaCost("2G")
        reclamationSage.setType(.Creature, .Elf, .Shaman)
        reclamationSage.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetArtifactOrEnchantment(optional: true),
                effect: { let _ = $0.destroy() }))
        reclamationSage.setFlavorText("\"What was once formed by masons, shaped by smiths, or given life by mages, I will return to the embrace of the earth.")
        reclamationSage.power = 2
        reclamationSage.toughness = 1
        return reclamationSage
    }
    // 197 Recollect
    static func RhoxOracle() -> Card {
        let rhoxOracle = Card(name: "Rhox Oracle", rarity: .Common, set: set, number: 198)
        rhoxOracle.setManaCost("4G")
        rhoxOracle.setType(.Creature, .Rhino, .Monk)
        rhoxOracle.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { rhoxOracle.getController().drawCard() })
        rhoxOracle.setFlavorText("\"The further into the future I look, the less certain my vision. Even now, the middle distance is obscured by fire.")
        rhoxOracle.power = 4
        rhoxOracle.toughness = 2
        return rhoxOracle
    }
    // 199 Root Snare
    // 200 Runic Armasaur
    // 201 Scapeshift
    // 202 Talons of Wildwood
    // 203 Thorn Lieutenant
    static func ThornhideWolves() -> Card {
        let thornhideWolves = Card(name: "Thornhide Wolves", rarity: .Common, set: set, number: 204)
        thornhideWolves.setManaCost("4G")
        thornhideWolves.setType(.Creature, .Wolf)
        thornhideWolves.setFlavorText("\"Halana grew brambles to create a barricade around our camp, hoping that it would keep the wolves out. That was a mistake for which we almost paid dearly.\"\nAlena, trapper of Kessig")
        thornhideWolves.power = 4
        thornhideWolves.toughness = 5
        return thornhideWolves
    }
    static func TitanicGrowth() -> Card {
        let titanicGrowth = Card(name: "Titanic Growth", rarity: .Common, set: set, number: 205)
        titanicGrowth.setManaCost("1G")
        titanicGrowth.setType(.Instant)
        titanicGrowth.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pump(4, 4) }))
        titanicGrowth.setFlavorText("The massive dominate through might. The tiny survive with guile. Beware the tiny who become massive.")
        return titanicGrowth
    }
    static func VigilantBaloth() -> Card {
        let vigilantBaloth = Card(name: "Vigilant Baloth", rarity: .Uncommon, set: set, number: 206)
        vigilantBaloth.setManaCost("3GG")
        vigilantBaloth.setType(.Creature, .Beast)
        vigilantBaloth.vigilance = true
        vigilantBaloth.setFlavorText("Villagers employ watchdogs as guardians and companions. Druids prefer something a little bigger.")
        vigilantBaloth.power = 5
        vigilantBaloth.toughness = 5
        return vigilantBaloth
    }
    // 207 Vine Mare
    static func VivienReid() -> Card {
        let vivienReid = Card(name: "Vivien Reid", rarity: .Mythic, set: set, number: 208)
        vivienReid.setManaCost("3GG")
        vivienReid.setType(.Legendary, .Planeswalker, .Vivien)
        vivienReid.addActivatedAbility(
            string: "{+1}: Look at the top four cards of your library. You may reveal a creature or land card from among them and put it into your hand. Put the rest on the bottom of your library in a random order.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: {
                vivienReid.getController().chooseCard(
                    from: Array(vivienReid.getController().getLibrary().suffix(4)),
                    restriction: { $0.isType(.Creature) || $0.isType(.Land) },
                    action: { chosen, rest in
                        chosen?.reveal()
                        chosen?.putIntoHand()
                        vivienReid.getController().putOnBottomOfLibrary(&rest, random: true)
                })
            },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        vivienReid.addActivatedAbility(
            string: "{-3}: Destroy target artifact, enchantment, or creature with flying.",
            cost: Cost.RemoveCounters(.Loyalty, 3),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Artifact) || $0.isType(.Enchantment) || ($0.isType(.Creature) && $0.flying) },
                    zones: [.Battlefield]),
                effect: { let _ = $0.destroy() }),
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        vivienReid.addActivatedAbility(
            string: "{-8}: You get an emblem with \"Creatures you control get +2/+2 and have vigilance, trample, and indestructible.\"",
            cost: Cost.RemoveCounters(.Loyalty, 8),
            effect: { vivienReid.getController().createEmblem(VivienReidEmblem()) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        vivienReid.startingLoyalty = 5
        return vivienReid
    }
    // 209 Vivien's Invocation
    static func WallOfVines() -> Card {
        let wallOfVines = Card(name: "Wall of Vines", rarity: .Common, set: set, number: 210)
        wallOfVines.setManaCost("G")
        wallOfVines.setType(.Creature, .Plant, .Wall)
        wallOfVines.defender = true
        wallOfVines.reach = true
        wallOfVines.setFlavorText("Like all jungle plants, the vines must fight and claw for sunlight. Once their place is secured, they grow strong, sharp, and impenetrable.")
        wallOfVines.power = 0
        wallOfVines.toughness = 3
        return wallOfVines
    }
    static func AerialEngineer() -> Card {
        let aerialEngineer = Card(name: "Aerial Engineer", rarity: .Uncommon, set: set, number: 211)
        aerialEngineer.setManaCost("2WU")
        aerialEngineer.setType(.Creature, .Human, .Artificer)
        aerialEngineer.addStaticAbility({ object in
            if object == aerialEngineer && !object.getController().getArtifacts().isEmpty {
                object.power = object.getBasePower() + 2
                // TODO: These should be in separate layers
                object.flying = true
            }
            return object
        })
        aerialEngineer.setFlavorText("The best of their trade know every bolt of their rigs, stem to stern.")
        aerialEngineer.power = 2
        aerialEngineer.toughness = 4
        return aerialEngineer
    }
    // 212 Arcades, the Strategist
    // 213 Brawl-Bash Ogre
    // 214 Chromium, the Mutable
    static func DraconicDisciple() -> Card {
        let draconicDisciple = Card(name: "DraconicDisciple", rarity: .Uncommon, set: set, number: 215)
        draconicDisciple.setManaCost("1RG")
        draconicDisciple.setType(.Creature, .Human, .Shaman)
        draconicDisciple.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { draconicDisciple.getController().addMana(color: .White) },
            manaAbility: true)
        draconicDisciple.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { draconicDisciple.getController().addMana(color: .Blue) },
            manaAbility: true)
        draconicDisciple.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { draconicDisciple.getController().addMana(color: .Black) },
            manaAbility: true)
        draconicDisciple.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { draconicDisciple.getController().addMana(color: .Red) },
            manaAbility: true)
        draconicDisciple.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { draconicDisciple.getController().addMana(color: .Green) },
            manaAbility: true)
        draconicDisciple.addActivatedAbility(
            string: "{7}, {T}, Sacrifice ~: Create a 5/5 red Dragon creature token with flying.",
            cost: Cost.Mana("7").Tap().Sacrifice(),
            effect: { draconicDisciple.getController().createToken(Dragon()) })
        draconicDisciple.setFlavorText("\"If I am to die, I will die in the embrace of immeasurable flame.\"")
        draconicDisciple.power = 2
        draconicDisciple.toughness = 2
        return draconicDisciple
    }
    static func EnigmaDrake() -> Card {
        let enigmaDrake = Card(name: "Enigma Drake", rarity: .Uncommon, set: set, number: 216)
        enigmaDrake.setManaCost("1UR")
        enigmaDrake.setType(.Creature, .Drake)
        enigmaDrake.flying = true
        enigmaDrake.addStaticAbility(
            { object in
                if object == enigmaDrake {
                    object.power = object.getController().getGraveyard().filter({ $0.isType(.Instant) || $0.isType(.Sorcery) }).count
                }
                return object
            },
            characteristicDefining: true)
        enigmaDrake.setFlavorText("Many initiates believe it possesses secrets beyond imagining. Many have become meals trying to learn them.")
        enigmaDrake.toughness = 4
        return enigmaDrake
    }
    static func HeroicReinforcements() -> Card {
        let heroicReinforcements = Card(name: "Heroic Reinforcements", rarity: .Uncommon, set: set, number: 217)
        heroicReinforcements.setManaCost("2RW")
        heroicReinforcements.setType(.Sorcery)
        heroicReinforcements.addEffect {
            heroicReinforcements.getController().createToken(Soldier())
            heroicReinforcements.getController().createToken(Soldier())
            heroicReinforcements.getController().getCreatures().forEach({ creature in
                creature.pump(1, 1)
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.haste = true
                    return object
                }))
            })
        }
        heroicReinforcements.setFlavorText("Cries of anguish quickly spurred cries of action.")
        return heroicReinforcements
    }
    // 218 Nicol Bolas, the Ravager // Nicol Bolas, the Arisen
    static func PalladiaMorsTheRuiner() -> Card {
        let palladiaMors = Card(name: "Palladia-Mors, the Ruiner", rarity: .Mythic, set: set, number: 219)
        palladiaMors.setManaCost("3RGW")
        palladiaMors.setType(.Legendary, .Creature, .Elder, .Dragon)
        palladiaMors.flying = true
        palladiaMors.vigilance = true
        palladiaMors.trample = true
        palladiaMors.addStaticAbility({ object in
            if object == palladiaMors && !object.hasDealtDamage {
                object.hexproof = true
            }
            return object
        })
        palladiaMors.setFlavorText("Sister of Nicol Bolas. Survivor of the Elder Dragon War. The most vicious of her kin.")
        palladiaMors.power = 6
        palladiaMors.toughness = 6
        return palladiaMors
    }
    // 220 Poison-Tip Archer
    static func PsychicSymbiont() -> Card {
        let psychicSymbiont = Card(name: "Psychic Symbiont", rarity: .Uncommon, set: set, number: 221)
        psychicSymbiont.setManaCost("4UB")
        psychicSymbiont.setType(.Creature, .Nightmare, .Horror)
        psychicSymbiont.flying = true
        psychicSymbiont.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== psychicSymbiont.getController() }),
                effect: { target in
                    target.discard()
                    psychicSymbiont.getController().drawCard()
        }))
        psychicSymbiont.setFlavorText("\"I turn around and see nothing, yet I know it is behind me. Its fingers rummage in my mind, crafting new ideas.\"")
        psychicSymbiont.power = 3
        psychicSymbiont.toughness = 3
        return psychicSymbiont
    }
    static func RegalBloodlord() -> Card {
        let regalBloodlord = Card(name: "Regal Bloodlord", rarity: .Uncommon, set: set, number: 222)
        regalBloodlord.setManaCost("3WB")
        regalBloodlord.setType(.Creature, .Vampire, .Soldier)
        regalBloodlord.flying = true
        regalBloodlord.addTriggeredAbility(
            trigger: .EachEndStep,
            effect: { regalBloodlord.getController().createToken(Bat()) },
            restriction: { regalBloodlord.getController().lifeGainedThisTurn > 0 })
        regalBloodlord.setFlavorText("Those of esteemed birth earn a most esteemed death.")
        regalBloodlord.power = 3
        regalBloodlord.toughness = 3
        return regalBloodlord
    }
    static func SatyrEnchanter() -> Card {
        let satyrEnchanter = Card(name: "Satyr Enchanter", rarity: .Uncommon, set: set, number: 223)
        satyrEnchanter.setManaCost("1GW")
        satyrEnchanter.setType(.Creature, .Satyr, .Druid)
        satyrEnchanter.addTriggeredAbility(
            trigger: .YouCastEnchantmentSpell,
            effect: { satyrEnchanter.getController().drawCard() })
        satyrEnchanter.setFlavorText("\"The threads of magic that protect this place were woven by my will.\"")
        satyrEnchanter.power = 2
        satyrEnchanter.toughness = 2
        return satyrEnchanter
    }
    // 224 Skyrider Patrol
    // 225 Vaevictis Asmadi, the Dire
    // 226 Amulet of Safekeeping
    static func ArcaneEncyclopedia() -> Card {
        let arcaneEncyclopedia = Card(name: "Arcane Encyclopedia", rarity: .Uncommon, set: set, number: 227)
        arcaneEncyclopedia.setManaCost("3")
        arcaneEncyclopedia.setType(.Artifact)
        arcaneEncyclopedia.addActivatedAbility(
            string: "{3}, {T}: Draw a card.",
            cost: Cost.Mana("3").Tap(),
            effect: { arcaneEncyclopedia.getController().drawCard() })
        arcaneEncyclopedia.setFlavorText("Knowledge itself is neither good nor evil. Just as the wrong book in the wrong hands could doom all existence, the same book in the right hands could save it.")
        return arcaneEncyclopedia
    }
    // 228 Chaos Wand
    // 229 Crucible of Worlds
    // 230 Desecrated Tomb
    // 231 Diamond Mare
    static func DragonsHoard() -> Card {
        let dragonsHoard = Card(name: "Dragon's Hoard", rarity: .Rare, set: set, number: 232)
        dragonsHoard.setManaCost("3")
        dragonsHoard.setType(.Artifact)
        dragonsHoard.addTriggeredAbility(
            trigger: .DragonEntersBattlefieldUnderYourControl,
            effect: { dragonsHoard.addCounter(.Gold) })
        dragonsHoard.addActivatedAbility(
            string: "{T}, Remove a Gold counter from ~: Draw a card.",
            cost: Cost.Tap().RemoveCounters(.Gold, 1),
            effect: { dragonsHoard.getController().drawCard() })
        dragonsHoard.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { dragonsHoard.getController().addMana(color: .White) },
            manaAbility: true)
        dragonsHoard.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { dragonsHoard.getController().addMana(color: .Blue) },
            manaAbility: true)
        dragonsHoard.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { dragonsHoard.getController().addMana(color: .Black) },
            manaAbility: true)
        dragonsHoard.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { dragonsHoard.getController().addMana(color: .Red) },
            manaAbility: true)
        dragonsHoard.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { dragonsHoard.getController().addMana(color: .Green) },
            manaAbility: true)
        return dragonsHoard
    }
    static func ExplosiveApparatus() -> Card {
        let explosiveApparatus = Card(name: "Explosive Apparatus", rarity: .Common, set: set, number: 233)
        explosiveApparatus.setManaCost("1")
        explosiveApparatus.setType(.Artifact)
        explosiveApparatus.addActivatedAbility(
            string: "{2}, {T}, Sacrifice ~: It deals 2 damage to any target.",
            cost: Cost.Mana("2").Tap().Sacrifice(),
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { explosiveApparatus.damage(to: $0, 2) }))
        explosiveApparatus.setFlavorText("\"Souls are volatile things. When compressed and loaded into a handheld device, their destructive potential is quite impressive.\"\n--Dierk, geistmage")
        return explosiveApparatus
    }
    static func FieldCreeper() -> Card {
        let fieldCreeper = Card(name: "Field Creeper", rarity: .Common, set: set, number: 234)
        fieldCreeper.setManaCost("2")
        fieldCreeper.setType(.Artifact, .Creature, .Scarecrow)
        fieldCreeper.setFlavorText("As it walks across the fallow field, its awkward, loping gait matches the rattling in its head to create a haunting rhythm that chills the bones.")
        fieldCreeper.power = 2
        fieldCreeper.toughness = 1
        return fieldCreeper
    }
    static func FountainOfRenewal() -> Card {
        let fountainOfRenewal = Card(name: "Fountain of Renewal", rarity: .Uncommon, set: set, number: 235)
        fountainOfRenewal.setManaCost("1")
        fountainOfRenewal.setType(.Artifact)
        fountainOfRenewal.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: { fountainOfRenewal.getController().gainLife(1) })
        fountainOfRenewal.addActivatedAbility(
            string: "{3}, Sacrifice ~: Draw a card.",
            cost: Cost.Mana("3").Sacrifice(),
            effect: { fountainOfRenewal.getController().drawCard() })
        fountainOfRenewal.setFlavorText("Entrepeneurs have attempted to sell the water, but to no avail. Whatever magic it contains disappears upon bottling.")
        return fountainOfRenewal
    }
    static func GargoyleSentinel() -> Card {
        let gargoyleSentinel = Card(name: "Gargoyle Sentinel", rarity: .Uncommon, set: set, number: 236)
        gargoyleSentinel.setManaCost("3")
        gargoyleSentinel.setType(.Artifact, .Creature, .Gargoyle)
        gargoyleSentinel.defender = true
        gargoyleSentinel.addActivatedAbility(
            string: "{3}: Until end of turn, ~ loses defender and gains flying.",
            cost: Cost.Mana("3"),
            effect: { gargoyleSentinel.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.defender = false
                object.flying = true
                return object
            }))
        })
        gargoyleSentinel.setFlavorText("\"Do not mistake a quiet rampart for one that is unguarded. Some things stir only when they need to.\"\n--Bonovar, siege commander")
        gargoyleSentinel.power = 3
        gargoyleSentinel.toughness = 3
        return gargoyleSentinel
    }
    static func GearsmithGuardian() -> Card {
        let gearsmithGuardian = Card(name: "Gearsmith Guardian", rarity: .Common, set: set, number: 237)
        gearsmithGuardian.setManaCost("5")
        gearsmithGuardian.setType(.Artifact, .Creature, .Construct)
        gearsmithGuardian.addStaticAbility({ object in
            if object == gearsmithGuardian && !object.getController().getCreatures().filter({ $0.isColor(.Blue) }).isEmpty {
                object.power = object.getBasePower() + 2
            }
            return object
        })
        gearsmithGuardian.setFlavorText("Made in its creator's image, though slightly more clangy.")
        gearsmithGuardian.power = 3
        gearsmithGuardian.toughness = 5
        return gearsmithGuardian
    }
    // 238 Magistrate's Scepter
    static func Manalith() -> Card {
        let manalith = Card(name: "Manalith", rarity: .Common, set: set, number: 239)
        manalith.setManaCost("3")
        manalith.setType(.Artifact)
        manalith.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { manalith.getController().addMana(color: .White) },
            manaAbility: true)
        manalith.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { manalith.getController().addMana(color: .Blue) },
            manaAbility: true)
        manalith.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { manalith.getController().addMana(color: .Black) },
            manaAbility: true)
        manalith.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { manalith.getController().addMana(color: .Red) },
            manaAbility: true)
        manalith.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { manalith.getController().addMana(color: .Green) },
            manaAbility: true)
        manalith.setFlavorText("Planeswalkers seek out great monuments throughout the Multiverse, knowing that their builders were unwittingly drawn by the convergence of mana in the area.")
        return manalith
    }
    static func MaraudersAxe() -> Card {
        let maraudersAxe = Card(name: "Marauder's Axe", rarity: .Common, set: set, number: 240)
        maraudersAxe.setManaCost("2")
        maraudersAxe.setType(.Artifact, .Equipment)
        maraudersAxe.addEquipAbility(
            string: "{2}: Equip.",
            cost: Cost.Mana("2"),
            effect: { object in
                object.power = object.getBasePower() + 2
                return object
        })
        maraudersAxe.setFlavorText("A sharp axe solves most problems.")
        return maraudersAxe
    }
    static func MeteorGolem() -> Card {
        let meteorGolem = Card(name: "Meteor Golem", rarity: .Uncommon, set: set, number: 241)
        meteorGolem.setManaCost("7")
        meteorGolem.setType(.Artifact, .Creature, .Golem)
        meteorGolem.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isPermanent() && !$0.isType(.Land) && $0.getController() !== meteorGolem.getController() },
                    zones: [.Battlefield]),
                effect: { let _ = $0.destroy() }))
        meteorGolem.setFlavorText("The impact sent the soldiers scattering--then something came out of the creater.")
        meteorGolem.power = 3
        meteorGolem.toughness = 3
        return meteorGolem
    }
    static func Millstone() -> Card {
        let millstone = Card(name: "Millstone", rarity: .Uncommon, set: set, number: 242)
        millstone.setManaCost("2")
        millstone.setType(.Artifact)
        millstone.addActivatedAbility(
            string: "{2}, {T}: Target player puts the top two cards of their library into their graveyard.",
            cost: Cost.Mana("2").Tap(),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { $0.mill(2) }))
        millstone.setFlavorText("Minds, like mountains, are never so grand and mighty that they can't be reduced to dust.")
        return millstone
    }
    // 243 Rogue's Gloves
    // 244 Sigiled Sword of Valeron
    static func Skyscanner() -> Card {
        let skyscanner = Card(name: "Skyscanner", rarity: .Common, set: set, number: 245)
        skyscanner.setManaCost("3")
        skyscanner.setType(.Artifact, .Creature, .Thopter)
        skyscanner.flying = true
        skyscanner.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { skyscanner.getController().drawCard() })
        skyscanner.power = 1
        skyscanner.toughness = 1
        return skyscanner
    }
    static func SuspiciousBookcase() -> Card {
        let suspiciousBookcase = Card(name: "Suspicious Bookcase", rarity: .Uncommon, set: set, number: 246)
        suspiciousBookcase.setManaCost("2")
        suspiciousBookcase.setType(.Artifact, .Creature, .Wall)
        suspiciousBookcase.defender = true
        suspiciousBookcase.addActivatedAbility(
            string: "{3}, {T}: Target creature can't be blocked this turn.",
            cost: Cost.Mana("3").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.unblockable = true; return $0 }))
        }))
        suspiciousBookcase.setFlavorText("All the books were dusty with disuse, save the one titled <i>Camouflage and Its Practical Applications</i>.")
        suspiciousBookcase.power = 0
        suspiciousBookcase.toughness = 4
        return suspiciousBookcase
    }
    static func TransmogrifyingWand() -> Card {
        let transmogrifyingWand = Card(name: "Transmogrifying Wand", rarity: .Rare, set: set, number: 247)
        transmogrifyingWand.setManaCost("3")
        transmogrifyingWand.setType(.Artifact)
        transmogrifyingWand.addReplacementEffect(
            event: .ThisETB,
            effect: { transmogrifyingWand.addCounters(.Charge, 3) })
        transmogrifyingWand.addActivatedAbility(
            string: "{1}, {T}, Remove a charge counter from ~: Destroy target creature. Its controller creates a 2/4 white Ox creature token. Activate this ability only any time you could cast a sorcery.",
            cost: Cost.Mana("1").Tap().RemoveCounters(.Charge, 1),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { target in
                    let controller = target.getController()
                    let _ = target.destroy()
                    controller.createToken(Ox())
            }),
            manaAbility: false,
            sorcerySpeed: true)
        return transmogrifyingWand
    }
    // 248 Cinder Barrens
    // 249 Detection Tower
    // 250 Forsaken Sanctuary
    // 251 Foul Orchard
    // 252 Highland Lake
    // 253 Meandering River
    // 254 Reliquary Tower
    // 255 Rupture Spire
    // 256 Stone Quarry
    // 257 Submerged Boneyard
    // 258 Timber Gorge
    // 259 Tranquil Expanse
    // 260 Woodland Stream
    static func Plains() -> Card {
        let plains = Card(name: "Plains", rarity: .Common, set: set, number: 261)
        plains.setManaCost("")
        plains.setType(.Basic, .Land, .Plains)
        plains.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { plains.getController().addMana(color: .White) },
            manaAbility: true )
        return plains
    }
    // 262 Plains
    // 263 Plains
    // 264 Plains
    static func Island() -> Card {
        let island = Card(name: "Island", rarity: .Common, set: set, number: 265)
        island.setManaCost("")
        island.setType(.Basic, .Land, .Island)
        island.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { island.getController().addMana(color: .Blue) },
            manaAbility: true )
        return island
    }
    // 266 Island
    // 267 Island
    // 268 Island
    static func Swamp() -> Card {
        let swamp = Card(name: "Swamp", rarity: .Common, set: set, number: 269)
        swamp.setManaCost("")
        swamp.setType(.Basic, .Land, .Swamp)
        swamp.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { swamp.getController().addMana(color: .Black) },
            manaAbility: true )
        return swamp
    }
    // 270 Swamp
    // 271 Swamp
    // 272 Swamp
    static func Mountain() -> Card {
        let mountain = Card(name: "Mountain", rarity: .Common, set: set, number: 273)
        mountain.setManaCost("")
        mountain.setType(.Basic, .Land, .Mountain)
        mountain.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { mountain.getController().addMana(color: .Red) },
            manaAbility: true )
        return mountain;
    }
    // 274 Mountain
    // 275 Mountain
    // 276 Mountain
    static func Forest() -> Card {
        let forest = Card(name: "Forest", rarity: .Common, set: set, number: 277)
        forest.setManaCost("")
        forest.setType(.Basic, .Land, .Forest)
        forest.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { forest.getController().addMana(color: .Green) },
            manaAbility: true )
        return forest;
    }
    // 278 Forest
    // 279 Forest
    // 280 Forest

    static func Angel() -> Token {
        let angel = Token(name: "Angel", set: set, number: 1)
        angel.colors = [.White]
        angel.setType(.Creature, .Angel)
        angel.flying = true
        angel.vigilance = true
        angel.power = 4
        angel.toughness = 4
        return angel
    }
    // t2 Avatar
    static func Cat() -> Token {
        let cat = Token(name: "Cat", set: set, number: 3)
        cat.colors = [.White]
        cat.setType(.Creature, .Cat)
        cat.lifelink = true
        cat.power = 1
        cat.toughness = 1
        return cat
    }
    static func Knight() -> Token {
        let knight = Token(name: "Knight", set: set, number: 4)
        knight.colors = [Color.White]
        knight.setType(.Creature, .Knight)
        knight.vigilance = true
        knight.power = 2
        knight.toughness = 2
        return knight;
    }
    static func Ox() -> Token {
        let ox = Token(name: "Ox", set: set, number: 5)
        ox.colors = [Color.White]
        ox.setType(.Creature, .Ox)
        ox.power = 2
        ox.toughness = 4
        return ox
    }
    static func Soldier() -> Token {
        let soldier = Token(name: "Soldier", set: set, number: 6)
        soldier.colors = [Color.White]
        soldier.setType(.Creature, .Soldier)
        soldier.power = 1
        soldier.toughness = 1
        return soldier
    }
    static func Bat() -> Token {
        let bat = Token(name: "Bat", set: set, number: 7)
        bat.colors = [.Black]
        bat.setType(.Creature, .Bat)
        bat.flying = true
        bat.power = 1
        bat.toughness = 1
        return bat
    }
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 8)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Zombie)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    static func Dragon_Firebreathing() -> Token {
        let dragon = Token(name: "Dragon", set: set, number: 9)
        dragon.colors = [.Red]
        dragon.setType(.Creature, .Dragon)
        dragon.flying = true
        dragon.addActivatedAbility(
            string: "{R}: ~ gets +1/+0 until end of turn.",
            cost: Cost.Mana("R"),
            effect: { dragon.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 1
                return object
            }))
        })
        dragon.power = 2
        dragon.toughness = 2
        return dragon
    }
    static func Dragon() -> Token {
        let dragon = Token(name: "Dragon", set: set, number: 10)
        dragon.colors = [.Red]
        dragon.setType(.Creature, .Dragon)
        dragon.flying = true
        dragon.power = 5
        dragon.toughness = 5
        return dragon
    }
    static func Goblin() -> Token {
        let goblin = Token(name: "Goblin", set: set, number: 11)
        goblin.colors = [.Red]
        goblin.setType(.Creature, .Goblin)
        goblin.power = 1
        goblin.toughness = 1
        return goblin
    }
    // t12 Beast
    // t13 Elf Warrior
    static func Thopter() -> Token {
        let thopter = Token(name: "Thopter", set: set, number: 14)
        thopter.setType(.Artifact, .Creature, .Thopter)
        thopter.flying = true
        thopter.power = 1
        thopter.toughness = 1
        return thopter
    }
    // t15 Ajani Emblem
    static func TezzeretArtificeMasterEmblem() -> Object {
        let tezzeretEmblem = Emblem(set: set, number: 16)
        tezzeretEmblem.addTriggeredAbility(
            trigger: .YourEndStep,
            effect: { tezzeretEmblem.getController().chooseCard(
                from: tezzeretEmblem.getController().getLibrary(),
                restriction: { $0.isPermanent() },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield()
                    tezzeretEmblem.getController().shuffleLibrary()
            })
        })
        return tezzeretEmblem
    }
    static func VivienReidEmblem() -> Object {
        let vivienEmblem = Emblem(set: set, number: 17)
        vivienEmblem.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === vivienEmblem.getController() {
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
                // TODO: Layers
                object.vigilance = true
                object.trample = true
                object.indestructible = true
            }
            return object
        })
        return vivienEmblem
    }
}
