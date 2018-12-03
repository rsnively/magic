import Foundation

enum LEA {
    static var set = "lea"
    static var count = 295
    
    static var cards = [
        /* Animate Wall, */ Armageddon, /* Balance, BenalishHero, BlackWard, BlazeOfGlory, */ Blessing, /* BlueWard, */ Castle, /* CircleOfProtectionBlue, CircleOfProtectionGreen, CircleOfProtectionRed, CircleOfProtectionWhite, ConsecrateLand, Conversion, */ Crusade, /* DeathWard, */ Disenchant, /* Farmstead, GreenWard, GuardianAngel, HealingSalve, */ HolyArmor, HolyStrength, /* IslandSanctuary, */ Karma, Lance, /* MesaPegasus, */ NorthernPaladin, PearledUnicorn, /* PersonalIncarnation, Purelace, RedWard, Resurrection, ReverseDamage, */ Righteousness, /* SamiteHealer, */ SavannahLions, SerraAngel, SwordsToPlowshares, /* VeteranBodyguard, */ WallOfSwords, /* WhiteKnight, WhiteWard, WrathOfGod, */ AirElemental, AncestrallRecall, /* AnimateArtifact, BlueElementalBlast, Braingeyser, Clone, ControlMagic, CopyArtifact, Counterspell, CreatureBond, DrainPower, */ Feedback, Flight, /* Invisibility, */ Jump, /* Lifetap, LordOfAtlantis, MagicalHack, */ MahamotiDjinn, ManaShort, MerfolkOfThePearlTrident, /* PhantasmalForces, PhantasmalTerrain, */ PhantomMonster, /* PirateShip, PowerLeak, PowerSink, */ ProdigalSorcerer, PsionicBlast, /* PsychicVenom, SeaSerpent, SirensCall, SleightOfMind, SpellBlast, Stasis, StealArtifact, Thoughtlace, TimeWalk, Timetwister, Twiddle, */ Unsummon, /* VesuvanDoppleganger, VolcanicEruption, */ WallOfAir, WallOfWater, WaterElemental,
    ]
    
    // 1 Animate Wall
    static func Armageddon() -> Card {
        let armageddon = Card(name: "Armageddon", rarity: .Rare, set: set, number: 2)
        armageddon.setManaCost("3W")
        armageddon.setType(.Sorcery)
        armageddon.addEffect {
            Game.shared.bothPlayers({ player in
                player.getLands().forEach({ card in player.destroyPermanent(card) })
            })
        }
        return armageddon
    }
    // 3 Balance
    // 4 Benalish Hero
    // 5 Black Ward
    // 6 Blaze of Glory
    static func Blessing() -> Card {
        let blessing = Card(name: "Blessing", rarity: .Rare, set: set, number: 7)
        blessing.setManaCost("WW")
        blessing.setType(.Enchantment, .Aura)
        blessing.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { return $0 })
        blessing.addActivatedAbility(
            string: "{W}: Enchanted creature gets +1/+1 until end of turn.",
            cost: Cost.Mana("W"),
            effect: { blessing.attachedTo?.pump(1, 1) })
        return blessing
    }
    // 8 Blue Ward
    static func Castle() -> Card {
        let castle = Card(name: "Castle", rarity: .Uncommon, set: set, number: 9)
        castle.setManaCost("3W")
        castle.setType(.Enchantment)
        // As of 6th edition, the second part of the ability was removed
        // http://gatherer.wizards.com/Pages/Card/Discussion.aspx?multiverseid=240
        castle.addStaticAbility({ object in
            if !object.isTapped && object.isType(.Creature) && object.getController() === castle.getController() {
                object.toughness = object.getBaseToughness() + 2
            }
            return object
        })
        return castle
    }
    // 10 Circle of Protection: Blue
    // 11 Circle of Protection: Green
    // 12 Circle of Protection: Red
    // 13 Circle of Protection: White
    // 14 Consecrate Land
    // 15 Conversion
    static func Crusade() -> Card {
        let crusade = Card(name: "Crusade", rarity: .Rare, set: set, number: 16)
        crusade.setManaCost("WW")
        crusade.setType(.Enchantment)
        crusade.addStaticAbility({ object in
            if object.isColor(.White) && object.isType(.Creature) {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        return crusade
    }
    // 17 Death Ward
    static func Disenchant() -> Card {
        let disenchant = Card(name: "Disenchant", rarity: .Common, set: set, number: 18)
        disenchant.setManaCost("1W")
        disenchant.setType(.Instant)
        disenchant.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in let _ = target.destroy() }))
        return disenchant
    }
    // 19 Farmstead
    // 20 Green Ward
    // 21 Guardian Angel
    // 22 Healing Salve
    static func HolyArmor() -> Card {
        let holyArmor = Card(name: "Holy Armor", rarity: .Common, set: set, number: 23)
        holyArmor.setManaCost("W")
        holyArmor.setType(.Enchantment, .Aura)
        holyArmor.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.toughness = object.getBaseToughness() + 2
                return object
        })
        holyArmor.addActivatedAbility(
            string: "{W}: Enchanted creature gets +0/+1 until end of turn.",
            cost: Cost.Mana("W"),
            effect: { holyArmor.attachedTo?.pump(0, 1) })
        return holyArmor
    }
    static func HolyStrength() -> Card {
        let holyStrength = Card(name: "Holy Strength", rarity: .Common, set: set, number: 24)
        holyStrength.setManaCost("W")
        holyStrength.setType(.Enchantment, .Aura)
        holyStrength.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 2
                return object
        })
        return holyStrength
    }
    // 25 Island Sanctuary
    static func Karma() -> Card {
        let karma = Card(name: "Karma", rarity: .Uncommon, set: set, number: 26)
        karma.setManaCost("2WW")
        karma.setType(.Enchantment)
        karma.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: {
                let numSwamps = Game.shared.getActivePlayer().getPermanents().filter({ $0.isType(.Swamp) }).count
                karma.damage(to: Game.shared.getActivePlayer(), numSwamps)
        })
        return karma
    }
    static func Lance() -> Card {
        let lance = Card(name: "Lance", rarity: .Uncommon, set: set, number: 27)
        lance.setManaCost("W")
        lance.setType(.Enchantment, .Aura)
        lance.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { $0.firstStrike = true; return $0 })
        return lance
    }
    // 28 Mesa Pegasus
    static func NorthernPaladin() -> Card {
        let northernPaladin = Card(name: "Northern Paladin", rarity: .Rare, set: set, number: 29)
        northernPaladin.setManaCost("2WW")
        northernPaladin.setType(.Creature, .Human, .Knight)
        northernPaladin.addActivatedAbility(
            string: "{W}{W}, {T}: Destroy target black permanent.",
            cost: Cost.Mana("WW").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isPermanent() && $0.isColor(.Black) },
                effect: { let _ = $0.destroy() }))
        northernPaladin.setFlavorText("\"Look to the north; there you will find aid and comfort.\"\n--The Book of Tal")
        northernPaladin.power = 3
        northernPaladin.toughness = 3
        return northernPaladin
    }
    static func PearledUnicorn() -> Card {
        let pearledUnicorn = Card(name: "Pearled Unicorn", rarity: .Common, set: set, number: 30)
        pearledUnicorn.setManaCost("2W")
        pearledUnicorn.setType(.Creature, .Unicorn)
        pearledUnicorn.setFlavorText("\"'Do you know, I always thought Unicorns were faulous monsters, too? I never saw one alive before!' 'Well now that we have seen each other,' said the Unicorn, 'if you'll believe in me, I'll believe in you.'\"\n--Lewis Carroll")
        pearledUnicorn.power = 2
        pearledUnicorn.toughness = 2
        return pearledUnicorn
    }
    // 31 Personal Incarnation
    // 32 Purelace
    // 33 Red Ward
    // 34 Resurrection
    // 35 Reverse Damage
    static func Righteousness() -> Card {
        let righteousness = Card(name: "Righteousness", rarity: .Rare, set: set, number: 36)
        righteousness.setManaCost("W")
        righteousness.setType(.Instant)
        righteousness.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) && $0.blocking },
            effect: { $0.pump(7, 7) }))
        return righteousness
    }
    // 37 Samite Healer
    static func SavannahLions() -> Card {
        let savannahLions = Card(name: "Savannah Lions", rarity: .Rare, set: set, number: 38)
        savannahLions.setManaCost("W")
        savannahLions.setType(.Creature, .Cat)
        savannahLions.setFlavorText("The traditional kings of the jungle command a healthy respect in other climates as well. Relying mainly on their stealth and speed, Savannah Lions can take a victim by surprise, even in the endless flat plains of their homeland.")
        savannahLions.power = 2
        savannahLions.toughness = 1
        return savannahLions
    }
    static func SerraAngel() -> Card {
        let serraAngel = Card(name: "Serra Angel", rarity: .Uncommon, set: set, number: 39)
        serraAngel.setManaCost("3WW")
        serraAngel.setType(.Creature, .Angel)
        serraAngel.flying = true
        serraAngel.vigilance = true
        serraAngel.setFlavorText("Born with wings of light and a sword of faith, this heavenly incarnation embodies both fury and purity.")
        serraAngel.power = 4
        serraAngel.toughness = 4
        return serraAngel
    }
    static func SwordsToPlowshares() -> Card {
        let swordsToPlowshares = Card(name: "Swords to Plowshares", rarity: .Uncommon, set: set, number: 40)
        swordsToPlowshares.setManaCost("W")
        swordsToPlowshares.setType(.Instant)
        swordsToPlowshares.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                let controller = target.getController()
                let power = target.getPower()
                target.exile()
                controller.gainLife(power)
        }))
        return swordsToPlowshares
    }
    // 41 Veteran Bodyguard
    static func WallOfSwords() -> Card {
        let wallOfSwords = Card(name: "Wall of Swords", rarity: .Uncommon, set: set, number: 42)
        wallOfSwords.setManaCost("3W")
        wallOfSwords.setType(.Creature, .Wall)
        wallOfSwords.defender = true
        wallOfSwords.flying = true
        wallOfSwords.setFlavorText("Just as the evil ones approached to slay Justina, she cast a great spell, imbuing her weapons with her own life force. Thus she fulfilled the prophecy: \"In the death of your savior will you find salvation.\"")
        wallOfSwords.power = 3
        wallOfSwords.toughness = 5
        return wallOfSwords
    }
    // 43 White Knight
    // 44 White Ward
    // 45 Wrath of God
    static func AirElemental() -> Card {
        let airElemental = Card(name: "Air Elemental", rarity: .Uncommon, set: set, number: 46)
        airElemental.setManaCost("3UU")
        airElemental.setType(.Creature, .Elemental)
        airElemental.flying = true
        airElemental.setFlavorText("These spirits of air are winsome and wild and cannot be truly contained. Only marginally intelligent, they often substitute whimsy for strategy, delighting in mischief and mayhem.")
        airElemental.power = 4
        airElemental.toughness = 3
        return airElemental
    }
    static func AncestrallRecall() -> Card {
        let ancestrallRecall = Card(name: "Ancestrall Recall", rarity: .Rare, set: set, number: 47)
        ancestrallRecall.setManaCost("U")
        ancestrallRecall.setType(.Instant)
        ancestrallRecall.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { $0.drawCards(3) }
        ))
        return ancestrallRecall
    }
    // 48 Animate Artifact
    // 49 Blue Elemental Blast
    // 50 Braingeyser
    // 51 Clone
    // 52 Control Magic
    // 53 Copy Artifact
    // 54 Counterspell
    // 55 Creature Bond
    // 56 Drain Power
    static func Feedback() -> Card {
        let feedback = Card(name: "Feedback", rarity: .Uncommon, set: set, number: 57)
        feedback.setManaCost("2U")
        feedback.setType(.Enchantment, .Aura)
        feedback.addEnchantAbility(
            restriction: { $0.isType(.Enchantment) },
            effect: { return $0 })
        feedback.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { feedback.damage(to: feedback.attachedTo!.getController(), 1) },
            restriction: {
                if let attachedTo = feedback.attachedTo {
                    return attachedTo.getController().active
                }
                return false
        })
        return feedback
    }
    static func Flight() -> Card {
        let flight = Card(name: "Flight", rarity: .Common, set: set, number: 58)
        flight.setManaCost("U")
        flight.setType(.Enchantment, .Aura)
        flight.addEnchantAbility(
            restriction: { $0.isType(.Creature) },
            effect: { $0.flying = true; return $0 })
        return flight
    }
    // 59 Invisibility
    static func Jump() -> Card {
        let jump = Card(name: "Jump", rarity: .Common, set: set, number: 60)
        jump.setManaCost("U")
        jump.setType(.Instant)
        jump.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.flying = true; return $0 }))
        }))
        return jump
    }
    // 61 Lifetap
    // 62 Lord of Atlantis
    // 63 Magical Hack
    static func MahamotiDjinn() -> Card {
        let mahamotiDjinn = Card(name: "Mahamoti Djinn", rarity: .Rare, set: set, number: 64)
        mahamotiDjinn.setManaCost("4UU")
        mahamotiDjinn.setType(.Creature, .Djinn)
        mahamotiDjinn.flying = true
        mahamotiDjinn.setFlavorText("Of royal blood amongst the spirits of the air, the Mahamoti Djinn rids on the wings of the winds. As dangerous in the gambling hall as he is in battle, he is a master of trickery and misdirection.")
        mahamotiDjinn.power = 5
        mahamotiDjinn.toughness = 6
        return mahamotiDjinn
    }
    static func ManaShort() -> Card {
        let manaShort = Card(name: "Mana Short", rarity: .Rare, set: set, number: 65)
        manaShort.setManaCost("2U")
        manaShort.setType(.Instant)
        manaShort.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { target in
                target.getLands().forEach({ $0.tap() })
                target.getManaPool().empty()
        }))
        return manaShort
    }
    static func MerfolkOfThePearlTrident() -> Card {
        let merfolkOfThePearlTrident = Card(name: "Merfolk of the Pearl Trident", rarity: .Common, set: set, number: 66)
        merfolkOfThePearlTrident.setManaCost("U")
        merfolkOfThePearlTrident.setType(.Creature, .Merfolk)
        merfolkOfThePearlTrident.setFlavorText("Most human scholars believe that Merfolk are the survivors of sunken Atlantis, humans adapted to the water. Merfolk, however, believe that humans sprang forth from Merfolk who adapted themselves in order to explore their last frontier.")
        merfolkOfThePearlTrident.power = 1
        merfolkOfThePearlTrident.toughness = 1
        return merfolkOfThePearlTrident
    }
    // 67 Phantasmal Forces
    // 68 Phantasmal Terrain
    static func PhantomMonster() -> Card {
        let phantomMonster = Card(name: "Phantom Monster", rarity: .Uncommon, set: set, number: 69)
        phantomMonster.setManaCost("3U")
        phantomMonster.setType(.Creature, .Illusion)
        phantomMonster.flying = true
        phantomMonster.setFlavorText("\"While, like a ghastly rapid river,\nThrough the pale door,\nA hideous throng rush out forever,\nAnd laugh--but smile no more.\"\n--Edgar Allen Poe, \"The Haunted Palace\"")
        phantomMonster.power = 3
        phantomMonster.toughness = 3
        return phantomMonster
    }
    // 70 Pirate Ship
    // 71 Power Leak
    // 72 Power Sink
    static func ProdigalSorcerer() -> Card {
        let prodigalSorcerer = Card(name: "Prodigal Sorcerer", rarity: .Common, set: set, number: 73)
        prodigalSorcerer.setManaCost("2U")
        prodigalSorcerer.setType(.Creature, .Human, .Wizard)
        prodigalSorcerer.addActivatedAbility(
            string: "{T}: ~ deals 1 damage to any target.",
            cost: Cost.Tap(),
            effect: TargetedEffect(
                restriction: TargetedEffect.AnyTarget,
                effect: { prodigalSorcerer.damage(to: $0, 1) }))
        prodigalSorcerer.setFlavorText("Occasionally a member of the Institute of Arcane Study acquires a taste for worldly pleasures. Seldom do they have trouble finding employment.")
        prodigalSorcerer.power = 1
        prodigalSorcerer.toughness = 1
        return prodigalSorcerer
    }
    static func PsionicBlast() -> Card {
        let psionicBlast = Card(name: "Psionic Blast", rarity: .Uncommon, set: set, number: 74)
        psionicBlast.setManaCost("2U")
        psionicBlast.setType(.Instant)
        psionicBlast.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { target in
                psionicBlast.damage(to: target, 4)
                psionicBlast.damage(to: psionicBlast.getController(), 2)
        }))
        return psionicBlast
    }
    // 75 Psychic Venom
    // 76 Sea Serpent
    // 77 Siren's Call
    // 78 Sleight of Mind
    // 79 Spell Blast
    // 80 Stasis
    // 81 Steal Artifact
    // 82 Thoughtlace
    // 83 Time Walk
    // 84 Timetwister
    // 85 Twiddle
    static func Unsummon() -> Card {
        let unsummon = Card(name: "Unsummon", rarity: .Common, set: set, number: 86)
        unsummon.setManaCost("U")
        unsummon.setType(.Instant)
        unsummon.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.bounce() }))
        return unsummon
    }
    // 87 Vesuvan Doppleganger
    // 88 Volcanic Eruption
    static func WallOfAir() -> Card {
        let wallOfAir = Card(name: "Wall of Air", rarity: .Uncommon, set: set, number: 89)
        wallOfAir.setManaCost("1UU")
        wallOfAir.setType(.Creature, .Wall)
        wallOfAir.defender = true
        wallOfAir.flying = true
        wallOfAir.setFlavorText("\"This 'standing windstorm' can hold us off indefinitely? Ridiculous!\" Saying nothing, she put a pinch of salt on the table. With a bang she clapped her hands, and the salt disappeared, blown away.")
        wallOfAir.power = 1
        wallOfAir.toughness = 5
        return wallOfAir
    }
    static func WallOfWater() -> Card {
        let wallOfWater = Card(name: "Wall of Water", rarity: .Uncommon, set: set, number: 90)
        wallOfWater.setManaCost("1UU")
        wallOfWater.setType(.Creature, .Wall)
        wallOfWater.defender = true
        wallOfWater.addActivatedAbility(
            string: "{U}: ~ gets +1/+0 until end of turn.",
            cost: Cost.Mana("U"),
            effect: { wallOfWater.pump(1, 0) })
        wallOfWater.setFlavorText("A deafening roar arose as the fury of an enormous vertical river supplanted our serenity. Eddies turned into whirling geysers, leveling everything in their path.")
        wallOfWater.power = 0
        wallOfWater.toughness = 5
        return wallOfWater
    }
    static func WaterElemental() -> Card {
        let waterElemental = Card(name: "Water Elemental", rarity: .Uncommon, set: set, number: 91)
        waterElemental.setManaCost("3UU")
        waterElemental.setType(.Creature, .Elemental)
        waterElemental.setFlavorText("Unpredictable as the sea itself, Water Elementals shift without warning from tranquility to tempest. Capricious and fickle, they flow restlessly from one shape to another, expressing their moods with their physical forms.")
        waterElemental.power = 5
        waterElemental.toughness = 4
        return waterElemental
    }
    // 92 Animate Dead
    static func BadMoon() -> Card {
        let badMoon = Card(name: "Bad Moon", rarity: .Rare, set: set, number: 93)
        badMoon.setManaCost("1B")
        badMoon.setType(.Enchantment)
        badMoon.addStaticAbility({ object in
            if object.isColor(.Black) && object.isType(.Creature) {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        return badMoon
    }
    // 94 Black Knight
    // 95 Bog Wraith
    // 96 Contract from Below
    // 97 Cursed Land
    static func DarkRitual() -> Card {
        let darkRitual = Card(name: "Dark Ritual", rarity: .Common, set: set, number: 98)
        darkRitual.setManaCost("B")
        darkRitual.setType(.Instant)
        darkRitual.addEffect {
            darkRitual.getController().addMana(color: .Black)
            darkRitual.getController().addMana(color: .Black)
            darkRitual.getController().addMana(color: .Black)
        }
        return darkRitual
    }
    // 99 Darkpact
    // 100 Deathgrip
    // 101 Deathlace
    // 102 Demonic Attorney
    // 103 Demonic Hordes
    // 104 Demonic Tutor
    // 105 Drain Life
    // 106 Drudge Skeletons
    // 107 Evil Presence
    // 108 Fear
    static func FrozenShade() -> Card {
        let frozenShade = Card(name: "Frozen Shade", rarity: .Common, set: set, number: 109)
        frozenShade.setManaCost("2B")
        frozenShade.setType(.Creature, .Shade)
        frozenShade.addActivatedAbility(
            string: "{B}: ~ gets +1/+1 until end of turn.",
            cost: Cost.Mana("B"),
            effect: { frozenShade.pump(1, 1) })
        frozenShade.setFlavorText("\"There are some qualities--some incorporate things,/ That have a double life, which thus is made/ A type of twin entity which springs/ From matter and light, evinced in solid and shade.\"\n--Edgar Allen Poe, \"Silence\"")
        frozenShade.power = 2
        frozenShade.toughness = 2
        return frozenShade
    }
    // 110 Gloom
    // 111 Howl from Beyond
    // 112 Hypnotic Spectre
    // 113 Lich
    // 114 Lord of the Pit
    // 115 Mind Twist
    // 116 Nether Shadow
    // 117 Nettling Imp
    // 118 Nightmare
    // 119 Paralyze
    // 120 Pestilence
    // 121 Plague Rats
    // 122 Raise Dead
    static func RoyalAssassin() -> Card {
        let royalAssassin = Card(name: "Royal Assassin", rarity: .Rare, set: set, number: 123)
        royalAssassin.setManaCost("1BB")
        royalAssassin.setType(.Creature, .Human, .Assassin)
        royalAssassin.addActivatedAbility(
            string: "{T}: Destroy target tapped creature.",
            cost: Cost.Tap(),
            // TODO: Shouldn't be able to target itself, as targets are selected before costs are paid
            // https://mtg.gamepedia.com/Casting_spells
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.isTapped },
                effect: { let _ = $0.destroy() }))
        royalAssassin.setFlavorText("Trained in the arts of stealth, the royal assassins choose their victims carefully, relying on timing and precision rather than brute force.")
        royalAssassin.power = 1
        royalAssassin.toughness = 1
        return royalAssassin
    }
    // 124 Sacrifice
    static func ScatheZombies() -> Card {
        let scatheZombies = Card(name: "Scathe Zombies", rarity: .Common, set: set, number: 125)
        scatheZombies.setManaCost("2B")
        scatheZombies.setType(.Creature, .Zombie)
        scatheZombies.setFlavorText("\"They groaned, they stirred, they all uprose,\nNor spake, nor moved their eyes;\nIt had been strange, even in a dream,\nTo have seen those dead men rise.\"\n--Samuel Taylor Colridge, \"The Rime of the Ancient Mariner")
        scatheZombies.power = 2
        scatheZombies.toughness = 2
        return scatheZombies
    }
    // 126 Scavenging Ghoul
    // 127 Sengir Vampire
    // 128 Simulacrum
    static func Sinkhole() -> Card {
        let sinkhole = Card(name: "Sinkhole", rarity: .Common, set: set, number: 129)
        sinkhole.setManaCost("BB")
        sinkhole.setType(.Sorcery)
        sinkhole.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Land) },
            effect: { target in let _ = target.destroy() }))
        return sinkhole
    }
    // 130 Terror
    // 131 Unholy Strength
    // 132 Wall of Bone
    // 133 Warp Artifact
    // 134 Weakness
    // 135 Will-O-The-Wisp
    // 136 Word of Command
    // 137 Zombie Master
    // 138 Burrowing
    // 139 Chaoslace
    // 140 Disintegrate
    // 141 Dragon Whelp
    static func DwarvenDemoltionTeam() -> Card {
        let dwarvenDemolitionTeam = Card(name: "Dwarven Demolition Team", rarity: .Uncommon, set: set, number: 142)
        dwarvenDemolitionTeam.setManaCost("2R")
        dwarvenDemolitionTeam.setType(.Creature, .Dwarf)
        dwarvenDemolitionTeam.addActivatedAbility(
            string: "{T}: Destroy target Wall.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Wall) },
                effect: { let _ = $0.destroy() }))
        dwarvenDemolitionTeam.setFlavorText("Foolishly, Najib retreated to his castle at El-Abar; the next morning he was dead. In just one night, the dwarves had reduced the mighty walls to mere rubble.")
        dwarvenDemolitionTeam.power = 1
        dwarvenDemolitionTeam.toughness = 1
        return dwarvenDemolitionTeam
    }
    static func DwarvenWarriors() -> Card {
        let dwarvenWarriors = Card(name: "Dwarven Warriors", rarity: .Common, set: set, number: 143)
        dwarvenWarriors.setManaCost("2R")
        dwarvenWarriors.setType(.Creature, .Dwarf, .Warrior)
        dwarvenWarriors.addActivatedAbility(
            string: "{T}: Target creature with power 2 or less can't be blocked this turn.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() <= 2 },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.unblockable = true; return $0 }))
        }))
        dwarvenWarriors.power = 1
        dwarvenWarriors.toughness = 1
        return dwarvenWarriors
    }
    static func EarthElemental() -> Card {
        let earthElemental = Card(name: "Earth Elemental", rarity: .Uncommon, set: set, number: 144)
        earthElemental.setManaCost("3RR")
        earthElemental.setType(.Creature, .Elemental)
        earthElemental.setFlavorText("Earth Elementals have the eternal strength of stone and the endurance of mountains. Primordially connected to the land they inhabit, they take a long-term view of things, scorning the impetuous haste of short-lived mortal creatures.")
        earthElemental.power = 4
        earthElemental.toughness = 5
        return earthElemental
    }
    // 145 Earthbind
    // 146 Earthquake
    // 147 False Orders
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: .Uncommon, set: set, number: 148)
        fireElemental.setManaCost("3RR")
        fireElemental.setType(.Creature, .Elemental)
        fireElemental.setFlavorText("Fire Elementals are ruthless infernos, annihilating and consuming their foes in a frenzied holocaust. Crackling and blazing, they sear swift, terrilble paths, leaving the land charred and scorched in their wake.")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    // 149 Fireball
    // 150 Firebreathing
    static func Flashfires() -> Card {
        let flashfires = Card(name: "Flashfires", rarity: .Uncommon, set: set, number: 151)
        flashfires.setManaCost("3R")
        flashfires.setType(.Sorcery)
        flashfires.addEffect {
            Game.shared.bothPlayers({ player in
                player.getLands().filter({$0.isType(.Plains)}).forEach({ let _ = $0.destroy()})
            })
        }
        return flashfires
    }
    // 152 Fork
    static func GoblinBalloonBridgade() -> Card {
        let goblinBalloonBrigade = Card(name: "Goblin Balloon Brigade", rarity: .Uncommon, set: set, number: 153)
        goblinBalloonBrigade.setManaCost("R")
        goblinBalloonBrigade.setType(.Creature, .Goblin, .Warrior)
        goblinBalloonBrigade.addActivatedAbility(
            string: "{R}: ~ gains flying until end of turn.",
            cost: Cost.Mana("R"),
            effect: { goblinBalloonBrigade.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.flying = true; return $0 }))})
        goblinBalloonBrigade.setFlavorText("\"From up here we can drop rocks and arrows and more rocks!\" \"Uh, yeah boss, but how do we get down?")
        goblinBalloonBrigade.power = 1
        goblinBalloonBrigade.toughness = 1
        return goblinBalloonBrigade
    }
    // 154 Goblin King
    static func GraniteGargoyle() -> Card {
        let graniteGargoyle = Card(name: "Granite Gargoyle", rarity: .Rare, set: set, number: 155)
        graniteGargoyle.setManaCost("2R")
        graniteGargoyle.setType(.Creature, .Gargoyle)
        graniteGargoyle.flying = true
        graniteGargoyle.addActivatedAbility(
            string: "{R}: ~ gets +0/+1 until end of turn.",
            cost: Cost.Mana("R"),
            effect: { graniteGargoyle.pump(0, 1) })
        graniteGargoyle.setFlavorText("\"While most overworlders fortunately don't realize this, Gargoyles can be most delicious, providing you have the appropriate tools to carve them.\"\n--The Underworld Cookbook by Asmoranomardicadaistinaculdacar")
        graniteGargoyle.power = 2
        graniteGargoyle.toughness = 2
        return graniteGargoyle
    }
    static func GrayOgre() -> Card {
        let grayOgre = Card(name: "Gray Ogre", rarity: .Common, set: set, number: 156)
        grayOgre.setManaCost("2R")
        grayOgre.setType(.Creature, .Ogre)
        grayOgre.setFlavorText("The Ogre philosopher Gnerdel believed the purpose of life was to live as high on the food chain as possible. She refused to eat vegetarians, and preferred to live entirely on creatures that preyed on sentient beings.")
        grayOgre.power = 2
        grayOgre.toughness = 2
        return grayOgre
    }
    static func HillGiant() -> Card {
        let hillGiant = Card(name: "Hill Giant", rarity: .Common, set: set, number: 157)
        hillGiant.setManaCost("3R")
        hillGiant.setType(.Creature, .Giant)
        hillGiant.setFlavorText("Fortunately, Hill Giants have large blind spots in which a human can easily hide. Unfortunately, these blind spots are beneath the bottoms of their feet.")
        hillGiant.power = 3
        hillGiant.toughness = 3
        return hillGiant
    }
    static func HurloonMinotaur() -> Card {
        let hurloonMinotaur = Card(name: "Hurloon Minotaur", rarity: .Common, set: set, number: 158)
        hurloonMinotaur.setManaCost("1RR")
        hurloonMinotaur.setType(.Creature, .Minotaur)
        hurloonMinotaur.setFlavorText("The Minotaurs of the Hurloon Mountains are known for their love of battle. They are also known for their hymns to the dead, sung for friend and foe alike. These hymns can last for days, filling the mountain valleys with their low, haunting sounds.")
        hurloonMinotaur.power = 2
        hurloonMinotaur.toughness = 3
        return hurloonMinotaur
    }
    // 159 Ironclaw Orcs
    // 160 Keldon Warlord
    static func LightningBolt() -> Card {
        let lightningBolt = Card(name: "Lightning Bolt", rarity: .Common, set: set, number: 161)
        lightningBolt.setManaCost("R")
        lightningBolt.setType(.Instant)
        lightningBolt.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { lightningBolt.damage(to: $0, 3) }))
        return lightningBolt
    }
    // 162 Mana Flare
    // 163 Manabarbs
    static func MonssGoblinRaiders() -> Card {
        let monssGoblinRaiders = Card(name: "Mons's Goblin Raiders", rarity: .Common, set: set, number: 164)
        monssGoblinRaiders.setManaCost("R")
        monssGoblinRaiders.setType(.Creature, .Goblin)
        monssGoblinRaiders.setFlavorText("The intricate dynamics of Rundvelt Goblin affairs are often confused with anarchy. The chaos, however, is the chaos of a thundercloud, and direction will sporadically and violently appear. Pashalik Mons and his raiders are the thunderhead that leads the storm.")
        monssGoblinRaiders.power = 1
        monssGoblinRaiders.toughness = 1
        return monssGoblinRaiders
    }
    static func OrcishArtillery() -> Card {
        let orcishArtillery = Card(name: "Orcish Artillery", rarity: .Uncommon, set: set, number: 165)
        orcishArtillery.setManaCost("1R")
        orcishArtillery.setType(.Creature, .Orc, .Warrior)
        orcishArtillery.addActivatedAbility(
            string: "{T}: ~ deals 2 damage to any target and 3 damage to you.",
            cost: Cost.Tap(),
            effect: TargetedEffect(
                restriction: TargetedEffect.AnyTarget,
                effect: { target in
                    orcishArtillery.damage(to: target, 2)
                    orcishArtillery.damage(to: orcishArtillery.getController(), 3)
        }))
        orcishArtillery.setFlavorText("In a rare display of ingenuity, the Orcs invented an incredibly destructive weapon. Most Orcish artillerists are those who dared criticize its effectiveness.")
        orcishArtillery.power = 1
        orcishArtillery.toughness = 3
        return orcishArtillery
    }
    static func OrcishOriflamme() -> Card {
        let orcishOriflamme = Card(name: "Orcish Oriflamme", rarity: .Uncommon, set: set, number: 166)
        orcishOriflamme.setManaCost("1R")
        orcishOriflamme.setType(.Enchantment)
        orcishOriflamme.addStaticAbility({ object in
            if object.attacking && object.isType(.Creature) && object.getController() === orcishOriflamme.getController() {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        return orcishOriflamme
    }
    // 167 Power Surge
    // 168 Raging River
    // 169 Red Elemental Blast
    static func RocOfKherRidges() -> Card {
        let rocOfKherRidges = Card(name: "Roc of Kher Ridges", rarity: .Rare, set: set, number: 170)
        rocOfKherRidges.setManaCost("3R")
        rocOfKherRidges.setType(.Creature, .Bird)
        rocOfKherRidges.flying = true
        rocOfKherRidges.setFlavorText("We encountered a valley topped with immense boulders and eerie rock formations. Suddenly one of those boulders toppled from its perch and spread gargauntuan wings, casting a shadow of darkness and sending us fleeing in terror.")
        rocOfKherRidges.power = 3
        rocOfKherRidges.toughness = 3
        return rocOfKherRidges
    }
    // 171 Rock Hydra
    // 172 Sedge Troll
    static func Shatter() -> Card {
        let shatter = Card(name: "Shatter", rarity: .Common, set: set, number: 173)
        shatter.setManaCost("1R")
        shatter.setType(.Instant)
        shatter.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) },
            effect: { target in let _ = target.destroy() }))
        return shatter
    }
    static func ShivanDragon() -> Card {
        let shivanDragon = Card(name: "Shivan Dragon", rarity: .Rare, set: set, number: 174)
        shivanDragon.setManaCost("4RR")
        shivanDragon.setType(.Creature, .Dragon)
        shivanDragon.flying = true
        shivanDragon.addActivatedAbility(
            string: "{R}: ~ gets +1/+0 until end of turn.",
            cost: Cost.Mana("R"),
            effect: { shivanDragon.pump(1, 0) })
        shivanDragon.setFlavorText("While it's true most dragons are cruel, the Shivan Dragon seems to take particular glee in the misery of others, often tormenting its victims much like a cat plays with a mouse before delivering the final blow.")
        shivanDragon.power = 5
        shivanDragon.toughness = 5
        return shivanDragon
    }
    // 175 Smoke
    // 176 Stone Giant
    static func StoneRain() -> Card {
        let stoneRain = Card(name: "Stone Rain", rarity: .Common, set: set, number: 177)
        stoneRain.setManaCost("2R")
        stoneRain.setType(.Sorcery)
        stoneRain.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Land) },
            effect: { target in let _ = target.destroy() }))
        return stoneRain
    }
    // 178 Tunnel
    // 179 Two-Headed Giant of Foriys
    // 180 Uthden Troll
    static func WallOfFire() -> Card {
        let wallOfFire = Card(name: "Wall of Fire", rarity: .Uncommon, set: set, number: 181)
        wallOfFire.setManaCost("1RR")
        wallOfFire.setType(.Creature, .Wall)
        wallOfFire.defender = true
        wallOfFire.addActivatedAbility(
            string: "{R}: ~ gets +1/+0 until end of turn.",
            cost: Cost.Mana("R"),
            effect: { wallOfFire.pump(1, 0) })
        wallOfFire.setFlavorText("Conjured from the bowels of hell, the fiery wall forms an impassible barrier, searing the soul of any creature attempting to pass through its terrible bursts of flame.")
        wallOfFire.power = 0
        wallOfFire.toughness = 5
        return wallOfFire
    }
    static func WallOfStone() -> Card {
        let wallOfStone = Card(name: "Wall of Stone", rarity: .Uncommon, set: set, number: 182)
        wallOfStone.setManaCost("1RR")
        wallOfStone.setType(.Creature, .Wall)
        wallOfStone.defender = true
        wallOfStone.setFlavorText("The Earth herself lends her strength to these walls of living stone, which possess the stability of ancient mountains. These mighty bulwarks thwart ground-based troops, providing welcome relief for weary warriors who defend the land.")
        wallOfStone.power = 0
        wallOfStone.toughness = 8
        return wallOfStone
    }
    static func WheelOfFortune() -> Card {
        let wheelOfFortune = Card(name: "Wheel of Fortune", rarity: .Rare, set: set, number: 183)
        wheelOfFortune.setManaCost("2R")
        wheelOfFortune.setType(.Sorcery)
        wheelOfFortune.addEffect {
            Game.shared.bothPlayers({ player in
                player.getHand().forEach({$0.discard()})
                player.drawCards(7)
            })
        }
        return wheelOfFortune
    }
    // 184 Aspect of Wolf
    // 185 Berserk
    static func BirdsOfParadise() -> Card {
        let birdsOfParadise = Card(name: "Birds of Paradise", rarity: .Rare, set: set, number: 186)
        birdsOfParadise.setManaCost("G")
        birdsOfParadise.setType(.Creature, .Bird)
        birdsOfParadise.flying = true
        birdsOfParadise.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { birdsOfParadise.getController().addMana(color: .White) },
            manaAbility: true)
        birdsOfParadise.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { birdsOfParadise.getController().addMana(color: .Blue) },
            manaAbility: true)
        birdsOfParadise.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { birdsOfParadise.getController().addMana(color: .Black) },
            manaAbility: true)
        birdsOfParadise.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { birdsOfParadise.getController().addMana(color: .Red) },
            manaAbility: true)
        birdsOfParadise.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { birdsOfParadise.getController().addMana(color: .Green) },
            manaAbility: true)
        birdsOfParadise.power = 0
        birdsOfParadise.toughness = 1
        return birdsOfParadise
    }
    // 187 Camouflage
    // 188 Channel
    // 189 Cockatrice
    static func CrawWurm() -> Card {
        let crawWurm = Card(name: "Craw Wurm", rarity: .Common, set: set, number: 190)
        crawWurm.setManaCost("4GG")
        crawWurm.setType(.Creature, .Wurm)
        crawWurm.setFlavorText("The most terrifying thing about the Craw Wurm is probably the horrible crashing sound it makes as it speeds through the forest. This noise is so loud it echoes through the trees and seems to come from all directions at once.")
        crawWurm.power = 6
        crawWurm.toughness = 4
        return crawWurm
    }
    // 191 Elvish Archers
    // 192 Fastbond
    // 193 Fog
    // 194 Force of Nature
    // 195 Fungusaur
    // 196 Gaea's Liege
    static func GiantGrowth() -> Card {
        let giantGrowth = Card(name: "Giant Growth", rarity: .Common, set: set, number: 197)
        giantGrowth.setManaCost("G")
        giantGrowth.setType(.Instant)
        giantGrowth.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { $0.pump(3, 3) }))
        return giantGrowth
    }
    static func GiantSpider() -> Card {
        let giantSpider = Card(name: "Giant Spider", rarity: .Common, set: set, number: 198)
        giantSpider.setManaCost("3G")
        giantSpider.setType(.Creature, .Spider)
        giantSpider.reach = true
        giantSpider.setFlavorText("While it possesses potent venom, the Giant Spider often chooses not to paralyze its victims. Perhaps the creature enjoys the gentle rocking motion caused by its captives' struggles to escape its web.")
        giantSpider.power = 2
        giantSpider.toughness = 4
        return giantSpider
    }
    static func GrizzlyBears() -> Card {
        let grizzlyBears = Card(name: "Grizzly Bears", rarity: .Common, set: set, number: 199)
        grizzlyBears.setManaCost("1G")
        grizzlyBears.setType(.Creature, .Bear)
        grizzlyBears.setFlavorText("Don't try to outrun one of Dominaria's Grizzlies; it'll catch you, knock you down, and eat you. Of course, you could run up a tree. In that case you'd get a nice view before it knocks the tree down and eats you.")
        grizzlyBears.power = 2
        grizzlyBears.toughness = 2
        return grizzlyBears
    }
    // 200 Hurricane
    static func IceStorm() -> Card {
        let iceStorm = Card(name: "Ice Rain", rarity: .Uncommon, set: set, number: 201)
        iceStorm.setManaCost("2G")
        iceStorm.setType(.Sorcery)
        iceStorm.addEffect(TargetedEffect.SingleObject(
            restriction: {  return $0.isType(.Land) },
            effect: { target in let _ = target.destroy() }))
        return iceStorm
    }
    // 202 Instill Energy
    static func IronrootTreefolk() -> Card {
        let ironrootTreefolk = Card(name: "Ironroot Treefolk", rarity: .Common, set: set, number: 203)
        ironrootTreefolk.setManaCost("4G")
        ironrootTreefolk.setType(.Creature, .Treefolk)
        ironrootTreefolk.setFlavorText("The mating habits of Treefolk, particularly the stalwart Ironroot Treefolk, are truly absurd. Molasses comes to mind. It's amazing the species can survive at all given such protracted periods of mate selection, conjugation, and gestation.")
        ironrootTreefolk.power = 3
        ironrootTreefolk.toughness = 5
        return ironrootTreefolk
    }
    // 204 Kudzu
    static func LeyDruid() -> Card {
        let leyDruid = Card(name: "Ley Druid", rarity: .Uncommon, set: set, number: 205)
        leyDruid.setManaCost("2G")
        leyDruid.setType(.Creature, .Human, .Druid)
        leyDruid.addActivatedAbility(
            string: "{T}: Untap target land.",
            cost: Cost.Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Land) },
                effect: { target in target.untap() }))
        leyDruid.setFlavorText("After years of training, the Druid becomes one with nature, drawing power from the land and returning it when needed.")
        leyDruid.power = 1
        leyDruid.toughness = 1
        return leyDruid
    }
    // 206 Lifeforce
    // 207 Lifelace
    // 208 Living Artifact
    // 209 Living Lands
    static func LlanowarElves() -> Card {
        let llanowarElves = Card(name: "Llanowar Elves", rarity: .Common, set: set, number: 210)
        llanowarElves.setManaCost("G")
        llanowarElves.setType(.Creature, .Elf)
        llanowarElves.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { llanowarElves.getController().addMana(color: .Green) },
            manaAbility: true)
        llanowarElves.setFlavorText("Whenever the Llanowar Elves gather the fruits of their forest, they leave one plant of each type untouched, considering that nature's portion.")
        llanowarElves.power = 1
        llanowarElves.toughness = 1
        return llanowarElves
    }
    // 211 Lure
    // 212 Natural Selection
    // 213 Regeneration
    // 214 Regrowth
    static func ScrybSprites() -> Card {
        let scrybSprites = Card(name: "Scryb Sprites", rarity: .Common, set: set, number: 215)
        scrybSprites.setManaCost("G")
        scrybSprites.setType(.Creature, .Faerie)
        scrybSprites.flying = true
        scrybSprites.setFlavorText("The only sound was the gentle clicking of the Faeries' wings. Then those intruders who were still standing turned and fled. One thing was certain: they didn't think the Scryb were very funny anymore.")
        scrybSprites.power = 1
        scrybSprites.toughness = 1
        return scrybSprites
    }
    // 216 Shanodin Dryads
    // 217 Stream of Life
    // 218 Thicket Basilisk
    // 219 Timber Wolves
    static func Tranquility() -> Card {
        let tranquility = Card(name: "Tranquility", rarity: .Common, set: set, number: 220)
        tranquility.setManaCost("2G")
        tranquility.setType(.Sorcery)
        tranquility.addEffect {
            Game.shared.bothPlayers({ player in
                player.getEnchantments().forEach({ card in player.destroyPermanent(card) })
            })
        }
        return tranquility
    }
    static func Tsunami() -> Card {
        let tsunami = Card(name: "Tsunami", rarity: .Uncommon, set: set, number: 152)
        tsunami.setManaCost("3G")
        tsunami.setType(.Sorcery)
        tsunami.addEffect {
            Game.shared.bothPlayers({ player in
                player.getLands().filter({$0.isType(.Island)}).forEach({let _ = $0.destroy()})
            })
        }
        return tsunami
    }
    static func VerduranEnchantress() -> Card {
        let verduranEnchantress = Card(name: "Verduran Enchantress", rarity: .Rare, set: set, number: 222)
        verduranEnchantress.setManaCost("1GG")
        verduranEnchantress.setType(.Creature, .Human, .Druid)
        verduranEnchantress.addTriggeredAbility(
            trigger: .YouCastEnchantmentSpell,
            effect: { verduranEnchantress.getController().drawCard() })
        verduranEnchantress.setFlavorText("Some say magic was first practiced by women, who have always felt strong ties to the land.")
        verduranEnchantress.power = 0
        verduranEnchantress.toughness = 2
        return verduranEnchantress
    }
    // 223 Wall of Brambles
    static func WallOfIce() -> Card {
        let wallOfIce = Card(name: "Wall of Ice", rarity: .Uncommon, set: set, number: 224)
        wallOfIce.setManaCost("2G")
        wallOfIce.setType(.Creature, .Wall)
        wallOfIce.defender = true
        wallOfIce.setFlavorText("\"And through the drifts the snowy cliffs| Did send a dismal sheen:| Nor shapes of men nor beasts we ken--| The ice was all between.\"| --Samuel Coleridge, \"The Rime of the Ancient Mariner\"")
        wallOfIce.power = 0
        wallOfIce.toughness = 7
        return wallOfIce
    }
    static func WallOfWood() -> Card {
        let wallOfWood = Card(name: "Wall of Wood", rarity: .Common, set: set, number: 225)
        wallOfWood.setManaCost("G")
        wallOfWood.setType(.Creature, .Wall)
        wallOfWood.defender = true
        wallOfWood.setFlavorText("Everybody knows that to ward off trouble, you knock on wood. But usually it's better to make a wall out of wood and let trouble do the knocking.")
        wallOfWood.power = 0
        wallOfWood.toughness = 3
        return wallOfWood
    }
    // 226 Wanderlust
    // 227 War Mammoth
    // 228 Web
    // 229 Wild Growth
    // 230 Ankh of Mishra
    // 231 Basalt Monolith
    static func BlackLotus() -> Card {
        let blackLotus = Card(name: "Black Lotus", rarity: .Rare, set: set, number: 232)
        blackLotus.setManaCost("")
        blackLotus.setType(.Artifact)
        blackLotus.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {W}{W}{W}.",
            cost: Cost.Tap().Sacrifice(),
            effect: { blackLotus.getController().addMana(color: .White, 3) },
            manaAbility: true)
        blackLotus.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {U}{U}{U}.",
            cost: Cost.Tap().Sacrifice(),
            effect: { blackLotus.getController().addMana(color: .Blue, 3) },
            manaAbility: true)
        blackLotus.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {B}{B}{B}.",
            cost: Cost.Tap().Sacrifice(),
            effect: { blackLotus.getController().addMana(color: .Black, 3) },
            manaAbility: true)
        blackLotus.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {R}{R}{R}.",
            cost: Cost.Tap().Sacrifice(),
            effect: { blackLotus.getController().addMana(color: .Red, 3) },
            manaAbility: true)
        blackLotus.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {G}{G}{G}.",
            cost: Cost.Tap().Sacrifice(),
            effect: { blackLotus.getController().addMana(color: .Green, 3) },
            manaAbility: true)
        return blackLotus
    }
    // 233 Black Vise
    static func CelestialPrism() -> Card {
        let celestialPrism = Card(name: "Celestial Prism", rarity: .Uncommon, set: set, number: 234)
        celestialPrism.setManaCost("3")
        celestialPrism.setType(.Artifact)
        celestialPrism.addActivatedAbility(
            string: "{2}, {T}: Add {W}.",
            cost: Cost.Mana("2").Tap(),
            effect: { celestialPrism.getController().addMana(color: .White) },
            manaAbility: true)
        celestialPrism.addActivatedAbility(
            string: "{2}, {T}: Add {U}.",
            cost: Cost.Mana("2").Tap(),
            effect: { celestialPrism.getController().addMana(color: .Blue) },
            manaAbility: true)
        celestialPrism.addActivatedAbility(
            string: "{2}, {T}: Add {B}.",
            cost: Cost.Mana("2").Tap(),
            effect: { celestialPrism.getController().addMana(color: .Black) },
            manaAbility: true)
        celestialPrism.addActivatedAbility(
            string: "{2}, {T}: Add {R}.",
            cost: Cost.Mana("2").Tap(),
            effect: { celestialPrism.getController().addMana(color: .Red) },
            manaAbility: true)
        celestialPrism.addActivatedAbility(
            string: "{2}, {T}: Add {G}.",
            cost: Cost.Mana("2").Tap(),
            effect: { celestialPrism.getController().addMana(color: .Green) },
            manaAbility: true)
        return celestialPrism
    }
    // 235 Chaos Orbb
    // 236 Clockwork Beast
    // 237 Conservator
    static func CopperTablet() -> Card {
        let copperTablet = Card(name: "Copper Tablet", rarity: .Uncommon, set: set, number: 238)
        copperTablet.setManaCost("2")
        copperTablet.setType(.Artifact)
        copperTablet.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { copperTablet.damage(to: Game.shared.getActivePlayer(), 1) })
        return copperTablet
    }
    // 239 Crystal Rod
    // 240 Cyclopean Tomb
    // 241 Dingus Egg
    // 242 Disrupting Scepter
    // 243 Forcefield
    // 244 Gauntlet of Might
    // 245 Glasses of Urza
    // 246 Helm of Chatzuk
    static func HowlingMine() -> Card {
        let howlingMine = Card(name: "Howling Mine", rarity: .Rare, set: set, number: 247)
        howlingMine.setManaCost("2")
        howlingMine.setType(.Artifact)
        howlingMine.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { Game.shared.getActivePlayer().drawCard() },
            restriction: { !howlingMine.isTapped })
        return howlingMine
    }
    static func IcyManipulator() -> Card {
        let icyManipulator = Card(name: "Icy Manipulator", rarity: .Uncommon, set: set, number: 248)
        icyManipulator.setManaCost("4")
        icyManipulator.setType(.Artifact)
        icyManipulator.addActivatedAbility(
            string: "{1}, {T}: Tap target artifact, creature, or land.",
            cost: Cost.Mana("1").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Land) },
                effect: { target in target.tap() }))
        return icyManipulator
    }
    // 249 Illusionary Mask
    // 250 Iron Star
    // 251 Ivory Cup
    // 252 Jade Monolith
    // 253 Jade Statue
    static func JayemdaeTome() -> Card {
        let jayemdaeTome = Card(name: "Jayemdae Tome", rarity: .Rare, set: set, number: 254)
        jayemdaeTome.setManaCost("4")
        jayemdaeTome.setType(.Artifact)
        jayemdaeTome.addActivatedAbility(
            string: "{4}, {T}: Draw a card",
            cost: Cost.Mana("4").Tap(),
            effect: { jayemdaeTome.getController().drawCard() })
        return jayemdaeTome
    }
    // 255 Juggernaut
    // 256 Kormus Bell
    // 257 Library of Leng
    // 258 Living Wall
    // 259 Mana Vault
    // 260 Meekstone
    static func MoxEmerald() -> Card {
        let moxEmerald = Card(name: "Mox Emerald", rarity: .Rare, set: set, number: 261)
        moxEmerald.setManaCost("")
        moxEmerald.setType(.Artifact)
        moxEmerald.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { moxEmerald.getController().addMana(color: .Green) },
            manaAbility: true)
        return moxEmerald
    }
    static func MoxJet() -> Card {
        let moxJet = Card(name: "Mox Jet", rarity: .Rare, set: set, number: 262)
        moxJet.setManaCost("")
        moxJet.setType(.Artifact)
        moxJet.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { moxJet.getController().addMana(color: .Black) },
            manaAbility: true)
        return moxJet
    }
    static func MoxPearl() -> Card {
        let moxPearl = Card(name: "Mox Pearl", rarity: .Rare, set: set, number: 263)
        moxPearl.setManaCost("")
        moxPearl.setType(.Artifact)
        moxPearl.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { moxPearl.getController().addMana(color: .White) },
            manaAbility: true)
        return moxPearl
    }
    static func MoxRuby() -> Card {
        let moxRuby = Card(name: "Mox Ruby", rarity: .Rare, set: set, number: 264)
        moxRuby.setManaCost("")
        moxRuby.setType(.Artifact)
        moxRuby.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { moxRuby.getController().addMana(color: .Red) },
            manaAbility: true)
        return moxRuby
    }
    static func MoxSapphire() -> Card {
        let moxSapphire = Card(name: "Mox Sapphire", rarity: .Rare, set: set, number: 265)
        moxSapphire.setManaCost("")
        moxSapphire.setType(.Artifact)
        moxSapphire.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { moxSapphire.getController().addMana(color: .Blue) },
            manaAbility: true)
        return moxSapphire
    }
    static func NevinyrralsDisk() -> Card {
        let nevinyrralsDisk = Card(name: "Nevinyrral's Disk", rarity: .Rare, set: set, number: 266)
        nevinyrralsDisk.setManaCost("4")
        nevinyrralsDisk.setType(.Artifact)
        nevinyrralsDisk.entersTapped = true
        nevinyrralsDisk.addActivatedAbility(
            string: "{1}, {T}: Destroy all artifacts, creatures, and enchantments.",
            cost: Cost.Mana("1").Tap(),
            effect: { Game.shared.bothPlayers({ player in
                player.getArtifacts().forEach({ card in player.destroyPermanent(card) })
                player.getCreatures().forEach({ card in player.destroyPermanent(card) })
                player.getEnchantments().forEach({ card in player.destroyPermanent(card) })
            })
        })
        return nevinyrralsDisk
    }
    static func ObsianusGolem() -> Card {
        let obsianusGolem = Card(name: "Obsianus Golem", rarity: .Uncommon, set: set, number: 267)
        obsianusGolem.setManaCost("6")
        obsianusGolem.setType(.Artifact, .Creature, .Golem)
        obsianusGolem.setFlavorText("\"The foot stone is connected to the ankle stone, the ankle stone is connected to the leg stone...\"\n--Song of the Artificer")
        obsianusGolem.power = 4
        obsianusGolem.toughness = 6
        return obsianusGolem
    }
    static func RodOfRuin() -> Card {
        let rodOfRuin = Card(name: "Rod of Ruin", rarity: .Uncommon, set: set, number: 268)
        rodOfRuin.setManaCost("4")
        rodOfRuin.setType(.Artifact)
        rodOfRuin.addActivatedAbility(
            string: "{3}, {T}: ~ deals 1 damage to any target.",
            cost: Cost.Mana("3").Tap(),
            effect: TargetedEffect(
                restriction: TargetedEffect.AnyTarget,
                effect: { rodOfRuin.damage(to: $0, 1) }))
        return rodOfRuin
    }
    static func SolRing() -> Card {
        let solRing = Card(name: "Sol Ring", rarity: .Uncommon, set: set, number: 269)
        solRing.setManaCost("1")
        solRing.setType(.Artifact)
        solRing.addActivatedAbility(
            string: "{T}: Add {C}{C}.",
            cost: Cost.Tap(),
            effect: { solRing.getController().addMana(color: nil, 2) },
            manaAbility: true)
        return solRing
    }
    // 270 Soul Net
    // 271 Sunglasses of Urza
    // 272 The Hive
    // 273 Throne of Bone
    // 274 Time Vault
    // 275 Winter Orb
    // 276 Wooden Sphere
    // 277 Badlands
    // 278 Bayou
    // 279 Plateau
    // 280 Savannah
    // 281 Scrubland
    // 282 Taiga
    // 283 Tropical Island
    // 284 Tundra
    static func UndergroundSea() -> Card {
        let undergroundSea = Card(name: "Underground Sea", rarity: .Rare, set: set, number: 285)
        undergroundSea.setManaCost("")
        undergroundSea.setType(.Land, .Island, .Swamp)
        undergroundSea.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { undergroundSea.getController().addMana(color: .Black) },
            manaAbility: true )
        undergroundSea.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { undergroundSea.getController().addMana(color: .Blue) },
            manaAbility: true )
        return undergroundSea
    }
    // 286 Plains
    // 287 Plains
    // 288 Island
    // 289 Island
    // 290 Swamp
    // 291 Swamp
    // 292 Mountain
    // 293 Mountain
    // 294 Forest
    // 295 Forest
}


