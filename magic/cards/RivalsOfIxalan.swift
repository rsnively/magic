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
    
    static private let cards = [
        /* BafflingEnd, BishopOfBinding, BlazingHope, CleansingRay, */ DivineVerdict, /* EverdawnChampion, */ ExultantSkymarcher, /* FamishedPaladin, ForerunnerOfTheLegion, */ ImperialCeratops, /* LegionConquistador, */ LuminousBonds, MajesticHeliopterus, MartyrOfDusk, MomentOfTriumph, /* PaladinOfAtonement, */ PrideOfConquerors, /* RadiantDestiny, */ RaptorCompanion, SanguineGlorifier, SkymarcherAspirant, /* SlaughterTheStrong, */ SnubhornSentry, /* SphinxsDecree, */ SquiresDevotion, SunSentinel, SunCrestedPterodon, /* TempleAltisaur, TrapjawTyrant, ZetalpaPrimalDawn, AdmiralsOrder, AcquaticIncursion, CraftyCutpurse, CrashingTide, CuriousObsession, DeadeyeRigHauler, ExpelFromOrazca, FloodOfRecollection, Hornswoggle, InducedAmnesia, */ KitesailCorsair, KumenasAwakening, MistCloakedHerald, /* Negate, NezahalThePrimalTide, ReleaseToTheWind, RiverDarter, RiverwiseAugur, */ SailorOfMeans, SeaLegs, /* SeafloorOracle, */ SecretsOfTheGoldenCity, /* SilvergillAdept, SirenReaver, SlipperyScoundrel, SoulOfTheRapids, */ SpireWinder, SwornGuardian, /* TimestreamNavigator, WarkiteMarauder, Waterknot, */ ArterialFlow, CanalMonitor, ChampionOfDusk, /* DarkInquiry, DeadMansChest, DinosaurHunter, */ DireFleetPoisoner, DuskCharger, DuskLegionZealot, FathomFleetBoarder, /* ForerunnerOfTheCoalition, */ GoldenDemise, GraspingScoundrel, GruesomeFate, Impale, /* MastermindsAcquisition, MausoleumHarpy, */ MomentOfCraving, /* OathswornVampire, PitilessPlunderer, */ RavenousChupacabra, /* ReaverAmbush, Recover, SadisticSkymarcher, TetzimocPrimalDeath, TombRobber, TwilightProphet, */ VampireRevenant, /* VonasHunger, VoraciousVampire, BloodSun, */ Bombard, BrasssBounty, BrazenFreebooter, /* BuccaneersBravado, ChargingTuskodon, DaringBuccaneer, DireFleetDaredevil, EtaliPrimalStorm, */ FanaticalFirebrand, /* ForerunnerOfTheEmpire, */ FormOfTheDinosaur, FrilledDeathspitter, /* GoblinTrailblazer, Mutiny, */ NeedletoothRaptor, OrazcaRaptor, /* PiratesPillage, */ RecklessRage, /* RekindlingPhoenix, SeeRed, */ ShakeTheFoundations, Shatter, /* SilvercladFerocidons, */ StampedingHorncrest, /* StormFleetSwashbuckler, */ SunCollaredRaptor, /* SwaggeringCorsair, */ TilonallisCrown, /* TilonallisSummoner, */ AggressiveUrge, Cacophodon, /* CherishedHatchling, */ ColossalDreadmaw, CrestedHerdcaller, /* DeeprootElite, EnterTheUnknown, ForerunnerOfTheHeralds, GhaltaPrimalHunger, GiltgroveStalker, */ HardyVeteran, HuntTheWeak, JadeBearer, JadecraftArtisan, /* JadelightRanger, JunglebornPioneer, KnightOfTheStampede, */ Naturalize, OrazcaFrillback, OvergrownArmasaur, /* PathOfDiscovery, */ Plummet, /* Polyraptor, */ StrengthOfThePack, /* SwiftWarden, */ TendershootDryad, ThrashingBrontodon, /* ThunderherdMigration, WaywardSwordtooth, WorldShaper, AngrathTheFlameChained, AtzocanSeer, AzorTheLawbringer, DeadeyeBrawler, */ DireFleetNeckbreaker, /* ElendaTheDuskRose, HuatliRadiantChampion, JungleCreeper, KumenaTyrantOfOrazca, */ LegionLieutenant, MerfolkMistbinder, /* ProteanRaider, */ RagingRegisaur, /* RelentlessRaptor, */ ResplendentGriffin, SiegehornCeratops, StormFleetSprinter, /* ZacamaPrimalCalamity, HadanasClimb, JourneyToEternity, PathToMettle, ProfaneProcession, StormTheVault, AzorsGateway, GoldenGuardian, AwakenedAmalgam, CaptainsHook, */ GleamingBarrier, /* TheImmortalSun, OrazcaRelic, SilentGravestone, */ StriderHarness, /* TravelersAmulet, ArchOfOrazca, EvolvingWilds, ForsakenSanctuary, FoulOrchard, HighlandLake, StoneQuary, WoodlandStream */
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 1 Baffling End
    // 2 Bishop of Binding
    // 3 Blazing Hope
    // 4 Cleansing Ray
    static func DivineVerdict() -> Card {
        let divineVerdict = Card(name: "Divine Verdict", rarity: .Common, set: set, number: 5)
        divineVerdict.setManaCost("3W")
        divineVerdict.setType(.Instant)
        divineVerdict.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking)},
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
            restriction: { $0.isType(.Creature) },
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
                restriction: { return  $0.id != majesticHeliopterus.id && $0.isType(.Dinosaur) },
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
            restriction: { $0.isType(.Creature) },
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
                restriction: { $0.id != sanguineGlorifier.id && $0.isType(.Vampire) && $0.getController() === sanguineGlorifier.getController() },
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
            if object.id == skymarcherAspirant.id {
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
            if object.id == snubhornSentry.id {
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
            restriction: { $0.isType(.Creature) },
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
            if object.id == sunCrestedPterodon.id && !object.getController().getPermanents().filter({ $0.id != object.id && $0.isType(.Dinosaur) }).isEmpty {
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
    // 30 Zetalpa, Primal Dawn
    // 31 Admiral's Order
    // 32 Acquatic Incursion
    // 33 Crafty Cutpurse
    // 34 Crashing Tide
    // 35 Curious Obsession
    // 36 Deadeye Rig-Hauler
    // 37 Expel from Orazca
    // 38 Flood of Recollection
    // 39 Hornswoggle
    // 40 Induced Amnesia
    static func KitesailCorsair() -> Card {
        let kitesailCorsair = Card(name: "Kitesail Corsair", rarity: .Common, set: set, number: 41)
        kitesailCorsair.setManaCost("1U")
        kitesailCorsair.setType(.Creature, .Human, .Pirate)
        kitesailCorsair.addStaticAbility({ object in
            if object.id == kitesailCorsair.id && object.attacking {
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
            if object.id == kumenasAwakening.id {
                object.ascend()
            }
            return object
        })
        kumenasAwakening.addTriggeredAbility(
            trigger: .YourUpkeep,
            effect: {
                kumenasAwakening.getController().drawCard()
                if !kumenasAwakening.getController().citysBlessing {
                    kumenasAwakening.getOpponent().drawCard()
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
    // 44 Negate
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
            restriction: { $0.isType(.Creature) },
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
    // 54 Siren Reaver
    // 55 Slippery Scoundrel
    // 56 Soul of the Rapids
    static func SpireWinder() -> Card {
        let spireWinder = Card(name: "Spire Winder", rarity: .Common, set: set, number: 57)
        spireWinder.setManaCost("3U")
        spireWinder.setType(.Creature, .Snake)
        spireWinder.flying = true
        spireWinder.addStaticAbility({ object in
            if object.id == spireWinder.id {
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
            arterialFlow.getOpponent().discard(2)
            let controlVampire = !arterialFlow.getController().getPermanents().filter({ $0.isType(.Vampire) }).isEmpty
            if controlVampire {
                arterialFlow.getOpponent().loseLife(2)
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
    // 65 Dark Inquiry
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
                restriction: { $0.attacking && $0.isType(.Pirate) && $0.getController() === direFleetPoisoner.getController() },
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
            if object.id == duskCharger.id {
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
            restriction: { fathomFleetBoarder.getController().getPermanents().filter({ $0.id != fathomFleetBoarder.id && $0.isType(.Pirate) }).isEmpty })
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
            goldenDemise.getOpponent().getCreatures().forEach({ $0.pump(-2, -2) })
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
            if object.id == graspingScoundrel.id && object.attacking {
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
            gruesomeFate.getOpponent().loseLife(numCreatures)
        }
        gruesomeFate.setFlavorText("\"You were keen enough to sink your fangs into us, vampire! And now you're afraid of a few little nibbles?\"\nUdvil \"Ratty\" Ratlock")
        return gruesomeFate
    }
    static func Impale() -> Card {
        let impale = Card(name: "Impale", rarity: .Common, set: set, number: 76)
        impale.setManaCost("2BB")
        impale.setType(.Sorcery)
        impale.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
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
            restriction: { $0.isType(.Creature) },
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
                restriction: { return $0.isType(.Creature) && $0.getController() !== ravenousChupacabra.getController() },
                effect: { let _ = $0.destroy() }))
        ravenousChupacabra.setFlavorText("Opening Orazca released more horrors than just the Immortal Sun.")
        ravenousChupacabra.power = 2
        ravenousChupacabra.toughness = 2
        return ravenousChupacabra
    }
    // 83 Reaver Ambush
    // 84 Recover
    // 85 Sadistic Skymarcher
    // 86 Tetzimoc, Primal Death
    // 87 Tomb Robber
    // 88 Twilight Prophet
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
            restriction: { return $0.isType(.Creature) },
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
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: TargetedEffect(
                restriction: TargetedEffect.AnyTarget,
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
                restriction: { $0.isType(.Creature) && $0.getController() !== formOfTheDinosaur.getController() },
                effect: { target in
                    formOfTheDinosaur.damage(to: target, 15)
                    target.damage(to: formOfTheDinosaur.getController(), max(target.getPower(), 0))
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
                restriction: { $0 !== frilledDeathspitter.getController() },
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
                restriction: { $0.isType(.Creature) && $0.getController() !== needletoothRaptor.getController() },
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
            restrictions: [{ $0.isType(.Creature) && $0.getController() !== recklessRage.getController() },
                           { $0.isType(.Creature) && $0.getController() === recklessRage.getController() }],
            effect: { targets in
                recklessRage.damage(to: targets[0], 4)
                recklessRage.damage(to: targets[1], 2)
        }))
        recklessRage.setFlavorText("\"Hard to starboard! Starb--Abandon ship! Abandon ship!\"")
        return recklessRage
    }
    // 111 Rekindling Phoenix
    // 112 See Red
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
            restriction: { return $0.isType(.Artifact) },
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
            if object.id == stampedingHorncrest.id && !object.getController().getPermanents().filter({ $0.id != object.id && $0.isType(.Dinosaur) }).isEmpty {
                object.haste = true
            }
            return object
        })
        stampedingHorncrest.setFlavorText("When the golden city opened, the dinosaurs inside were eager to greet the new visitors.")
        stampedingHorncrest.power = 4
        stampedingHorncrest.toughness = 4
        return stampedingHorncrest
    }
    // 117 Storm Fleet Swashbuckler
    static func SunCollaredRaptor() -> Card {
        let sunCollaredRaptor = Card(name: "Sun-Collared Raptor", rarity: .Common, set: set, number: 118)
        sunCollaredRaptor.setManaCost("1R")
        sunCollaredRaptor.setType(.Creature, .Dinosaur)
        sunCollaredRaptor.trample = true
        sunCollaredRaptor.addActivatedAbility(
            string: "{2}{R}: ~ gets +3/+0 until end of turn.",
            cost: Cost("2R"),
            effect: { sunCollaredRaptor.pump(3, 0) })
        sunCollaredRaptor.setFlavorText("\"With Tilonalli's gifts, even the smallest of us can become great.\"\n--Huatli")
        sunCollaredRaptor.power = 1
        sunCollaredRaptor.toughness = 2
        return sunCollaredRaptor
    }
    // 119 Swaggering Corsair
    static func TilonallisCrown() -> Card {
        let tilonallisCrown = Card(name: "Tilonalli's Crown", rarity: .Common, set: set, number: 120)
        tilonallisCrown.setManaCost("1R")
        tilonallisCrown.setType(.Enchantment, .Aura)
        tilonallisCrown.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
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
            restriction: { $0.isType(.Creature) },
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
                restriction: { $0.isPermanent() },
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
    // 130 Ghalta, Primal Hunger
    // 131 Giltgrove Stalker
    static func HardyVeteran() -> Card {
        let hardyVeteran = Card(name: "Hardy Veteran", rarity: .Common, set: set, number: 132)
        hardyVeteran.setManaCost("1G")
        hardyVeteran.setType(.Creature, .Human, .Warrior)
        hardyVeteran.addStaticAbility({ object in
            if object.id == hardyVeteran.id && hardyVeteran.getController().active {
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
            restrictions: [{ $0.isType(.Creature) && $0.getController() === huntTheWeak.getController() },
                           { $0.isType(.Creature) && $0.getController() !== huntTheWeak.getController() }],
            effect: { targets in
                targets[0].addCounter(.PlusOnePlusOne)
                targets[0].fight(targets[1])
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
                restriction: { $0.id != jadeBearer.id && $0.isType(.Merfolk) && $0.getController() === jadeBearer.getController() },
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
                restriction: { $0.isType(.Creature) },
                effect: { $0.pump(2, 2) }))
        jadecraftArtisan.setFlavorText("\"A blade is not fully forged until it is given.\"")
        jadecraftArtisan.power = 3
        jadecraftArtisan.toughness = 3
        return jadecraftArtisan
    }
    // 136 Jadelight Ranger
    // 137 Jungleborn Pioneer
    // 138 Knight of the Stampede
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 139)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
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
            restriction: { return $0.isType(.Creature) && $0.flying },
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
    // 146 Swift Warden
    static func TendershootDryad() -> Card {
        let tendershootDryad = Card(name: "Tendershoot Dryad", rarity: .Rare, set: set, number: 147)
        tendershootDryad.setManaCost("4G")
        tendershootDryad.setType(.Creature, .Dryad)
        tendershootDryad.addStaticAbility({ object in
            if object.id == tendershootDryad.id {
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
            cost: Cost("1", tap: false, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Artifact) || $0.isType(.Enchantment) },
                effect: { let _ = $0.destroy() }))
        thrashingBrontodon.setFlavorText("It cares more about preserving the herd's territory than about preserving itself.")
        thrashingBrontodon.power = 3
        thrashingBrontodon.toughness = 4
        return thrashingBrontodon
    }
    // 149 Thunderherd Migration
    // 150 Wayward Swordtooth
    // 151 World Shaper
    // 152 Angrath, the Flame-Chained
    // 153 Atzocan Seer
    // 154 Azor, the Lawbringer
    // 155 Deadeye Brawler
    static func DireFleetNeckbreaker() -> Card {
        let direFleetNeckbreaker = Card(name: "Dire Fleet Neckbreaker", rarity: .Uncommon, set: set, number: 156)
        direFleetNeckbreaker.setManaCost("2BR")
        direFleetNeckbreaker.setType(.Creature, .Orc, .Pirate)
        direFleetNeckbreaker.addStaticAbility({ object in
            if object.attacking && object.isType(.Pirate) && object.getController() === direFleetNeckbreaker.getController() {
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
    // 159 Huatli, Radiant Champion
    // 160 Journey to Eternity // Atzal, Cave of Eternity
    // 161 Jungle Creeper
    // 162 Kumena, Tyrant of Orazca
    static func LegionLieutenant() -> Card {
        let legionLieutenant = Card(name: "Legion Lieutenant", rarity: .Uncommon, set: set, number: 163)
        legionLieutenant.setManaCost("WB")
        legionLieutenant.setType(.Creature, .Vampire, .Knight)
        legionLieutenant.addStaticAbility({ object in
            if object.id != legionLieutenant.id && object.isType(.Vampire) && object.getController() === legionLieutenant.getController() {
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
            if object.id != merfolkMistbinder.id && object.isType(.Merfolk) && object.getController() === merfolkMistbinder.getController() {
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
                restriction: TargetedEffect.AnyTarget,
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
            if object.id == resplendentGriffin.id {
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
    // 175 Awakened Amalgam
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
            cost: Cost("1"),
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
    // 184 Traveler's Amulet
    // 185 Arch of Orazca
    // 186 Evolving Wilds
    // 187 Forsaken Sanctuary
    // 188 Foul Orchard
    // 189 Highland Lake
    // 190 Stone Quarry
    // 191 Woodland Stream
    // 192 Plains
    // 193 Island
    // 194 Swamp
    // 195 Forest
    // 196 Mountain
    
    // T1 Elemental (from rekindling phoenix)
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
    // T5 Huatli Emblem
    // T6 City's Blessing Marker
}

