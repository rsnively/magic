import Foundation

enum M20 {
    static var set = "m20"
    static var count = 280
    
    static let cards = [
        AerialAssault,
        AjaniStrengthOfThePride,
        AncestralBlade,
//        AngelOfVitality,
        AngelicGift,
//        ApostleOfPurifyingLight,
//        BattalionFootSoldier,
//        BishopOfWings,
//        BroughtBack,
        CavalierOfDawn,
        DawningAngel,
        DaybreakChaplain,
//        DevoutDecree,
        Disenchant,
        EternalIsolation,
        FencingAce,
//        GauntletsOfLight,
        GlaringAegis,
//        GodsWilling,
        GriffinProtector,
        GriffinSentinel,
//        HangedExecutioner,
        HeraldOfTheSun,
        InspiredCharge,
        InspiringCaptain,
//        LeylineOfSanctity,
        LoxodonLifechanter,
//        LoyalPegasus,
        MasterSplicer,
        MomentOfHeroism,
        MoorlandInquisitor,
        Pacifism,
        PlanarCleansing,
        RaiseTheAlarm,
//        RuleOfLaw,
//        SepharaSkysBlade,
        Soulmender,
//        SquadCaptain,
//        StarfieldMystic,
        SteadfastSentry,
        YokedOx,
//        AetherGust,
//        AgentOfTreachery,
        AirElemental,
//        Anticipate,
//        AtemsisAllSeeing,
        Befuddle,
        BoneToAsh,
//        BorealElemental,
        BrinebornCutthroat,
        CaptivatingGyre,
//        CavalierOfGales,
//        CeruleanDrake,
        CloudkinSeer,
//        Convolute,
//        DrawnFromDreams,
//        DungeonGeists,
        FaerieMiscreant,
//        FloodOfTears,
        FortressCrab,
        FrilledSeaSerpent,
        FrostLynx,
//        HardCover,
//        LeylineOfAnticipation,
//        MasterfulReplication,
        MetropolisSprite,
        MoatPiranhas,
//        MuYanlingSkyDancer,
        Negate,
//        Octoprophet,
//        PortalOfSanctuary,
//        RenownedWeaponsmith,
//        SagesRowDenizen,
        ScholarOfTheAges,
        SleepParalysis,
        SpectralSailor,
//        TalesEnd,
        Unsummon,
        WardenOfEvosIsle,
        WingedWords,
        YaroksWavecrasher,
        ZephyrCharge,
        
        Disfigure,
        
        LegionsEnd,
        
        ThoughtDistortion,
        
        ChandraNovicePyromancer,
        
        DragonMage,
        
        EmberHauler,
        
        FlameSweep,
        
        Infuriate,
        
        FerociousPup,
        
        GrowthCycle,
        
        PulseOfMurasa,
        
        SilverbackShaman,
        
        ThrashingBrontodon,
        
        CorpseKnight,
        CreepingTrailblazer,
        EmpyreanEagle,
        IronrootWarlord,
        
        ManifoldKey,
        
        SteelOverseer,
        
        FieldOfTheDead,
        
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    static func AerialAssault() -> Card {
        let aerialAssault = Card(name: "Aerial Assault", rarity: .Common, set: set, number: 1)
        aerialAssault.setManaCost("2W")
        aerialAssault.setType(.Sorcery)
        aerialAssault.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.isTapped },
                zones: [.Battlefield]),
            effect: { target in
                _ = target.destroy()
                let numFlyingCreatures = aerialAssault.getController().getCreatures().filter({ $0.flying }).count
                aerialAssault.getController().gainLife(numFlyingCreatures)
        }))
        aerialAssault.setFlavorText("\"Oh, you must be mistaken. Hawks are solitary hunters, you see.\"\n--Bunder Diedreck, ornithologist")
        return aerialAssault
    }
    static func AjaniStrengthOfThePride() -> Card {
        let ajani = Card(name: "Ajani, Strength of the Pride", rarity: .Mythic, set: set, number: 2)
        ajani.setManaCost("2WW")
        ajani.setType(.Legendary, .Planeswalker, .Ajani)
        ajani.addActivatedAbility(
            string: "{+1}: You gain life equal to the number of creatures you control plus the number of planeswalkers you control.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: {
                let numCreatures = ajani.getController().getCreatures().count
                let numPlaneswalkers = ajani.getController().getPermanents().filter({ $0.isType(.Planeswalker) }).count
                ajani.getController().gainLife(numCreatures + numPlaneswalkers)
            },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        ajani.addActivatedAbility(
            string: "{-2}: Create a 2/2 white Cat Soldier creature token named Ajani's Pridemate with \"Whenever you gain life, put a +1/+1 counter on Ajani's Pridemate.\"",
            cost: Cost.RemoveCounters(.Loyalty, 2),
            effect: { ajani.getController().createToken(AjanisPridemate()) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        ajani.addActivatedAbility(
            string: "{0}: If you have at least 15 life more than your starting life total, exile ~ and each artifact and creature your opponents control.",
            cost: Cost.AddCounters(.Loyalty, 0),
            effect: {
                if ajani.getController().getLife() >= Player.startingLifeTotal + 15 {
                    let opponent = ajani.getOpponent()
                    ajani.exile()
                    opponent.getPermanents().filter({ $0.isType(.Artifact) || $0.isType(.Creature) }).forEach({ $0.exile() })
                }
            },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        ajani.startingLoyalty = 5
        return ajani
    }
    static func AncestralBlade() -> Card {
        let ancestralBlade = Card(name: "Ancestral Blade", rarity: .Uncommon, set: set, number: 3)
        ancestralBlade.setManaCost("1W")
        ancestralBlade.setType(.Artifact, .Equipment)
        ancestralBlade.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let soldier = Soldier()
                ancestralBlade.getController().createToken(soldier)
                ancestralBlade.attachTo(soldier)
            })
        ancestralBlade.addEquipAbility(
            string: "{1}: Equip.",
            cost: Cost.Mana("1"),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        return ancestralBlade
    }
    // 4 Angel of Vitality
    static func AngelicGift() -> Card {
        let angelicGift = Card(name: "Angelic Gift", rarity: .Common, set: set, number: 5)
        angelicGift.setManaCost("1W")
        angelicGift.setType(.Enchantment, .Aura)
        angelicGift.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { angelicGift.getController().drawCard() })
        angelicGift.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { return $0.pumped(2, 2) },
            layer: .PowerToughnessChanging)
        return angelicGift
    }
    // 6 Apostle of Purifying Light
    // 7 Battalion Footsoldier
    // 8 Bishop of Wings
    // 9 Brought Back
    static func CavalierOfDawn() -> Card {
        let cavalierOfDawn = Card(name: "Cavalier of Dawn", rarity: .Mythic, set: set, number: 10)
        cavalierOfDawn.setManaCost("2WWW")
        cavalierOfDawn.setType(.Creature, .Elemental, .Knight)
        cavalierOfDawn.vigilance = true
        cavalierOfDawn.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetNonlandPermanent(optional: true),
                effect: { target in
                    let controller = target.getController()
                    _ = target.destroy()
                    controller.createToken(Golem())
            }))
        cavalierOfDawn.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getOwner() === cavalierOfDawn.getController() && $0.isType(.Artifact) || $0.isType(.Enchantment) },
                    zones: [.Graveyard]),
                effect: { $0.putIntoHand() }))
        cavalierOfDawn.power = 4
        cavalierOfDawn.toughness = 6
        return cavalierOfDawn
    }
    static func DawningAngel() -> Card {
        let dawningAngel = Card(name: "Dawning Angel", rarity: .Common, set: set, number: 11)
        dawningAngel.setManaCost("4W")
        dawningAngel.setType(.Creature, .Angel)
        dawningAngel.flying = true
        dawningAngel.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { dawningAngel.getController().gainLife(4) })
        dawningAngel.setFlavorText("\"As the sun rose behind the Bone Spire, an angel appeared over the charnel fields, bringing a surge of new hope.\"\n--Krinnea, <em>Siege of the Bone Spire</em>")
        dawningAngel.power = 3
        dawningAngel.toughness = 2
        return dawningAngel
    }
    static func DaybreakChaplain() -> Card {
        let daybreakChaplain = Card(name: "Daybreak Chaplain", rarity: .Common, set: set, number: 12)
        daybreakChaplain.setManaCost("1W")
        daybreakChaplain.setType(.Creature, .Human, .Cleric)
        daybreakChaplain.lifelink = true
        daybreakChaplain.setFlavorText("\"May the light shine through me to guide the lost.\"")
        daybreakChaplain.power = 1
        daybreakChaplain.toughness = 3
        return daybreakChaplain
    }
    // 13 Devout Decree
    static func Disenchant() -> Card {
        let disenchant = Card(name: "Disenchant", rarity: .Common, set: set, number: 14)
        disenchant.setManaCost("1W")
        disenchant.setType(.Instant)
        disenchant.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { target in let _ = target.destroy() }))
        disenchant.setFlavorText("Where the holy light of the angels has shone, only purity remains.")
        return disenchant
    }
    static func EternalIsolation() -> Card {
        let eternalIsolation = Card(name: "Eternal Isolation", rarity: .Uncommon, set: set, number: 15)
        eternalIsolation.setManaCost("1W")
        eternalIsolation.setType(.Sorcery)
        eternalIsolation.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() >= 4 },
                zones: [.Battlefield]),
            effect: { $0.putOnBottomOfLibrary() }))
        eternalIsolation.setFlavorText("\"Well, at least it's a lovely view.\"")
        return eternalIsolation
    }
    static func FencingAce() -> Card {
        let fencingAce = Card(name: "Fencing Ace", rarity: .Uncommon, set: set, number: 16)
        fencingAce.setManaCost("1W")
        fencingAce.setType(.Creature, .Human, .Soldier)
        fencingAce.doubleStrike = true
        fencingAce.setFlavorText("\"Go find yourself a couple friends, and bring me a blindfold. Then we might have a fair fight.\"")
        fencingAce.power = 1
        fencingAce.toughness = 1
        return fencingAce
    }
    // 17 Gauntlets of Light
    static func GlaringAegis() -> Card {
        let glaringAegis = Card(name: "Glaring Aegis", rarity: .Common, set: set, number: 18)
        glaringAegis.setManaCost("W")
        glaringAegis.setType(.Enchantment, .Aura)
        glaringAegis.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== glaringAegis.getController() },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        glaringAegis.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pumped(1, 3) },
            layer: .PowerToughnessChanging)
        return glaringAegis
    }
    // 19 Gods Willing
    static func GriffinProtector() -> Card {
        let griffinProtector = Card(name: "Griffin Protector", rarity: .Common, set: set, number: 20)
        griffinProtector.setManaCost("3W")
        griffinProtector.setType(.Creature, .Griffin)
        griffinProtector.flying = true
        griffinProtector.addTriggeredAbility(
            trigger: .AnotherCreatureEntersBattlefieldUnderYourControl,
            effect: { griffinProtector.pump(1, 1) })
        griffinProtector.setFlavorText("\"Here is a companion who will never falter, no matter how desperate the battle!\"\n--Ajani Goldmane")
        griffinProtector.power = 2
        griffinProtector.toughness = 3
        return griffinProtector
    }
    static func GriffinSentinel() -> Card {
        let griffinSentinel = Card(name: "Griffin Sentinel", rarity: .Common, set: set, number: 21)
        griffinSentinel.setManaCost("2W")
        griffinSentinel.setType(.Creature, .Griffin)
        griffinSentinel.flying = true
        griffinSentinel.vigilance = true
        griffinSentinel.setFlavorText("Once a griffin sentinel adopts a territory as its own, only death can force it to betray its post.")
        griffinSentinel.power = 1
        griffinSentinel.toughness = 3
        return griffinSentinel
    }
    // 22 Hanged Executioner
    static func HeraldOfTheSun() -> Card {
        let heraldOfTheSun = Card(name: "Herald of the Sun", rarity: .Uncommon, set: set, number: 23)
        heraldOfTheSun.setManaCost("4WW")
        heraldOfTheSun.setType(.Creature, .Angel)
        heraldOfTheSun.flying = true
        heraldOfTheSun.addActivatedAbility(
            string: "{3}{W}: Put a +1/+1 counter on another target creature with flying.",
            cost: Cost.Mana("3W"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.flying },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        heraldOfTheSun.setFlavorText("\"Fear neither clouds nor darkness. The light shall overcome them all.\"")
        heraldOfTheSun.power = 4
        heraldOfTheSun.toughness = 4
        return heraldOfTheSun
    }
    static func InspiredCharge() -> Card {
        let inspiredCharge = Card(name: "Inspired Charge", rarity: .Common, set: set, number: 24)
        inspiredCharge.setManaCost("2WW")
        inspiredCharge.setType(.Instant)
        inspiredCharge.addEffect {
            inspiredCharge.getController().getCreatures().forEach({ $0.pump(2, 1) })
        }
        inspiredCharge.setFlavorText("\"We are armed with light and steel. Who can stand against us?\"")
        return inspiredCharge
    }
    static func InspiringCaptain() -> Card {
        let inspiringCaptain = Card(name: "Inspiring Captain", rarity: .Common, set: set, number: 25)
        inspiringCaptain.setManaCost("3W")
        inspiringCaptain.setType(.Creature, .Human, .Knight)
        inspiringCaptain.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                inspiringCaptain.getController().getCreatures().forEach({ $0.pump(1, 1) })
        })
        inspiringCaptain.setFlavorText("\"Time to show the foe our true mettle.\"")
        inspiringCaptain.power = 3
        inspiringCaptain.toughness = 3
        return inspiringCaptain
    }
    // 26 Leyline of Sanctity
    static func LoxodonLifechanter() -> Card {
        let loxodonLifechanter = Card(name: "Loxodon Lifechanter", rarity: .Rare, set: set, number: 27)
        loxodonLifechanter.setManaCost("5W")
        loxodonLifechanter.setType(.Creature, .Elephant, .Cleric)
        loxodonLifechanter.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let totalToughness = loxodonLifechanter.getController().getCreatures().reduce(0, { acc, creature in acc + creature.getToughness() })
                loxodonLifechanter.getController().setLife(totalToughness)
            },
            effectOptional: true)
        loxodonLifechanter.addActivatedAbility(
            string: "{5}{W}: ~ gets +X/+X until end of turn, where X is your life total.",
            cost: Cost.Mana("5W"),
            effect: {
                let amt = loxodonLifechanter.getController().getLife()
                loxodonLifechanter.pump(amt, amt)
        })
        loxodonLifechanter.power = 4
        loxodonLifechanter.toughness = 6
        return loxodonLifechanter
    }
    // 28 Loyal Pegasus
    static func MasterSplicer() -> Card {
        let masterSplicer = Card(name: "Master Splicer", rarity: .Uncommon, set: set, number: 29)
        masterSplicer.setManaCost("3W")
        masterSplicer.setType(.Creature, .Human, .Artificer)
        masterSplicer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { masterSplicer.getController().createToken(Golem()) })
        masterSplicer.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: masterSplicer, subtype: .Golem),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        masterSplicer.setFlavorText("Phyrexian artificers remove the flesh they no longer need and use it to bring their unholy creations to a greater semblance of life.")
        masterSplicer.power = 1
        masterSplicer.toughness = 1
        return masterSplicer
    }
    static func MomentOfHeroism() -> Card {
        let momentOfHeroism = Card(name: "Moment of Heroism", rarity: .Common, set: set, number: 30)
        momentOfHeroism.setManaCost("1W")
        momentOfHeroism.setType(.Instant)
        momentOfHeroism.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(2, 2)
                target.giveKeywordUntilEndOfTurn(.Lifelink)
        }))
        momentOfHeroism.setFlavorText("\"My faith is stronger than fang, claw, or mindless hunger.\"")
        return momentOfHeroism
    }
    static func MoorlandInquisitor() -> Card {
        let moorlandInquisitor = Card(name: "Moorland Inquisitor", rarity: .Common, set: set, number: 31)
        moorlandInquisitor.setManaCost("1W")
        moorlandInquisitor.setType(.Creature, .Human, .Soldier)
        moorlandInquisitor.addActivatedAbility(
            string: "{2}{W}: ~ gains first strike until end of turn.",
            cost: Cost.Mana("2W"),
            effect: { moorlandInquisitor.giveKeywordUntilEndOfTurn(.FirstStrike) })
        moorlandInquisitor.setFlavorText("Inquisitors are taught scripture, philosophy, and the fine art of sharpening an axe.")
        moorlandInquisitor.power = 2
        moorlandInquisitor.toughness = 2
        return moorlandInquisitor
    }
    static func Pacifism() -> Card {
        let pacifism = Card(name: "Pacifism", rarity: .Common, set: set, number: 32)
        pacifism.setManaCost("1W")
        pacifism.setType(.Enchantment, .Aura)
        pacifism.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effects: [
                ({ return $0.withKeyword(.CantAttack) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantBlock) }, .AbilityAddingOrRemoving)
            ])
        pacifism.setFlavorText("\"Can't a fella get a moment's peace around here?\"")
        return pacifism
    }
    static func PlanarCleansing() -> Card {
        let planarCleansing = Card(name: "Planar Cleansing", rarity: .Rare, set: set, number: 33)
        planarCleansing.setManaCost("3WWW")
        planarCleansing.setType(.Sorcery)
        planarCleansing.addEffect({
            Game.shared.bothPlayers({ player in
                player.getPermanents().filter({ !$0.isType(.Land) }).forEach({ _ = $0.destroy() })
            })
        })
        return planarCleansing
    }
    static func RaiseTheAlarm() -> Card {
        let raiseTheAlarm = Card(name: "Raise the Alarm", rarity: .Common, set: set, number: 34)
        raiseTheAlarm.setManaCost("1W")
        raiseTheAlarm.setType(.Instant)
        raiseTheAlarm.addEffect({
            raiseTheAlarm.getController().createToken(Soldier())
            raiseTheAlarm.getController().createToken(Soldier())
        })
        raiseTheAlarm.setFlavorText("Like blinking or breathing, responding to an alarm is an involuntary effect.")
        return raiseTheAlarm
    }
    // 35 Rule of Law
    // 36 Sephara, Sky's Blade
    static func Soulmender() -> Card {
        let soulmender = Card(name: "Soulmender", rarity: .Common, set: set, number: 37)
        soulmender.setManaCost("W")
        soulmender.setType(.Creature, .Human, .Cleric)
        soulmender.addActivatedAbility(
            string: "{T}: You gain 1 life.",
            cost: Cost.Tap(),
            effect: { soulmender.getController().gainLife(1) })
        soulmender.setFlavorText("\"Healing is more art than magic. Well, there is still quite a bbit of magic.\"")
        soulmender.power = 1
        soulmender.toughness = 1
        return soulmender
    }
    // 38 Squad Captain
    // 39 Starfield Mystic
    static func SteadfastSentry() -> Card {
        let steadfastSentry = Card(name: "Steadfast Sentry", rarity: .Common, set: set, number: 40)
        steadfastSentry.setManaCost("2W")
        steadfastSentry.setType(.Creature, .Human, .Soldier)
        steadfastSentry.vigilance = true
        steadfastSentry.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === steadfastSentry.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        steadfastSentry.setFlavorText("\"Get up, slugabeds! We've got company, and they're not dressed for a party!")
        steadfastSentry.power = 3
        steadfastSentry.toughness = 2
        return steadfastSentry
    }
    static func YokedOx() -> Card {
        let yokedOx = Card(name: "Yoked Ox", rarity: .Common, set: set, number: 41)
        yokedOx.setManaCost("W")
        yokedOx.setType(.Creature, .Ox)
        yokedOx.setFlavorText("The courage of those who work the land is born of long days of labor in the hot summer sun and the cold winter wind. It is the courage of the earth itself.")
        yokedOx.power = 0
        yokedOx.toughness = 0
        return yokedOx
    }
    // 42 Aether Gust
    // 43 Agent of Treachery
    static func AirElemental() -> Card {
        let airElemental = Card(name: "Air Elemental", rarity: .Uncommon, set: set, number: 44)
        airElemental.setManaCost("3UU")
        airElemental.setType(.Creature, .Elemental)
        airElemental.flying = true
        airElemental.setFlavorText("As the ship approached, the jade totem rose high overhead. Power rippled. Eyes of stone glowed and crackled. Out hissed a breath of the world, and a windstorm came alive.")
        airElemental.power = 4
        airElemental.toughness = 4
        return airElemental
    }
    // 45 Anticipate
    // 46 Atemsis, All-Seeing
    static func Befuddle() -> Card {
        let befuddle = Card(name: "Befuddle", rarity: .Common, set: set, number: 47)
        befuddle.setManaCost("2U")
        befuddle.setType(.Instant)
        befuddle.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                target.pump(-4, 0)
                befuddle.getController().drawCard()
        }))
        befuddle.setFlavorText("The trick to talking sense into Keldons is getting them to hold still.")
        return befuddle
    }
    static func BoneToAsh() -> Card {
        let boneToAsh = Card(name: "Bone to Ash", rarity: .Uncommon, set: set, number: 48)
        boneToAsh.setManaCost("2UU")
        boneToAsh.setType(.Instant)
        boneToAsh.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreatureSpell(),
            effect: { target in
                target.counter()
                boneToAsh.getController().drawCard()
        }))
        boneToAsh.setFlavorText("\"I can think of worse ways to go. On second thought, maybe not.\"\n--Ludevic, necro-alchemist")
        return boneToAsh
    }
    // 49 Boreal Elemental
    static func BrinebornCutthroat() -> Card {
        let brinebornCutthroat = Card(name: "Brineborn Cutthroat", rarity: .Uncommon, set: set, number: 50)
        brinebornCutthroat.setManaCost("1U")
        brinebornCutthroat.setType(.Creature, .Merfolk, .Pirate)
        brinebornCutthroat.flash = true
        brinebornCutthroat.addTriggeredAbility(
            trigger: .YouCastSpellDuringOpponentsTurn,
            effect: { brinebornCutthroat.addCounter(.PlusOnePlusOne) })
        brinebornCutthroat.setFlavorText("\"I always attack from where their spyglasses can't see.\"")
        brinebornCutthroat.power = 2
        brinebornCutthroat.toughness = 1
        return brinebornCutthroat
    }
    static func CaptivatingGyre() -> Card {
        let captivatingGyre = Card(name: "Captivating Gyre", rarity: .Uncommon, set: set, number: 51)
        captivatingGyre.setManaCost("4UU")
        captivatingGyre.setType(.Sorcery)
        captivatingGyre.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.TargetCreature(optional: true),
                TargetingRestriction.TargetCreature(optional: true),
                TargetingRestriction.TargetCreature(optional: true)
            ],
            effect: { targets in
                for case .some(let target) in targets {
                    target.bounce()
                }
            },
            distinctTargets: true))
        captivatingGyre.setFlavorText("\"That's enough of that.\"\n--Atemsis, All-Seeing")
        return captivatingGyre
    }
    // 52 Cavalier of Gales
    // 53 Cerulean Drake
    static func CloudkinSeer() -> Card {
        let cloudkinSeer = Card(name: "Cloudkin Seer", rarity: .Common, set: set, number: 54)
        cloudkinSeer.setManaCost("2U")
        cloudkinSeer.setType(.Creature, .Elemental, .Wizard)
        cloudkinSeer.flying = true
        cloudkinSeer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { cloudkinSeer.getController().drawCard() })
        cloudkinSeer.setFlavorText("\"I can see which way the wind is blowing.\"")
        cloudkinSeer.power = 2
        cloudkinSeer.toughness = 1
        return cloudkinSeer
    }
    // 55 Convolute
    // 56 Drawn from Dreams
    // 57 Dungeon Geists
    static func FaerieMiscreant() -> Card {
        let name = "Faerie Miscreant"
        let faerieMiscreant = Card(name: name, rarity: .Common, set: set, number: 58)
        faerieMiscreant.setManaCost("U")
        faerieMiscreant.setType(.Creature, .Faerie, .Rogue)
        faerieMiscreant.flying = true
        faerieMiscreant.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { faerieMiscreant.getController().drawCard() },
            restriction: { !faerieMiscreant.getController().getCreatures().filter({ $0 != faerieMiscreant && $0.getName() == name}).isEmpty })
        faerieMiscreant.setFlavorText("One faerie distracts the judge while a second steals the law.")
        faerieMiscreant.power = 1
        faerieMiscreant.toughness = 1
        return faerieMiscreant
    }
    // 59 Flood of Tears
    static func FortressCrab() -> Card {
        let fortressCrab = Card(name: "Fortress Crab", rarity: .Common, set: set, number: 60)
        fortressCrab.setManaCost("3U")
        fortressCrab.setType(.Creature, .Crab)
        fortressCrab.setFlavorText("Unbreakable and unappetizing, the crab grows uninterrupted, sometimes to the size of a cottage and beyond.")
        fortressCrab.power = 1
        fortressCrab.toughness = 6
        return fortressCrab
    }
    static func FrilledSeaSerpent() -> Card {
        let frilledSeaSerpent = Card(name: "Frilled Sea Serpent", rarity: .Common, set: set, number: 61)
        frilledSeaSerpent.setManaCost("4UU")
        frilledSeaSerpent.setType(.Creature, .Serpent)
        frilledSeaSerpent.addActivatedAbility(
            string: "{5}{U}{U}: ~ can't be blocked this turn.",
            cost: Cost.Mana("5UU"),
            effect: { frilledSeaSerpent.giveKeywordUntilEndOfTurn(.Unblockable) })
        frilledSeaSerpent.setFlavorText("\"Reel it in. No, wait! Throw it back!\"\n--Gertrude, deep-sea angler")
        frilledSeaSerpent.power = 4
        frilledSeaSerpent.toughness = 6
        return frilledSeaSerpent
    }
    static func FrostLynx() -> Card {
        let frostLynx = Card(name: "Frost Lynx", rarity: .Common, set: set, number: 62)
        frostLynx.setManaCost("2U")
        frostLynx.setType(.Creature, .Elephant, .Cat)
        frostLynx.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() !== frostLynx.getController() },
                    zones: [.Battlefield]),
                effect: { target in
                    target.tap()
                    target.untapsDuringNextUntapStep = false
            }))
        frostLynx.setFlavorText("It readily attacks much larger prey, knowing retaliation is impossible.")
        frostLynx.power = 2
        frostLynx.toughness = 2
        return frostLynx
    }
    // 63 Hard Cover
    // 64 Leyline of Anticipation
    // 65 Masterful Replication
    static func MetropolisSprite() -> Card {
        let metropolisSprite = Card(name: "Metropolis Sprite", rarity: .Common, set: set, number: 66)
        metropolisSprite.setManaCost("1U")
        metropolisSprite.setType(.Creature, .Faerie, .Rogue)
        metropolisSprite.flying = true
        metropolisSprite.addActivatedAbility(
            string: "{U}: ~ gets +1/-1 until end of turn.",
            cost: Cost.Mana("U"),
            effect: { metropolisSprite.pump(1, -1) })
        metropolisSprite.setFlavorText("\"Well, if that goblin didn't want his tongue pierced, he shouldn't have stuck it out at me.\"")
        metropolisSprite.power = 1
        metropolisSprite.toughness = 2
        return metropolisSprite
    }
    static func MoatPiranhas() -> Card {
        let moatPiranhas = Card(name: "Moat Piranhas", rarity: .Common, set: set, number: 67)
        moatPiranhas.setManaCost("1U")
        moatPiranhas.setType(.Creature, .Fish)
        moatPiranhas.defender = true
        moatPiranhas.setFlavorText("\"Come on, it's not even that deep!\"\n--Gorin the Brazen")
        moatPiranhas.power = 3
        moatPiranhas.toughness = 3
        return moatPiranhas
    }
    // 68 Mu Yanling, Sky Dancer
    static func Negate() -> Card {
        let negate = Card(name: "Negate", rarity: .Common, set: set, number: 69)
        negate.setManaCost("1U")
        negate.setType(.Instant)
        negate.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetNonCreatureSpell(),
            effect: { $0.counter() }
        ))
        negate.setFlavorText("\"As one, nature lifts its voice to tell you this: 'No.'\"")
        return negate
    }
    // 70 Octoprophet
    // 71 Portal of Sanctuary
    // 72 Renowned Weaponsmith
    // 73 Sage's Row Denizen
    static func ScholarOfTheAges() -> Card {
        let scholarOfTheAges = Card(name: "Scholar of the Ages", rarity: .Uncommon, set: set, number: 74)
        scholarOfTheAges.setManaCost("5UU")
        scholarOfTheAges.setType(.Creature, .Human, .Wizard)
        scholarOfTheAges.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.MultiObject(
                restrictions: [
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Instant) || $0.isType(.Sorcery) && $0.getController() === scholarOfTheAges.getController() },
                        zones: [.Graveyard],
                        optional: true),
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Instant) || $0.isType(.Sorcery) && $0.getController() === scholarOfTheAges.getController() },
                        zones: [.Graveyard],
                        optional: true)
                ],
                effect: { targets in
                    for case .some(let target) in targets {
                        target.putIntoHand()
                    }
                },
                distinctTargets: true))
        scholarOfTheAges.setFlavorText("\"I study the past to find hope for the future.\"")
        scholarOfTheAges.power = 3
        scholarOfTheAges.toughness = 3
        return scholarOfTheAges
    }
    static func SleepParalysis() -> Card {
        let sleepParalysis = Card(name: "Sleep Paralysis", rarity: .Common, set: set, number: 75)
        sleepParalysis.setManaCost("3U")
        sleepParalysis.setType(.Enchantment, .Aura)
        sleepParalysis.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { sleepParalysis.attachedTo?.tap() })
        sleepParalysis.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.withoutKeyword(.UntapsDuringUntapStep)},
            layer: .AbilityAddingOrRemoving)
        sleepParalysis.setFlavorText("Sleep doesn't always mean rest.")
        return sleepParalysis
    }
    static func SpectralSailor() -> Card {
        let spectralSailor = Card(name: "Spectral Sailor", rarity: .Uncommon, set: set, number: 76)
        spectralSailor.setManaCost("U")
        spectralSailor.setType(.Creature, .Spirit, .Pirate)
        spectralSailor.flash = true
        spectralSailor.flying = true
        spectralSailor.addActivatedAbility(
            string: "{3}{U}: Draw a card.",
            cost: Cost.Mana("3U"),
            effect: { spectralSailor.getController().drawCard() })
        spectralSailor.setFlavorText("\"Any ship that sails on these mean seas for long is bound to pick up a ghost or two.\"\n--Admiral Beckett Brass")
        spectralSailor.power = 1
        spectralSailor.toughness = 1
        return spectralSailor
    }
    // 77 Tale's End
    static func Unsummon() -> Card {
        let unsummon = Card(name: "Unsummon", rarity: .Common, set: set, number: 78)
        unsummon.setManaCost("U")
        unsummon.setType(.Instant)
        unsummon.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in target.bounce() }))
        unsummon.setFlavorText("\"Don't you have somewhere else to be?\"\n--Sharuum the Hegemon")
        return unsummon
    }
    static func WardenOfEvosIsle() -> Card {
        let wardenOfEvosIsle = Card(name: "Warden of Evos Isle", rarity: .Uncommon, set: set, number: 79)
        wardenOfEvosIsle.setManaCost("2U")
        wardenOfEvosIsle.setType(.Creature, .Bird, .Wizard)
        wardenOfEvosIsle.addStaticAbility(
            requirement: AbilityRequirement.SpellsYouCast(
                source: wardenOfEvosIsle,
                additionalRequirement: { $0.isType(.Creature) && $0.flying }),
            effect: { object in
                object.castingCost = object.getBaseCastingCost().reducedBy(1)
                return object
            },
            layer: .CostReduction)
        wardenOfEvosIsle.setFlavorText("On Evos Isle, the swift and formidable aven enforce the will of the ruling sphinxes.")
        wardenOfEvosIsle.power = 2
        wardenOfEvosIsle.toughness = 2
        return wardenOfEvosIsle
    }
    static func WingedWords() -> Card {
        let wingedWords = Card(name: "Winged Words", rarity: .Common, set: set, number: 80)
        wingedWords.setManaCost("2U")
        wingedWords.setType(.Sorcery)
        wingedWords.addStaticAbility(
            requirement: AbilityRequirement.This(wingedWords),
            effect: { object in
                if !object.getController().getCreatures().filter({ $0.flying }).isEmpty {
                    object.castingCost = object.getBaseCastingCost().reducedBy(1)
                }
                return object
            },
            layer: .CostReduction,
            allZones: true)
        wingedWords.addEffect {
            wingedWords.getController().drawCards(2)
        }
        wingedWords.setFlavorText("Magic written across the sky falls like rain on thirsty ground, bringing forth wisdom in its season.")
        return wingedWords
    }
    static func YaroksWavecrasher() -> Card {
        let yaroksWavecrasher = Card(name: "Yarok's Wavecrasher", rarity: .Uncommon, set: set, number: 81)
        yaroksWavecrasher.setManaCost("3U")
        yaroksWavecrasher.setType(.Creature, .Elemental)
        yaroksWavecrasher.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0 != yaroksWavecrasher && $0.isType(.Creature) && $0.getController() === yaroksWavecrasher.getController()},
                    zones: [.Battlefield]),
                effect: { $0.bounce() }))
        yaroksWavecrasher.setFlavorText("\"Yarok's waters rush and rage\nWhere armies bled into the sand.\"\n--Lament for Bala Ged, stanza 2")
        yaroksWavecrasher.power = 4
        yaroksWavecrasher.toughness = 4
        return yaroksWavecrasher
    }
    static func ZephyrCharge() -> Card {
        let zephyrCharge = Card(name: "Zephyr Charge", rarity: .Common, set: set, number: 82)
        zephyrCharge.setManaCost("1U")
        zephyrCharge.setType(.Enchantment)
        zephyrCharge.addActivatedAbility(
            string: "{1}{U}: Target creature gains flying until end of turn.",
            cost: Cost.Mana("1U"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.giveKeywordUntilEndOfTurn(.Flying) }))
        zephyrCharge.setFlavorText("\"The knights charged forward on wings of wind, and the necromancer's horde roared in helpless rage.\"\n--Krinnea, Siege of the Bone Spire")
        return zephyrCharge
    }
    // 83
    // 84
    // 85
    // 86
    // 87 Blightbeetle
    // 88
    // 89
    // 90
    // 91
    // 92 Bone Splinters
    // 93
    // 94
    static func Disfigure() -> Card {
        // TODO art
        let disfigure = Card(name: "Disfigure", rarity: .Uncommon, set: set, number: 95)
        disfigure.setManaCost("B")
        disfigure.setType(.Instant)
        disfigure.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pump(-2, -2) }))
        disfigure.setFlavorText("\"Let this serve as a reminder of your failure.\"\n--Exdratha, bog witch")
        return disfigure
    }
    // 96 Dread Presence
    // 97
    // 98
    // 99
    // 100
    // 101
    // 102
    // 103
    // 104
    // 105
    static func LegionsEnd() -> Card {
        let legionsEnd = Card(name: "Legion's End", rarity: .Rare, set: set, number: 106)
        legionsEnd.setManaCost("1B")
        legionsEnd.setType(.Sorcery)
        legionsEnd.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() !== legionsEnd.getController() && $0.getConvertedManaCost() <= 2 },
                zones: [.Battlefield]),
            effect: { target in
                let name = target.getName()
                let controller = target.getController()
                target.exile()
                controller.getCreatures().filter({ $0.getName() == name }).forEach({ $0.exile() })
                controller.revealHand()
                controller.getHand().filter({ $0.getName() == name }).forEach({ $0.exile() })
                controller.getGraveyard().filter({ $0.getName() == name }).forEach({ $0.exile() })
        }))
        legionsEnd.setFlavorText("\"With a single word, they were unmade.\"\n--Krinnea, Siege of the Bone Spire")
        return legionsEnd
    }
    // 107 Leyline of the Void
    // 108
    // 109
    // 110
    // 111
    // 112
    // 113 Scheming Symmetry
    // 114
    // 115
    // 116
    static func ThoughtDistortion() -> Card {
        let thoughtDistortion = Card(name: "Thought Distortion", rarity: .Uncommon, set: set, number: 117)
        thoughtDistortion.setManaCost("4BB")
        thoughtDistortion.setType(.Sorcery)
        thoughtDistortion.uncounterable = true
        thoughtDistortion.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.SinglePlayer(restriction: { $0 !== thoughtDistortion.getController() }),
            effect: { target in
                target.revealHand()
                target.getHand().filter({ !$0.isType(.Creature) && !$0.isType(.Land) }).forEach({ $0.exile() })
                target.getGraveyard().filter({ !$0.isType(.Creature) && !$0.isType(.Land) }).forEach({ $0.exile() })
        }))
        thoughtDistortion.setFlavorText("\"The skull is rigid, but the mind is so deliciously supple.\"\n--Eromena the Mind Render")
        return thoughtDistortion
    }
    // 118
    // 119
    // 120
    // 121
    // 122
    // 123 Yarok's Fenlurker
    // 124
    // 125 Cavalier of Flame
    // 126 Chandra, Acolyte of Flame
    // 127 Chandra, Awakened Inferno
    static func ChandraNovicePyromancer() -> Card {
        let chandra = Card(name: "Chandra, Novice Pyromancer", rarity: .Uncommon, set: set, number: 128)
        chandra.setManaCost("3R")
        chandra.setType(.Legendary, .Planeswalker, .Chandra)
        chandra.addActivatedAbility(
            string: "{+1}: Elementals you control get +2/+0 until end of turn.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: { chandra.getController().getCreatures().filter({ $0.isType(.Elemental) }).forEach({ $0.pump(2, 0) }) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        chandra.addActivatedAbility(
            string: "{-1}: Add {R}{R}.",
            cost: Cost.RemoveCounters(.Loyalty, 1),
            effect: { chandra.getController().addMana(color: .Red, 2) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        chandra.addActivatedAbility(
            string: "{-2}: ~ deals 2 damage to any target.",
            cost: Cost.RemoveCounters(.Loyalty, 2),
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { chandra.damage(to: $0, 2) }),
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        chandra.startingLoyalty = 5
        return chandra
    }
    // 129 Chandra's Embercat
    // 130
    // 131 Chandra's Regulator
    // 132 Chandra's Spitfire
    // 133
    // 134
    static func DragonMage() -> Card {
        let dragonMage = Card(name: "Dragon Mage", rarity: .Uncommon, set: set, number: 135)
        dragonMage.setManaCost("5RR")
        dragonMage.setType(.Creature, .Dragon, .Wizard)
        dragonMage.flying = true
        dragonMage.addTriggeredAbility(
            trigger: .ThisDealsCombatDamageToPlayer,
            effect: {
                Game.shared.bothPlayers({ player in
                    player.discardHand()
                    player.drawCards(7)
                })
        })
        dragonMage.setFlavorText("\"Yes, it's huge and strong and breathes fire. But we're smart!\"\n--Tadith the Wise, last words")
        dragonMage.power = 5
        dragonMage.toughness = 5
        return dragonMage
    }
    // 136
    static func EmberHauler() -> Card {
        let emberHauler = Card(name: "Ember Hauler", rarity: .Uncommon, set: set, number: 137)
        emberHauler.setManaCost("RR")
        emberHauler.setType(.Creature, .Goblin)
        emberHauler.addActivatedAbility(
            string: "{1}, Sacrifice ~: It deals 2 damage to any target.",
            cost: Cost.Mana("1").Sacrifice(),
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { emberHauler.damage(to: $0, 2) }
        ))
        emberHauler.setFlavorText("Not every job in the goblin army is glamorous. Actually, <em>no</em> job in the goblin army is glamorous.")
        emberHauler.power = 2
        emberHauler.toughness = 2
        return emberHauler
    }
    // 138
    static func FlameSweep() -> Card {
        let flameSweep = Card(name: "Flame Sweep", rarity: .Uncommon, set: set, number: 139)
        flameSweep.setManaCost("2R")
        flameSweep.setType(.Instant)
        flameSweep.addEffect({
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ creature in
                    if !(creature.getController() === flameSweep.getController() && creature.flying) {
                        flameSweep.damage(to: creature, 2)
                    }
                })
            })
        })
        flameSweep.setFlavorText("\"I have calculated that a dragon in flight, in a single strafing run, can cover an area of--\"\n--Thaedus the Clever, last words")
        return flameSweep
    }
    // 140
    // 141
    // 142
    // 143 Goblin Ringleader
    // 144
    static func Infuriate() -> Card {
        let infuriate = Card(name: "Infuriate", rarity: .Common, set: set, number: 145)
        infuriate.setManaCost("R")
        infuriate.setType(.Instant)
        infuriate.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pump(3, 2) }))
        infuriate.setFlavorText("\"No shirt, no shoes, no service.\"\n--Marketplace sign")
        return infuriate
    }
    // 146
    // 147
    // 148 Leyline of Combustion
    
    // 164 Unchained Berserker
    // 165 Barkhide Troll
    
    static func FerociousPup() -> Card {
        let ferociousPup = Card(name: "Ferocious Pup", rarity: .Common, set: set, number: 171)
        ferociousPup.setManaCost("2G")
        ferociousPup.setType(.Creature, .Wolf)
        ferociousPup.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { ferociousPup.getController().createToken(Wolf()) })
        ferociousPup.setFlavorText("The strongest pack has the finest pups.")
        ferociousPup.power = 0
        ferociousPup.toughness = 1
        return ferociousPup
    }
    // 172
    // 173
    // 174
    static func GrowthCycle() -> Card {
        let name = "Growth Cycle"
        let growthCycle = Card(name: name, rarity: .Common, set: set, number: 175)
        growthCycle.setManaCost("1G")
        growthCycle.setType(.Instant)
        growthCycle.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                let amount = 3 + 2 * growthCycle.getController().getGraveyard().filter({ $0.getName() == name }).count
                target.pump(amount, amount)
        }))
        growthCycle.setFlavorText("\"Shed your faded husks! Emerge sleeker and stronger!\"\n--Tyris, fauna shaman")
        return growthCycle
    }
    
    // 187 Overgrowth Elemental
    // 188
    static func PulseOfMurasa() -> Card {
        let pulseOfMurasa = Card(name: "Pulse of Murasa", rarity: .Uncommon, set: set, number: 189)
        pulseOfMurasa.setManaCost("2G")
        pulseOfMurasa.setType(.Instant)
        pulseOfMurasa.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) || $0.isType(.Land) },
                zones: [.Graveyard]),
            effect: { target in
                target.putIntoHand()
                pulseOfMurasa.getController().gainLife(6)
        }))
        pulseOfMurasa.setFlavorText("\"Little flower twirl and bloom, arise from this your rocky tomb. Little warrior slash and brawl, be born again to free us all.\"")
        return pulseOfMurasa
    }
    
    static func SilverbackShaman() -> Card {
        let silverbackShaman = Card(name: "Silverback Shaman", rarity: .Common, set: set, number: 195)
        silverbackShaman.setManaCost("3GG")
        silverbackShaman.setType(.Creature, .Ape, .Shaman)
        silverbackShaman.trample = true
        silverbackShaman.addTriggeredAbility(
            trigger: .ThisDies,
            effect: {
                silverbackShaman.getController().drawCard()
        })
        silverbackShaman.setFlavorText("The apes of Yavimaya draw strength from the spirits of their ancestors.")
        silverbackShaman.power = 5
        silverbackShaman.toughness = 4
        return silverbackShaman
    }
    // 196
    static func ThrashingBrontodon() -> Card {
        let thrashingBrontodon = Card(name: "Thrashing Brontodon", rarity: .Uncommon, set: set, number: 197)
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
    // 198 Veil of Summer
    
    static func CorpseKnight() -> Card {
        let corpseKnight = Card(name: "Corpse Knight", rarity: .Uncommon, set: set, number: 206)
        corpseKnight.setManaCost("WB")
        corpseKnight.setType(.Creature, .Zombie, .Knight)
        corpseKnight.addTriggeredAbility(
            trigger: .AnotherCreatureEntersBattlefieldUnderYourControl,
            effect: { corpseKnight.eachOpponent({ $0.loseLife(1) }) })
        corpseKnight.setFlavorText("\"With each knight that rode out from the bone-white keep, the queen's soldiers felt their courage failing.\"\n--Krinnea, <em>Siege of the Bone Spire</em>")
        corpseKnight.power = 2
        corpseKnight.toughness = 2
        return corpseKnight
    }
    static func CreepingTrailblazer() -> Card {
        let creepingTrailblazer = Card(name: "Creeping Trailblazer", rarity: .Uncommon, set: set, number: 207)
        creepingTrailblazer.setManaCost("RG")
        creepingTrailblazer.setType(.Creature, .Elemental)
        creepingTrailblazer.addStaticAbility(
            requirement: AbilityRequirement.OtherSubtypeYouControl(
                source: creepingTrailblazer,
                subtype: .Elemental),
            effect: { $0.pumped(1, 0) },
            layer: .PowerToughnessChanging)
        creepingTrailblazer.addActivatedAbility(
            string: "{2}{R}{G}: ~ gets +1/+1 until end of turn for each Elemental you control.",
            cost: Cost.Mana("2RG"),
            effect: {
                let amount = creepingTrailblazer.getController().getPermanents().filter({ $0.isType(.Elemental) }).count
                creepingTrailblazer.pump(amount, amount)
        })
        creepingTrailblazer.setFlavorText("The destruction of a wildfire with the tenacity of a jungle vine.")
        creepingTrailblazer.power = 2
        creepingTrailblazer.toughness = 2
        return creepingTrailblazer
    }
    static func EmpyreanEagle() -> Card {
        let empyreanEagle = Card(name: "Empyrean Eagle", rarity: .Uncommon, set: set, number: 208)
        empyreanEagle.setManaCost("1WU")
        empyreanEagle.setType(.Creature, .Bird, .Spirit)
        empyreanEagle.flying = true
        empyreanEagle.addStaticAbility(
            requirement: AbilityRequirement.OtherCreaturesYouControl(
                source: empyreanEagle,
                additionalRequirement: { $0.flying }),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        empyreanEagle.setFlavorText("All the birds of the skies are the spirit's brood, gathered for safety under its wings.")
        empyreanEagle.power = 2
        empyreanEagle.toughness = 3
        return empyreanEagle
    }
    static func IronrootWarlord() -> Card {
        let ironrootWarlord = Card(name: "Ironroot Warlord", rarity: .Uncommon, set: set, number: 209)
        ironrootWarlord.setManaCost("1GW")
        ironrootWarlord.setType(.Creature, .Treefolk, .Soldier)
        ironrootWarlord.addStaticAbility(
            requirement: AbilityRequirement.This(ironrootWarlord),
            effect: { object in
                object.power = object.getController().getCreatures().count
                return object
            },
            layer: .PowerToughnessCDA,
            allZones: true)
        ironrootWarlord.addActivatedAbility(
            string: "{3}{G}{W}: Create a 1/1 white Soldier creature token.",
            cost: Cost.Mana("3GW"),
            effect: { ironrootWarlord.getController().createToken(Soldier()) })
        ironrootWarlord.setFlavorText("\"Alone, it's a fortification. At the head of its troops, it's a battering ram.\"\n--Skerk Hobnett, wilderness guide")
        ironrootWarlord.toughness = 5
        return ironrootWarlord
    }
    // 210 Kaalia, Zenith Seeker
    // 211
    // 212 Kykar, Wind's Fury
    
    // 217 Risen Reef
    
    // 226 Golos, Tireless Pilgrim
    
    static func ManifoldKey() -> Card {
        let manifoldKey = Card(name: "Manifold Key", rarity: .Uncommon, set: set, number: 230)
        manifoldKey.setManaCost("1")
        manifoldKey.setType(.Artifact)
        manifoldKey.addActivatedAbility(
            string: "{1}, {T}: Untap another target artifact.",
            cost: Cost.Mana("1").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Artifact) && $0 != manifoldKey },
                    zones: [.Battlefield]),
                effect: { $0.untap() }))
        manifoldKey.addActivatedAbility(
            string: "{3}, {T}: Target creature can't be blocked this turn.",
            cost: Cost.Mana("3").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.giveKeywordUntilEndOfTurn(.Unblockable) }))
        manifoldKey.setFlavorText("\"Locks want to be opened, and treasure wants to be free.\"\n--Nayrex Slipfinger, master thief")
        return manifoldKey
    }
    
    static func SteelOverseer() -> Card {
        let steelOverseer = Card(name: "Steel Overseer", rarity: .Rare, set: set, number: 239)
        steelOverseer.setManaCost("2")
        steelOverseer.setType(.Artifact, .Creature, .Construct)
        steelOverseer.addActivatedAbility(
            string: "{T}: Put a +1/+1 counter on each artifact creature you control.",
            cost: Cost.Tap(),
            effect: { steelOverseer.getController().getPermanents().filter({ $0.isType(.Artifact) && $0.isType(.Creature) }).forEach({ $0.addCounter(.PlusOnePlusOne) }) })
        steelOverseer.setFlavorText("\"The world is already run by all manner of machines. One day, they'll remind us of that fact.\"\n--Sargiz Haz, artificer")
        steelOverseer.power = 1
        steelOverseer.toughness = 1
        return steelOverseer
    }
    
    // 244 Cryptic Caves
    
    static func FieldOfTheDead() -> Card {
        let fieldOfTheDead = Card(name: "Field of the Dead", rarity: .Rare, set: set, number: 247)
        fieldOfTheDead.setType(.Land)
        fieldOfTheDead.entersTapped = true
        fieldOfTheDead.addActivatedAbility(
            string: "{T}: Add {C}.",
            cost: Cost.Tap(),
            effect: { fieldOfTheDead.getController().addMana(color: nil) },
            manaAbility: true)
        
        let effect = {
            let uniqueLandNames = Set(fieldOfTheDead.getController().getLands().map({ $0.getName() })).count
            if uniqueLandNames >= 7 {
                fieldOfTheDead.getController().createToken(Zombie())
            }
        }
        
        // TODO: make sure doesn't trigger twice when this etb
        fieldOfTheDead.addTriggeredAbility(trigger: .ThisETB, effect: effect)
        fieldOfTheDead.addTriggeredAbility(trigger: .Landfall, effect: effect)
        return fieldOfTheDead
    }
    
    static func AjanisPridemate() -> Token {
        let ajanisPridemate = Token(name: "Ajani's Pridemate", set: set, number: 1)
        ajanisPridemate.colors = [.White]
        ajanisPridemate.setType(.Creature, .Cat, .Soldier)
        ajanisPridemate.addTriggeredAbility(
            trigger: .YouGainLife,
            effect: { ajanisPridemate.addCounter(.PlusOnePlusOne) }
        )
        ajanisPridemate.power = 2
        ajanisPridemate.toughness = 2
        return ajanisPridemate
    }
    static func Soldier() -> Token {
        let soldier = Token(name: "Soldier", set: set, number: 2)
        soldier.colors = [.White]
        soldier.setType(.Creature, .Soldier)
        soldier.power = 1
        soldier.toughness = 1
        return soldier
    }
    // 3 Spirit
    // 4 Elemental Bird
    // 5 Demon
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 6)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Zombie)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    // 7 Elemental
    static func Wolf() -> Token {
        let wolf = Token(name: "Wolf", set: set, number: 8)
        wolf.colors = [.Green]
        wolf.setType(.Creature, .Wolf)
        wolf.power = 2
        wolf.toughness = 2
        return wolf
    }
    static func Golem() -> Token {
        let golem = Token(name: "Golem", set: set, number: 9)
        golem.setType(.Artifact, .Creature, .Golem)
        golem.power = 3
        golem.toughness = 3
        return golem
    }
    // 10 Treasure
    // 11 Chandra Emblem
    // 12 Mu Yanling Emblem

}
