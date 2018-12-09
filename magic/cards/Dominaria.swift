import Foundation

extension Object {
    func isHistoric() -> Bool {
        return isType(.Artifact) || isType(.Legendary) || isType(.Saga)
    }
}

enum DOM {
    static var set = "dom"
    static var count = 269
    
    static let cards = [
        /* KarnScionOfUrza, */ AdamantWill, AvenSentry, /* BairdStewardOfArgive, */ BenalishHonorGuard, BenalishMarshal, BlessedLight, BoardTheWeatherlight, CallTheCavalry, Charge, DAvenantTrapper, /* DanithaCapashenParagon, */ /* DaringArchaeologist, */ /* DauntlessBodyguard, */ /* Dub, */ EvraHalcyonWitness, /* ExcavationElephant, */ /* FallOfTheThran, */ GideonsReproach, /* HealingGrace, */ HistoryOfBenalia, InvokeTheDivine, /* KnightOfGrace, */ KnightOfNewBenalia, KwendePrideOfFemeref, LyraDawnbringer, MesaUnicorn, /* OnSerrasWings, */ PegasusCourser, /* SanctumSpirit, */ /* SealAway, */ /* SergeantAtArms, */ SerraAngel, SerraDisciple, /* ShalaiVoiceOfPlenty, */ /* TesharAncestorsApostle, */ /* TragicPoet, */ TriumphOfGerrard, /* UrzasRuinousBlast, */ /* AcademyDrake, */ /* AcademyJourneymage, */ /* TheAntiquitiesWar, */ ArcaneFlight, /* ArtificersAssistant, */ Befuddle, /* BlinkOfAnEye, */ /* CloudreaderSphinx, */ ColdWaterSnapper, /* CuratorsWard, */ /* DeepFreeze, */ DiligentExcavator, Divination, HomaridExplorer, /* InBolassClutches, */ /* KarnsTemporalSundering, */ /* MerfolkTrickster, */ /* TheMirariConjecture, */ /* NabanDeanOfIteration, */ /* NaruMehaMasterWizard, */ /* Opt, */ /* PrecognitionField, */ /* RelicRunner, */ Rescue, /* SageOfNatLam, */ /* SentinelOfThePearlTrident, */ /* SlinnVodaTheRisingDeep, */ /* Syncopate, */ TempestDjinn, TetsukoUmezawaFugitive, /* TimeOfIce, */ TolarianScholar, /* Unwind, */ /* VodalianArcanist, */ WeightOfMemory, /* WizardsRetort, */ /* ZahidDjiinOfTheLamp, */ BlessingOfBelzenlok, CabalEvangel, CabalPaladin, /* CaligoSkinWitch, */ CastDown, /* ChainersTorment, */ /* DarkBargain, */ DeathbloomThallid, /* DemonicVigor, */ /* DemonlordBelzenlok, */ Divest, DreadShade, DrudgeSentinel, /* TheEldestReborn, */ Eviscerate, FeralAbomination, /* FinalParting, */ FungalInfection, /* JosuVessLichKnight, */ /* KazarovSengirPureblood, */ /* KnightOfMalice, */ /* LichsMastery, */ /* LingeringPhantom, */ /* PhyrexianScriptures, */ RatColony, /* RiteOfBelzenlok, */ /* SettleTheScore, */ /* SoulSalvage, */ /* StrongholdConfessor, */ /* ThallidOmnivore, */ /* ThallidSoothsayer, */ /* TorgaarFamineIncarnate, */ /* UrgorosTheEmptyOne, */ /* ViciousOffering, */ /* WhisperBloodLiturgist, */ WindgraceAcolyte, YargleGluttonOfUrborg, /* YawgmothsVileOffering, */ /* BloodstoneGoblin, */ ChampionOfTheFlame, FerventStrike, /* FieryIntervention, */ /* FightWithFire, */ FireElemental, FirefistAdept, /* TheFirstEruption, */ /* TheFlameOfKeld, */ /* FrenziedRage, */ /* GhituChronicler, */ GhituJourneymage, GhituLavarunner, /* GoblinBarrage, */ GoblinChainwhirler, /* GoblinWarchief, */ /* HaphazardBombardment, */ /* JayaBallard, */ /* JayasImmolatingInferno, */ /* KeldonOverseer, */ /* KeldonRaider, */ KeldonWarcaller, /* OrcishVandal, */ RadiatingLightning, /* RampagingCyclops, */ RunAmok, /* SeismicShift, */ /* ShivanFire, */ /* SiegeGangCommander, */ /* SkirkProspector, */ /* Skizzik, */ /* SqueeTheImmortal, */ /* TwoHeadedGiant, */ /* ValdukKeeperOfTheFlame, */ /* VerixBladewing, */ /* WarcryPhoenix, */ WarlordsFury, /* WizardsLightning, */ /* AdventurousImpulse, */ AncientAnimus, ArborArmament, /* BalothGorger, */ /* BrokenBond, */ /* CorrosiveOoze, */ /* ElfhameDruid, */ /* FungalPlots, */ /* GaeasBlessing, */ /* GaeasProtector, */ /* GiftOfGrowth, */ /* GromFromTheAshes, */ /* GrunnTheLonelyKing, */ /* KamahlsDruidicVow, */ /* KrosanDruid, */ LlanowarElves, LlanowarEnvoy, LlanowarScout, MammothSpider, /* MarwynTheNurturer, */ TheMendingOfDominaria, /* MultaniYavimayasAvatar, */ /* NaturesSpiral, */ PierceTheSky, PrimordialWurm, /* SaprolingMigration, */ /* SongOfFreyalise, */ SporeSwarm, SporecrownThallid, /* SteelLeafChampion, */ /* SylvanAwakening, */ /* TerritorialAllosaurus, */ /* ThornElemental, */ /* UntamedKavu, */ VerdantForce, /* WildOnslaught, */ YavimayaSapherd, AdelizTheCinderWind, ArvadTheCursed, /* AryelKnightOfWindgrace, */ /* DarigaazReincarnated, */ /* GarnaTheBloodflame, */ /* GrandWarlordRadha, */ /* HallarTheFirefletcher, */ JhoiraWeatherlightCaptain, /* JodahArchmageEternal, */ /* MuldrothaTheGravetide, */ /* OathOfTeferi, */ /* PrimevalsGloriousRebirth, */ /* RaffCapashenShipsMage, */ /* RonaDiscipleOfGix, */ /* ShannaSisaysLegacy, */ /* SlimefootTheStowaway, */ TatyovaBenthicDruid, /* TeferiHeroOfDominaria, */ /* TianaShipsCaretaker, */ AesthirGlider, AmaranthineWall, BlackbladeReforged, BloodtallowCandle, /* DampingSphere, */ /* ForebearsBlade, */ GildedLotus, /* GuardiansOfKoilos, */ /* HelmOfTheHost, */ HowlingGolem, IcyManipulator, /* JhoirasFamiliar, */ JoustingLance, /* Juggernaut, */ /* MishrasSelfReplicator, */ /* MoxAmber, */ /* NavigatorsCompass, */ PardicWanderer, PowerstoneShard, /* ShieldOfTheRealm, */ ShortSword, SkitteringSurveyor, /* SorcerersWand, */ SparringConstruct, ThranTemporalGateway, /* TraxosScourgeOfKroog, */ /* UrzasTome, */ VoltaicServant, /* Weatherlight, */ CabalStronghold, ClifftopRetreat, HinterlandHarbor, IsolatedChapel, /* MemorialToFolly, */ MemorialToGenius, MemorialToGlory, MemorialToUnity, MemorialToWar, SulfurFalls, WoodlandCemetery, /* ZhalfirinVoid, */
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

    // 1 Karn, Scion of Urza
    static func AdamantWill() -> Card {
        let adamantWill = Card(name: "Adamant Will", rarity: .Common, set: set, number: 2)
        adamantWill.setManaCost("1W")
        adamantWill.setType(.Instant)
        adamantWill.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.pump(2, 2)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.indestructible = true
                    return object
                }))
        }))
        adamantWill.setFlavorText("The shield took a year to craft, a month to enchant, and a decade to master--all for one glorious moment.")
        return adamantWill
    }
    static func AvenSentry() -> Card {
        let avenSentry = Card(name: "Aven Sentry", rarity: .Common, set: set, number: 3)
        avenSentry.setManaCost("3W")
        avenSentry.setType(.Creature, .Bird, .Soldier)
        avenSentry.flying = true
        avenSentry.setFlavorText("\"My flock flew from a distant continent ruined by cataclysm and war. Benalia gave us shelter to end our exodus.\"")
        avenSentry.power = 3
        avenSentry.toughness = 2
        return avenSentry
    }
    // 4 Baird, Steward of Argive
    static func BenalishHonorGuard() -> Card {
        let benalishHonorGuard = Card(name: "Benalish Honor Guard", rarity: .Common, set: set, number: 5)
        benalishHonorGuard.setManaCost("1W")
        benalishHonorGuard.setType(.Creature, .Human, .Knight)
        benalishHonorGuard.addStaticAbility({ object in
            if object == benalishHonorGuard {
                let numLegends = object.getController().getCreatures().filter({ $0.isType(.Legendary) }).count
                object.power = object.getBasePower() + numLegends
            }
            return object
        })
        benalishHonorGuard.setFlavorText("\"The true measure of all heroes is not what they achieve, but who they inspire.\"\n--Triumph of Gerrard")
        benalishHonorGuard.power = 2
        benalishHonorGuard.toughness = 2
        return benalishHonorGuard
    }
    static func BenalishMarshal() -> Card {
        let benalishMarshal = Card(name: "Benalish Marshal", rarity: .Rare, set: set, number: 6)
        benalishMarshal.setManaCost("WWW")
        benalishMarshal.setType(.Creature, .Human, .Knight)
        benalishMarshal.addStaticAbility({ object in
            if object != benalishMarshal && object.isType(.Creature) && object.getController() === benalishMarshal.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        benalishMarshal.setFlavorText("\"Some aspire to climb the mountain of Honor. The Benalish are born upon its peak, and from there ascend among the stars.\"\n--History of Benalia")
        benalishMarshal.power = 3
        benalishMarshal.toughness = 3
        return benalishMarshal
    }
    static func BlessedLight() -> Card {
        let blessedLight = Card(name: "Blessed Light", rarity: .Common, set: set, number: 7)
        blessedLight.setManaCost("4W")
        blessedLight.setType(.Instant)
        blessedLight.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) || $0.isType(.Enchantment) },
            effect: { $0.exile() }))
        blessedLight.setFlavorText("Enchanted by mage-smiths and blessed by priests, Benalish windows let in light and cast out darkness.")
        return blessedLight
    }
    static func BoardTheWeatherlight() -> Card {
        let boardTheWeatherlight = Card(name: "Board the Weatherlight", rarity: .Uncommon, set: set, number: 8)
        boardTheWeatherlight.setManaCost("1W")
        boardTheWeatherlight.setType(.Sorcery)
        boardTheWeatherlight.addEffect({
            boardTheWeatherlight.getController().chooseCard(
                from: Array(boardTheWeatherlight.getController().getLibrary().suffix(5)),
                restriction: { $0.isHistoric() },
                action: { chosenCard, rest in
                    chosenCard?.reveal()
                    chosenCard?.putIntoHand()
                    boardTheWeatherlight.getController().putOnBottomOfLibrary(&rest, random: true)
            })
        })
        boardTheWeatherlight.setFlavorText("A new gathering for a new age.")
        return boardTheWeatherlight
    }
    static func CallTheCavalry() -> Card {
        let callTheCavalry = Card(name: "Call the Cavalry", rarity: .Common, set: set, number: 9)
        callTheCavalry.setManaCost("3W")
        callTheCavalry.setType(.Sorcery)
        callTheCavalry.addEffect {
            callTheCavalry.getController().createToken(Knight())
            callTheCavalry.getController().createToken(Knight())
        }
        callTheCavalry.setFlavorText("Benalish citizens born under the same constellation share a star-clan. Their loyalty to one another interlaces the Seven Houses.")
        return callTheCavalry
    }
    static func Charge() -> Card {
        let charge = Card(name: "Charge", rarity: .Common, set: set, number: 10)
        charge.setManaCost("W")
        charge.setType(.Instant)
        charge.addEffect {
            charge.getController().getCreatures().forEach({ $0.pump(1, 1) })
        }
        charge.setFlavorText("\"Honor rides before us. All we have to do is catch up\"\n--Danitha Capashen")
        return charge
    }
    static func DAvenantTrapper() -> Card {
        let dAvenantTrapper = Card(name: "D'Avenant Trapper", rarity: .Common, set: set, number: 11)
        dAvenantTrapper.setManaCost("2W")
        dAvenantTrapper.setType(.Creature, .Human, .Archer)
        dAvenantTrapper.addTriggeredAbility(
            trigger: .YouCastHistoricSpell,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() !== dAvenantTrapper.getController() },
                effect: { $0.tap() }))
        dAvenantTrapper.setFlavorText("\"Go swiftly, clever arrows, and teach\nThe philosophy of stillness.\"\n--D'Avenant verse")
        dAvenantTrapper.power = 3
        dAvenantTrapper.toughness = 2
        return dAvenantTrapper
    }
    // 12 Danitha Capashen, Pargaon
    // 13 Daring Archaeologist
    // 14 Dauntless Bodygyard
    // 15 Dub
    static func EvraHalcyonWitness() -> Card {
        let evra = Card(name: "Evra, Halcyon Witness", rarity: .Rare, set: set, number: 16)
        evra.setManaCost("4WW")
        evra.setType(.Legendary, .Creature, .Avatar)
        evra.lifelink = true
        evra.addActivatedAbility(
            string: "{4}: Exchange your life total with ~'s power.",
            cost: Cost.Mana("4"),
            effect: {
                let temp = evra.getController().getLife()
                evra.getController().setLife(evra.getPower())
                // TODO: Since we're setting base power, it doesn't currently display on card
                evra.power = temp
        })
        evra.setFlavorText("\"Light from the Null Moon took form--a mirage made real, alone in grandeur, isolated in a world that once had been its own.\"\n--Fall of the Thran")
        evra.power = 4
        evra.toughness = 4
        return evra
    }
    // 17 Excavation Elephant
    // 18 Fall of the Thran
    static func GideonsReproach() -> Card {
        let gideonsReproach = Card(name: "Gideon's Reproach", rarity: .Common, set: set, number: 19)
        gideonsReproach.setManaCost("1W")
        gideonsReproach.setType(.Instant)
        gideonsReproach.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && ($0.isAttacking || $0.blocking) },
            effect: { target in gideonsReproach.damage(to: target, 4) }))
        gideonsReproach.setFlavorText("On Amonkhet, Gideon lost both his sural and his faith in himself. But he can still throw a punch, and he still knows a bad guy when he sees one.")
        return gideonsReproach
    }
    // 20 Healing Grace
    static func HistoryOfBenalia() -> Card {
        let historyOfBenalia = Card(name: "History of Benalia", rarity: .Mythic, set: set, number: 21)
        historyOfBenalia.setManaCost("1WW")
        historyOfBenalia.setType(.Enchantment, .Saga)
        Saga(historyOfBenalia)
        historyOfBenalia.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: {
                let loreCounters = historyOfBenalia.getCounters(.Lore)
                if loreCounters == 1 || loreCounters == 2 {
                    historyOfBenalia.getController().createToken(Knight())
                }
                else if loreCounters == 3 {
                    historyOfBenalia.getController().getCreatures().filter({ $0.isType(.Knight) }).forEach({ $0.pump(2, 1) })
                }

                if loreCounters >= 3 {
                    historyOfBenalia.sacrifice()
                }
        })
        return historyOfBenalia
    }
    static func InvokeTheDivine() -> Card {
        let invokeTheDivine = Card(name: "Invoke the Divine", rarity: .Common, set: set, number: 22)
        invokeTheDivine.setManaCost("2W")
        invokeTheDivine.setType(.Instant)
        invokeTheDivine.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in
                let _ = target.destroy()
                invokeTheDivine.getController().gainLife(4)
            }))
        invokeTheDivine.setFlavorText("\"Let go of all that harms you. Cast your burdens into the darkness, and build for the faithful a house of light.\"\n--<i>Song of All</i>, canto 1008")
        return invokeTheDivine
    }
    // 23 Knight of Grace
    static func KnightOfNewBenalia() -> Card {
        let knightOfNewBenalia = Card(name: "Knight of New Benalia", rarity: .Common, set: set, number: 24)
        knightOfNewBenalia.setManaCost("1W")
        knightOfNewBenalia.setType(.Creature, .Human, .Knight)
        knightOfNewBenalia.setFlavorText("The mage-smiths of New Benalia have perfected the art of blending fine steel and enchanted glass into weapons that are both beautiful and deadly. Only elite knights are entrusted with these martial works of art.")
        knightOfNewBenalia.power = 3
        knightOfNewBenalia.toughness = 1
        return knightOfNewBenalia
    }
    static func KwendePrideOfFemeref() -> Card {
        let kwende = Card(name: "Kwende, Pride of Femeref", rarity: .Uncommon, set: set, number: 25)
        kwende.setManaCost("3W")
        kwende.setType(.Legendary, .Creature, .Human, .Knight)
        kwende.doubleStrike = true
        kwende.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === kwende.getController() && object.firstStrike {
                object.doubleStrike = true
            }
            return object
        })
        kwende.setFlavorText("Descendant of a vanished land, student of a forgotten general, and master of blades no smith could forge anew. He honors them all by living a life worthy of song.")
        kwende.power = 2
        kwende.toughness = 2
        return kwende
    }
    static func LyraDawnbringer() -> Card {
        let lyra = Card(name: "Lyra Dawnbringer", rarity: .Mythic, set: set, number: 26)
        lyra.setManaCost("3WW")
        lyra.setType(.Legendary, .Creature, .Angel)
        lyra.flying = true
        lyra.firstStrike = true
        lyra.lifelink = true
        lyra.addStaticAbility({ object in
            if object != lyra && object.isType(.Angel) && object.getController() === lyra.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                // TODO: Layers
                object.lifelink = true
            }
            return object
        })
        lyra.setFlavorText("\"You are not alone. You never were.\"")
        lyra.power = 5
        lyra.toughness = 5
        return lyra
    }
    static func MesaUnicorn() -> Card {
        let mesaUnicorn = Card(name: "Mesa Unicorn", rarity: .Common, set: set, number: 27)
        mesaUnicorn.setManaCost("1W")
        mesaUnicorn.setType(.Creature, .Unicorn)
        mesaUnicorn.lifelink = true
        mesaUnicorn.setFlavorText("The unicorns of Sursi are a manifestation of Serra's joy and compassion. They frolic and dance like children, offering blessings to anyone they encounter.")
        mesaUnicorn.power = 2
        mesaUnicorn.toughness = 2
        return mesaUnicorn
    }
    // 28 On Serra's Wings
    static func PegasusCourser() -> Card {
        let pegasusCourser = Card(name: "Pegasus Couser", rarity: .Common, set: set, number: 29)
        pegasusCourser.setManaCost("2W")
        pegasusCourser.setType(.Creature, .Pegasus)
        pegasusCourser.flying = true
        pegasusCourser.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isAttacking && $0.isType(.Creature) && $0 != pegasusCourser },
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
    // 30 Sanctum Spirit
    // 31 Seal Away
    // 32 Sergeant-at-Arms
    static func SerraAngel() -> Card {
        let serraAngel = Card(name: "Serra Angel", rarity: .Uncommon, set: set, number: 33)
        serraAngel.setManaCost("3WW")
        serraAngel.setType(.Creature, .Angel)
        serraAngel.flying = true
        serraAngel.vigilance = true
        serraAngel.setFlavorText("The angel remembers her past lives like dreams. Her song held up meadows. Her blade drove back darkness. Her wings carried her across the ages.")
        serraAngel.power = 4
        serraAngel.toughness = 4
        return serraAngel
    }
    static func SerraDisciple() -> Card {
        let serraDisciple = Card(name: "Serra Disciple", rarity: .Common, set: set, number: 34)
        serraDisciple.setManaCost("1W")
        serraDisciple.setType(.Creature, .Bird, .Cleric)
        serraDisciple.flying = true
        serraDisciple.firstStrike = true
        serraDisciple.addTriggeredAbility(
            trigger: .YouCastHistoricSpell,
            effect: { serraDisciple.pump(1, 1) })
        serraDisciple.setFlavorText("Theologians new believe the Ancestor was another divine form of Serra.")
        serraDisciple.power = 1
        serraDisciple.toughness = 1
        return serraDisciple
    }
    // 35 Shalai, Voice of Plenty
    // 36 Teshar, Ancestor's Apostle
    // 37 Tragic Poet
    static func TriumphOfGerrard() -> Card {
        let triumphOfGerrard = Card(name: "Triumph of Gerrard", rarity: .Uncommon, set: set, number: 38)
        triumphOfGerrard.setManaCost("1W")
        triumphOfGerrard.setType(.Enchantment, .Saga)
        Saga(triumphOfGerrard)
        triumphOfGerrard.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: TargetedEffect.SingleObject(
                restriction: { potentialTarget in
                    let greatestPower = triumphOfGerrard.getController().getCreatures().map({ return $0.getPower() }).max() ?? 0
                    return potentialTarget.isType(.Creature) && potentialTarget.getPower() == greatestPower
            }, effect: { target in
                let loreCounters = triumphOfGerrard.getCounters(.Lore)
                if loreCounters == 1 || loreCounters == 2 {
                    target.addCounter(.PlusOnePlusOne)
                }
                else if loreCounters == 3 {
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                        object.flying = true
                        object.firstStrike = true
                        object.lifelink = true
                        return object
                    }))
                }
                
                if loreCounters >= 3 {
                    triumphOfGerrard.sacrifice()
                }
            }))
        return triumphOfGerrard
    }
    // 39 Urza's Ruinous Blast
    // 40 Academy Drake
    // 41 Academy Journeymage
    // 42 The Antiquities War
    static func ArcaneFlight() -> Card {
        let arcaneFlight = Card(name: "Arcane Flight", rarity: .Common, set: set, number: 43)
        arcaneFlight.setManaCost("U")
        arcaneFlight.setType(.Enchantment, .Aura)
        arcaneFlight.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                // TODO: Layers
                object.flying = true
                return object
        })
        arcaneFlight.setFlavorText("The Tolarian Academies are known for their magical research, powerful sorcerers, and accidental destruction of ecosystems.")
        return arcaneFlight
    }
    // 44 Artificer's Assistant
    static func Befuddle() -> Card {
        let befuddle = Card(name: "Befuddle", rarity: .Common, set: set, number: 45)
        befuddle.setManaCost("2U")
        befuddle.setType(.Instant)
        befuddle.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.pump(-4, 0)
                befuddle.getController().drawCard()
        }))
        befuddle.setFlavorText("\"The trick to talking sense into Keldons is getting them to hold still. I learned that from Radha.\"\n--Jhoira")
        return befuddle
    }
    // 46 Blink of an Eye
    // 47 Cloudreader Sphinx
    static func ColdWaterSnapper() -> Card {
        let coldWaterSnapper = Card(name: "Cold-Water Snapper", rarity: .Common, set: set, number: 48)
        coldWaterSnapper.setManaCost("4U")
        coldWaterSnapper.setType(.Creature, .Turtle)
        coldWaterSnapper.hexproof = true
        coldWaterSnapper.setFlavorText("For generations, the inhabitants of Orvada have hungered for turtle soup. For generations, the turtles have frustrated their ambitions.")
        coldWaterSnapper.power = 4
        coldWaterSnapper.toughness = 5
        return coldWaterSnapper
    }
    // 49 Curator's Ward
    // 50 Deep Freeze
    static func DiligentExcavator() -> Card {
        let diligentExcavator = Card(name: "Diligent Excavator", rarity: .Uncommon, set: set, number: 51)
        diligentExcavator.setManaCost("1U")
        diligentExcavator.setType(.Creature, .Human, .Artificer)
        diligentExcavator.addTriggeredAbility(
            trigger: .YouCastHistoricSpell,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetedEffect.AnyPlayer,
                effect: { $0.mill(2) }))
        diligentExcavator.setFlavorText("Archaeologists don't just dig in the dirt. The excavate time, scraping off the years grain by grain.")
        diligentExcavator.power = 1
        diligentExcavator.toughness = 3
        return diligentExcavator
    }
    static func Divination() -> Card {
        let divination = Card(name: "Divination", rarity: .Common, set: set, number: 52)
        divination.setManaCost("2U")
        divination.setType(.Sorcery)
        divination.addEffect {
            divination.getController().drawCards(2)
        }
        divination.setFlavorText("\"Half your studies will be learning the laws of magic. The other half will be bending them.\"\n--Naru Meha, master wizard.")
        return divination
    }
    static func HomaridExplorer() -> Card {
        let homaridExplorer = Card(name: "Homarid Explorer", rarity: .Common, set: set, number: 53)
        homaridExplorer.setManaCost("3U")
        homaridExplorer.setType(.Creature, .Homarid, .Scout)
        homaridExplorer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetedEffect.AnyPlayer,
                effect: { $0.mill(4) }))
        homaridExplorer.setFlavorText("\"Homarids spread northward from Sarpadia as the climate cooled, raiding coastal settlements for supplies.\"\n--Time of Ice")
        homaridExplorer.power = 3
        homaridExplorer.toughness = 3
        return homaridExplorer
    }
    // 54 In Bolas's Clutches
    // 55 Karn's Temporal Sundering
    // 56 Merfolk Trickster
    // 57 The Mirari Conjecture
    // 58 Naban, Dean of Iteration
    // 59 Naru Meha, Master Wizard
    // 60 Opt
    // 61 Precognition Field
    // 62 Relic Runner
    static func Rescue() -> Card {
        let rescue = Card(name: "Rescue", rarity: .Common, set: set, number: 63)
        rescue.setManaCost("U")
        rescue.setType(.Instant)
        rescue.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.getController() === rescue.getController() },
            effect: { target in target.bounce() }))
        rescue.setFlavorText("With just a few seconds to escape, Deryan saved Hurkyl's editions on restoring physical objects from ash.")
        return rescue
    }
    // 64 Sage of Lat-Nam
    // 65 Sentinel of the Pearl Trident
    // 66 Slinn Voda, the Rising Deep
    // 67 Syncopate
    static func TempestDjinn() -> Card {
        let tempestDjinn = Card(name: "Tempest Djinn", rarity: .Rare, set: set, number: 68)
        tempestDjinn.setManaCost("UUU")
        tempestDjinn.setType(.Creature, .Djinn)
        tempestDjinn.flying = true
        tempestDjinn.addStaticAbility({ object in
            if object == tempestDjinn {
                let numIslands = object.getController().getPermanents().filter({ $0.isType(.Basic) && $0.isType(.Island) }).count
                object.power = object.getBasePower() + numIslands
            }
            return object
        })
        tempestDjinn.setFlavorText("The first to arrive on Dominaria from their distant home, the marids are the oldest tribe of djinn and the most respected by storm and sea.")
        tempestDjinn.power = 0
        tempestDjinn.toughness = 4
        return tempestDjinn
    }
    static func TetsukoUmezawaFugitive() -> Card {
        let tetsuko = Card(name: "Tetsuke Umezawa, Fugitive", rarity: .Uncommon, set: set, number: 69)
        tetsuko.setManaCost("1U")
        tetsuko.setType(.Legendary, .Creature, .Human, .Rogue)
        tetsuko.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === tetsuko.getController() && object.getPower() <= 1 {
                object.unblockable = true
            }
            return object
        })
        tetsuko.setFlavorText("\"My ancestor Toshiro used to say, 'Life is a series of choices between bad and worse.' I'm a master of making great bad choices.\"")
        tetsuko.power = 1
        tetsuko.toughness = 3
        return tetsuko
    }
    // 70 Time of Ice
    static func TolarianScholar() -> Card {
        let tolarianScholar = Card(name: "Tolarian Scholar", rarity: .Common, set: set, number: 71)
        tolarianScholar.setManaCost("2U")
        tolarianScholar.setType(.Creature, .Human, .Wizard)
        tolarianScholar.setFlavorText("The Tolarian Academies embrace a tradition of study and research while discouraging the kinds of experiments that ruined the original island of Tolaria.")
        tolarianScholar.power = 2
        tolarianScholar.toughness = 3
        return tolarianScholar
    }
    // 72 Unwind
    // 73 Vodalian Arcanist
    static func WeightOfMemory() -> Card {
        let weightOfMemory = Card(name: "Weight of Memory", rarity: .Uncommon, set: set, number: 74)
        weightOfMemory.setManaCost("3UU")
        weightOfMemory.setType(.Sorcery)
        weightOfMemory.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { target in
                weightOfMemory.getController().drawCards(3)
                target.mill(3)
        }))
        weightOfMemory.setFlavorText("In lives that have stretched for centuries, there are bound to be a few awkward silences.")
        return weightOfMemory
    }
    // 75 Wizard's Retort
    // 76 Zahid, Djinn of the Lamp
    static func BlessingOfBelzenlok() -> Card {
        let blessingOfBelzenlok = Card(name: "Blessing of Belzenlok", rarity: .Common, set: set, number: 77)
        blessingOfBelzenlok.setManaCost("B")
        blessingOfBelzenlok.setType(.Instant)
        blessingOfBelzenlok.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(2, 1)
                if target.isType(.Legendary) {
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0 }))
                }
        }))
        blessingOfBelzenlok.setFlavorText("\"My heart is not mine, it is Belzenlok's. All hearts are his, and all blood.\"\n--\"Rite of Belzenlok\"")
        return blessingOfBelzenlok
    }
    static func CabalEvangel() -> Card {
        let cabalEvangel = Card(name: "Cabal Evangel", rarity: .Common, set: set, number: 78)
        cabalEvangel.setManaCost("2B")
        cabalEvangel.setType(.Creature, .Human, .Cleric)
        cabalEvangel.setFlavorText("\"All hail the Demonlord Belzenlok, Evincar of the Stronghold, Scion of Darkness, Doom of Fools, Lord of the Wastes, Master of the Ebon Hand, Eternal Patriarch of the Cabal...\"")
        cabalEvangel.power = 2
        cabalEvangel.toughness = 2
        return cabalEvangel
    }
    static func CabalPaladin() -> Card {
        let cabalPaladin = Card(name: "Cabal Paladin", rarity: .Common, set: set, number: 77)
        cabalPaladin.setManaCost("3B")
        cabalPaladin.setType(.Creature, .Human, .Knight)
        cabalPaladin.addTriggeredAbility(
            trigger: .YouCastHistoricSpell,
            effect: { cabalPaladin.damage(to: cabalPaladin.getOpponent(), 2) })
        cabalPaladin.setFlavorText("\"The Demonlord has ruled every age. Every ruin, myth, and nightmare proves his power.\"\n--\"Rite of Belzenlok\"")
        cabalPaladin.power = 4
        cabalPaladin.toughness = 2
        return cabalPaladin
    }
    // 80 Caligo Skin-Witch
    static func CastDown() -> Card {
        let castDown = Card(name: "Cast Down", rarity: .Uncommon, set: set, number: 81)
        castDown.setManaCost("1B")
        castDown.setType(.Instant)
        castDown.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && !$0.isType(.Legendary) },
            effect: { target in let _ = target.destroy() }))
        castDown.setFlavorText("\"Your life is finished, your name lost, and your work forgotten. It is as though Mazeura never existed.\"\n--Chainer's Torment")
        return castDown
    }
    // 82 Chainer's Torment
    // 83 Dark Bargain
    static func DeathbloomThallid() -> Card {
        let deathbloomThallid = Card(name: "Deathbloom Thallid", rarity: .Common, set: set, number: 84)
        deathbloomThallid.setManaCost("2B")
        deathbloomThallid.setType(.Creature, .Fungus)
        deathbloomThallid.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { deathbloomThallid.getController().createToken(Saproling()) })
        deathbloomThallid.setFlavorText("\"Nature is not always gentle or kind, but all life begets life.\"\n--Marwyn of Llanowar")
        deathbloomThallid.power = 3
        deathbloomThallid.toughness = 2
        return deathbloomThallid
    }
    // 85 Demonic Vigor
    static func DemonlordBelzenlok() -> Card {
        let demonlordBelzenlok = Card(name: "Demonlord Belzenlok", rarity: .Mythic, set: set, number: 86)
        demonlordBelzenlok.setManaCost("4BB")
        demonlordBelzenlok.setType(.Legendary, .Creature, .Elder, .Demon)
        demonlordBelzenlok.flying = true
        demonlordBelzenlok.trample = true
        demonlordBelzenlok.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                var cardsPutIntoHand = 0
                for card in demonlordBelzenlok.getController().getLibrary() {
                    card.exile()
                    if !card.isType(.Land) {
                        card.putIntoHand()
                        cardsPutIntoHand += 1
                        if card.getConvertedManaCost() < 4 {
                            break
                        }
                    }
                }
                demonlordBelzenlok.damage(to: demonlordBelzenlok.getController(), cardsPutIntoHand)
        })
        demonlordBelzenlok.power = 6
        demonlordBelzenlok.toughness = 6
        return demonlordBelzenlok
    }
    static func Divest() -> Card {
        let divest = Card(name: "Divest", rarity: .Common, set: set, number: 87)
        divest.setManaCost("B")
        divest.setType(.Sorcery)
        divest.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { target in
                divest.getController().chooseCard(
                    from: target.getHand(),
                    restriction: { $0.isType(.Artifact) || $0.isType(.Creature) },
                    action: { chosen, rest in chosen?.discard() })
        }))
        divest.setFlavorText("Flittersprites collect unusually valuable things: coins of fallen empires, baby teeth, and memories of treasured names.")
        return divest
    }
    static func DreadShade() -> Card {
        let dreadShade = Card(name: "Dread Shade", rarity: .Rare, set: set, number: 88)
        dreadShade.setManaCost("BBB")
        dreadShade.setType(.Creature, .Shade)
        dreadShade.addActivatedAbility(
            string: "{B}: ~ gets +1/+1 until end of turn.",
            cost: Cost.Mana("B"),
            effect: { dreadShade.pump(1, 1) })
        dreadShade.setFlavorText("\"The forest surrounding the Vess estate became the Caligo Morass, a vast bog stalked by horrors too terrible to name.\"\n--\"The Fall of the House of Vess\"")
        dreadShade.power = 3
        dreadShade.toughness = 3
        return dreadShade
    }
    static func DrudgeSentinel() -> Card {
        let drudgeSentinel = Card(name: "Drudge Sentinel", rarity: .Common, set: set, number: 89)
        drudgeSentinel.setManaCost("2B")
        drudgeSentinel.setType(.Creature, .Skeleton, .Warrior)
        drudgeSentinel.addActivatedAbility(
            string: "{3}: Tap ~. It gains indestructible until end of turn.",
            cost: Cost.Mana("3"),
            effect: {
                drudgeSentinel.tap()
                drudgeSentinel.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.indestructible = true; return $0 }))
        })
        drudgeSentinel.setFlavorText("The Cabal assured the Seven Houses that hostages receive all the food and rest they require.")
        drudgeSentinel.power = 2
        drudgeSentinel.toughness = 1
        return drudgeSentinel
    }
    // 90 The Eldest Reborn
    static func Eviscerate() -> Card {
        let eviscerate = Card(name: "Eviscerate", rarity: .Common, set: set, number: 91)
        eviscerate.setManaCost("3B")
        eviscerate.setType(.Sorcery)
        eviscerate.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in let _ = target.destroy() }))
        eviscerate.setFlavorText("\"Fear the dark if you must, but don't mistake sunlight for safety.\"\n--Josu Vess")
        return eviscerate
    }
    static func FeralAbomination() -> Card {
        let feralAbomination = Card(name: "Feral Abomination", rarity: .Common, set: set, number: 92)
        feralAbomination.setManaCost("5B")
        feralAbomination.setType(.Creature, .Thrull)
        feralAbomination.deathtouch = true
        feralAbomination.setFlavorText("\"Urborg used to be lovely--scenic volcanoes, respectable lich lords. Since the Cabal came with their nightmares and thurlls, it's all gone to the worms.\"\n--Mister Lostspoons, Skulltown gossip")
        feralAbomination.power = 5
        feralAbomination.toughness = 5
        return feralAbomination
    }
    // 93 Final Parting
    static func FungalInfection() -> Card {
        let fungalInfection = Card(name: "Fungal Infection", rarity: .Common, set: set, number: 94)
        fungalInfection.setManaCost("B")
        fungalInfection.setType(.Instant)
        fungalInfection.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.pump(-1, -1)
                fungalInfection.getController().createToken(Saproling())
        }))
        fungalInfection.setFlavorText("To thallids, the whole world is just a pile of mulch to grow saprolings in.")
        return fungalInfection
    }
    // 95 Josu Vess, Lich Knight
    // 96 Kazarov, Sengir Pureblood
    // 97 Knight of Malice
    // 98 Lich's Mastery
    // 99 Lingering Phantom
    // 100 Phyrexian Scriptures
    static func RatColony() -> Card {
        let ratColony = Card(name: "Rat Colony", rarity: .Common, set: set, number: 101)
        ratColony.setManaCost("1B")
        ratColony.setType(.Creature, .Rat)
        ratColony.addStaticAbility({ object in
            if object == ratColony {
                let numOtherRats = object.getController().getPermanents().filter({ $0 != object && $0.isType(.Rat) }).count
                object.power = object.getBasePower() + numOtherRats
            }
            return object
        })
        // TODO: deckbuilding restriction ability
        ratColony.setFlavorText("Wreckage from the Phyrexian Invasion provided the rats with a seemingly unlimited number of breeding grounds.")
        ratColony.power = 2
        ratColony.toughness = 1
        return ratColony
    }
    // 102 Rite of Belzenlok
    // 103 Settle the Score
    // 104 Soul Salvage
    // 105 Stronghold Confessor
    // 106 Thallid Omnivore
    // 107 Thallid Soothsayer
    // 108 Torgaar, Famine Incarnate
    // 109 Urgoros, the Empty One
    // 110 Vicious Offering
    // 111 Whisper, Blood Liturgist
    static func WindgraceAcolyte() -> Card {
        let windgraceAcolyte = Card(name: "Windgrace Acolyte", rarity: .Common, set: set, number: 112)
        windgraceAcolyte.setManaCost("4B")
        windgraceAcolyte.setType(.Creature, .Cat, .Warrior)
        windgraceAcolyte.flying = true
        windgraceAcolyte.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                windgraceAcolyte.getController().mill(3)
                windgraceAcolyte.getController().gainLife(3)
        })
        windgraceAcolyte.setFlavorText("Acolytes of the lost Lord Windgrace fight to keep Urborg relics out of Cabal hands.")
        windgraceAcolyte.power = 3
        windgraceAcolyte.toughness = 2
        return windgraceAcolyte
    }
    static func YargleGluttonOfUrborg() -> Card {
        let yargle = Card(name: "Yargle, Glutton of Urborg", rarity: .Uncommon, set: set, number: 113)
        yargle.setManaCost("4B")
        yargle.setType(.Legendary, .Creature, .Frog, .Spirit)
        yargle.setFlavorText("When Belzenlok's lieutenant Yar-Kul grew too ambitious, the Demonlord transformed him into a maggot. The frog that ate the maggot grew and grew, until a ravneous spirit burst from its body.")
        yargle.power = 9
        yargle.toughness = 3
        return yargle
    }
    // 114 Yawgmoth's Vile Offering
    // 115 Bloodstone Goblin
    static func ChampionOfTheFlame() -> Card {
        let championOfTheFlame = Card(name: "Champion of the Flame", rarity: .Uncommon, set: set, number: 116)
        championOfTheFlame.setManaCost("1R")
        championOfTheFlame.setType(.Creature, .Human, .Warrior)
        championOfTheFlame.trample = true
        championOfTheFlame.addStaticAbility({ object in
            if object == championOfTheFlame {
                let numAttachments = object.getController().getPermanents().filter({ ($0.isType(.Aura) || $0.isType(.Equipment)) && $0.isAttachedTo(object) }).count
                let bonus = numAttachments * 2
                object.power = object.getBasePower() + bonus
                object.toughness = object.getBaseToughness() + bonus
            }
            return object
        })
        championOfTheFlame.setFlavorText("Grand Warlord Radha's challengers are always defeated, but she rewards the most passionate with the Flame of Keld. After that, they burn for her.")
        championOfTheFlame.power = 1
        championOfTheFlame.toughness = 1
        return championOfTheFlame
    }
    static func FerventStrike() -> Card {
        let ferventStrike = Card(name: "Fervent Strike", rarity: .Common, set: set, number: 117)
        ferventStrike.setManaCost("R")
        ferventStrike.setType(.Instant)
        ferventStrike.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(1, 0)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.firstStrike = true
                    object.haste = true
                    return object
                }))
        }))
        ferventStrike.setFlavorText("\"The flame paints a bright wheel on the sky, then shifts into a stabbing spark. The enemy falls; the smoke of victory rises.\"\n--\"Legends of the Firedancer\"")
        return ferventStrike
    }
    // 118 Fiery Intervention
    // 119 Fight with Fire
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: .Common, set: set, number: 120)
        fireElemental.setManaCost("3RR")
        fireElemental.setType(.Creature, .Elemental)
        fireElemental.setFlavorText("\"The best way to learn from a book on pyromancy is to burn it.\"\n--Jaya Ballard")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    static func FirefistAdept() -> Card {
        let firefistAdept = Card(name: "Firefist Adept", rarity: .Uncommon, set: set, number: 121)
        firefistAdept.setManaCost("4R")
        firefistAdept.setType(.Creature, .Human, .Wizard)
        firefistAdept.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.getController() !== firefistAdept.getController() },
                effect: { target in
                    let numWizards = firefistAdept.getController().getCreatures().filter({ return $0.isType(.Wizard) }).count
                    firefistAdept.damage(to: target, numWizards)
        }))
        firefistAdept.setFlavorText("The versatile \"fiery gauntlet\" is among the first spells young Ghitu mages learn.")
        firefistAdept.power = 3
        firefistAdept.toughness = 2
        return firefistAdept
    }
    // 122 The First Eruption
    // 123 The Flame of Keld
    // 124 Frenzied Rage
    // 125 Ghitu Chronicler
    static func GhituJourneymage() -> Card {
        let ghituJourneymage = Card(name: "Ghitu Journeymage", rarity: .Common, set: set, number: 126)
        ghituJourneymage.setManaCost("2R")
        ghituJourneymage.setType(.Creature, .Human, .Wizard)
        ghituJourneymage.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { ghituJourneymage.damage(to: ghituJourneymage.getOpponent(), 2)},
            restriction: { !ghituJourneymage.getController().getPermanents().filter({ $0.isType(.Wizard) && $0 != ghituJourneymage }).isEmpty })
        ghituJourneymage.setFlavorText("The Ghitu of Shiv are as fierce and uncompromising as their volcanic home.")
        ghituJourneymage.power = 3
        ghituJourneymage.toughness = 2
        return ghituJourneymage
    }
    static func GhituLavarunner() -> Card {
        let ghituLavarunner = Card(name: "Ghitu Lavarunner", rarity: .Common, set: set, number: 127)
        ghituLavarunner.setManaCost("R")
        ghituLavarunner.setType(.Creature, .Human, .Wizard)
        ghituLavarunner.addStaticAbility({ object in
            if object == ghituLavarunner {
                if object.getController().getGraveyard().filter({ $0.isType(.Instant) || $0.isType(.Sorcery) }).count >= 2 {
                    object.power = object.getBasePower() + 1
                    // TODO: Should these be separate effects?
                    object.haste = true
                }
            }
            return object
        })
        ghituLavarunner.setFlavorText("Tolarians teach the theory of pyromancy. The Ghitu prefer applied research.")
        ghituLavarunner.power = 1
        ghituLavarunner.toughness = 2
        return ghituLavarunner
    }
    // 128 Goblin Barrage
    static func GoblinChainwhirler() -> Card {
        let goblinChainwhirler = Card(name: "Goblin Chainwhirler", rarity: .Rare, set: set, number: 129)
        goblinChainwhirler.setManaCost("RRR")
        goblinChainwhirler.setType(.Creature, .Goblin, .Warrior)
        goblinChainwhirler.firstStrike = true
        goblinChainwhirler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                goblinChainwhirler.damage(to: goblinChainwhirler.getOpponent(), 1)
                goblinChainwhirler.getOpponent().getCreatures().forEach({ goblinChainwhirler.damage(to: $0, 1) })
                // TODO: Also planeswalkers (in same call as creatures because might be both)
        })
        goblinChainwhirler.setFlavorText("\"The trick is, once you get moving, don't stop!\"")
        goblinChainwhirler.power = 3
        goblinChainwhirler.toughness = 3
        return goblinChainwhirler
    }
    // 130 Goblin Warchief
    // 131 Haphazard Bombardment
    // 132 Jaya Ballard
    // 133 Jaya's Immolating Inferno
    // 134 Keldon Overseer
    // 135 Keldon Raider
    static func KeldonWarcaller() -> Card {
        let keldonWarcaller = Card(name: "Keldon Warcaller", rarity: .Common, set: set, number: 136)
        keldonWarcaller.setManaCost("1R")
        keldonWarcaller.setType(.Creature, .Human, .Warrior)
        keldonWarcaller.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Saga) && $0.getController() === keldonWarcaller.getController() },
                effect: { $0.addCounter(.Lore) }))
        keldonWarcaller.setFlavorText("\"The Mountain gave the Flame to Kradak to light the furnaces of his people's hearts. The wanderers became Keldons, and he the first warlord.\"\n--\"The Flame of Keld\"")
        keldonWarcaller.power = 2
        keldonWarcaller.toughness = 2
        return keldonWarcaller
    }
    // 137 Orcish Vandal
    static func RadiatingLightning() -> Card {
        let radiatingLightning = Card(name: "Radiating Lightning", rarity: .Common, set: set, number: 138)
        radiatingLightning.setManaCost("3R")
        radiatingLightning.setType(.Instant)
        radiatingLightning.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { target in
                radiatingLightning.damage(to: target, 3)
                target.getCreatures().forEach({ radiatingLightning.damage(to: $0, 1) })
        }))
        radiatingLightning.setFlavorText("As the Cabal legions pushed into Shiv, they learned not to stand so close together.")
        return radiatingLightning
    }
    // 139 Rampaging Cyclops
    static func RunAmok() -> Card {
        let runAmok = Card(name: "Run Amok", rarity: .Common, set: set, number: 140)
        runAmok.setManaCost("1R")
        runAmok.setType(.Instant)
        runAmok.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) && $0.isAttacking },
            effect: { target in
                target.pump(3, 3)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
        }))
        runAmok.setFlavorText("Keld faced an apocalypse to fulfill a dire prophecy. Now Keldons have nothing left to believe in except themselves.")
        return runAmok
    }
    // 141 Seismic Shift
    // 142 Shivan Fire
    // 143 Siege-Gang Commander
    // 144 Skirk Prospector
    // 145 Skizzik
    // 146 Squee the Immortal
    // 147 Two-Headed Giant
    // 148 Valduk, Keeper of the Flame
    // 149 Verix Bladewing
    // 150 Warcry Phoenix
    static func WarlordsFury() -> Card {
        let warlordsFury = Card(name: "Warlord's Fury", rarity: .Common, set: set, number: 151)
        warlordsFury.setManaCost("R")
        warlordsFury.setType(.Sorcery)
        warlordsFury.addEffect({
            warlordsFury.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.firstStrike = true; return $0 }))
            })
            warlordsFury.getController().drawCard()
        })
        warlordsFury.setFlavorText("\"The old ways were for a winter world. We do what's best for us, not for the past. We are Keldons!\"\n--Grand Warlord Radha")
        return warlordsFury
    }
    // 152 Wizard's Lightning
    // 153 Adventurous Impulse
    static func AncientAnimus() -> Card {
        let ancientAnimus = Card(name: "Ancient Animus", rarity: .Common, set: set, number: 154)
        ancientAnimus.setManaCost("1G")
        ancientAnimus.setType(.Instant)
        ancientAnimus.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === ancientAnimus.getController()},
                           { $0.isType(.Creature) && $0.getController() !== ancientAnimus.getController()}],
            effect: { targets in
                if targets[0].isType(.Legendary) {
                    targets[0].addCounter(.PlusOnePlusOne)
                }
                targets[0].fight(targets[1])
        }))
        ancientAnimus.setFlavorText("Multani's mind grasped for consciousness as rage itself rebuilt his body.")
        return ancientAnimus
    }
    static func ArborArmament() -> Card {
        let arborArmament = Card(name: "Arbor Armament", rarity: .Common, set: set, number: 155)
        arborArmament.setManaCost("G")
        arborArmament.setType(.Instant)
        arborArmament.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.addCounter(.PlusOnePlusOne)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.reach = true
                    return object
                }))
        }))
        arborArmament.setFlavorText("\"Llanowar's boughs are ever ready\nTo unleash an autumn of steel leaves.\"\n--\"Song of Freyalise\"")
        return arborArmament
    }
    // 156 Baloth Gorger
    // 157 Broken Bond
    // 158 Corrosive Ooze
    // 159 Elfhame Druid
    // 160 Fungal Plots
    // 161 Gaea's Blessing
    // 162 Gaea's Protector
    // 163 Gift of Growth
    // 164 Grow from the Ashes
    // 165 Grunn, the Lonely King
    // 166 Kamahl's Druidic Vow
    // 167 Krosan Druid
    static func LlanowarElves() -> Card {
        let llanowarElves = Card(name: "Llanowar Elves", rarity: .Common, set: set, number: 168)
        llanowarElves.setManaCost("G")
        llanowarElves.setType(.Creature, .Elf)
        llanowarElves.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { llanowarElves.getController().addMana(color: .Green) },
            manaAbility: true)
        llanowarElves.setFlavorText("As patient and generous as life, as harsh and merciless as nature.")
        llanowarElves.power = 1
        llanowarElves.toughness = 1
        return llanowarElves
    }
    static func LlanowarEnvoy() -> Card {
        let llanowarEnvoy = Card(name: "Llanowar Envoy", rarity: .Common, set: set, number: 169)
        llanowarEnvoy.setManaCost("2G")
        llanowarEnvoy.setType(.Creature, .Elf, .Scout)
        llanowarEnvoy.addActivatedAbility(
            string: "{1}{G}: Add {W}.",
            cost: Cost.Mana("1G"),
            effect: { llanowarEnvoy.getController().addMana(color: .White) })
        llanowarEnvoy.addActivatedAbility(
            string: "{1}{G}: Add {U}.",
            cost: Cost.Mana("1G"),
            effect: { llanowarEnvoy.getController().addMana(color: .Blue) })
        llanowarEnvoy.addActivatedAbility(
            string: "{1}{G}: Add {B}.",
            cost: Cost.Mana("1G"),
            effect: { llanowarEnvoy.getController().addMana(color: .Black) })
        llanowarEnvoy.addActivatedAbility(
            string: "{1}{G}: Add {R}.",
            cost: Cost.Mana("1G"),
            effect: { llanowarEnvoy.getController().addMana(color: .Red) })
        llanowarEnvoy.addActivatedAbility(
            string: "{1}{G}: Add {G}.",
            cost: Cost.Mana("1G"),
            effect: { llanowarEnvoy.getController().addMana(color: .Green) })
        llanowarEnvoy.setFlavorText("\"Cherish this world in honor of the martyrs who saved it. We too must be prepared to give our lives.\"\n--The Mending of Dominaria")
        llanowarEnvoy.power = 3
        llanowarEnvoy.toughness = 2
        return llanowarEnvoy
    }
    static func LlanowarScout() -> Card {
        let llanowarScout = Card(name: "Llanowar Scout", rarity: .Common, set: set, number: 170)
        llanowarScout.setManaCost("1G")
        llanowarScout.setType(.Creature, .Elf, .Scout)
        llanowarScout.addActivatedAbility(
            string: "{T}: You may put a land card from your hand onto the battlefield.",
            cost: Cost.Tap(),
            effect: { llanowarScout.getController().chooseCard(
                from: llanowarScout.getController().getHand(),
                restriction: { $0.isType(.Land) },
                action: { chosen, rest in chosen?.putOntoBattlefield() })
        })
        llanowarScout.setFlavorText("Llanowar elfhames occupy different heights within the great forest. Elves of the Loridalh and Kelfae hames can see neither earth nor sky.")
        llanowarScout.power = 1
        llanowarScout.toughness = 3
        return llanowarScout
    }
    static func MammothSpider() -> Card {
        let mammothSpider = Card(name: "Mammoth Spider", rarity: .Common, set: set, number: 171)
        mammothSpider.setManaCost("4G")
        mammothSpider.setType(.Creature, .Spider)
        mammothSpider.reach = true
        mammothSpider.setFlavorText("Most spiders of Llanowar disdain elvish alliances. No elf has as many beautiful eyes or as many strong arms.")
        mammothSpider.power = 3
        mammothSpider.toughness = 5
        return mammothSpider
    }
    // 172 Marwyn, the Nurturer
    static func TheMendingOfDominaria() -> Card {
        let theMendingOfDominaria = Card(name: "The Mending of Dominaria", rarity: .Rare, set: set, number: 173)
        theMendingOfDominaria.setManaCost("3GG")
        theMendingOfDominaria.setType(.Enchantment, .Saga)
        Saga(theMendingOfDominaria)
        theMendingOfDominaria.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: {
                let loreCounters = theMendingOfDominaria.getCounters(.Lore)
                if loreCounters == 1 || loreCounters == 2 {
                    theMendingOfDominaria.getController().mill(2)
                    theMendingOfDominaria.getController().chooseCard(
                        from: theMendingOfDominaria.getController().getGraveyard(),
                        restriction: { $0.isType(.Creature) },
                        action: { chosen, rest in chosen?.putIntoHand() })
                }
                else if loreCounters == 3 {
                    theMendingOfDominaria.getController().getGraveyard().filter({ $0.isType(.Land) }).forEach({ $0.putOntoBattlefield(tapped: true) })
                    theMendingOfDominaria.getController().shuffleGraveyardIntoLibrary();
                }
                
                if loreCounters >= 3 {
                    theMendingOfDominaria.sacrifice()
                }
        })
        return theMendingOfDominaria
    }
    // 174 Multani, Yavimaya's Avatar
    // 175 Nature's Spiral
    static func PierceTheSky() -> Card {
        let pierceTheSky = Card(name: "Pierce the Sky", rarity: .Common, set: set, number: 176)
        pierceTheSky.setManaCost("1G")
        pierceTheSky.setType(.Instant)
        pierceTheSky.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) && $0.flying },
            effect: { pierceTheSky.damage(to: $0, 7) }))
        pierceTheSky.setFlavorText("Llanowar elves conceal their ballistae in the upper canopy of the forest, ready to clear the skies of any intruder.")
        return pierceTheSky
    }
    static func PrimordialWurm() -> Card {
        let primordialWurm = Card(name: "Primordial Wurm", rarity: .Common, set: set, number: 177)
        primordialWurm.setManaCost("4GG")
        primordialWurm.setType(.Creature, .Wurm)
        primordialWurm.setFlavorText("\"You can hear its tail thrashing from a mile away. Keep in mind that its jaws may already be half a mile closer.\"\nJenson Carthalion, Yavimaya exile")
        primordialWurm.power = 7
        primordialWurm.toughness = 6
        return primordialWurm
    }
    // 178 Saproling Migration
    // 179 Song of Freyalise
    static func SporeSwarm() -> Card {
        let sporeSwarm = Card(name: "Spore Swarm", rarity: .Uncommon, set: set, number: 180)
        sporeSwarm.setManaCost("3G")
        sporeSwarm.setType(.Instant)
        sporeSwarm.addEffect({
            sporeSwarm.getController().createToken(Saproling())
            sporeSwarm.getController().createToken(Saproling())
            sporeSwarm.getController().createToken(Saproling())
        })
        sporeSwarm.setFlavorText("As the irrepressible power of a dormant Multani courses through Yavimaya, the forest passes judgment on travelers and natives alike. Only the fungus prospers.")
        return sporeSwarm
    }
    static func SporecrownThallid() -> Card {
        let sporecrownThallid = Card(name: "Sporecrown Thallid", rarity: .Uncommon, set: set, number: 181)
        sporecrownThallid.setManaCost("1G")
        sporecrownThallid.setType(.Creature, .Fungus)
        sporecrownThallid.addStaticAbility({ object in
            if object != sporecrownThallid && object.isType(.Creature) && object.getController() === sporecrownThallid.getController() && (object.isType(.Fungus) || (object.isType(.Saproling))) {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        sporecrownThallid.setFlavorText("\"The identifying ornamental growths of alpha thallids may be hereditary, or catalyzed by some chemical signal.\"\n--Sarpadian Empires, vol. III")
        sporecrownThallid.power = 2
        sporecrownThallid.toughness = 2
        return sporecrownThallid
    }
    // 182 Steel Leaf Champion
    // 183 Sylvan Awakening
    // 184 Territorial Allosaurus
    // 185 Thorn Elemental
    // 186 Untamed Kavu
    static func VerdantForce() -> Card {
        let verdantForce = Card(name: "Verdant Force", rarity: .Rare, set: set, number: 187)
        verdantForce.setManaCost("5GGG")
        verdantForce.setType(.Creature, .Elemental)
        verdantForce.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { verdantForce.getController().createToken(Saproling()) })
        verdantForce.setFlavorText("The bower shuddered. The stillness broke. The scurf shifted, and a being emerged from the flowers and ferns.")
        verdantForce.power = 7
        verdantForce.toughness = 7
        return verdantForce
    }
    // 188 Wild Onslaught
    static func YavimayaSapherd() -> Card {
        let yavimayaSapherd = Card(name: "Yavimaya Sapherd", rarity: .Common, set: set, number: 189)
        yavimayaSapherd.setManaCost("2G")
        yavimayaSapherd.setType(.Creature, .Fungus)
        yavimayaSapherd.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { yavimayaSapherd.getController().createToken(Saproling()) })
        yavimayaSapherd.setFlavorText("\"When their community grows cluttered, thallids begin a traditional bobbing dance, then trek out in all directions.\"\n--Sarpadian Empires, vol. III")
        yavimayaSapherd.power = 2
        yavimayaSapherd.toughness = 2
        return yavimayaSapherd
    }
    static func AdelizTheCinderWind() -> Card {
        let adeliz = Card(name: "Adeliz, the Cinder Wind", rarity: .Uncommon, set: set, number: 190)
        adeliz.setManaCost("1UR")
        adeliz.setType(.Legendary, .Creature, .Human, .Wizard)
        adeliz.flying = true
        adeliz.haste = true
        adeliz.addTriggeredAbility(
            trigger: .YouCastInstantOrSorcery,
            effect: { adeliz.getController().getPermanents().filter({ $0.isType(.Wizard) }).forEach({ $0.pump(1, 1) }) })
        adeliz.setFlavorText("The passionate intensity of the Ghitu tempered by the cool insight of Tolarian training.")
        adeliz.power = 2
        adeliz.toughness = 2
        return adeliz
    }
    static func ArvadTheCursed() -> Card {
        let arvad = Card(name: "Arvad the Cursed", rarity: .Uncommon, set: set, number: 191)
        arvad.setManaCost("3WB")
        arvad.setType(.Legendary, .Creature, .Vampire, .Knight)
        arvad.deathtouch = true
        arvad.lifelink = true
        arvad.addStaticAbility({ object in
            if object  != arvad  && object.isType(.Legendary) && object.isType(.Creature) {
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
            }
            return object
        })
        arvad.setFlavorText("\"I won't abandon the <i>Weatherlight</i>. My destiny is to serve at Jhoira's side. This 'illness' means I must trust my faith more and myself less.\"")
        arvad.power = 3
        arvad.toughness = 3
        return arvad
    }
    // 192 Aryel, Knight of Windgrace
    // 193 Darigaaz Reincarnated
    // 194 Garna, the Bloodflame
    // 195 Grand Warlord Radha
    // 196 Hallar, the Firefletcher
    static func JhoiraWeatherlightCaptain() -> Card {
        let jhoira = Card(name: "Jhoira, Weatherlight Captain", rarity: .Mythic, set: set, number: 197)
        jhoira.setManaCost("2UR")
        jhoira.setType(.Legendary, .Creature, .Human, .Artificer)
        jhoira.addTriggeredAbility(
            trigger: .YouCastHistoricSpell,
            effect: { jhoira.getController().drawCard() })
        jhoira.setFlavorText("As she took the wheel of the <i>Weatherlight</i> for the first time in a millennium, Jhoira knew she'd been right to restore the ship. Anything was possible now.")
        jhoira.power = 3
        jhoira.toughness = 3
        return jhoira
    }
    // 198 Jodah, Archmage Eternal
    // 199 Muldrotha, the Gravetide
    // 200 Oath of Teferi
    // 201 Primevals' Glorious Rebirth
    // 202 Raff Capashen, Ship's Mage
    // 203 Rona, Disciple of Ghix
    // 204 Shanna, Sisay's Legacy
    // 205 Slimefoot, the Stowaway
    static func TatyovaBenthicDruid() -> Card {
        let tatyova = Card(name: "Tatyova, Benthic Druid", rarity: .Uncommon, set: set, number: 206)
        tatyova.setManaCost("3GU")
        tatyova.setType(.Legendary, .Creature, .Merfolk, .Druid)
        tatyova.addTriggeredAbility(
            trigger: .Landfall,
            effect: {
                tatyova.getController().gainLife(1)
                tatyova.getController().drawCard()
        })
        tatyova.setFlavorText("\"Yavimaya is one being--one vastness of rippling leaves, one deepness of roots, and one chatter of animals--of which I am one part.\"")
        tatyova.power = 3
        tatyova.toughness = 3
        return tatyova
    }
    // 207 Teferi, Hero of Dominaria
    // 208 Tiana, Ship's Caretaker
    static func AesthirGlider() -> Card {
        let aesthirGlider = Card(name: "Aesthir Glider", rarity: .Common, set: set, number: 209)
        aesthirGlider.setManaCost("3")
        aesthirGlider.setType(.Artifact, .Creature, .Bird, .Construct)
        aesthirGlider.flying = true
        aesthirGlider.cantBlock = true
        aesthirGlider.setFlavorText("An ancient device recovered from a thawing glacier high in the Karplusan mountains.")
        aesthirGlider.power = 2
        aesthirGlider.toughness = 1
        return aesthirGlider
    }
    static func AmaranthineWall() -> Card {
        let amaranthineWall = Card(name: "Amaranthine Wall", rarity: .Uncommon, set: set, number: 210)
        amaranthineWall.setManaCost("4")
        amaranthineWall.setType(.Artifact, .Creature, .Wall)
        amaranthineWall.defender = true
        amaranthineWall.addActivatedAbility(
            string: "{2}: ~ gains indestructible until end of turn.",
            cost: Cost.Mana("2"),
            effect: { amaranthineWall.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in object.indestructible = true; return object }))})
        amaranthineWall.setFlavorText("Neither its appearance nor its temperature varies as the years pass, an eternal testament to the forces that shaped Dominaria.")
        amaranthineWall.power = 0
        amaranthineWall.toughness = 6
        return amaranthineWall
    }
    static func BlackbladeReforged() -> Card {
        let blackbladeReforged = Card(name: "Blackblade Reforged", rarity: .Rare, set: set, number: 211)
        blackbladeReforged.setManaCost("2")
        blackbladeReforged.setType(.Legendary, .Artifact, .Equipment)
        
        func effect(_ object: Object) -> Object {
            let numLands = blackbladeReforged.getController().getLands().count
            object.power = object.getBasePower() + numLands
            object.toughness = object.getBaseToughness() + numLands
            return object
        }
        blackbladeReforged.addEquipAbility(
            string: "{3}: Equip legendary creature.",
            cost: Cost.Mana("3"),
            effect: effect,
            restriction: { $0.isType(.Legendary) })
        blackbladeReforged.addEquipAbility(
            string: "{7}: Equip.",
            cost: Cost.Mana("7"),
            effect: effect)
        
        blackbladeReforged.setFlavorText("It spilled the blood of one elder dragon. In Gideon's hands it may yet taste another's.")
        return blackbladeReforged
    }
    static func BloodtallowCandle() -> Card {
        let bloodtallowCandle = Card(name: "Bloodtallow Candle", rarity: .Common, set: set, number: 212)
        bloodtallowCandle.setManaCost("1")
        bloodtallowCandle.setType(.Artifact)
        bloodtallowCandle.addActivatedAbility(
            string: "{6}, {T}, Sacrifice ~: Target creature gets -5/-5 until end of turn.",
            cost: Cost.Mana("6").Tap().Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.pump(-5, -5) }))
        bloodtallowCandle.setFlavorText("\"Bring me an angel feather, and I will give you one death in return. There can be no turning back once the candle is lit.\"\n--Whisper, blood liturgist")
        return bloodtallowCandle
    }
    // 213 Damping Sphere
    // 214 Forebear's Blade
    static func GildedLotus() -> Card {
        let gildedLotus = Card(name: "Gilded Lotus", rarity: .Rare, set: set, number: 215)
        gildedLotus.setManaCost("5")
        gildedLotus.setType(.Artifact)
        gildedLotus.addActivatedAbility(
            string: "{T}: Add {W}{W}{W}.",
            cost: Cost.Tap(),
            effect: { gildedLotus.getController().addMana(color: .White, 3) },
            manaAbility: true)
        gildedLotus.addActivatedAbility(
            string: "{T}: Add {U}{U}{U}.",
            cost: Cost.Tap(),
            effect: { gildedLotus.getController().addMana(color: .Blue, 3) },
            manaAbility: true)
        gildedLotus.addActivatedAbility(
            string: "{T}: Add {B}{B}{B}.",
            cost: Cost.Tap(),
            effect: { gildedLotus.getController().addMana(color: .Black, 3) },
            manaAbility: true)
        gildedLotus.addActivatedAbility(
            string: "{T}: Add {R}{R}{R}.",
            cost: Cost.Tap(),
            effect: { gildedLotus.getController().addMana(color: .Red, 3) },
            manaAbility: true)
        gildedLotus.addActivatedAbility(
            string: "{T}: Add {G}{G}{G}.",
            cost: Cost.Tap(),
            effect: { gildedLotus.getController().addMana(color: .Green, 3) },
            manaAbility: true)
        gildedLotus.setFlavorText("\"The perfection of the lotus reminds me of my hopes for this world... and my failures. I will not rest until I've atoned for them.\"\n--Karn")
        return gildedLotus
    }
    // 216 Guardians of Koilos
    // 217 Helm of the Host
    static func HowlingGolem() -> Card {
        let howlingGolem = Card(name: "Howling Golem", rarity: .Uncommon, set: set, number: 218)
        howlingGolem.setManaCost("3")
        howlingGolem.setType(.Artifact, .Creature, .Golem)
        howlingGolem.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { Game.shared.bothPlayers({ $0.drawCard() })})
        howlingGolem.addTriggeredAbility(
            trigger: .ThisBlocks,
            effect: { Game.shared.bothPlayers({ $0.drawCard() })})
        howlingGolem.setFlavorText("It wails of buried riches and the souls lost seeking them.")
        howlingGolem.power = 2
        howlingGolem.toughness = 3
        return howlingGolem
    }
    static func IcyManipulator() -> Card {
        let icyManipulator = Card(name: "Icy Manipulator", rarity: .Uncommon, set: set, number: 219)
        icyManipulator.setManaCost("4")
        icyManipulator.setType(.Artifact)
        icyManipulator.addActivatedAbility(
            string: "{1}, {T}: Tap target artifact, creature, or land.",
            cost: Cost.Mana("1").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Land) },
                effect: { target in target.tap() }))
        icyManipulator.setFlavorText("Ice may thaw, but malice never does.")
        return icyManipulator
    }
    // 220 Jhoira's Familiar
    static func JoustingLance() -> Card {
        let joustingLance = Card(name: "Jousting Lance", rarity: .Common, set: set, number: 221)
        joustingLance.setManaCost("2")
        joustingLance.setType(.Artifact, .Equipment)
        joustingLance.addEquipAbility(
            string: "{3}: Equip.",
            cost: Cost.Mana("3"),
            effect: { object in
                object.power = object.getBasePower() + 2
                // TODO: Layers
                if object.getController().active {
                    object.firstStrike = true
                }
                return object
        })
        return joustingLance
    }
    // 222 Juggernaut
    // 223 Mishra's Self Replicator
    // 224 Mox Ambber
    // 225 Naviagor's Compass
    static func PardicWanderer() -> Card {
        let pardicWanderer = Card(name: "Pardic Wanderer", rarity: .Common, set: set, number: 226)
        pardicWanderer.setManaCost("6")
        pardicWanderer.setType(.Artifact, .Creature, .Golem)
        pardicWanderer.trample = true
        pardicWanderer.setFlavorText("\"To the head of Archaeological Findings: The excavation schedule at dig sit 93-beta must be revised. Part of the site has walked off.\"\n--Tolarian field dispatch")
        pardicWanderer.power = 5
        pardicWanderer.toughness = 5
        return pardicWanderer
    }
    static func PowerstoneShard() -> Card {
        let powerstoneShard = Card(name: "Powerstone Shard", rarity: .Common, set: set, number: 227)
        powerstoneShard.setManaCost("3")
        powerstoneShard.setType(.Artifact)
        powerstoneShard.addActivatedAbility(
            string: "{T}: Add {C} for each artifact you control named Powerstone Shard.",
            cost: Cost.Tap(),
            effect: {
                let count = powerstoneShard.getController().getArtifacts().filter({ return $0.getName() == "Powerstone Shard" }).count
                for _ in 1...count { powerstoneShard.getController().addMana(color: nil) }
            },
            manaAbility: true )
        powerstoneShard.setFlavorText("\"Light passing through a powerstone is refracted by eternity and colored by planar energy. I wonder how the world appeared through Urza's eyes?\"\n--Teferi")
        return powerstoneShard
    }
    // 228 Shield of the Realm
    static func ShortSword() -> Card {
        let shortSword = Card(name: "Short Sword", rarity: .Common, set: set, number: 229)
        shortSword.setManaCost("1")
        shortSword.setType(.Artifact, .Equipment)
        shortSword.addEquipAbility(
            string: "{1}: Equip.",
            cost: Cost.Mana("1"),
            effect: { object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                return object
        })
        shortSword.setFlavorText("\"Sometimes the only difference between a martyr and a hero is a sword.\"\n--Captain Sisay, Memoirs")
        return shortSword
    }
    static func SkitteringSurveyor() -> Card {
        let skitteringSurveyor = Card(name: "Skittering Surveyor", rarity: .Common, set: set, number: 230)
        skitteringSurveyor.setManaCost("3")
        skitteringSurveyor.setType(.Artifact, .Creature, .Construct)
        skitteringSurveyor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { skitteringSurveyor.getController().chooseCard(
                from: skitteringSurveyor.getController().getLibrary(),
                restriction: { $0.isBasicLand() },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    skitteringSurveyor.getController().shuffleLibrary()
                })
            },
            effectOptional: true)
        skitteringSurveyor.setFlavorText("Like a cross between a spider and a spyglass, but friendlier.")
        skitteringSurveyor.power = 1
        skitteringSurveyor.toughness = 2
        return skitteringSurveyor
    }
    // 231 Sorcerer's Wand
    static func SparringConstruct() -> Card {
        let sparringConstruct = Card(name: "Sparring Construct", rarity: .Common, set: set, number: 232)
        sparringConstruct.setManaCost("1")
        sparringConstruct.setType(.Artifact, .Creature, .Construct)
        sparringConstruct.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() === sparringConstruct.getController() },
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        sparringConstruct.setFlavorText("The trainers were a gift of gratitude from the wizards of Tolaria West to the knights of New Benalia for their aid during the Talas Incursion.")
        sparringConstruct.power = 1
        sparringConstruct.toughness = 1
        return sparringConstruct
    }
    static func ThranTemporalGateway() -> Card {
        let thranTemporalGateway = Card(name: "Thran Temporal Gateway", rarity: .Rare, set: set, number: 233)
        thranTemporalGateway.setManaCost("4")
        thranTemporalGateway.setType(.Legendary, .Artifact)
        thranTemporalGateway.addActivatedAbility(
            string: "{4}, {T}: You may put a historic permanent card from your hand onto the battlefield.",
            cost: Cost.Mana("4").Tap(),
            effect: { thranTemporalGateway.getController().chooseCard(
                from: thranTemporalGateway.getController().getHand(),
                restriction: { $0.isHistoric() && $0.isPermanent() },
                action: { chosen, rest in chosen?.putOntoBattlefield() })
        })
        thranTemporalGateway.setFlavorText("The portal opens not to the past, but from it. Those who step through discover an unimaginable future.")
        return thranTemporalGateway
    }
    // 234 Traxos, Scourge of Kroog
    // 235 Urza's Tome
    static func VoltaicServant() -> Card {
        let voltaicServant = Card(name: "Voltaic Servant", rarity: .Common, set: set, number: 236)
        voltaicServant.setManaCost("2")
        voltaicServant.setType(.Artifact, .Creature, .Construct)
        voltaicServant.addTriggeredAbility(
            trigger: .YourEndStep,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Artifact) },
                effect: { $0.untap() }))
        voltaicServant.setFlavorText("A missing piece in search of a puzzle.")
        voltaicServant.power = 1
        voltaicServant.toughness = 3
        return voltaicServant
    }
    // 237 Weatherlight
    static func CabalStronghold() -> Card {
        let cabalStronghold = Card(name: "Cabal Stronghold", rarity: .Rare, set: set, number: 238)
        cabalStronghold.setManaCost("")
        cabalStronghold.setType(.Land)
        cabalStronghold.addActivatedAbility(
            string: "{T}: Add {C}.",
            cost: Cost.Tap(),
            effect: { cabalStronghold.getController().addMana(color: nil) },
            manaAbility: true)
        cabalStronghold.addActivatedAbility(
            string: "{3}, {T}: Add {B} for each basic Swamp you control.",
            cost: Cost.Mana("3").Tap(),
            effect: {
                let numSwamps = cabalStronghold.getController().getPermanents().filter({ return $0.isType(.Basic) && $0.isType(.Swamp) }).count
                cabalStronghold.getController().addMana(color: nil, numSwamps)
            },
            manaAbility: true)
        cabalStronghold.setFlavorText("The seat of Belzenlok's power, the Stronghold serves as the gathering place for the Cabal as their dark influence spreads from Urborg.")
        return cabalStronghold
    }
    static func ClifftopRetreat() -> Card {
        let clifftopRetreat = Card(name: "Clifftop Retreat", rarity: .Rare, set: set, number: 239)
        clifftopRetreat.setManaCost("")
        clifftopRetreat.setType(.Land)
        clifftopRetreat.addStaticAbility({ object in
            if object == clifftopRetreat {
                let controlsMountain = !clifftopRetreat.getController().getLands().filter({ $0.isType(.Mountain) }).isEmpty
                let controlsPlains = !clifftopRetreat.getController().getLands().filter({ $0.isType(.Plains) }).isEmpty
                object.entersTapped = !(controlsMountain || controlsPlains)
            }
            return object
        })
        clifftopRetreat.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { clifftopRetreat.getController().addMana(color: .Red) },
            manaAbility: true)
        clifftopRetreat.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { clifftopRetreat.getController().addMana(color: .White) },
            manaAbility: true)
        clifftopRetreat.setFlavorText("The sunlight falls pristine on the temple at Epityr, softened by the remembered shadows of angelic saviors' wings.")
        return clifftopRetreat
    }
    static func HinterlandHarbor() -> Card {
        let hinterlandHarbor = Card(name: "Hinterland Harbor", rarity: .Rare, set: set, number: 240)
        hinterlandHarbor.setManaCost("")
        hinterlandHarbor.setType(.Land)
        hinterlandHarbor.addStaticAbility({ object in
            if object == hinterlandHarbor {
                let controlsForest = !hinterlandHarbor.getController().getLands().filter({ $0.isType(.Forest) }).isEmpty
                let controlsIsland = !hinterlandHarbor.getController().getLands().filter({ $0.isType(.Island) }).isEmpty
                object.entersTapped = !(controlsForest || controlsIsland)
            }
            return object
        })
        hinterlandHarbor.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { hinterlandHarbor.getController().addMana(color: .Green) },
            manaAbility: true)
        hinterlandHarbor.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { hinterlandHarbor.getController().addMana(color: .Blue) },
            manaAbility: true)
        hinterlandHarbor.setFlavorText("\"Our ancestors brought down a Phyrexian portal ship, then built our town on its hull. We're pretty proud of that.\"\n--Alene of Riverspan")
        return hinterlandHarbor
    }
    static func IsolatedChapel() -> Card {
        let isolatedChapel = Card(name: "Isolated Chapel", rarity: .Rare, set: set, number: 241)
        isolatedChapel.setManaCost("")
        isolatedChapel.setType(.Land)
        isolatedChapel.addStaticAbility({ object in
            if object == isolatedChapel {
                let controlsPlains = !isolatedChapel.getController().getLands().filter({ $0.isType(.Plains) }).isEmpty
                let controlsSwamp = !isolatedChapel.getController().getLands().filter({ $0.isType(.Swamp) }).isEmpty
                object.entersTapped = !(controlsPlains || controlsSwamp)
            }
            return object
        })
        isolatedChapel.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { isolatedChapel.getController().addMana(color: .White) },
            manaAbility: true)
        isolatedChapel.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { isolatedChapel.getController().addMana(color: .Black) },
            manaAbility: true)
        isolatedChapel.setFlavorText("Serra's blessing lies strongest upon Sursi, where her holy chapels are untouched even as the Cabal encroaches.")
        return isolatedChapel
    }
    // 242 Memorial to Folly
    static func MemorialToGenius() -> Card {
        let memorialToGenius = Card(name: "Memorial to Genius", rarity: .Uncommon, set: set, number: 243)
        memorialToGenius.setManaCost("")
        memorialToGenius.setType(.Land)
        memorialToGenius.entersTapped = true
        memorialToGenius.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { memorialToGenius.getController().addMana(color: .Blue) },
            manaAbility: true)
        memorialToGenius.addActivatedAbility(
            string: "{4}{U}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("4U").Tap().Sacrifice(),
            effect: { memorialToGenius.getController().drawCards(2) })
        return memorialToGenius
    }
    static func MemorialToGlory() -> Card {
        let memorialToGlory = Card(name: "Memorial to Glory", rarity: .Uncommon, set: set, number: 244)
        memorialToGlory.setManaCost("")
        memorialToGlory.setType(.Land)
        memorialToGlory.entersTapped = true
        memorialToGlory.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { memorialToGlory.getController().addMana(color: .White) },
            manaAbility: true)
        memorialToGlory.addActivatedAbility(
            string: "{3}{W}, {T}, Sacrifice ~: Create two 1/1 white Soldier creature tokens.",
            cost: Cost.Mana("3W").Tap().Sacrifice(),
            effect: {
                memorialToGlory.getController().createToken(Soldier())
                memorialToGlory.getController().createToken(Soldier())
        })
        return memorialToGlory
    }
    static func MemorialToUnity() -> Card {
        let memorialToUnity = Card(name: "Memorial to Unity", rarity: .Uncommon, set: set, number: 247)
        memorialToUnity.setManaCost("")
        memorialToUnity.setType(.Land)
        memorialToUnity.entersTapped = true
        memorialToUnity.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { memorialToUnity.getController().addMana(color: .Green) },
            manaAbility: true)
        memorialToUnity.addActivatedAbility(
            string: "{2}{G}, {T}, Sacrifice ~: Look at the top five cards of your library. You may reveal a creature card from among them and put it into your hand. Then put the rest on the bottom of your library in a random order.",
            cost: Cost.Mana("2G").Tap().Sacrifice(),
            effect: { memorialToUnity.getController().chooseCard(
                from: Array(memorialToUnity.getController().getLibrary().suffix(5)),
                restriction: { $0.isType(.Creature) },
                action: { chosen, rest in
                    chosen?.reveal()
                    memorialToUnity.getController().putOnBottomOfLibrary(&rest, random: true)
                })
        })
        return memorialToUnity
    }
    static func MemorialToWar() -> Card {
        let memorialToWar = Card(name: "Memorial to War", rarity: .Uncommon, set: set, number: 246)
        memorialToWar.setManaCost("")
        memorialToWar.setType(.Land)
        memorialToWar.entersTapped = true
        memorialToWar.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { memorialToWar.getController().addMana(color: .Red) },
            manaAbility: true)
        memorialToWar.addActivatedAbility(
            string: "{4}{R}, {T}, Sacrifice ~: Destroy target land.",
            cost: Cost.Mana("4R").Tap().Sacrifice(),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Land) },
                effect: { let _ = $0.destroy() }))
        return memorialToWar
    }
    static func SulfurFalls() -> Card {
        let sulfurFalls = Card(name: "Sulfur Falls", rarity: .Rare, set: set, number: 247)
        sulfurFalls.setManaCost("")
        sulfurFalls.setType(.Land)
        sulfurFalls.addStaticAbility({ object in
            if object == sulfurFalls {
                let controlsIsland = !sulfurFalls.getController().getLands().filter({ $0.isType(.Island) }).isEmpty
                let controlsMountain = !sulfurFalls.getController().getLands().filter({ $0.isType(.Mountain) }).isEmpty
                object.entersTapped = !(controlsIsland || controlsMountain)
            }
            return object
        })
        sulfurFalls.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { sulfurFalls.getController().addMana(color: .Blue) },
            manaAbility: true)
        sulfurFalls.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { sulfurFalls.getController().addMana(color: .Red) },
            manaAbility: true)
        sulfurFalls.setFlavorText("\"We have inherited the mysteries of the Thran, but few of the answers.\"\n--Jhoira")
        return sulfurFalls
    }
    static func WoodlandCemetery() -> Card {
        let woodlandCemetery = Card(name: "Woodland Cemetery", rarity: .Rare, set: set, number: 248)
        woodlandCemetery.setManaCost("")
        woodlandCemetery.setType(.Land)
        woodlandCemetery.addStaticAbility({ object in
            if object == woodlandCemetery {
                let controlsIsland = !woodlandCemetery.getController().getLands().filter({ $0.isType(.Island) }).isEmpty
                let controlsMountain = !woodlandCemetery.getController().getLands().filter({ $0.isType(.Mountain) }).isEmpty
                object.entersTapped = !(controlsIsland || controlsMountain)
            }
            return object
        })
        woodlandCemetery.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { woodlandCemetery.getController().addMana(color: .Black) },
            manaAbility: true)
        woodlandCemetery.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { woodlandCemetery.getController().addMana(color: .Green) },
            manaAbility: true)
        woodlandCemetery.setFlavorText("\"They never found the body of young Josu, or that of his murderous sister.\"\n--\"The Fall of the House of Vess\"")
        return woodlandCemetery
    }
    // 249 Zhalfirin Void
    // Basics



    static func Knight() -> Token {
        return (Int.random(in: 1 ... 2) == 1) ? Knight1() : Knight2()
    }
    static func Knight1() -> Token {
        let knight1 = Token(name: "Knight", set: set, number: 1)
        knight1.colors = [Color.White]
        knight1.setType(.Creature, .Knight)
        knight1.vigilance = true
        knight1.power = 2
        knight1.toughness = 2
        return knight1;
    }
    static func Knight2() -> Token {
        let knight2 = Token(name: "Knight", set: set, number: 2)
        knight2.colors = [Color.White]
        knight2.setType(.Creature, .Knight)
        knight2.vigilance = true
        knight2.power = 2
        knight2.toughness = 2
        return knight2;
    }
    static func Soldier() -> Token {
        let soldier = Token(name: "Soldier", set: set, number: 3)
        soldier.colors = [Color.White]
        soldier.setType(.Creature, .Soldier)
        soldier.power = 1
        soldier.toughness = 1
        return soldier
    }
    // 4 Cleric
    // 5 Zombie Knight
    // 6 Nightmare Horror
    // 7 Demon
    // 8 Elemental
    // 9 Goblin
    // 10 Karox Bladewing

    static func Saproling() -> Token {
        let r = Int.random(in: 1 ... 3)
        return (r == 1) ? Saproling11() : ((r == 12) ? Saproling12() : Saproling13())
    }
    static func Saproling11() -> Token {
        let saproling11 = Token(name: "Saproling", set: set, number: 11)
        saproling11.colors = [.Green]
        saproling11.setType(.Creature, .Saproling)
        saproling11.power = 1
        saproling11.toughness = 1
        return saproling11
    }
    static func Saproling12() -> Token {
        let saproling12 = Token(name: "Saproling", set: set, number: 12)
        saproling12.colors = [.Green]
        saproling12.setType(.Creature, .Saproling)
        saproling12.power = 1
        saproling12.toughness = 1
        return saproling12
    }
    static func Saproling13() -> Token {
        let saproling13 = Token(name: "Saproling", set: set, number: 13)
        saproling13.colors = [.Green]
        saproling13.setType(.Creature, .Saproling)
        saproling13.power = 1
        saproling13.toughness = 1
        return saproling13
    }
    // 14 Construct
    // 15 Jaya Emblem
    // 16 Teferi Emlem
}
