import Foundation

extension Object {
    func ascend() {
        if getController().getPermanents().count >= 10 {
            getController().citysBlessing = true
        }
    }
}

enum RIX {
    static var set = "rix"
    static var count = 196

    static let cards = [
        BafflingEnd, /* BishopOfBinding, */ BlazingHope, /* CleansingRay, */ DivineVerdict, /* EverdawnChampion, */ ExultantSkymarcher, /* FamishedPaladin, ForerunnerOfTheLegion, */ ImperialCeratops, /* LegionConquistador, */ LuminousBonds, MajesticHeliopterus, MartyrOfDusk, MomentOfTriumph, /* PaladinOfAtonement, */ PrideOfConquerors, /* RadiantDestiny, */ RaptorCompanion, SanguineGlorifier, SkymarcherAspirant, /* SlaughterTheStrong, */ SnubhornSentry, /* SphinxsDecree, */ SquiresDevotion, SunSentinel, SunCrestedPterodon, /* TempleAltisaur, TrapjawTyrant, */ ZetalpaPrimalDawn, /* AdmiralsOrder, */ AcquaticIncursion, /* CraftyCutpurse, */ CrashingTide, /* CuriousObsession, */ DeadeyeRigHauler, /* ExpelFromOrazca, FloodOfRecollection, */ Hornswoggle, /* InducedAmnesia, */ KitesailCorsair, KumenasAwakening, MistCloakedHerald, Negate, /* NezahalThePrimalTide, ReleaseToTheWind, RiverDarter, RiverwiseAugur, */ SailorOfMeans, SeaLegs, /* SeafloorOracle, */ SecretsOfTheGoldenCity, /* SilvergillAdept, */ SirenReaver, SlipperyScoundrel, SoulOfTheRapids, SpireWinder, SwornGuardian, /* TimestreamNavigator, WarkiteMarauder, Waterknot, */ ArterialFlow, CanalMonitor, ChampionOfDusk, DarkInquiry, /* DeadMansChest, DinosaurHunter, */ DireFleetPoisoner, DuskCharger, DuskLegionZealot, FathomFleetBoarder, /* ForerunnerOfTheCoalition, */ GoldenDemise, GraspingScoundrel, GruesomeFate, Impale, /* MastermindsAcquisition, MausoleumHarpy, */ MomentOfCraving, /* OathswornVampire, PitilessPlunderer, */ RavenousChupacabra, ReaverAmbush, Recover, /* SadisticSkymarcher, TetzimocPrimalDeath, TombRobber, */ TwilightProphet, VampireRevenant, /* VonasHunger, VoraciousVampire, BloodSun, */ Bombard, BrasssBounty, BrazenFreebooter, /* BuccaneersBravado, ChargingTuskodon, DaringBuccaneer, DireFleetDaredevil, EtaliPrimalStorm, */ FanaticalFirebrand, /* ForerunnerOfTheEmpire, */ FormOfTheDinosaur, FrilledDeathspitter, /* GoblinTrailblazer, Mutiny, */ NeedletoothRaptor, OrazcaRaptor, /* PiratesPillage, */ RecklessRage, RekindlingPhoenix, SeeRed, ShakeTheFoundations, Shatter, /* SilvercladFerocidons, */ StampedingHorncrest, StormFleetSwashbuckler, SunCollaredRaptor, SwaggeringCorsair, TilonallisCrown, /* TilonallisSummoner, */ AggressiveUrge, Cacophodon, /* CherishedHatchling, */ ColossalDreadmaw, CrestedHerdcaller, /* DeeprootElite, EnterTheUnknown, ForerunnerOfTheHeralds, */ GhaltaPrimalHunger, GiltgroveStalker, HardyVeteran, HuntTheWeak, JadeBearer, JadecraftArtisan, /* JadelightRanger, */ JunglebornPioneer, KnightOfTheStampede, Naturalize, OrazcaFrillback, OvergrownArmasaur, /* PathOfDiscovery, */ Plummet, /* Polyraptor, */ StrengthOfThePack, SwiftWarden, TendershootDryad, ThrashingBrontodon, /* ThunderherdMigration, WaywardSwordtooth, */ WorldShaper, /* AngrathTheFlameChained, */ AtzocanSeer, /* AzorTheLawbringer, */ DeadeyeBrawler, DireFleetNeckbreaker, /* ElendaTheDuskRose, */ HuatliRadiantChampion, /* JungleCreeper, KumenaTyrantOfOrazca, */ LegionLieutenant, MerfolkMistbinder, /* ProteanRaider, */ RagingRegisaur, /* RelentlessRaptor, */ ResplendentGriffin, SiegehornCeratops, StormFleetSprinter, /* ZacamaPrimalCalamity, HadanasClimb, JourneyToEternity, PathToMettle, ProfaneProcession, StormTheVault, AzorsGateway, GoldenGuardian, */ AwakenedAmalgam, /* CaptainsHook, */ GleamingBarrier, /* TheImmortalSun, OrazcaRelic, SilentGravestone, */ StriderHarness, TravelersAmulet, /* ArchOfOrazca, */ EvolvingWilds, ForsakenSanctuary, FoulOrchard, HighlandLake, StoneQuarry, WoodlandStream
    ]

    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }

    static func BafflingEnd() -> Card {
        let bafflingEnd = Card(name: "Baffling End", rarity: .Uncommon, set: set, number: 1)
        bafflingEnd.setManaCost("1W")
        bafflingEnd.setType(.Enchantment)
        bafflingEnd.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== bafflingEnd.getController() && $0.getConvertedManaCost() <= 3 },
                    zones: [.Battlefield]),
                effect: { $0.exile() }))
        bafflingEnd.addTriggeredAbility(
            trigger: .ThisLTB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== bafflingEnd.getController() }),
                effect: { $0.createToken(XLN.Dinosaur()) }))
        return bafflingEnd
    }
    // 2 Bishop of Binding
    static func BlazingHope() -> Card {
        let blazingHope = Card(name: "Blazing Hope", rarity: .Uncommon, set: set, number: 3)
        blazingHope.setManaCost("W")
        blazingHope.setType(.Instant)
        blazingHope.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() >= blazingHope.getController().getLife() },
                zones: [.Battlefield]),
            effect: { $0.exile() }))
        blazingHope.setFlavorText("\"No shadow remains for you to hide in.\"\n--Caparocti Sunborn")
        return blazingHope
    }
    // 4 Cleansing Ray
    static func DivineVerdict() -> Card {
        let divineVerdict = Card(name: "Divine Verdict", rarity: .Common, set: set, number: 5)
        divineVerdict.setManaCost("3W")
        divineVerdict.setType(.Instant)
        divineVerdict.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && ($0.isAttacking || $0.blocking)},
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }))
        divineVerdict.setFlavorText("Cunning warriors and dim-witted beasts alike fall under the church's harsh judgment.")
        return divineVerdict
    }
    // 6 Everdawn Champion
    static func ExultantSkymarcher() -> Card {
        let exultantSkymarcher = Card(name: "Exultant Skymarcher", rarity: .Common, set: set, number: 7)
        exultantSkymarcher.setManaCost("1WW")
        exultantSkymarcher.setType(.Creature, .Vampire, .Soldier)
        exultantSkymarcher.flying = true
        exultantSkymarcher.setFlavorText("\"We have come at last to this holiest of holy places. What was stolen from us long ago is ours once again.\"")
        exultantSkymarcher.power = 2
        exultantSkymarcher.toughness = 3
        return exultantSkymarcher
    }
    // 8 Famished Paladin
    // 9 Forerunner of the Legion
    static func ImperialCeratops() -> Card {
        let imperialCeratops = Card(name: "Ravenous Dagertooth", rarity: .Uncommon, set: set, number: 10)
        imperialCeratops.setManaCost("4W")
        imperialCeratops.setType(.Creature, .Dinosaur)
        imperialCeratops.addTriggeredAbility(
            trigger: .ThisDealtDamage,
            effect: { imperialCeratops.getController().gainLife(2) })
        imperialCeratops.setFlavorText("\"The music of blades against its silver armor merely inspires it to bellow more full-throated melodies.\"\n--Huatli")
        imperialCeratops.power = 3
        imperialCeratops.toughness = 5
        return imperialCeratops
    }
    // 11 Legion Conquistador
    static func LuminousBonds() -> Card {
        let luminousBonds = Card(name: "Luminous Bonds", rarity: .Common, set: set, number: 12)
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
    static func MajesticHeliopterus() -> Card {
        let majesticHeliopterus = Card(name: "Majestic Heliopterus", rarity: .Uncommon, set: set, number: 13)
        majesticHeliopterus.setManaCost("3W")
        majesticHeliopterus.setType(.Creature, .Dinosaur)
        majesticHeliopterus.flying = true
        majesticHeliopterus.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { return  $0 != majesticHeliopterus && $0.isType(.Dinosaur) && $0.getController() === MajesticHeliopterus().getController() },
                    zones: [.Battlefield]),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.flying = true
                    return object
                }))
        }))
        majesticHeliopterus.setFlavorText("\"Its rise is like the sun's, a beautiful beginning. Its descent is like the sun's, a frightening ending.\"\n--Huatli")
        majesticHeliopterus.power = 2
        majesticHeliopterus.toughness = 2
        return majesticHeliopterus
    }
    static func MartyrOfDusk() -> Card {
        let martyrOfDusk = Card(name: "Martyr of Dusk", rarity: .Common, set: set, number: 14)
        martyrOfDusk.setManaCost("1W")
        martyrOfDusk.setType(.Creature, .Vampire, .Soldier)
        martyrOfDusk.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { martyrOfDusk.getController().createToken(XLN.Vampire()) })
        martyrOfDusk.setFlavorText("\"Should I fall, take up our standard and carry on. The Legion must alwasy prevail.\"")
        martyrOfDusk.power = 2
        martyrOfDusk.toughness = 1
        return martyrOfDusk
    }
    static func MomentOfTriumph() -> Card {
        let momentOfTriump = Card(name: "Moment of Triumph", rarity: .Common, set: set, number: 15)
        momentOfTriump.setManaCost("W")
        momentOfTriump.setType(.Instant)
        momentOfTriump.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(2, 2)
                momentOfTriump.getController().gainLife(2)
            }))
        momentOfTriump.setFlavorText("\"The time of salvation is at hand. Dusk washes over the world, and the Legion will rise immortal!\"")
        return momentOfTriump
    }
    // 16 Paladin of Atonement
    static func PrideOfConquerors() -> Card {
        let prideOfConquerors = Card(name: "Pride of Conquerors", rarity: .Uncommon, set: set, number: 17)
        prideOfConquerors.setManaCost("1W")
        prideOfConquerors.setType(.Instant)
        prideOfConquerors.addEffect({
            prideOfConquerors.ascend()
            let amount = prideOfConquerors.getController().citysBlessing ? 2 : 1
            prideOfConquerors.getController().getCreatures().forEach({ $0.pump(amount, amount) })
        })
        return prideOfConquerors
    }
    // 18 Radiant Destiny
    static func RaptorCompanion() -> Card {
        let raptorCompanion = Card(name: "Raptor Companion", rarity: .Common, set: set, number: 19)
        raptorCompanion.setManaCost("1W")
        raptorCompanion.setType(.Creature, .Dinosaur)
        raptorCompanion.setFlavorText("The abundance of foes in Orazca means the raptors no longer need any orders.")
        raptorCompanion.power = 3
        raptorCompanion.toughness = 1
        return raptorCompanion
    }
    static func SanguineGlorifier() -> Card {
        let sanguineGlorifier = Card(name: "Sanguine Glorifier", rarity: .Common, set: set, number: 20)
        sanguineGlorifier.setManaCost("3W")
        sanguineGlorifier.setType(.Creature, .Vampire, .Cleric)
        sanguineGlorifier.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != sanguineGlorifier && $0.isType(.Vampire) && $0.getController() === sanguineGlorifier.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        sanguineGlorifier.setFlavorText("For the Legion of Dusk, the Immortal Sun is a source of eternal life. When they reclaim it, they will no longer be forced to subsist on the blood of the wicked.")
        sanguineGlorifier.power = 3
        sanguineGlorifier.toughness = 3
        return sanguineGlorifier
    }
    static func SkymarcherAspirant() -> Card {
        let skymarcherAspirant = Card(name: "Skymarcher Aspirant", rarity: .Uncommon, set: set, number: 21)
        skymarcherAspirant.setManaCost("W")
        skymarcherAspirant.setType(.Creature, .Vampire, .Soldier)
        skymarcherAspirant.addStaticAbility({ object in
            if object == skymarcherAspirant {
                object.ascend()
                if object.getController().citysBlessing {
                    object.flying = true
                }
            }
            return object
        })
        skymarcherAspirant.setFlavorText("\"I was born to glory.\"")
        skymarcherAspirant.power = 2
        skymarcherAspirant.toughness = 1
        return skymarcherAspirant
    }
    // 22 Slaughter the Strong
    static func SnubhornSentry() -> Card {
        let snubhornSentry = Card(name: "Snubhorn Sentry", rarity: .Common, set: set, number: 23)
        snubhornSentry.setManaCost("W")
        snubhornSentry.setType(.Creature, .Dinosaur)
        snubhornSentry.addStaticAbility({ object in
            if object == snubhornSentry {
                object.ascend()
                if object.getController().citysBlessing {
                    object.power = object.getBasePower() + 3
                }
            }
            return object
        })
        snubhornSentry.setFlavorText("They're fun to train--if you like stubborn, aggressive, and fiercly territorial.")
        snubhornSentry.power = 0
        snubhornSentry.toughness = 3
        return snubhornSentry
    }
    // 24 Sphinx's Decree
    static func SquiresDevotion() -> Card {
        let squiresDevotion = Card(name: "Squire's Devotion", rarity: .Common, set: set, number: 25)
        squiresDevotion.setManaCost("2W")
        squiresDevotion.setType(.Enchantment, .Aura)
        squiresDevotion.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                // TODO: Layers
                object.lifelink = true
                return object
        })
        squiresDevotion.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { squiresDevotion.getController().createToken(XLN.Vampire()) })
        return squiresDevotion
    }
    static func SunSentinel() -> Card {
        let sunSentinel = Card(name: "Sun Sentinel", rarity: .Common, set: set, number: 26)
        sunSentinel.setManaCost("1W")
        sunSentinel.setType(.Creature, .Human, .Soldier)
        sunSentinel.vigilance = true
        sunSentinel.setFlavorText("\"I will not sleep until Orazca is ours once more.\"")
        sunSentinel.power = 2
        sunSentinel.toughness = 2
        return sunSentinel
    }
    static func SunCrestedPterodon() -> Card {
        let sunCrestedPterodon = Card(name: "Sun-Crested Pterodon", rarity: .Common, set: set, number: 27)
        sunCrestedPterodon.setManaCost("4W")
        sunCrestedPterodon.setType(.Creature, .Dinosaur)
        sunCrestedPterodon.flying = true
        sunCrestedPterodon.addStaticAbility({ object in
            if object == sunCrestedPterodon && !object.getController().getPermanents().filter({ $0 != object && $0.isType(.Dinosaur) }).isEmpty {
                sunCrestedPterodon.vigilance = true
            }
            return sunCrestedPterodon
        })
        sunCrestedPterodon.setFlavorText("\"Pterodons tolerate no intrusion into their skies. Even the clouds must ask permission.\"\n--Mahuiz, Sun Empire archer")
        sunCrestedPterodon.power = 2
        sunCrestedPterodon.toughness = 5
        return sunCrestedPterodon
    }
    // 28 Temple Altisaur
    // 29 Trapjaw Tyrant
    static func ZetalpaPrimalDawn() -> Card {
        let zetalpa = Card(name: "Zetalpa, Primal Dawn", rarity: .Rare, set: set, number: 30)
        zetalpa.setManaCost("6WW")
        zetalpa.setType(.Legendary, .Creature, .Elder, .Dinosaur)
        zetalpa.flying = true
        zetalpa.doubleStrike = true
        zetalpa.vigilance = true
        zetalpa.trample = true
        zetalpa.indestructible = true
        zetalpa.setFlavorText("The sky takes flight and the earth trembles.")
        zetalpa.power = 4
        zetalpa.toughness = 8
        return zetalpa
    }
    // 31 Admiral's Order
    static func AcquaticIncursion() -> Card {
        let acquaticIncursion = Card(name: "Acquatic Incursion", rarity: .Uncommon, set: set, number: 32)
        acquaticIncursion.setManaCost("3U")
        acquaticIncursion.setType(.Enchantment)
        acquaticIncursion.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                acquaticIncursion.getController().createToken(XLN.Merfolk())
                acquaticIncursion.getController().createToken(XLN.Merfolk())
        })
        acquaticIncursion.addActivatedAbility(
            string: "{3}{U}: Target Merfolk can't be blocked this turn.",
            cost: Cost.Mana("3U"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Merfolk) },
                    zones: [.Battlefield]),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.unblockable = true; return $0 }))
            }))
        return acquaticIncursion
    }
    // 33 Crafty Cutpurse
    static func CrashingTide() -> Card {
        let crashingTide = Card(name: "Crashing Tide", rarity: .Common, set: set, number: 34)
        crashingTide.setManaCost("2U")
        crashingTide.setType(.Sorcery)
        crashingTide.addStaticAbility(
            { object in
                if object == crashingTide && !object.getController().getPermanents().filter({ $0.isType(.Merfolk )}).isEmpty {
                    object.flash = true
                }
                return object
            },
            characteristicDefining: false,
            allZones: true)
        crashingTide.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.bounce()
                crashingTide.getController().drawCard()
        }))
        return crashingTide
    }
    // 35 Curious Obsession
    static func DeadeyeRigHauler() -> Card {
        let deadeyeRigHauler = Card(name: "Deadeye Rig-Hauler", rarity: .Common, set: set, number: 36)
        deadeyeRigHauler.setManaCost("3U")
        deadeyeRigHauler.setType(.Creature, .Human, .Pirate)
        deadeyeRigHauler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.bounce() },
                effectOptional: true),
            restriction: { deadeyeRigHauler.getController().attackedWithCreatureThisTurn })
        deadeyeRigHauler.setFlavorText("\"Up you go, you soggy rat.\"")
        deadeyeRigHauler.power = 3
        deadeyeRigHauler.toughness = 2
        return deadeyeRigHauler
    }
    // 37 Expel from Orazca
    // 38 Flood of Recollection
    static func Hornswoggle() -> Card {
        let hornswoggle = Card(name: "Hornswoggle", rarity: .Uncommon, set: set, number: 39)
        hornswoggle.setManaCost("2U")
        hornswoggle.setType(.Instant)
        hornswoggle.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreatureSpell(),
            effect: { target in
                target.counter()
                hornswoggle.getController().createToken(XLN.Treasure())
        }))
        hornswoggle.setFlavorText("Being a merciful pirate, she saved the vampire's gold from falling overboard.")
        return hornswoggle
    }
    // 40 Induced Amnesia
    static func KitesailCorsair() -> Card {
        let kitesailCorsair = Card(name: "Kitesail Corsair", rarity: .Common, set: set, number: 41)
        kitesailCorsair.setManaCost("1U")
        kitesailCorsair.setType(.Creature, .Human, .Pirate)
        kitesailCorsair.addStaticAbility({ object in
            if object == kitesailCorsair && object.isAttacking {
                object.flying = true
            }
            return object
        })
        kitesailCorsair.setFlavorText("\"Why perch in the crow's nest when I can fly like the crows?\"")
        kitesailCorsair.power = 2
        kitesailCorsair.toughness = 1
        return kitesailCorsair
    }
    static func KumenasAwakening() -> Card {
        let kumenasAwakening = Card(name: "Kumena's Awakening", rarity: .Rare, set: set, number: 42)
        kumenasAwakening.setManaCost("2UU")
        kumenasAwakening.setType(.Enchantment)
        kumenasAwakening.addStaticAbility({ object in
            if object == kumenasAwakening {
                object.ascend()
            }
            return object
        })
        kumenasAwakening.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: {
                kumenasAwakening.getController().drawCard()
                if !kumenasAwakening.getController().citysBlessing {
                    kumenasAwakening.eachOpponent({ $0.drawCard() })
                }
        })
        return kumenasAwakening
    }
    static func MistCloakedHerald() -> Card {
        let mistCloakedHerald = Card(name: "Mist-Cloaked Herald", rarity: .Common, set: set, number: 43)
        mistCloakedHerald.setManaCost("U")
        mistCloakedHerald.setType(.Creature, .Merfolk, .Warrior)
        mistCloakedHerald.unblockable = true
        mistCloakedHerald.setFlavorText("With matchless speed, the River Heralds fought a running battle against the three enemy forces.")
        mistCloakedHerald.power = 1
        mistCloakedHerald.toughness = 1
        return mistCloakedHerald
    }
    static func Negate() -> Card {
        let negate = Card(name: "Negate", rarity: .Common, set: set, number: 44)
        negate.setManaCost("1U")
        negate.setType(.Instant)
        negate.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetNonCreatureSpell(),
            effect: { $0.counter() }
        ))
        negate.setFlavorText("\"As one, nature lifts its voice to tell you this: 'No.'\"")
        return negate
    }
    // 45 Nezahal, Primal Tide
    // 46 Release to the Wind
    // 47 River Darter
    // 48 Riverwise Augur
    static func SailorOfMeans() -> Card {
        let sailorOfMeans = Card(name: "Sailor of Means", rarity: .Common, set: set, number: 49)
        sailorOfMeans.setManaCost("2U")
        sailorOfMeans.setType(.Creature, .Human, .Pirate)
        sailorOfMeans.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { sailorOfMeans.getController().createToken(XLN.Treasure()) })
        sailorOfMeans.setFlavorText("The rising tide of Orazca's plunder lifted all ships.")
        sailorOfMeans.power = 1
        sailorOfMeans.toughness = 4
        return sailorOfMeans
    }
    static func SeaLegs() -> Card {
        let seaLegs = Card(name: "Sea Legs", rarity: .Common, set: set, number: 50)
        seaLegs.setManaCost("U")
        seaLegs.setType(.Enchantment, .Aura)
        seaLegs.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                if object.isType(.Pirate) {
                    object.toughness = object.getBaseToughness() + 2
                }
                else {
                    object.power = object.getBasePower() - 2
                }
                return object
        })
        seaLegs.setFlavorText("\"When the waves pick up, either you find your feet or you lose your lunch.\"")
        return seaLegs
    }
    // 51 Seafloor Oracle
    static func SecretsOfTheGoldenCity() -> Card {
        let secretsOfTheGoldenCity = Card(name: "Secrets of the Golden City", rarity: .Common, set: set, number: 52)
        secretsOfTheGoldenCity.setManaCost("1UU")
        secretsOfTheGoldenCity.setType(.Sorcery)
        secretsOfTheGoldenCity.addEffect({
            secretsOfTheGoldenCity.ascend()
            let amount = secretsOfTheGoldenCity.getController().citysBlessing ? 3 : 2
            secretsOfTheGoldenCity.getController().drawCards(amount)
        })
        secretsOfTheGoldenCity.setFlavorText("Stolen knowledge can never be stolen back.")
        return secretsOfTheGoldenCity
    }
    // 53 Silvergill Adept
    static func SirenReaver() -> Card {
        let sirenReaver = Card(name: "Siren Reaver", rarity: .Uncommon, set: set, number: 54)
        sirenReaver.setManaCost("3U")
        sirenReaver.setType(.Creature, .Siren, .Pirate)
        sirenReaver.addStaticAbility(
            { object in
                if object == sirenReaver && object.getController().attackedWithCreatureThisTurn {
                    object.castingCost = object.getBaseCastingCost().reducedBy(1)
                }
                return object
            },
            characteristicDefining: false,
            allZones: true)
        sirenReaver.flying = true
        sirenReaver.setFlavorText("\"Prepare to be boarded.\"")
        sirenReaver.power = 3
        sirenReaver.toughness = 2
        return sirenReaver
    }
    static func SlipperyScoundrel() -> Card {
        let slipperyScoundrel = Card(name: "Slippery Scoundrel", rarity: .Uncommon, set: set, number: 55)
        slipperyScoundrel.setManaCost("2U")
        slipperyScoundrel.setType(.Creature, .Human, .Pirate)
        slipperyScoundrel.addStaticAbility({ object in
            if object == slipperyScoundrel {
                object.ascend()
                if object.getController().citysBlessing {
                    object.hexproof = true
                    object.unblockable = true
                }
            }
            return object
        })
        slipperyScoundrel.setFlavorText("\"I'd rather be caught red-handed than leave empty-handed!\"")
        slipperyScoundrel.power = 2
        slipperyScoundrel.toughness = 2
        return slipperyScoundrel
    }
    static func SoulOfTheRapids() -> Card {
        let soulOfTheRapids = Card(name: "Soul of the Rapids", rarity: .Common, set: set, number: 58)
        soulOfTheRapids.setManaCost("3UU")
        soulOfTheRapids.setType(.Creature, .Elemental)
        soulOfTheRapids.flying = true
        soulOfTheRapids.hexproof = true
        soulOfTheRapids.setFlavorText("With Kumena in control of the Immortal Sun, the rapids rose from their riverbeds and the waterfalls took flight.")
        soulOfTheRapids.power = 3
        soulOfTheRapids.toughness = 2
        return soulOfTheRapids
    }
    static func SpireWinder() -> Card {
        let spireWinder = Card(name: "Spire Winder", rarity: .Common, set: set, number: 57)
        spireWinder.setManaCost("3U")
        spireWinder.setType(.Creature, .Snake)
        spireWinder.flying = true
        spireWinder.addStaticAbility({ object in
            if object == spireWinder {
                object.ascend()
                if object.getController().citysBlessing {
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                }
            }
            return object
        })
        spireWinder.power = 2
        spireWinder.toughness = 3
        return spireWinder
    }
    static func SwornGuardian() -> Card {
        let swornGuardian = Card(name: "Sworn Guardian", rarity: .Common, set: set, number: 58)
        swornGuardian.setManaCost("1U")
        swornGuardian.setType(.Creature, .Merfolk, .Warrior)
        swornGuardian.setFlavorText("For the River Heralds, the Immortal Sun is an object of terror and devastation. The idea that anyone would retrieve it for their own use is utterly abhorrent.")
        swornGuardian.power = 1
        swornGuardian.toughness = 3
        return swornGuardian
    }
    // 59 Timestream Navigator
    // 60 Warkite Marauder
    // 61 Waterknot
    static func ArterialFlow() -> Card {
        let arterialFlow = Card(name: "Arterial Flow", rarity: .Uncommon, set: set, number: 62)
        arterialFlow.setManaCost("1BB")
        arterialFlow.setType(.Sorcery)
        arterialFlow.addEffect({
            arterialFlow.eachOpponent({ $0.discard(2) })
            let controlVampire = !arterialFlow.getController().getPermanents().filter({ $0.isType(.Vampire) }).isEmpty
            if controlVampire {
                arterialFlow.eachOpponent({ $0.loseLife(2) })
                arterialFlow.getController().gainLife(2)
            }
        })
        arterialFlow.setFlavorText("\"It is impious to admit, but I do enjoy pirate blood. Something in the salty tang of it, the spice of rebellion.\"")
        return arterialFlow
    }
    static func CanalMonitor() -> Card {
        let canalMonitor = Card(name: "Canal Monitor", rarity: .Common, set: set, number: 63)
        canalMonitor.setManaCost("4B")
        canalMonitor.setType(.Creature, .Lizard)
        canalMonitor.setFlavorText("The first goblin tried to swim the canal. The second built a raft. The last and craftiest goblin launched herself from a firecannon and soared over the canal, trailing smoke. All were eaten, but only one was cooked.")
        canalMonitor.power = 5
        canalMonitor.toughness = 3
        return canalMonitor
    }
    static func ChampionOfDusk() -> Card {
        let championOfDusk = Card(name: "Champion of Dusk", rarity: .Rare, set: set, number: 64)
        championOfDusk.setManaCost("3BB")
        championOfDusk.setType(.Creature, .Vampire, .Knight)
        championOfDusk.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let numVampires = championOfDusk.getController().getPermanents().filter({$0.isType(.Vampire)}).count
                championOfDusk.getController().drawCards(numVampires)
                championOfDusk.getController().loseLife(numVampires)
            })
        championOfDusk.setFlavorText("\"Drench these golden streets in the blood of our enemies.\"")
        championOfDusk.power = 4
        championOfDusk.toughness = 4
        return championOfDusk
    }
    static func DarkInquiry() -> Card {
        let darkInquiry = Card(name: "Dark Inquiry", rarity: .Common, set: set, number: 65)
        darkInquiry.setManaCost("2B")
        darkInquiry.setType(.Sorcery)
        darkInquiry.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.SinglePlayer(
                restriction: { $0 !== darkInquiry.getController() }),
            effect: { target in
                darkInquiry.getController().chooseCard(
                    from: target.getHand(),
                    restriction: { !$0.isType(.Land) },
                    action: { chosen, rest in
                        chosen?.discard()
                })
        }))
        darkInquiry.setFlavorText("\"Your mind is no longer yours to waste.\"")
        return darkInquiry
    }
    // 66 Dead Man's Chest
    // 67 Dinosaur Hunter
    static func DireFleetPoisoner() -> Card {
        let direFleetPoisoner = Card(name: "Dire Fleet Poisoner", rarity: .Rare, set: set, number: 68)
        direFleetPoisoner.setManaCost("1B")
        direFleetPoisoner.setType(.Creature, .Human, .Pirate)
        direFleetPoisoner.flash = true
        direFleetPoisoner.deathtouch = true
        direFleetPoisoner.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isAttacking && $0.isType(.Pirate) && $0.getController() === direFleetPoisoner.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    target.pump(1, 1)
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0 }))
        }))
        direFleetPoisoner.power = 2
        direFleetPoisoner.toughness = 2
        return direFleetPoisoner
    }
    static func DuskCharger() -> Card {
        let duskCharger = Card(name: "Dusk Charger", rarity: .Common, set: set, number: 69)
        duskCharger.setManaCost("3B")
        duskCharger.setType(.Creature, .Horse)
        duskCharger.addStaticAbility({ object in
            if object == duskCharger {
                object.ascend()
                if object.getController().citysBlessing {
                    object.power = object.getBasePower() + 2
                    object.toughness = object.getBaseToughness() + 2
                }
            }
            return object
        })
        duskCharger.setFlavorText("Stories say demon blood runs in its veins, making it fearless and bloodthirsty.")
        duskCharger.power = 3
        duskCharger.toughness = 3
        return duskCharger
    }
    static func DuskLegionZealot() -> Card {
        let duskLegionZealot = Card(name: "Dusk Legion Zealot", rarity: .Common, set: set, number: 70)
        duskLegionZealot.setManaCost("1B")
        duskLegionZealot.setType(.Creature, .Vampire, .Soldier)
        duskLegionZealot.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                duskLegionZealot.getController().drawCard()
                duskLegionZealot.getController().loseLife(1)
            })
        duskLegionZealot.setFlavorText("Once they reached Orazca, the Legion's explorers ransacked tombs and temples, hunting for the Immortal Sun.")
        duskLegionZealot.power = 1
        duskLegionZealot.toughness = 1
        return duskLegionZealot
    }
    static func FathomFleetBoarder() -> Card {
        let fathomFleetBoarder = Card(name: "Fathom Fleet Boarder", rarity: .Common, set: set, number: 71)
        fathomFleetBoarder.setManaCost("2B")
        fathomFleetBoarder.setType(.Creature, .Orc, .Pirate)
        fathomFleetBoarder.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { fathomFleetBoarder.getController().loseLife(2) },
            restriction: { fathomFleetBoarder.getController().getPermanents().filter({ $0 != fathomFleetBoarder && $0.isType(.Pirate) }).isEmpty })
        fathomFleetBoarder.setFlavorText("Without frequent raids, orcs sometimes get bored and plunder their own ships.")
        fathomFleetBoarder.power = 3
        fathomFleetBoarder.toughness = 3
        return fathomFleetBoarder
    }
    // 72 Forerunner of the Coalition
    static func GoldenDemise() -> Card {
        let goldenDemise = Card(name: "Golden Demise", rarity: .Uncommon, set: set, number: 73)
        goldenDemise.setManaCost("1BB")
        goldenDemise.setType(.Sorcery)
        goldenDemise.addEffect({
            goldenDemise.ascend()
            goldenDemise.eachOpponent({ $0.getCreatures().forEach({ $0.pump(-2, -2) }) })
            if goldenDemise.getController().citysBlessing {
                goldenDemise.getController().getCreatures().forEach({ $0.pump(-2, -2) })
            }
        })
        return goldenDemise
    }
    static func GraspingScoundrel() -> Card {
        let graspingScoundrel = Card(name: "Grasping Scoundrel", rarity: .Common, set: set, number: 74)
        graspingScoundrel.setManaCost("B")
        graspingScoundrel.setType(.Creature, .Human, .Pirate)
        graspingScoundrel.addStaticAbility({ object in
            if object == graspingScoundrel && object.isAttacking {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        graspingScoundrel.setFlavorText("\"I can hear the plunder calling. It asks for me by name.\"")
        graspingScoundrel.power = 1
        graspingScoundrel.toughness = 2
        return graspingScoundrel
    }
    static func GruesomeFate() -> Card {
        let gruesomeFate = Card(name: "Gruesome Fate", rarity: .Common, set: set, number: 75)
        gruesomeFate.setManaCost("2B")
        gruesomeFate.setType(.Sorcery)
        gruesomeFate.addEffect {
            let numCreatures = gruesomeFate.getController().getCreatures().count
            gruesomeFate.eachOpponent({ $0.loseLife(numCreatures) })
        }
        gruesomeFate.setFlavorText("\"You were keen enough to sink your fangs into us, vampire! And now you're afraid of a few little nibbles?\"\nUdvil \"Ratty\" Ratlock")
        return gruesomeFate
    }
    static func Impale() -> Card {
        let impale = Card(name: "Impale", rarity: .Common, set: set, number: 76)
        impale.setManaCost("2BB")
        impale.setType(.Sorcery)
        impale.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in let _ = target.destroy() }))
        impale.setFlavorText("Never let the glitter of gold distract you from the gleam of steel in the shadows.")
        return impale
    }
    // 77 Mastermind's Acquisition
    // 78 Mausoleum Harpy
    static func MomentOfCraving() -> Card {
        let momentOfCraving = Card(name: "Moment of Craving", rarity: .Common, set: set, number: 79)
        momentOfCraving.setManaCost("1B")
        momentOfCraving.setType(.Instant)
        momentOfCraving.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(-2, -2)
                momentOfCraving.getController().gainLife(2)
        }))
        momentOfCraving.setFlavorText("\"The time of condemnation is at hand. Dusk washes over the world, and I consign you to eternal darkness!\"")
        return momentOfCraving
    }
    // 80 Oathsworn Vampire
    // 81 Pitiless Plunderer
    static func RavenousChupacabra() -> Card {
        let ravenousChupacabra = Card(name: "Ravenous Chupacabra", rarity: .Uncommon, set: set, number: 82)
        ravenousChupacabra.setManaCost("2BB")
        ravenousChupacabra.setType(.Creature, .Beast, .Horror)
        ravenousChupacabra.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { return $0.isType(.Creature) && $0.getController() !== ravenousChupacabra.getController() },
                    zones: [.Battlefield]),
                effect: { let _ = $0.destroy() }))
        ravenousChupacabra.setFlavorText("Opening Orazca released more horrors than just the Immortal Sun.")
        ravenousChupacabra.power = 2
        ravenousChupacabra.toughness = 2
        return ravenousChupacabra
    }
    static func ReaverAmbush() -> Card {
        let reaverAmbush = Card(name: "Reaver Ambush", rarity: .Uncommon, set: set, number: 83)
        reaverAmbush.setManaCost("2G")
        reaverAmbush.setType(.Instant)
        reaverAmbush.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() <= 3 },
                zones: [.Battlefield]),
            effect: { $0.exile() }))
        reaverAmbush.setFlavorText("Onora knew with sudden, grim certainty he would never see the Great River again.")
        return reaverAmbush
    }
    static func Recover() -> Card {
        let recover = Card(name: "Recover", rarity: .Common, set: set, number: 84)
        recover.setManaCost("2B")
        recover.setType(.Sorcery)
        recover.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.getOwner() === recover.getOwner() && $0.isType(.Creature) },
                zones: [.Graveyard] ),
            effect: { target in
                target.putIntoHand()
                recover.getController().drawCard()
        }))
        recover.setFlavorText("\"No more fear of death's oblivion--is this not the greatest treasure of all?\"\n--Gurezan, Legion resurrectionist")
        return recover
    }
    // 85 Sadistic Skymarcher
    // 86 Tetzimoc, Primal Death
    // 87 Tomb Robber
    static func TwilightProphet() -> Card {
        let twilightProphet = Card(name: "Twilight Prophet", rarity: .Mythic, set: set, number: 88)
        twilightProphet.setManaCost("2BB")
        twilightProphet.setType(.Creature, .Vampire, .Cleric)
        twilightProphet.flying = true
        twilightProphet.addStaticAbility({ object in
            if object == twilightProphet {
                object.ascend()
            }
            return object
        })
        twilightProphet.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: {
                if let topOfLibrary = twilightProphet.getController().getLibrary().last {
                    topOfLibrary.reveal()
                    topOfLibrary.putIntoHand()
                    let life = topOfLibrary.getConvertedManaCost()
                    twilightProphet.eachOpponent({ $0.loseLife(life) })
                    twilightProphet.getController().gainLife(life)
                }
            },
            restriction: { twilightProphet.getController().citysBlessing })
        twilightProphet.power = 2
        twilightProphet.toughness = 4
        return twilightProphet
    }
    static func VampireRevenant() -> Card {
        let vampireRevenant = Card(name: "Vampire Revenant", rarity: .Common, set: set, number: 89)
        vampireRevenant.setManaCost("3B")
        vampireRevenant.setType(.Creature, .Vampire, .Spirit)
        vampireRevenant.flying = true
        vampireRevenant.setFlavorText("\"A thick fog obscures the port of Leor, but it's not thick enough to muffle the screams.\"\n--Admiral Beckett Brass")
        vampireRevenant.power = 3
        vampireRevenant.toughness = 1
        return vampireRevenant
    }
    // 90 Vona's Hunger
    // 91 Voracious Vampire
    // 92 Blood Sun
    static func Bombard() -> Card {
        let bombard = Card(name: "Bombard", rarity: .Common, set: set, number: 93)
        bombard.setManaCost("2R")
        bombard.setType(.Instant)
        bombard.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { bombard.damage(to: $0, 4) }))
        bombard.setFlavorText("\"Want to sink a ship? Blow a hole in the hull. Want to kill a regisaur? Same answer.\"\n--Captain Brandis Thorn")
        return bombard
    }
    static func BrasssBounty() -> Card {
        let brasssBounty = Card(name: "Brass's Bounty", rarity: .Rare, set: set, number: 94)
        brasssBounty.setManaCost("6R")
        brasssBounty.setType(.Sorcery)
        brasssBounty.addEffect({
            let numLands = brasssBounty.getController().getLands().count
            for _ in 1 ... numLands {
                brasssBounty.getController().createToken(XLN.Treasure())
            }
        })
        brasssBounty.setFlavorText("\"Why squabble for trinkets when we could be living large off all this gold?\"\n--Admiral Beckett Brass")
        return brasssBounty
    }
    static func BrazenFreebooter() -> Card {
        let brazenFreebooter = Card(name: "Brazen Freebooter", rarity: .Common, set: set, number: 95)
        brazenFreebooter.setManaCost("3R")
        brazenFreebooter.setType(.Creature, .Human, .Pirate)
        brazenFreebooter.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { brazenFreebooter.getController().createToken(XLN.Treasure()) })
        brazenFreebooter.setFlavorText("Finders, keepers.")
        brazenFreebooter.power = 3
        brazenFreebooter.toughness = 3
        return brazenFreebooter
    }
    // 96 Buccaneer's Bravado
    // 97 Charging Tuskodon
    // 98 Daring Buccaneer
    // 99 Dire Fleet Daredevil
    // 100 Etali, Primal Storm
    static func FanaticalFirebrand() -> Card {
        let fanaticalFirebrand = Card(name: "Fanatical Firebrand", rarity: .Common, set: set, number: 101)
        fanaticalFirebrand.setManaCost("R")
        fanaticalFirebrand.setType(.Creature, .Goblin, .Pirate)
        fanaticalFirebrand.haste = true
        fanaticalFirebrand.addActivatedAbility(
            string: "{T}, Sacrifice ~: It deals 1 damage to any target.",
            cost: Cost.Tap().Sacrifice(),
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { fanaticalFirebrand.damage(to: $0, 1) }))
        fanaticalFirebrand.setFlavorText("\"The Brazen Coalition is a firecannon pointed at our enemies. Goblins like him are the spark to its powder.\"\n--Admiral Beckett Brass")
        fanaticalFirebrand.power = 1
        fanaticalFirebrand.toughness = 1
        return fanaticalFirebrand
    }
    // 102 Forerunner of the Empire
    static func FormOfTheDinosaur() -> Card {
        let formOfTheDinosaur = Card(name: "Form of the Dinosaur", rarity: .Rare, set: set, number: 103)
        formOfTheDinosaur.setManaCost("4RR")
        formOfTheDinosaur.setType(.Enchantment)
        formOfTheDinosaur.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { formOfTheDinosaur.getController().setLife(15) })
        formOfTheDinosaur.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== formOfTheDinosaur.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    formOfTheDinosaur.damage(to: target, 15)
                    target.damage(to: formOfTheDinosaur.getController(), target.getPower())
        }))
        return formOfTheDinosaur
    }
    static func FrilledDeathspitter() -> Card {
        let frilledDeathspitter = Card(name: "Frilled Deathspitter", rarity: .Common, set: set, number: 104)
        frilledDeathspitter.setManaCost("2R")
        frilledDeathspitter.setType(.Creature, .Dinosaur)
        frilledDeathspitter.addTriggeredAbility(
            trigger: .ThisDealtDamage,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.SinglePlayer(
                    restriction: { $0 !== frilledDeathspitter.getController() }),
                effect: { frilledDeathspitter.damage(to: $0, 2) }))
        frilledDeathspitter.setFlavorText("Nothing says trouble like a reedy hiss with a hint of liquid gurgle.")
        frilledDeathspitter.power = 3
        frilledDeathspitter.toughness = 2
        return frilledDeathspitter
    }
    // 105 Goblin Trailblazer
    // 106 Mutiny
    static func NeedletoothRaptor() -> Card {
        let needletoothRaptor = Card(name: "Needletooth Raptor", rarity: .Uncommon, set: set, number: 107)
        needletoothRaptor.setManaCost("3R")
        needletoothRaptor.setType(.Creature, .Dinosaur)
        needletoothRaptor.addTriggeredAbility(
            trigger: .ThisDealtDamage,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== needletoothRaptor.getController() },
                    zones: [.Battlefield]),
                effect: { needletoothRaptor.damage(to: $0, 5) }))
        needletoothRaptor.setFlavorText("It hatches with its ferocity fully grown.")
        needletoothRaptor.power = 2
        needletoothRaptor.toughness = 2
        return needletoothRaptor
    }
    static func OrazcaRaptor() -> Card {
        let orazcaRaptor = Card(name: "Orazca Raptor", rarity: .Common, set: set, number: 108)
        orazcaRaptor.setManaCost("2RR")
        orazcaRaptor.setType(.Creature, .Dinosaur)
        orazcaRaptor.setFlavorText("\"If you come across a raptor in the city, stay perfectly still. At least then you'll be well rested when you die.\"\n--Captain Brandis Thorn")
        orazcaRaptor.power = 3
        orazcaRaptor.toughness = 4
        return orazcaRaptor
    }
    // 109 Pirate's Pillage
    static func RecklessRage() -> Card {
        let recklessRage = Card(name: "Reckless Rage", rarity: .Uncommon, set: set, number: 110)
        recklessRage.setManaCost("R")
        recklessRage.setType(.Instant)
        recklessRage.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== recklessRage.getController() },
                    zones: [.Battlefield]
                ),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === recklessRage.getController() },
                    zones: [.Battlefield]
                )
            ],
            effect: { targets in
                if let theirCreature = targets[0] {
                    recklessRage.damage(to: theirCreature, 4)
                }
                if let myCreature = targets[1] {
                    recklessRage.damage(to: myCreature, 2)
                }
        }))
        recklessRage.setFlavorText("\"Hard to starboard! Starb--Abandon ship! Abandon ship!\"")
        return recklessRage
    }
    static func RekindlingPhoenix() -> Card {
        let rekindlingPhoenix = Card(name: "Rekindling Phoenix", rarity: .Mythic, set: set, number: 111)
        rekindlingPhoenix.setManaCost("2RR")
        rekindlingPhoenix.setType(.Creature, .Phoenix)
        rekindlingPhoenix.flying = true
        rekindlingPhoenix.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { rekindlingPhoenix.getController().createToken(RekindlingPhoenixElemental()) })
        rekindlingPhoenix.power = 4
        rekindlingPhoenix.toughness = 3
        return rekindlingPhoenix
    }
    static func SeeRed() -> Card {
        let seeRed = Card(name: "See Red", rarity: .Uncommon, set: set, number: 112)
        seeRed.setManaCost("1R")
        seeRed.setType(.Enchantment, .Aura)
        seeRed.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 1
                // TODO Layers
                object.firstStrike = true
                return object
        })
        seeRed.addTriggeredAbility(
            trigger: .YourEndStep,
            effect: { seeRed.sacrifice() },
            effectOptional: false,
            restriction: { !seeRed.getController().attackedWithCreatureThisTurn })
        return seeRed
    }
    static func ShakeTheFoundations() -> Card {
        let shakeTheFoundations = Card(name: "Shake the Foundations", rarity: .Uncommon, set: set, number: 113)
        shakeTheFoundations.setManaCost("2R")
        shakeTheFoundations.setType(.Instant)
        shakeTheFoundations.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().filter({ return !$0.flying }).forEach({ shakeTheFoundations.damage(to: $0, 1) })
            })
            shakeTheFoundations.getController().drawCard()
        }
        shakeTheFoundations.setFlavorText("A threefold calamity with a single will.")
        return shakeTheFoundations
    }
    static func Shatter() -> Card {
        let shatter = Card(name: "Shatter", rarity: .Common, set: set, number: 114)
        shatter.setManaCost("1R")
        shatter.setType(.Instant)
        shatter.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifact(),
            effect: { target in let _ = target.destroy() }))
        shatter.setFlavorText("Today it's a miracle of architecture, a marvel of stained glass, a symbol of the Legion's power. Tomorrow, driftwood.")
        return shatter
    }
    // 115 Silverclad Ferocidons
    static func StampedingHorncrest() -> Card {
        let stampedingHorncrest = Card(name: "Stampeding Horncrest", rarity: .Common, set: set, number: 116)
        stampedingHorncrest.setManaCost("4R")
        stampedingHorncrest.setType(.Creature, .Dinosaur)
        stampedingHorncrest.addStaticAbility({ object in
            if object == stampedingHorncrest && !object.getController().getPermanents().filter({ $0 != object && $0.isType(.Dinosaur) }).isEmpty {
                object.haste = true
            }
            return object
        })
        stampedingHorncrest.setFlavorText("When the golden city opened, the dinosaurs inside were eager to greet the new visitors.")
        stampedingHorncrest.power = 4
        stampedingHorncrest.toughness = 4
        return stampedingHorncrest
    }
    static func StormFleetSwashbuckler() -> Card {
        let stormFleetSwashbuckler = Card(name: "Storm Fleet Swashbuckler", rarity: .Uncommon, set: set, number: 117)
        stormFleetSwashbuckler.setManaCost("1R")
        stormFleetSwashbuckler.setType(.Creature, .Human, .Pirate)
        stormFleetSwashbuckler.addStaticAbility({ object in
            if object == stormFleetSwashbuckler {
                object.ascend()
                if object.getController().citysBlessing {
                    object.doubleStrike = true
                }
            }
            return object
        })
        stormFleetSwashbuckler.setFlavorText("\"A bolt to the eye, a blade to the neck. That's the way to clear the deck!")
        stormFleetSwashbuckler.power = 2
        stormFleetSwashbuckler.toughness = 2
        return stormFleetSwashbuckler
    }
    static func SunCollaredRaptor() -> Card {
        let sunCollaredRaptor = Card(name: "Sun-Collared Raptor", rarity: .Common, set: set, number: 118)
        sunCollaredRaptor.setManaCost("1R")
        sunCollaredRaptor.setType(.Creature, .Dinosaur)
        sunCollaredRaptor.trample = true
        sunCollaredRaptor.addActivatedAbility(
            string: "{2}{R}: ~ gets +3/+0 until end of turn.",
            cost: Cost.Mana("2R"),
            effect: { sunCollaredRaptor.pump(3, 0) })
        sunCollaredRaptor.setFlavorText("\"With Tilonalli's gifts, even the smallest of us can become great.\"\n--Huatli")
        sunCollaredRaptor.power = 1
        sunCollaredRaptor.toughness = 2
        return sunCollaredRaptor
    }
    static func SwaggeringCorsair() -> Card {
        let swaggeringCorsair = Card(name: "Swaggering Corsair", rarity: .Common, set: set, number: 119)
        swaggeringCorsair.setManaCost("2R")
        swaggeringCorsair.setType(.Creature, .Human, .Pirate)
        swaggeringCorsair.addReplacementEffect(
            event: .ThisETB,
            effect: {
                if swaggeringCorsair.getController().attackedWithCreatureThisTurn {
                    swaggeringCorsair.addCounter(.PlusOnePlusOne)
                }
        })
        swaggeringCorsair.setFlavorText("\"I'm about to make you famous. From the golden city to High and Dry, they'll talk about how fast you died!\"")
        swaggeringCorsair.power = 2
        swaggeringCorsair.toughness = 2
        return swaggeringCorsair
    }
    static func TilonallisCrown() -> Card {
        let tilonallisCrown = Card(name: "Tilonalli's Crown", rarity: .Common, set: set, number: 120)
        tilonallisCrown.setManaCost("1R")
        tilonallisCrown.setType(.Enchantment, .Aura)
        tilonallisCrown.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.power = object.getBasePower() + 3
                // TODO: Layers
                object.trample = true
                return object
        })
        tilonallisCrown.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                if let attachedTo = tilonallisCrown.attachedTo {
                    tilonallisCrown.damage(to: attachedTo, 1)
                }
        })
        return tilonallisCrown
    }
    // 121 Tilonalli's Summoner
    static func AggressiveUrge() -> Card {
        let aggressiveUrge = Card(name: "Aggressive Urge", rarity: .Common, set: set, number: 122)
        aggressiveUrge.setManaCost("1G")
        aggressiveUrge.setType(.Instant)
        aggressiveUrge.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(1, 1)
                aggressiveUrge.getController().drawCard()
        }))
        aggressiveUrge.setFlavorText("\"Our lives, our homes, and all our history are at risk. Do not speak to me of peace.\"")
        return aggressiveUrge
    }
    static func Cacophodon() -> Card {
        let cacophodon = Card(name: "Cacophodon", rarity: .Uncommon, set: set, number: 123)
        cacophodon.setManaCost("3G")
        cacophodon.setType(.Creature, .Dinosaur)
        cacophodon.addTriggeredAbility(
            trigger: .ThisDealtDamage,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetPermanent(),
                effect: { $0.untap() }))
        cacophodon.setFlavorText("When a cacophodon is angry, the whole jungle knows.")
        cacophodon.power = 2
        cacophodon.toughness = 5
        return cacophodon
    }
    // 124 Cherished Hatchling
    static func ColossalDreadmaw() -> Card {
        let colossalDreadmaw = Card(name: "Colossal Dreadmaw", rarity: .Common, set: set, number: 125)
        colossalDreadmaw.setManaCost("4GG")
        colossalDreadmaw.setType(.Creature, .Dinosaur)
        colossalDreadmaw.trample = true
        colossalDreadmaw.setFlavorText("\"Remember when it was the most terrifying thing you'd ever seen?\"\n--Captain Lannery Storm")
        colossalDreadmaw.power = 6
        colossalDreadmaw.toughness = 6
        return colossalDreadmaw
    }
    static func CrestedHerdcaller() -> Card {
        let crestedHerdcaller = Card(name: "Crested Herdcaller", rarity: .Uncommon, set: set, number: 126)
        crestedHerdcaller.setManaCost("3GG")
        crestedHerdcaller.setType(.Creature, .Dinosaur)
        crestedHerdcaller.trample = true
        crestedHerdcaller.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { crestedHerdcaller.getController().createToken(XLN.Dinosaur()) })
        crestedHerdcaller.setFlavorText("\"Our survival, like theirs, depends on our ability to work together.\"\n--Huatli, to Tishana")
        crestedHerdcaller.power = 3
        crestedHerdcaller.toughness = 3
        return crestedHerdcaller
    }
    // 127 Deeproot Elite
    // 128 Enter the Unknown
    // 129 Forerunner of the Heralds
    static func GhaltaPrimalHunger() -> Card {
        let ghalta = Card(name: "Ghalta, Primal Hunger", rarity: .Rare, set: set, number: 130)
        ghalta.setManaCost("10GG")
        ghalta.setType(.Legendary, .Creature, .Elder, .Dinosaur)
        ghalta.addStaticAbility(
            { object in
                if object == ghalta {
                    // TODO: if another creature needs to look at characteristics to determine power (or anything really) this infinite loops (see: another ghalta before sacrificing)
                    // This would get fixed by layers / timestamps I think?
                    let totalPower = object.getController().getCreatures().map({ return $0 == ghalta ? $0.getBasePower() : $0.getPower() }).reduce(0, +)
                    object.castingCost = object.getBaseCastingCost().reducedBy(max(0, totalPower))
                }
                return object
            },
            characteristicDefining: false,
            allZones: true)
        ghalta.trample = true
        ghalta.setFlavorText("The earth walks, strongest of all.")
        ghalta.power = 12
        ghalta.toughness = 12
        return ghalta
    }
    static func GiltgroveStalker() -> Card {
        let giltgroveStalker = Card(name: "Giltgrove Stalker", rarity: .Common, set: set, number: 131)
        giltgroveStalker.setManaCost("1G")
        giltgroveStalker.setType(.Creature, .Merfolk, .Warrior)
        giltgroveStalker.blockabilityRequirements.append({ object in
            return object.getPower() > 2
        })
        giltgroveStalker.setFlavorText("\"The only gold I need is the sheltering shimmer of the trees.\"")
        giltgroveStalker.power = 2
        giltgroveStalker.toughness = 1
        return giltgroveStalker
    }
    static func HardyVeteran() -> Card {
        let hardyVeteran = Card(name: "Hardy Veteran", rarity: .Common, set: set, number: 132)
        hardyVeteran.setManaCost("1G")
        hardyVeteran.setType(.Creature, .Human, .Warrior)
        hardyVeteran.addStaticAbility({ object in
            if object == hardyVeteran && hardyVeteran.getController().active {
                object.toughness = object.getBaseToughness() + 2
            }
            return object
        })
        hardyVeteran.setFlavorText("For the Sun Empire, the Immortal Sun is a symbol of national identity. When they reclaim it, the Empire will flourish once more.")
        hardyVeteran.power = 2
        hardyVeteran.toughness = 2
        return hardyVeteran
    }
    static func HuntTheWeak() -> Card {
        let huntTheWeak = Card(name: "Hunt the Weak", rarity: .Common, set: set, number: 133)
        huntTheWeak.setManaCost("3G")
        huntTheWeak.setType(.Sorcery)
        huntTheWeak.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === huntTheWeak.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== huntTheWeak.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                if let myCreature = targets[0] {
                    myCreature.addCounter(.PlusOnePlusOne)
                    if let theirCreature = targets[1] {
                        myCreature.fight(theirCreature)
                    }
                }
        }))
        huntTheWeak.setFlavorText("\"Death lizard approaching, cap'n!\"\n--Brint Doobin, last words")
        return huntTheWeak
    }
    static func JadeBearer() -> Card {
        let jadeBearer = Card(name: "Jade Bearer", rarity: .Common, set: set, number: 134)
        jadeBearer.setManaCost("G")
        jadeBearer.setType(.Creature, .Merfolk, .Shaman)
        jadeBearer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != jadeBearer && $0.isType(.Merfolk) && $0.getController() === jadeBearer.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        jadeBearer.setFlavorText("\"Sisora wore this, who defeated the tyrant of Azcanta, and before her Natena of Vuhana's band. May it bring you their strength.\"")
        jadeBearer.power = 1
        jadeBearer.toughness = 1
        return jadeBearer
    }
    static func JadecraftArtisan() -> Card {
        let jadecraftArtisan = Card(name: "Jadecraft Artisan", rarity: .Common, set: set, number: 135)
        jadecraftArtisan.setManaCost("3G")
        jadecraftArtisan.setType(.Creature, .Merfolk, .Shaman)
        jadecraftArtisan.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.pump(2, 2) }))
        jadecraftArtisan.setFlavorText("\"A blade is not fully forged until it is given.\"")
        jadecraftArtisan.power = 3
        jadecraftArtisan.toughness = 3
        return jadecraftArtisan
    }
    // 136 Jadelight Ranger
    static func JunglebornPioneer() -> Card {
        let junglebornPioneer = Card(name: "Jungleborn Pioneer", rarity: .Common, set: set, number: 137)
        junglebornPioneer.setManaCost("2G")
        junglebornPioneer.setType(.Creature, .Merfolk, .Scout)
        junglebornPioneer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { junglebornPioneer.getController().createToken(XLN.Merfolk()) })
        junglebornPioneer.setFlavorText("\"We fought so long to hide this place. Let us be first to learn its wonders!\"")
        junglebornPioneer.power = 2
        junglebornPioneer.toughness = 2
        return junglebornPioneer
    }
    static func KnightOfTheStampede() -> Card {
        let knightOfTheStampede = Card(name: "Knight of the Stampede", rarity: .Common, set: set, number: 138)
        knightOfTheStampede.setManaCost("3G")
        knightOfTheStampede.setType(.Creature, .Human, .Knight)
        knightOfTheStampede.addStaticAbility({ object in
            if object.isType(.Dinosaur) && object.isSpell() && object.getOwner() === knightOfTheStampede.getController() {
                object.castingCost = object.getBaseCastingCost().reducedBy(2)
            }
            return object
        })
        knightOfTheStampede.setFlavorText("\"My whisper becomes a thousand roars.\"")
        knightOfTheStampede.power = 2
        knightOfTheStampede.toughness = 4
        return knightOfTheStampede
    }
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 139)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { target in let _ = target.destroy() }))
        naturalize.setFlavorText("\"Better to let the sword go than to lose the arm with it.\"\n--Captain Lannery Storm")
        return naturalize
    }
    static func OrazcaFrillback() -> Card {
        let orazcaFrillback = Card(name: "Orazca Frillback", rarity: .Common, set: set, number: 140)
        orazcaFrillback.setManaCost("2G")
        orazcaFrillback.setType(.Creature, .Dinosaur)
        orazcaFrillback.setFlavorText("The frillbacks of Orazca soak up the sun on their tall spinal fins. They look slow and sleepy--until they catch the scent of prey.")
        orazcaFrillback.power = 4
        orazcaFrillback.toughness = 2
        return orazcaFrillback
    }
    static func OvergrownArmasaur() -> Card {
        let overgrownArmasaur = Card(name: "Overgrown Armasaur", rarity: .Common, set: set, number: 141)
        overgrownArmasaur.setManaCost("3GG")
        overgrownArmasaur.setType(.Creature, .Dinosaur)
        overgrownArmasaur.addTriggeredAbility(
            trigger: .ThisDealtDamage,
            effect: { overgrownArmasaur.getController().createToken(Saproling()) })
        overgrownArmasaur.setFlavorText("It embodies the riotous growth of the jungle, where creatures crowd upon creatures, where roots sprawl and vines swarm.")
        overgrownArmasaur.power = 4
        overgrownArmasaur.toughness = 4
        return overgrownArmasaur
    }
    // 142 Path of Discovery
    static func Plummet() -> Card {
        let plummet = Card(name: "Plummet", rarity: .Common, set: set, number: 143)
        plummet.setManaCost("1G")
        plummet.setType(.Instant)
        plummet.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.flying },
                zones: [.Battlefield]),
            effect: { target in let _ = target.destroy() }))
        plummet.setFlavorText("\"Still, the pterodon chasing the clouds from its skies must bow to the great forest below.\"\n--Mahuiz, Sun Empire archer")
        return plummet
    }
    // 144 Polyraptor
    static func StrengthOfThePack() -> Card {
        let strengthOfThePack = Card(name: "Strength of the Pack", rarity: .Uncommon, set: set, number: 145)
        strengthOfThePack.setManaCost("4GG")
        strengthOfThePack.setType(.Sorcery)
        strengthOfThePack.addEffect({
            strengthOfThePack.getController().getCreatures().forEach({ $0.addCounter(.PlusOnePlusOne )})
        })
        strengthOfThePack.setFlavorText("The pack that ambushes, eviscerates, and devours together stays together.")
        return strengthOfThePack
    }
    static func SwiftWarden() -> Card {
        let swiftWarden = Card(name: "Swift Warden", rarity: .Uncommon, set: set, number: 146)
        swiftWarden.setManaCost("1GG")
        swiftWarden.setType(.Creature, .Merfolk, .Warrior)
        swiftWarden.flash = true
        swiftWarden.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Merfolk) && $0.getController() === swiftWarden.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.hexproof = true; return $0 }))
            }))
        swiftWarden.setFlavorText("A warning shout would take too long.")
        swiftWarden.power = 3
        swiftWarden.toughness = 3
        return swiftWarden
    }
    static func TendershootDryad() -> Card {
        let tendershootDryad = Card(name: "Tendershoot Dryad", rarity: .Rare, set: set, number: 147)
        tendershootDryad.setManaCost("4G")
        tendershootDryad.setType(.Creature, .Dryad)
        tendershootDryad.addStaticAbility({ object in
            if object == tendershootDryad {
                object.ascend()
            }
            return object
        })
        tendershootDryad.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { tendershootDryad.getController().createToken(Saproling()) })
        tendershootDryad.addStaticAbility({ object in
            if object.isType(.Saproling) && object.getController() === tendershootDryad.getController() && tendershootDryad.getController().citysBlessing {
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
            }
            return object
        })
        tendershootDryad.power = 2
        tendershootDryad.toughness = 2
        return tendershootDryad
    }
    static func ThrashingBrontodon() -> Card {
        let thrashingBrontodon = Card(name: "Thrashing Brontodon", rarity: .Uncommon, set: set, number: 148)
        thrashingBrontodon.setManaCost("1GG")
        thrashingBrontodon.setType(.Creature, .Dinosaur)
        thrashingBrontodon.addActivatedAbility(
            string: "{1}, Sacrifice ~: Destroy target artifact or enchantment.",
            cost: Cost.Mana("1").Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
                effect: { let _ = $0.destroy() }))
        thrashingBrontodon.setFlavorText("It cares more about preserving the herd's territory than about preserving itself.")
        thrashingBrontodon.power = 3
        thrashingBrontodon.toughness = 4
        return thrashingBrontodon
    }
    // 149 Thunderherd Migration
    // 150 Wayward Swordtooth
    static func WorldShaper() -> Card {
        let worldShaper = Card(name: "World Shaper", rarity: .Rare, set: set, number: 151)
        worldShaper.setManaCost("3G")
        worldShaper.setType(.Creature, .Merfolk, .Shaman)
        worldShaper.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { worldShaper.getController().mill(3) },
            effectOptional: true)
        worldShaper.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { worldShaper.getController().getGraveyard().filter({ $0.isType(.Land) }).forEach({ $0.putOntoBattlefield() }) })
        worldShaper.setFlavorText("\"The Great River will not be tamed.\"")
        worldShaper.power = 3
        worldShaper.toughness = 3
        return worldShaper
    }
    // 152 Angrath, the Flame-Chained
    static func AtzocanSeer() -> Card {
        let atzocanSeer = Card(name: "Atzocan Seer", rarity: .Uncommon, set: set, number: 153)
        atzocanSeer.setManaCost("1GW")
        atzocanSeer.setType(.Creature, .Human, .Druid)
        atzocanSeer.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { atzocanSeer.getController().addMana(color: .White) },
            manaAbility: true)
        atzocanSeer.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { atzocanSeer.getController().addMana(color: .Blue) },
            manaAbility: true)
        atzocanSeer.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { atzocanSeer.getController().addMana(color: .Black) },
            manaAbility: true)
        atzocanSeer.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { atzocanSeer.getController().addMana(color: .Red) },
            manaAbility: true)
        atzocanSeer.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { atzocanSeer.getController().addMana(color: .Green) },
            manaAbility: true)
        atzocanSeer.addActivatedAbility(
            string: "Sacrifice ~: Return target Dinosaur card from your graveyard to your hand.",
            cost: Cost.Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Dinosaur) && $0.getOwner() === atzocanSeer.getOwner() },
                    zones: [.Graveyard]),
                effect: { $0.putIntoHand() }))
        atzocanSeer.setFlavorText("Streams of gold and bright feathers flash in the orb, visions of past and future.")
        atzocanSeer.power = 2
        atzocanSeer.toughness = 3
        return atzocanSeer
    }
    // 154 Azor, the Lawbringer
    static func DeadeyeBrawler() -> Card {
        let deadeyeBrawler = Card(name: "Deadeye Brawler", rarity: .Uncommon, set: set, number: 155)
        deadeyeBrawler.setManaCost("2UB")
        deadeyeBrawler.setType(.Creature, .Human, .Pirate)
        deadeyeBrawler.deathtouch = true
        deadeyeBrawler.addStaticAbility({ object in
            if object == deadeyeBrawler {
                object.ascend()
            }
            return object
        })
        deadeyeBrawler.addTriggeredAbility(
            trigger: .ThisDealsCombatDamageToPlayer,
            effect: { deadeyeBrawler.getController().drawCard() },
            restriction: { deadeyeBrawler.getController().citysBlessing })
        deadeyeBrawler.power = 2
        deadeyeBrawler.toughness = 4
        return deadeyeBrawler
    }
    static func DireFleetNeckbreaker() -> Card {
        let direFleetNeckbreaker = Card(name: "Dire Fleet Neckbreaker", rarity: .Uncommon, set: set, number: 156)
        direFleetNeckbreaker.setManaCost("2BR")
        direFleetNeckbreaker.setType(.Creature, .Orc, .Pirate)
        direFleetNeckbreaker.addStaticAbility({ object in
            if object.isAttacking && object.isType(.Pirate) && object.getController() === direFleetNeckbreaker.getController() {
                object.power = object.getBasePower() + 2
            }
            return object
        })
        direFleetNeckbreaker.setFlavorText("The buccaneers scaled the sides of the buildings as easily as the boarded enemy ships.")
        direFleetNeckbreaker.power = 3
        direFleetNeckbreaker.toughness = 2
        return direFleetNeckbreaker
    }
    // 157 Elenda, the Dusk Rose
    // 158 Hadana's Climb // Winged Temple of Orazca
    static func HuatliRadiantChampion() -> Card {
        let huatli = Card(name: "Huatli, Radiant Champion", rarity: .Mythic, set: set, number: 159)
        huatli.setManaCost("2GW")
        huatli.setType(.Legendary, .Planeswalker, .Huatli)
        huatli.addActivatedAbility(
            string: "{+1}: Put a loyalty counter on ~ for each creature you control.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: {
                let numCreatures = huatli.getController().getCreatures().count
                huatli.addCounters(.Loyalty, numCreatures)
            },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        huatli.addActivatedAbility(
            string: "{-1}: Target creature gets +X/+X until end of turn, where X is the number of creatures you control.",
            cost: Cost.RemoveCounters(.Loyalty, 1),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { target in
                    let numCreatures = huatli.getController().getCreatures().count
                    target.pump(numCreatures, numCreatures)
            }),
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        huatli.addActivatedAbility(
            string: "{-8}: You get an emblem with \"Whenever a creature enters the battlefield under your control, you may draw a card.\"",
            cost: Cost.RemoveCounters(.Loyalty, 8),
            effect: { huatli.getController().createEmblem(HuatliRadiantChampionEmblem()) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        huatli.startingLoyalty = 3
        return huatli
    }
    // 160 Journey to Eternity // Atzal, Cave of Eternity
    // 161 Jungle Creeper
    // 162 Kumena, Tyrant of Orazca
    static func LegionLieutenant() -> Card {
        let legionLieutenant = Card(name: "Legion Lieutenant", rarity: .Uncommon, set: set, number: 163)
        legionLieutenant.setManaCost("WB")
        legionLieutenant.setType(.Creature, .Vampire, .Knight)
        legionLieutenant.addStaticAbility({ object in
            if object != legionLieutenant && object.isType(.Vampire) && object.getController() === legionLieutenant.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        legionLieutenant.setFlavorText("\"We long ago abandoned the things that make humans weak: friendship, marriage, family. All that remains is the strength of our devotion.\"")
        legionLieutenant.power = 2
        legionLieutenant.toughness = 2
        return legionLieutenant
    }
    static func MerfolkMistbinder() -> Card {
        let merfolkMistbinder = Card(name: "Merfolk Mistbinder", rarity: .Uncommon, set: set, number: 164)
        merfolkMistbinder.setManaCost("GU")
        merfolkMistbinder.setType(.Creature, .Merfolk, .Shaman)
        merfolkMistbinder.addStaticAbility({ object in
            if object != merfolkMistbinder && object.isType(.Merfolk) && object.getController() === merfolkMistbinder.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        merfolkMistbinder.setFlavorText("\"The mist clothes us when we are bare, hides us when we are alone, and unites us when we are together.\"\n--Nirit of Pashona's band.")
        merfolkMistbinder.power = 2
        merfolkMistbinder.toughness = 2
        return merfolkMistbinder
    }
    // 165 Path of Mettle // Metzali, Tower of Triumph
    // 166 Profane Procession // Tomb of the Dusk Rose
    // 167 Protean Raider
    static func RagingRegisaur() -> Card {
        let ragingRegisaur = Card(name: "Raging Regisaur", rarity: .Uncommon, set: set, number: 168)
        ragingRegisaur.setManaCost("2RG")
        ragingRegisaur.setType(.Creature, .Dinosaur)
        ragingRegisaur.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { ragingRegisaur.damage(to: $0, 1) }))
        ragingRegisaur.setFlavorText("Its breath is a gale. Its roar is a volcano. Its anger tears soul from flesh.")
        ragingRegisaur.power = 4
        ragingRegisaur.toughness = 4
        return ragingRegisaur
    }
    // 169 Relentless Raptor
    static func ResplendentGriffin() -> Card {
        let resplendentGriffin = Card(name: "Resplendent Griffin", rarity: .Uncommon, set: set, number: 170)
        resplendentGriffin.setManaCost("1WU")
        resplendentGriffin.setType(.Creature, .Griffin)
        resplendentGriffin.flying = true
        resplendentGriffin.addStaticAbility({ object in
            if object == resplendentGriffin {
                object.ascend()
            }
            return object
        })
        resplendentGriffin.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                if resplendentGriffin.getController().citysBlessing {
                    resplendentGriffin.addCounter(.PlusOnePlusOne)
                }
        })
        resplendentGriffin.power = 2
        resplendentGriffin.toughness = 2
        return resplendentGriffin
    }
    static func SiegehornCeratops() -> Card {
        let siegehornCeratops = Card(name: "Siegehorn Ceratops", rarity: .Rare, set: set, number: 171)
        siegehornCeratops.setManaCost("GW")
        siegehornCeratops.setType(.Creature, .Dinosaur)
        siegehornCeratops.addTriggeredAbility(
            trigger: .ThisDealtDamage,
            effect: { siegehornCeratops.addCounters(.PlusOnePlusOne, 2) })
        siegehornCeratops.setFlavorText("To a siegehorn, there is no such thing as a dead end.")
        siegehornCeratops.power = 2
        siegehornCeratops.toughness = 2
        return siegehornCeratops
    }
    static func StormFleetSprinter() -> Card {
        let stormFleetSprinter = Card(name: "Storm Fleet Sprinter", rarity: .Uncommon, set: set, number: 172)
        stormFleetSprinter.setManaCost("1UR")
        stormFleetSprinter.setType(.Creature, .Human, .Pirate)
        stormFleetSprinter.haste = true
        stormFleetSprinter.unblockable = true
        stormFleetSprinter.setFlavorText("\"Charge like a red-hot cannonball straight to your target. You slow down, you sink.\"\n--Captain Lannery Storm")
        stormFleetSprinter.power = 2
        stormFleetSprinter.toughness = 2
        return stormFleetSprinter
    }
    // 173 Storm the Vault // Vault of Catlacan
    // 174 Zacama, Primal Calamity
    static func AwakenedAmalgam() -> Card {
        let awakenedAmalgam = Card(name: "Awakened Amalgam", rarity: .Rare, set: set, number: 175)
        awakenedAmalgam.setManaCost("4")
        awakenedAmalgam.setType(.Artifact, .Creature, .Golem)
        awakenedAmalgam.addStaticAbility(
            { object in
                if object == awakenedAmalgam {
                    let amount = Set(object.getController().getLands().map({ return $0.getName() })).count
                    object.power = amount
                    object.toughness = amount
                }
                return object
            },
            characteristicDefining: true)
        awakenedAmalgam.setFlavorText("\"The fools have done it.\"\n--Tishana")
        return awakenedAmalgam
    }
    // 176 Azor's Gateway // Sanctum of the Sun
    // 177 Captain's Hook
    static func GleamingBarrier() -> Card {
        let gleamingBarrier = Card(name: "Gleaming Barrier", rarity: .Common, set: set, number: 178)
        gleamingBarrier.setManaCost("2")
        gleamingBarrier.setType(.Artifact, .Creature, .Wall)
        gleamingBarrier.defender = true
        gleamingBarrier.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { gleamingBarrier.getController().createToken(XLN.Treasure()) })
        gleamingBarrier.setFlavorText("\"Gold without freedom might as well be lead.\"\n--Angrath")
        gleamingBarrier.power = 0
        gleamingBarrier.toughness = 4
        return gleamingBarrier
    }
    // 179 Golden Guardian // Gold-Forge Garrison
    // 180 The Immortal Sun
    // 181 Orazca Relic
    // 182 Silent Gravestone
    static func StriderHarness() -> Card {
        let striderHarness = Card(name: "Strider Harness", rarity: .Common, set: set, number: 183)
        striderHarness.setManaCost("3")
        striderHarness.setType(.Artifact, .Equipment)
        striderHarness.addEquipAbility(
            string: "{1}: Equip.",
            cost: Cost.Mana("1"),
            effect: { object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                // TODO Layers
                object.haste = true
                return object
        })
        striderHarness.setFlavorText("\"Because the giant, implacable death lizard wasn't scary enough already.\"\n--Captain Brinely Rage")
        return striderHarness
    }
    static func TravelersAmulet() -> Card {
        let travelersAmulet = Card(name: "Traveler's Amulet", rarity: .Common, set: set, number: 184)
        travelersAmulet.setManaCost("1")
        travelersAmulet.setType(.Artifact)
        travelersAmulet.addActivatedAbility(
            string: "{1}, Sacrifice ~: Search your library for a basic land card, reveal it, put it into your hand, then shuffle your library.",
            cost: Cost.Mana("1").Sacrifice(),
            effect: { travelersAmulet.getController().chooseCard(
                from: travelersAmulet.getController().getLibrary(),
                restriction: { $0.isBasicLand() },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    travelersAmulet.getController().shuffleLibrary()
                })
        })
        travelersAmulet.setFlavorText("\"The best kind of treasure is the kind that leads to more treasure!\"\n--Captain Lannery Storm")
        return travelersAmulet
    }
    // 185 Arch of Orazca
    static func EvolvingWilds() -> Card {
        let evolvingWilds = Card(name: "Evolving Wilds", rarity: .Common, set: set, number: 186)
        evolvingWilds.setManaCost("")
        evolvingWilds.setType(.Land)
        evolvingWilds.addActivatedAbility(
            string: "{T}, Sacrifice ~: Search your library for a basic land card, put it onto the battlefield tapped, then shuffle your library.",
            cost: Cost.Tap().Sacrifice(),
            effect: { evolvingWilds.getController().chooseCard(
                from: evolvingWilds.getController().getLibrary(),
                restriction: { $0.isBasicLand() },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield(tapped: true)
                    evolvingWilds.getController().shuffleLibrary()
            })
        })
        evolvingWilds.setFlavorText("The Sun Empire bends nature--rivers, mountainsides, dinosaurs--to its unyielding will.")
        return evolvingWilds
    }
    static func ForsakenSanctuary() -> Card {
        let forsakenSanctuary = Card(name: "Forsaken Sanctuary", rarity: .Uncommon, set: set, number: 187)
        forsakenSanctuary.setManaCost("")
        forsakenSanctuary.setType(.Land)
        forsakenSanctuary.entersTapped = true
        forsakenSanctuary.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { forsakenSanctuary.getController().addMana(color: .White) },
            manaAbility: true)
        forsakenSanctuary.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { forsakenSanctuary.getController().addMana(color: .Black) },
            manaAbility: true)
        forsakenSanctuary.setFlavorText("In the galleon's grand cathedral, conquistadors swore vows of faith. In its wreckage, they swore vows of revenge.")
        return forsakenSanctuary
    }
    static func FoulOrchard() -> Card {
        let foulOrchard = Card(name: "Foul Orchard", rarity: .Uncommon, set: set, number: 188)
        foulOrchard.setManaCost("")
        foulOrchard.setType(.Land)
        foulOrchard.entersTapped = true
        foulOrchard.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { foulOrchard.getController().addMana(color: .Black) },
            manaAbility: true)
        foulOrchard.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { foulOrchard.getController().addMana(color: .Green) },
            manaAbility: true)
        foulOrchard.setFlavorText("The stench of rotting meat lures flies, goblins, and young raptors.")
        return foulOrchard
    }
    static func HighlandLake() -> Card {
        let highlandLake = Card(name: "Highland Lake", rarity: .Uncommon, set: set, number: 189)
        highlandLake.setManaCost("")
        highlandLake.setType(.Land)
        highlandLake.entersTapped = true
        highlandLake.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { highlandLake.getController().addMana(color: .Blue) },
            manaAbility: true)
        highlandLake.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { highlandLake.getController().addMana(color: .Red) },
            manaAbility: true)
        highlandLake.setFlavorText("\"A place like this makes me wonder if there's more to life than blood and treasure... Nah.\"\n--Boyl Bucksalt, Storm Fleet swab")
        return highlandLake
    }
    static func StoneQuarry() -> Card {
        let stoneQuarry = Card(name: "Stone Quarry", rarity: .Uncommon, set: set, number: 190)
        stoneQuarry.setManaCost("")
        stoneQuarry.setType(.Land)
        stoneQuarry.entersTapped = true
        stoneQuarry.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { stoneQuarry.getController().addMana(color: .Red) },
            manaAbility: true)
        stoneQuarry.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { stoneQuarry.getController().addMana(color: .White) },
            manaAbility: true)
        stoneQuarry.setFlavorText("The Sun Empire's cities are built from the bones of the earth.")
        return stoneQuarry
    }
    static func WoodlandStream() -> Card {
        let woodlandStream = Card(name: "Woodland Stream", rarity: .Uncommon, set: set, number: 191)
        woodlandStream.setManaCost("")
        woodlandStream.setType(.Land)
        woodlandStream.entersTapped = true
        woodlandStream.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { woodlandStream.getController().addMana(color: .Green) },
            manaAbility: true)
        woodlandStream.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { woodlandStream.getController().addMana(color: .Blue) },
            manaAbility: true)
        woodlandStream.setFlavorText("Countless streams flow into the nine rivers, and then nine rivers flow into the Great River. The River Heralds guard them all.")
        return woodlandStream
    }
    // 192 Plains
    // 193 Island
    // 194 Swamp
    // 195 Forest
    // 196 Mountain

    static func RekindlingPhoenixElemental() -> Token {
        let elemental = Token(name: "Elemental", set: set, number: 1)
        elemental.colors = [.Red]
        elemental.setType(.Creature, .Elemental)
        elemental.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getController() === elemental.getOwner() && $0.getName() == "Rekindling Phoenix" },
                    zones: [.Graveyard]),
                effect: { target in
                    elemental.sacrifice()
                    target.putOntoBattlefield()
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.haste = true; return $0 }))
        }))
        elemental.power = 0
        elemental.toughness = 1
        return elemental
    }
    // T2 Elemental (1/1)
    static func Saproling() -> Token {
        let saproling = Token(name: "Saproling", set: set, number: 3)
        saproling.colors = [.Green]
        saproling.setType(.Creature, .Saproling)
        saproling.power = 1
        saproling.toughness = 1
        return saproling
    }
    // T4 Golem
    static func HuatliRadiantChampionEmblem() -> Emblem {
        let huatliEmblem = Emblem(set: set, number: 5)
        huatliEmblem.addTriggeredAbility(
            trigger: .CreatureEntersBattlefieldUnderYourControl,
            effect: { huatliEmblem.getController().drawCard() },
            effectOptional: true)
        return huatliEmblem
    }
    // T6 City's Blessing Marker
}

