import Foundation

enum HOU {
    static var set = "hou"
    static var count = 199
    
    // 1 Act of Heroism
    // 2 Adorned Pouncer
    // 3 Angel of Condemnation
    // 4 Angel of the God-Pharoah
    static func AvenOfEnduringHope() -> Card {
        let avenOfEnduringHope = Card(name: "Aven of Enduring Hope", rarity: .Common, set: set, number: 5)
        avenOfEnduringHope.setManaCost("4W")
        avenOfEnduringHope.setType(.Creature, .Bird, .Cleric)
        avenOfEnduringHope.flying = true
        avenOfEnduringHope.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { avenOfEnduringHope.getController().gainLife(3) })
        avenOfEnduringHope.setFlavorText("\"This storm will calm. We must believe that.\"")
        avenOfEnduringHope.power = 3
        avenOfEnduringHope.toughness = 3
        return avenOfEnduringHope
    }
    static func CrestedSunmare() -> Card {
        let crestedSunmare = Card(name: "Crested Sunmare", rarity: .Mythic, set: set, number: 6)
        crestedSunmare.setManaCost("3WW")
        crestedSunmare.setType(.Creature, .Horse)
        crestedSunmare.addStaticAbility({ object in
            if object != crestedSunmare && object.isType(.Horse) && object.getController() === crestedSunmare.getController() {
                object.indestructible = true
            }
            return object
        })
        crestedSunmare.addTriggeredAbility(
            trigger: .EachEndStep,
            effect: { crestedSunmare.getController().createToken(Horse()) },
            restriction: { crestedSunmare.getController().lifeGainedThisTurn > 0 })
        crestedSunmare.setFlavorText("\"It is evidence that some pure corner of the world must still exist.\"\n--Djeru, former Tah-crop initiate")
        crestedSunmare.power = 5
        crestedSunmare.toughness = 5
        return crestedSunmare
    }
    static func DauntlessAven() -> Card {
        let dauntlessAven = Card(name: "Dauntless Aven", rarity: .Common, set: set, number: 7)
        dauntlessAven.setManaCost("2W")
        dauntlessAven.setType(.Creature, .Bird, .Warrior)
        dauntlessAven.flying = true
        dauntlessAven.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() === dauntlessAven.getController() },
                effect: { $0.untap() }))
        dauntlessAven.setFlavorText("In the chaos brought by the new gods, swift-winged aven served as pathfinders, leading the last of the people away from the ruins of Naktamun.")
        dauntlessAven.power = 2
        dauntlessAven.toughness = 1
        return dauntlessAven
    }
    // 8 Deserts Hold
    // 9 Disposal Mummy
    // 10 Djeru, With Eyes Open
    // 11 Djeru's Renunciation
    static func DutifulServants() -> Card {
        let dutifulServants = Card(name: "Dutiful Servants", rarity: .Common, set: set, number: 12)
        dutifulServants.setManaCost("3W")
        dutifulServants.setType(.Creature, .Zombie)
        dutifulServants.setFlavorText("Buildings crumbled and monuments fell. The river bled and the sky wept tears of fire. All the while, servants silently continued their work, oblivious to all.")
        dutifulServants.power = 2
        dutifulServants.toughness = 4
        return dutifulServants
    }
    // 13 Gideon's Defeat
    // 14 God-Pharoah's Faithful
    // 15 Hour of Revelation
    // 16 Mummy Paramount
    // 17 Oketra's Avenger
    // 18 Oketra's Last Mercy
    // 19 Overwhelming Splendor
    static func Sandblast() -> Card {
        let sandblast = Card(name: "Sandblast", rarity: .Common, set: set, number: 20)
        sandblast.setManaCost("2W")
        sandblast.setType(.Instant)
        sandblast.addEffect(TargetedEffect.SingleObject(
            restriction: { ($0.isAttacking || $0.blocking) && $0.isType(.Creature) },
            effect: { sandblast.damage(to: $0, 5) }))
        sandblast.setFlavorText("The sands of Amonkhet can be as much a boon as a bane. It depends entirely on which way the wind blows.")
        return sandblast
    }
    // 21 Saving Grace
    // 22 Solemnity
    static func SolitaryCamel() -> Card {
        let solitaryCamel = Card(name: "Solitary Camel", rarity: .Common, set: set, number: 23)
        solitaryCamel.setManaCost("2W")
        solitaryCamel.setType(.Creature, .Camel)
        solitaryCamel.addStaticAbility({ object in
            if object == solitaryCamel {
                let controlDesert = !object.getController().getPermanents().filter({ $0.isType(.Desert) }).isEmpty
                let desertInGraveyard = !object.getController().getGraveyard().filter({ $0.isType(.Desert) }).isEmpty
                if controlDesert || desertInGraveyard {
                    object.lifelink = true
                }
            }
            return object
        })
        solitaryCamel.setFlavorText("Deserts are inhospitable, not uninhabitable.")
        return solitaryCamel
    }
    // 24 Steadfast Sentinel
    // 25 Steward of Solidarity
    // 26 Sunscourge Champion
    // 27 Unconventional Tactics
    // 28 Vizier of the True
    static func AerialGuide() -> Card {
        let aerialGuide = Card(name: "Aerial Guide", rarity: .Common, set: set, number: 29)
        aerialGuide.setManaCost("2U")
        aerialGuide.setType(.Creature, .Drake)
        aerialGuide.flying = true
        aerialGuide.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { $0 != aerialGuide && $0.isAttacking && $0.isType(.Creature) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.flying = true
                    return object
                }))
            }))
        aerialGuide.setFlavorText("\"Kefnet taught us to turn obstacles into advantages.\"\n--Neponem, vizier of Kefnet")
        aerialGuide.power = 2
        aerialGuide.toughness = 2
        return aerialGuide
    }
    static func AvenReedstalker() -> Card {
        let avenReedstalker = Card(name: "Aven Reedstalker", rarity: .Common, set: set, number: 30)
        avenReedstalker.setManaCost("3U")
        avenReedstalker.setType(.Creature, .Bird, .Warrior)
        avenReedstalker.flash = true
        avenReedstalker.flying = true
        avenReedstalker.setFlavorText("\"Our best chance against the Eternals will be tactics they've never seen and styles they've never trained in.\"")
        avenReedstalker.power = 2
        avenReedstalker.toughness = 3
        return avenReedstalker
    }
    // 31 Champion of Wits
    // 32 Countervailing Winds
    // 33 Cunning Survivor
    // 34 Eternal of Harsh Truths
    // 35 Fraying Sanity
    // 36 Hour of Eternity
    // 37 Imaginary Threats
    // 38 Jace's Defeat
    // 39 Kefnet's Last Word
    // 40 Nimble Obstructionist
    // 41 Ominous Sphinx
    // 42 Proven Combatant
    // 43 Riddleform
    // 44 Seer of the Last Tomorrow
    // 45 Sinuous Striker
    // 46 Spellweaver Eternal
    // 47 Strategic Planning
    // 48 Striped Riverwinder
    // 49 Supreme Will
    // 50 Swarm Intelligence
    // 51 Tragic Lesson
    // 52 Unesh, Criosphinx Sovereign
    // 53 Unquenchable Thirst
    static func Unsummon() -> Card {
        let unsummon = Card(name: "Unsummon", rarity: .Common, set: set, number: 54)
        unsummon.setManaCost("U")
        unsummon.setType(.Instant)
        unsummon.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.bounce() }))
        unsummon.setFlavorText("Skills mastered by initiates are preserved within cartouches, so Eternals remain adept at their preferred combat styles.")
        return unsummon
    }
    // 55 Vizier of the Anointed
    static func AccursedHorde() -> Card {
        let accursedHorde = Card(name: "Accursed Horde", rarity: .Uncommon, set: set, number: 56)
        accursedHorde.setManaCost("3B")
        accursedHorde.setType(.Creature, .Zombie)
        accursedHorde.addActivatedAbility(
            string: "{1}{B}: Target attacking Zombie gains indestructible until end of turn.",
            cost: Cost.Mana("1B"),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isAttacking && $0.isType(.Zombie) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.indestructible = true; return $0}) )}
        ))
        accursedHorde.power = 3
        accursedHorde.toughness = 3
        return accursedHorde
    }
    // 57 Ammit Eternal
    // 58 Apocalypse Demon
    // 59 Banewhip Punisher
    // 60 Bontus Last Reckoning
    static func CarrionScreecher() -> Card {
        let carrionScreecher = Card(name: "Carrion Screecher", rarity: .Common, set: set, number: 61)
        carrionScreecher.setManaCost("3B")
        carrionScreecher.setType(.Creature, .Zombie, .Bird)
        carrionScreecher.flying = true
        carrionScreecher.setFlavorText("The banished have come home to roost.")
        carrionScreecher.power = 3
        carrionScreecher.toughness = 1
        return carrionScreecher
    }
    // 62 Doomfall
    // 63 Dreamstealer
    // 64 Grisly Survivor
    // 65 Hour of Glory
    // 66 Khenra Eternal
    // 67 Lethal Sting
    // 68 Liliana's Defeat
    // 69 Lurching Rotbeast
    // 70 Marauding Boneslasher
    // 71 Merciless Eternal
    // 72 Moaning Wall
    // 73 Razaketh, the Foulblooded
    // 74 Razaketh's Rite
    // 75 Ruin Rat
    static func ScroungerOfSouls() -> Card {
        let scroungerOfSouls = Card(name: "Scrounger of Souls", rarity: .Common, set: set, number: 76)
        scroungerOfSouls.setManaCost("4B")
        scroungerOfSouls.setType(.Creature, .Horse)
        scroungerOfSouls.lifelink = true
        scroungerOfSouls.setFlavorText("Yell for help, and that may answer.")
        scroungerOfSouls.power = 3
        scroungerOfSouls.toughness = 4
        return scroungerOfSouls
    }
    // 77 Torment of Hailfire
    // 78 Torment of Scarabs
    // 79 Torment of Venom
    // 80 Vile Manifestation
    // 81 Without Weakness
    static func WretchedCamel() -> Card {
        let wretchedCamel = Card(name: "Wretched Camel", rarity: .Common, set: set, number: 82)
        wretchedCamel.setManaCost("1B")
        wretchedCamel.setType(.Creature, .Zombie, .Camel)
        wretchedCamel.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetedEffect.AnyPlayer,
                effect: { $0.discard() }),
            restriction: {
                let controlDesert = !wretchedCamel.getController().getPermanents().filter({ $0.isType(.Desert) }).isEmpty
                let desertInGraveyard = !wretchedCamel.getController().getGraveyard().filter({ $0.isType(.Desert) }).isEmpty
                return controlDesert || desertInGraveyard
        })
        wretchedCamel.setFlavorText("Perfectly adapted to cross the wastes in life, they bring the wastes with them in death.")
        wretchedCamel.power = 2
        wretchedCamel.toughness = 1
        return wretchedCamel
    }
    // 83 Abrade
    // 84 Blur of Blades
    // 85 Burning-Fist Minotaur
    // 86 Chandra's Defeat
    static func ChaosMaw() -> Card {
        let chaosMaw = Card(name: "Chaos Maw", rarity: .Rare, set: set, number: 87)
        chaosMaw.setManaCost("5RR")
        chaosMaw.setType(.Creature, .Hellion)
        chaosMaw.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                Game.shared.bothPlayers({ $0.getCreatures().forEach({ creature in
                    if creature != chaosMaw {
                        chaosMaw.damage(to: creature, 3)
                    }
                })})
        })
        chaosMaw.setFlavorText("The food chain doesn't end at sandwurms.")
        chaosMaw.power = 6
        chaosMaw.toughness = 6
        return chaosMaw
    }
    static func CrashThrough() -> Card {
        let crashThrough = Card(name: "Crash Through", rarity: .Common, set: set, number: 88)
        crashThrough.setManaCost("R")
        crashThrough.setType(.Sorcery)
        crashThrough.addEffect({
            crashThrough.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
            })
            crashThrough.getController().drawCard()
        })
        crashThrough.setFlavorText("\"We have to get out of this city, Djeru. All of us! Gather as many as you can.\"\n--Samut, former Tah-crop initiate")
        return crashThrough
    }
    static func DefiantKhenra() -> Card {
        let defiantKhenra = Card(name: "Defiant Khenra", rarity: .Common, set: set, number: 89)
        defiantKhenra.setManaCost("1R")
        defiantKhenra.setType(.Creature, .Jackal, .Warrior)
        defiantKhenra.setFlavorText("There were those who saw the death of the gods and the city's collapse as a final test of worth. Some believed it meant the God-Pharoah had been killed. Only a few realized they had been deceived.")
        defiantKhenra.power = 2
        defiantKhenra.toughness = 2
        return defiantKhenra
    }
    // 90 Earthshaker Khenra
    // 91 Fervent Paincaster
    static func FirebrandArcher() -> Card {
        let firebrandArcher = Card(name: "Firebrand Archer", rarity: .Common, set: set, number: 92)
        firebrandArcher.setManaCost("1R")
        firebrandArcher.setType(.Creature, .Human, .Archer)
        firebrandArcher.addTriggeredAbility(
            trigger: .YouCastNoncreatureSpell,
            effect: { firebrandArcher.damage(to: firebrandArcher.getOpponent(), 2) })
        firebrandArcher.setFlavorText("A word of vengeance, and her arrows awaken in flame.")
        firebrandArcher.power = 2
        firebrandArcher.toughness = 1
        return firebrandArcher
    }
    // 93 Frontline Devastator
    // 94 Gilded Cerodon
    // 95 Granitic Titan
    // 96 Hazoret's Undying Fury
    // 97 Hour of Devastation
    // 98 Imminent Doom
    // 99 Inferno Jet
    // 100 Khenra Scrapper
    // 101 Kindled Fury
    // 102 Magmaroth
    // 103 Manticore Eternal
    // 104 Neheb, the Eternal
    static func OpenFire() -> Card {
        let openFire = Card(name: "Open Fire", rarity: .Common, set: set, number: 105)
        openFire.setManaCost("2R")
        openFire.setType(.Instant)
        openFire.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { openFire.damage(to: $0, 3) }))
        openFire.setFlavorText("Some khenra archers fashion their arrows with a personal touch.")
        return openFire
    }
    // 106 Puncturing Blow
    // 107 Sand Strangler
    // 108 Thorned Moloch
    // 109 Wildfire Eternal
    static func Ambuscade() -> Card {
        let ambuscade = Card(name: "Ambuscade", rarity: .Common, set: set, number: 110)
        ambuscade.setManaCost("2G")
        ambuscade.setType(.Instant)
        ambuscade.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === ambuscade.getController() },
                           { $0.isType(.Creature) && $0.getController() !== ambuscade.getController() }],
            effect: { targets in
                targets[0].pump(1, 0)
                targets[0].damage(to: targets[0], targets[1].getPower())
        }))
        ambuscade.setFlavorText("\"Spent a lifetime learning from predators. Picked up a few tricks.\"")
        return ambuscade
    }
    // 111 Beneath the Sands
    static func BitterbowSharpshooters() -> Card {
        let bitterbowSharpshooters = Card(name: "Bitterbow Sharpshooters", rarity: .Common, set: set, number: 112)
        bitterbowSharpshooters.setManaCost("4G")
        bitterbowSharpshooters.setType(.Creature, .Jackal, .Archer)
        bitterbowSharpshooters.vigilance = true
        bitterbowSharpshooters.reach = true
        bitterbowSharpshooters.setFlavorText("\"Remember, brother, the eyes are always vulnerable.\"\n\"I never forget.\"")
        bitterbowSharpshooters.power = 4
        bitterbowSharpshooters.toughness = 4
        return bitterbowSharpshooters
    }
    static func DevoteeOfStrength() -> Card {
        let devoteeOfStrength = Card(name: "Devotee of Strength", rarity: .Uncommon, set: set, number: 113)
        devoteeOfStrength.setManaCost("2G")
        devoteeOfStrength.setType(.Creature, .Naga, .Wizard)
        devoteeOfStrength.addActivatedAbility(
            string: "{4}{G}: Target creature gets +2/+2 until end of turn.",
            cost: Cost.Mana("4G"),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.pump(2, 2) }))
        devoteeOfStrength.setFlavorText("When Rhonas fell, his followers stirred with newfound strength--a final gift from a god they thought indomitable.")
        devoteeOfStrength.power = 3
        devoteeOfStrength.toughness = 2
        return devoteeOfStrength
    }
    // 114 Dune Diviner
    static func FeralProwler() -> Card {
        let feralProwler = Card(name: "Feral Prowler", rarity: .Common, set: set, number: 115)
        feralProwler.setManaCost("1G")
        feralProwler.setType(.Creature, .Cat)
        feralProwler.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { feralProwler.getController().drawCard() })
        feralProwler.setFlavorText("Once favored companions, many cats were left to fend for themselves.")
        feralProwler.power = 1
        feralProwler.toughness = 3
        return feralProwler
    }
    // 116 Frilled Sandwaller
    static func GiftOfStrength() -> Card {
        let giftOfStrength = Card(name: "Gift of Strength", rarity: .Common, set: set, number: 117)
        giftOfStrength.setManaCost("1G")
        giftOfStrength.setType(.Instant)
        giftOfStrength.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: {
                $0.pump(3, 3)
                $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.reach = true; return $0 }))
        }))
        giftOfStrength.setFlavorText("\"What greater testament can there be to Rhonas's lessons?\"")
        return giftOfStrength
    }
    static func HarrierNaga() -> Card {
        let harrierNaga = Card(name: "Harrier Naga", rarity: .Common, set: set, number: 118)
        harrierNaga.setManaCost("2G")
        harrierNaga.setType(.Creature, .Naga, .Warrior)
        harrierNaga.setFlavorText("She trusts that the potent poisons of her darts will reach the enemy before the enemy reaches her.")
        harrierNaga.power = 3
        harrierNaga.toughness = 3
        return harrierNaga
    }
    // 119 Hope Tender
    // 120 Hour of Promise
    // 121 Life Goes On
    // 122 Majestic Myriarch
    // 123 Nissa's Defeat
    // 124 Oasis Ritualist
    static func Overcome() -> Card {
        let overcome = Card(name: "Overcome", rarity: .Uncommon, set: set, number: 125)
        overcome.setManaCost("3GG")
        overcome.setType(.Sorcery)
        overcome.addEffect {
            overcome.getController().getCreatures().forEach({ creature in
                creature.pump(2, 2)
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
            })
        }
        overcome.setFlavorText("\"Forward! Until the horizon is ours!\"\n--Khemses, charioteer")
        return overcome
    }
    // 126 Pride Sovereign
    // 127 Quarry Beetle
    // 128 Rampaging Hippo
    // 129 Ramunap Excavator
    static func RamunapHydra() -> Card {
        let ramunapHydra = Card(name: "Ramunap Hydra", rarity: .Rare, set: set, number: 130)
        ramunapHydra.setManaCost("3G")
        ramunapHydra.setType(.Creature, .Snake, .Hydra)
        ramunapHydra.vigilance = true
        ramunapHydra.reach = true
        ramunapHydra.trample = true
        ramunapHydra.addStaticAbility({ object in
            if object == ramunapHydra {
                if !object.getController().getPermanents().filter({ $0.isType(.Desert) }).isEmpty {
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                }
            }
            return object
        })
        ramunapHydra.addStaticAbility({ object in
            if object == ramunapHydra {
                if !object.getController().getGraveyard().filter({ $0.isType(.Desert) }).isEmpty {
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                }
            }
            return object
        })
        ramunapHydra.power = 3
        ramunapHydra.toughness = 3
        return ramunapHydra
    }
    // 131 Resilient Khenra
    // 132 Rhonas's Last Stand
    // 133 Rhonas's Stalwart
    static func SidewinderNaga() -> Card {
        let sidewinderNaga = Card(name: "Sidewinder Naga", rarity: .Common, set: set, number: 134)
        sidewinderNaga.setManaCost("2G")
        sidewinderNaga.setType(.Creature, .Naga, .Warrior)
        sidewinderNaga.addStaticAbility({ object in
            if object == sidewinderNaga {
                let controlDesert = !object.getController().getPermanents().filter({ $0.isType(.Desert) }).isEmpty
                let desertInGraveyard = !object.getController().getGraveyard().filter({ $0.isType(.Desert) }).isEmpty
                if controlDesert || desertInGraveyard {
                    object.power = object.getBasePower() + 1
                    // TODO: These should be in different layers?
                    object.trample = true
                }
            }
            return object
        })
        sidewinderNaga.setFlavorText("\"Those who embrace the harsh land rather than fight it find they have a powerful ally.\"\n--Nissa Revane")
        sidewinderNaga.power = 3
        sidewinderNaga.toughness = 2
        return sidewinderNaga
    }
    // 135 Sifter Wurm
    // 136 Tenacious Hunter
    // 137 Uncage the Menagerie
    // 138 Bloodwater Entity
    // 139 The Locust God
    // 140 Nicol Bolas, God-Pharoah
    // 141 Obelisk Spider
    // 142 Resolute Survivors
    static func RiverHoopoe() -> Card {
        let riverHoopoe = Card(name: "River Hoopoe", rarity: .Uncommon, set: set, number: 143)
        riverHoopoe.setManaCost("GU")
        riverHoopoe.setType(.Creature, .Bird)
        riverHoopoe.flying = true
        riverHoopoe.addActivatedAbility(
            string: "{3}{G}{U}: You gain 2 life and draw a card.",
            cost: Cost.Mana("3GU"),
            effect: {
                riverHoopoe.getController().gainLife(2)
                riverHoopoe.getController().drawCard()
        })
        riverHoopoe.setFlavorText("\"It's a cruel thing to give such a sad song to such a colorful creature.\"\n--Sana, former Ahn-crop initiate")
        riverHoopoe.power = 1
        riverHoopoe.toughness = 3
        return riverHoopoe
    }
    // 144 Samut, the Tested
    // 145 The Scarab God
    // 146 The Scorpion God
    static func UnravelingMummy() -> Card {
        let unravelingMummy = Card(name: "Unraveling Mummy", rarity: .Uncommon, set: set, number: 147)
        unravelingMummy.setManaCost("1WB")
        unravelingMummy.setType(.Creature, .Zombie)
        unravelingMummy.addActivatedAbility(
            string: "{1}{W}: Target attacking Zombie gains lifelink until end of turn.",
            cost: Cost.Mana("1W"),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isAttacking && $0.isType(.Zombie) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0}) )}
        ))
        unravelingMummy.addActivatedAbility(
            string: "{1}{B}: Target attacking Zombie gains deathtoucn until end of turn.",
            cost: Cost.Mana("1B"),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isAttacking && $0.isType(.Zombie) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0}) )}
        ))
        unravelingMummy.setFlavorText("\"We are no longer in control.\"\n--Elekh, vizier of embalming")
        unravelingMummy.power = 2
        unravelingMummy.toughness = 3
        return unravelingMummy
    }
    // 148 Farm // Market
    // 149 Consign // Oblivion
    // 150 Claim // Fame
    // 151 Struggle // Survive
    // 152 Appeal // Authority
    // 153 Leave // Chance
    // 154 Reason // Believe
    // 155 Grind // Dust
    // 156 Refuse // Cooperate
    // 157 Driven // Despair
    // 158 Abandoned Sarcophagus
    // 159 Crook of Condemnation
    // 160 Dagger of the Worthy
    // 161 God-Pharoah's Gift
    // 162 Graven Abomination
    // 163 Hollow One
    static func Manalith() -> Card {
        let manalith = Card(name: "Manalith", rarity: .Common, set: set, number: 164)
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
        manalith.setFlavorText("\"Though the afterlife, the city, and even the God-Pharoah himself were one great deception, the ideals championed by the gods remain true.\"\n--Djeru, former Tah-crop initiate")
        return manalith
    }
    // 165 Mirage Mirror
    // 166 Sunset Pyramid
    // 167 Traveler's Amulet
    // 168 Wall of Forgotten Pharoahs
    // 169 Crypt of the Eternals
    // 168 Desert of the Fervent
    // 169 Desert of the Glorified
    // 170 Desert of the Indomitable
    // 171 Desert of the Mindful
    // 172 Desert of the True
    // 173 Dunes of the Dead
    // 174 Endless Sands
    // 175 Hashep Oasis
    // 176 Hostile Desert
    // 177 Ifnir Deadlands
    // 178 Ipnu Rivulet
    // 179 Ramunap Ruins
    // 180 Scavenger Grounds
    // 181 Shefet Dunes
    // 182 Survivors' Encampent
    // BASICS
    
    // 1 Adorned Pouncer Eternalized
    // 2 Champion of Wits Eternalized
    // 3 Dreamstealer Eternalized
    // 4 Earthshaker Khenra Eternalized
    // 5 Proven Combatant Eternalized
    // 6 Resilient Khenra Eternalized
    // 7 Sinuous Striker Eternalized
    // 8 Steadfast Sentinel Eternalized
    // 9 Sunscourge Champion Eternalized
    static func Horse() -> Token {
        let horse = Token(name: "Horse", set: set, number: 10)
        horse.colors = [.White]
        horse.setType(.Creature, .Horse)
        horse.power = 5
        horse.toughness = 5
        return horse
    }
    // 11 Snake
    // 12 Insect

}
