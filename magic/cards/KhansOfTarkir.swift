import Foundation

extension Object {
    func ferocious() -> Bool {
        return getController().getPermanents().first(where: { $0.getPower() >= 4 }) != nil
    }
}

enum KTK {
    static let set = "ktk"
    static let count = 269
    
    static func Prowess(_ source: Object) -> TriggeredAbility {
        return UntargetedTriggeredAbility(
            source: source,
            trigger: .YouCastNoncreatureSpell,
            effect: { source.pump(1, 1) })
    }
    
    // 1 Abzan Battle Priest - Sorcery speed abilities
    // 2 Abzan Falconer - Sorcery speed abilities
    // 3 Ainok Bond-Kin - Sorcery speed abilities
    static func AlabasterKirin() -> Card {
        let alabasterKirin = Card(name: "Alabaster Kirin", rarity: .Common, set: set, number: 4)
        alabasterKirin.setManaCost("3W")
        alabasterKirin.setType(.Creature, .Kirin)
        alabasterKirin.flying = true
        alabasterKirin.vigilance = true
        alabasterKirin.setFlavorText("The appearance of a kirin signifies the passing or arrival of an important figure. As word of sightings spread, all the khans took it to mean themselves. Only the shaman Chianul thought of Sarkhan Vol.")
        alabasterKirin.power = 2
        alabasterKirin.toughness = 3
        return alabasterKirin
    }
    // 5 Brave the Sands - Blocking additional creatures
    static func DazzlingRamparts() -> Card {
        let dazzlingRamparts = Card(name: "Dazzling Ramparts", rarity: .Uncommon, set: set, number: 6)
        dazzlingRamparts.setManaCost("4W")
        dazzlingRamparts.setType(.Creature, .Wall)
        dazzlingRamparts.defender = true
        dazzlingRamparts.addActivatedAbility(
            string: "{1}{W}, {T}: Tap target creature.",
            cost: Cost.Mana("1W").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.tap() }))
        dazzlingRamparts.setFlavorText("When Anafenza holds court under the First Tree, the gates of Mer-Ek are sealed. No safer place exists in all of Tarkir.")
        dazzlingRamparts.power = 0
        dazzlingRamparts.toughness = 7
        return dazzlingRamparts
    }
    static func DefiantStrike() -> Card {
        let defiantStrike = Card(name: "Defiant Strike", rarity: .Common, set: set, number: 7)
        defiantStrike.setManaCost("W")
        defiantStrike.setType(.Instant)
        defiantStrike.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: {
                $0.pump(1, 0)
                defiantStrike.getController().drawCard()
        }))
        defiantStrike.setFlavorText("\"Stand where the whole battle can see you. Strike so they'll never forget.\"\n--Anafenza, khan of the Abzan")
        return defiantStrike
    }
    // 8 End Hostilities - Permanents attached to creatures (auras, equipment)
    // 9 Erase - Exile
    // 10 Feat of Resistance - Protection from a color of your choice
    // 11 Firehoof Cavalry - Trample
    // 12 Herald of Anafenza - Sorcery speed abilities, outlast trigger specific to this object
    static func HighSentinelsOfArashin() -> Card {
        let highSentinelsOfArashin = Card(name: "High Sentinels of Arashin", rarity: .Rare, set: set, number: 13)
        highSentinelsOfArashin.setManaCost("3W")
        highSentinelsOfArashin.setType(.Creature, .Bird, .Soldier)
        highSentinelsOfArashin.flying = true
        highSentinelsOfArashin.addStaticAbility({ object in
            if object == highSentinelsOfArashin {
                let numOtherCreaturesWithCounters = highSentinelsOfArashin.getController().getCreatures().filter({ $0 != highSentinelsOfArashin && $0.getCounters(.PlusOnePlusOne) > 0}).count
                object.power = object.getBasePower() + numOtherCreaturesWithCounters
                object.toughness = object.getBaseToughness() + numOtherCreaturesWithCounters
            }
            return object
        })
        highSentinelsOfArashin.addActivatedAbility(
            string: "{3}{W}: Put a +1/+1 counter on target creature.",
            cost: Cost.Mana("3W"),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        highSentinelsOfArashin.power = 3
        highSentinelsOfArashin.toughness = 4
        return highSentinelsOfArashin
    }
    static func JeskaiStudent() -> Card {
        let jeskaiStudent = Card(name: "Jeskai Student", rarity: .Common, set: set, number: 14)
        jeskaiStudent.setManaCost("1W")
        jeskaiStudent.setType(.Creature, .Human, .Monk)
        jeskaiStudent.triggeredAbilities.append(Prowess(jeskaiStudent))
        jeskaiStudent.setFlavorText("Discipline is the first pillar of the Jeskai Way. Each member of the clan trains in a weapon, perfecting its use over a lifetime.")
        jeskaiStudent.power = 1
        jeskaiStudent.toughness = 3
        return jeskaiStudent
    }
    static func KillShot() -> Card {
        let killShot = Card(name: "Kill Shot", rarity: .Common, set: set, number: 15)
        killShot.setManaCost("2W")
        killShot.setType(.Instant)
        killShot.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.attacking },
            effect: { let _ = $0.destroy() }))
        killShot.setFlavorText("Mardu archers have trained in Dakla, the way of the bow. They never miss their target, no matter how small, how fast, or how far away.")
        return killShot
    }
    static func MarduHateblade() -> Card {
        let marduHateblade = Card(name: "Mardu Hateblade", rarity: .Common, set: set, number: 16)
        marduHateblade.setManaCost("W")
        marduHateblade.setType(.Creature, .Human, .Warrior)
        marduHateblade.addActivatedAbility(
            string: "{B}: ~ gains deathtouch until end of turn.",
            cost: Cost.Mana("B"),
            effect: { marduHateblade.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0 }))})
        marduHateblade.setFlavorText("\"There may be little honor in my tactics, but there is no honor in losing.\"")
        marduHateblade.power = 1
        marduHateblade.toughness = 1
        return marduHateblade
    }
    // 17 Mardu Hordechief - Raid, Conditional triggered abilities, attacked with creature this turn
    // 18 Master of Pearls - Morph, turned face up trigger
    static func RushOfBattle() -> Card {
        let rushOfBattle = Card(name: "Rush of Battle", rarity: .Common, set: set, number: 19)
        rushOfBattle.setManaCost("3W")
        rushOfBattle.setType(.Sorcery)
        rushOfBattle.addEffect {
            rushOfBattle.getController().getCreatures().forEach({ creature in
                creature.pump(2, 1)
                if creature.isType(.Warrior) {
                    creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0 }))
                }
            })
        }
        rushOfBattle.setFlavorText("The Mardu charge reflects the dragon's speed--and its hunger.")
        return rushOfBattle
    }
    // 20 Sage-Eye Harrior - Morph
    // 21 Salt Road Patrol - Sorcery speed abilities
    static func SeekerOfTheWay() -> Card {
        let seekerOfTheWay = Card(name: "Seeker of the Way", rarity: .Uncommon, set: set, number: 22)
        seekerOfTheWay.setManaCost("1W")
        seekerOfTheWay.setType(.Creature, .Human, .Warrior)
        seekerOfTheWay.triggeredAbilities.append(Prowess(seekerOfTheWay))
        seekerOfTheWay.addTriggeredAbility(
            trigger: .YouCastNoncreatureSpell,
            effect: { seekerOfTheWay.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0 }))})
        seekerOfTheWay.setFlavorText("\"I don't know where my destiny lies, but I know it isn't here.\"")
        seekerOfTheWay.power = 2
        seekerOfTheWay.toughness = 2
        return seekerOfTheWay
    }
    // 23 Siegecraft - Auras
    static func SmiteTheMonstrous() -> Card {
        let smiteTheMonstrous = Card(name: "Smite the Monstrous", rarity: .Common, set: set, number: 24)
        smiteTheMonstrous.setManaCost("3W")
        smiteTheMonstrous.setType(.Instant)
        smiteTheMonstrous.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
            effect: { let _ = $0.destroy() }))
        smiteTheMonstrous.setFlavorText("\"The dragons thought they were too strong to be tamed, too large to fall. And where are they now?\"\n--Khibat the Revered")
        return smiteTheMonstrous
    }
    // 25 Suspension Field - Exile, Until triggered abilities
    static func TakeUpArms() -> Card {
        let takeUpArms = Card(name: "Take Up Arms", rarity: .Uncommon, set: set, number: 26)
        takeUpArms.setManaCost("4W")
        takeUpArms.setType(.Instant)
        takeUpArms.addEffect {
            takeUpArms.getController().createToken(Warrior())
            takeUpArms.getController().createToken(Warrior())
            takeUpArms.getController().createToken(Warrior())
        }
        takeUpArms.setFlavorText("\"Many scales make the skin of a dragon.\"\n--Abzan wisdom")
        return takeUpArms
    }
    // 27 Timely Hordemate - Raid, Conditionally triggering abilities, Targets in Graveyard
    static func VenerableLammasu() -> Card {
        let venerableLammasu = Card(name: "Venerable Lammasu", rarity: .Uncommon, set: set, number: 28)
        venerableLammasu.setManaCost("6W")
        venerableLammasu.setType(.Creature, .Lammasu)
        venerableLammasu.flying = true
        venerableLammasu.setFlavorText("Lammasu are the enigmatic travelers of Tarkir, soaring high above all lands in all seasons. None know their true purpose, but the often arive on the eve of great conflicts or turning points in history.")
        venerableLammasu.power = 5
        venerableLammasu.toughness = 4
        return venerableLammasu
    }
    // 29 War Behemoth - Morph
    // 30 Watcher of the Roost - Morph, face up trigger
    // 31 Wingmate Roc - Raid, conditionally triggering abilities
    static func BlindingSpray() -> Card {
        let blindingSpray = Card(name: "Blinding Spray", rarity: .Uncommon, set: set, number: 32)
        blindingSpray.setManaCost("4U")
        blindingSpray.setType(.Instant)
        blindingSpray.addEffect {
            blindingSpray.getOpponent().getCreatures().forEach({ $0.pump(-4, 0) })
            blindingSpray.getController().drawCard()
        }
        blindingSpray.setFlavorText("\"The stronger our enemies seem, the more vulnerable they are.\"\n--Sultai secret")
        return blindingSpray
    }
    // 33 Cancel - Countering spells
    // 34 Clever Impersonator - Copy effects
    // 35 Crippling Chill - Doesn't untap effect
    // 36 Dig Through Time - Delve, Card selection
    // 37 Disdainful Stroke - Countering spells
    // 38 Dragon's Eye Savants - Morph, revealing card as cost, face up trigger, reveal cards in hand
    // 39 Embodiment of Spring - Sacrifice as cost, Card selection
    // 40 Force Away - Optional effects, discarding
    // 41 Glacial Stalker - Morph
    // 42 Icy Blast - X in mana Cost, X targets, doesn't untap effect
    // 43 Jeskai Elder - Combat damage to player trigger, optional effects, discarding
    static func JeskaiWindscout() -> Card {
        let jeskaiWindscout = Card(name: "Jeskai Windscout", rarity: .Common, set: set, number: 44)
        jeskaiWindscout.setManaCost("2U")
        jeskaiWindscout.setType(.Creature, .Bird, .Scout)
        jeskaiWindscout.flying = true
        jeskaiWindscout.triggeredAbilities.append(Prowess(jeskaiWindscout))
        jeskaiWindscout.setFlavorText("They range from Sage-Eye Stronghold to the farthest reaches of Tarkir.")
        jeskaiWindscout.power = 2
        jeskaiWindscout.toughness = 1
        return jeskaiWindscout
    }
    // 45 Kheru Spellsnatcher - Morph, face up triggers, countering spell, exile, reflexive trigger, cast from exile, cast without paying mana cost
    // 46 Mistfire Weaver - Morph, face up triggers, hexproof
    // 47 Monastery Flock - Morph
    // 48 Mystic of the Hidden Way - Unblockable, Morph
    // 49 Pearl Lake Ancient - Uncounterable, returning lands to hand as cost
    // 50 Quiet Contemplation - Optional effects, doesn't untap effects
    static func RiverwheelAerialists() -> Card {
        let riverwheelAerialists = Card(name: "Riverwheel Aerialists", rarity: .Uncommon, set: set, number: 51)
        riverwheelAerialists.setManaCost("5U")
        riverwheelAerialists.setType(.Creature, .Djinn, .Monk)
        riverwheelAerialists.flying = true
        riverwheelAerialists.triggeredAbilities.append(Prowess(riverwheelAerialists))
        riverwheelAerialists.setFlavorText("Adepts of the Riverwheel Stronghold can run through rain and never get wet; masters use the raindrops as stepping stones.")
        riverwheelAerialists.power = 4
        riverwheelAerialists.toughness = 5
        return riverwheelAerialists
    }
    // 52 Scaldkin - Sacrifice as cost
    static func ScionOfGlaciers() -> Card {
        let scionOfGlaciers = Card(name: "Scion of Glaciers", rarity: .Uncommon, set: set, number: 53)
        scionOfGlaciers.setManaCost("2UU")
        scionOfGlaciers.setType(.Creature, .Elemental)
        scionOfGlaciers.addActivatedAbility(
            string: "{U}: ~ gets +1/-1 until end of turn.",
            cost: Cost.Mana("U"),
            effect: { scionOfGlaciers.pump(1, -1) })
        scionOfGlaciers.setFlavorText("\"There is nothing so free as the spring river born of winter's ice.\"\n--Nitula, the Hunt Caller")
        scionOfGlaciers.power = 2
        scionOfGlaciers.toughness = 5
        return scionOfGlaciers
    }
    // 54 Set Adrift - Delve
    // 55 Singing Bell Strike - Auras, Doesn't untap effect, Granting activated abilities
    // 56 Stubborn Denial - Countering spells, optional effect
    // 57 Taigam's Scheming - Card selection
    // 58 Thousand Winds - Morph, face up trigger
    // 59 Treasure Cruise - Delve
    // 60 Waterwhirl - Up to two targets
    static func WeaveFate() -> Card {
        let weaveFate = Card(name: "Weave Fate", rarity: .Common, set: set, number: 61)
        weaveFate.setManaCost("3U")
        weaveFate.setType(.Instant)
        weaveFate.addEffect {
            weaveFate.getController().drawCards(2)
        }
        weaveFate.setFlavorText("Temur shamans speak of three destinies: the now, the echo of the past, and the unwritten. They find flickering paths among tangled possibilities.")
        return weaveFate
    }
    static func WetlandSambar() -> Card {
        let wetlandSambar = Card(name: "Wetland Sambar", rarity: .Common, set: set, number: 62)
        wetlandSambar.setManaCost("1U")
        wetlandSambar.setType(.Creature, .Elk)
        wetlandSambar.setFlavorText("As a test of calm and compassion, a Jeskai monk softly approaches a grazing sambar and offers it a lotus from his or her hand. If the creature eats, the student ascends to the next level of training.")
        wetlandSambar.power = 2
        wetlandSambar.toughness = 1
        return wetlandSambar
    }
    // 63 Whirlwind Adept - Hexproof
    // 64 Bellowing Saddlebrute - Raid
    // 65 Bitter Revelation - Card selection
    // 66 Bloodsoaked Champion - Can't block, Raid, Abilities in graveyard
    // 67 Dead Drop - Delve, Sacrifice
    // 68 Debilitating Injury - Auras
    // 69 Despise - Card selection
    // 70 Disowned Ancestor - Outlast
    // 71 Dutiful Return - Up to two, targets in graveyard
    // 72 Empty the Pits - Delve, X in casting cost
    // 73 Grim Haruspex - Morph, Another nontoken creature you control dies trigger
    // 74 Gurmag Swiftwing - First strike
    // 75 Kheru Bloodsucker - Creature you control with toughness 4 or greater dies trigger, Sacrifice another creature as cost
    // 76 Kheru Dreadmaw - Sacrifice another creature as cost, remembering sacrificed creature
    // 77 Krumar Bond-Kin - Morph
    // 78 Mardu Skullhunter - Raid, discard
    // 79 Mer-Ek Nightblade - Outlast
    // 80 Molting Snakeskin - Aura, Granting activated abilities, Regenerate
    // 81 Murderous Cut - Delve
    // 82 Necropolis Fiend - Delve, X in cost, exile cards from graveyard as cost
    // 83 Raiders' Spoils - Warrior you control deals combat damage to a player trigger, optional effect
    // 84 Rakshasa's Secret - Discard
    // 85 Retribution of the Ancients - Remove +1/+1 counters as cost, X in cost
    static func RiteOfTheSerpent() -> Card {
        let riteOfTheSerpent = Card(name: "Rite of the Serpent", rarity: .Common, set: set, number: 86)
        riteOfTheSerpent.setManaCost("4BB")
        riteOfTheSerpent.setType(.Sorcery)
        riteOfTheSerpent.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                let hadCounter = target.getCounters(.PlusOnePlusOne) > 0
                let _ = target.destroy()
                if hadCounter {
                    riteOfTheSerpent.getController().createToken(Snake())
                }
        }))
        riteOfTheSerpent.setFlavorText("\"From your death, new life. From your loss, our profit.\"\n--Kirada, Qarsi overseer")
        return riteOfTheSerpent
    }
    static func RottingMastodon() -> Card {
        let rottingMastodon = Card(name: "Rotting Mastodon", rarity: .Common, set: set, number: 87)
        rottingMastodon.setManaCost("4B")
        rottingMastodon.setType(.Creature, .Zombie, .Elephant)
        rottingMastodon.setFlavorText("Mastodons became extinct long ago, but foul forces of the Gurmag Swamp sometimes animate their decaying remains. The Sultai happily exploit such creatures but consider them inferior to their own necromantic creations.")
        rottingMastodon.power = 2
        rottingMastodon.toughness = 8
        return rottingMastodon
    }
    // 88 Ruthless Ripper - Morph, reveal card in hand as cost, face up trigger
    // 89 Shambling Attendants - Delve
    // 90 Sidisi's Pet - Morph
    // 91 Sultai Scavenger - Delve
    // 92 Swarm of Bloodflies - Enters with counters, whenever another creature dies trigger
    static func Throttle() -> Card {
        let throttle = Card(name: "Throttle", rarity: .Common, set: set, number: 93)
        throttle.setManaCost("4B")
        throttle.setType(.Instant)
        throttle.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { $0.pump(-4, -4) }))
        throttle.setFlavorText("\"The best servants are made from those who died without a scratch.\"\n--Sidisi, khan of the Sultai")
        return throttle
    }
    // 94 Unyielding Krumar - First strike
    // 95 Act of Treason - Control changing effects
    // 96 Ainok Tracker - First strike, morph
    // 97 Arc Lightning - Variable number of targets, divided as you like
    // 98 Arrow Storm - Raid, unpreventable damage
    // 99 Ashcloud Phoenix - Morph, face up trigger
    // 100 Barrage of Boulders - Can't block effect
    static func BloodfireExpert() -> Card {
        let bloodfireExpert = Card(name: "Bloodfire Expert", rarity: .Common, set: set, number: 101)
        bloodfireExpert.setManaCost("2R")
        bloodfireExpert.setType(.Creature, .Efreet, .Monk)
        bloodfireExpert.triggeredAbilities.append(Prowess(bloodfireExpert))
        bloodfireExpert.setFlavorText("Some efreet abandon their homes in the volcanic Fire Rim to embrace the Jeskai Way and discipline their innate flames.")
        bloodfireExpert.power = 3
        bloodfireExpert.toughness = 1
        return bloodfireExpert
    }
    // 102 Bloodfire Mentor - discard
    static func BringLow() -> Card {
        let bringLow = Card(name: "Bring Low", rarity: .Common, set: set, number: 103)
        bringLow.setManaCost("3R")
        bringLow.setType(.Instant)
        bringLow.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                let hasP1P1Counter = target.getCounters(.PlusOnePlusOne) > 0
                bringLow.damage(to: target, hasP1P1Counter ? 5 : 3)
        }))
        bringLow.setFlavorText("\"People are often humbled by the elements. But the elements, too, can be humbled.\"\n-Surrak, khan of the Temur")
        return bringLow
    }
    // 104 Burn Away - Exile, when that creature dies this turn trigger
    // 105 Canyon Lurkers - Morph
    // 106 Crater's Claws - X in casting cost
    // 107 Dragon's Grip - Aura, ability on card in hand, First strike
    // 108 Dragon-Style Twins - Double strike
    // 109 Goblinslide - Optional effects NOTE - the goblin token below does not have haste, it's for hordeling outburst
    // 110 Horde Ambusher - Morph, revealing card from hand as cost, face up trigger, can't block effect
    static func HordelingOutburst() -> Card {
        let hordelingOutburst = Card(name: "Hordeling Outburst", rarity: .Uncommon, set: set, number: 111)
        hordelingOutburst.setManaCost("1RR")
        hordelingOutburst.setType(.Sorcery)
        hordelingOutburst.addEffect {
            hordelingOutburst.getController().createToken(Goblin())
            hordelingOutburst.getController().createToken(Goblin())
            hordelingOutburst.getController().createToken(Goblin())
        }
        hordelingOutburst.setFlavorText("\"Leave no scraps, lest you attract pests.\"\n--Mardu threat")
        return hordelingOutburst
    }
    // 112 Howl of the Horde - Spell copying, next instant or sorcery trigger, raid
    // 113 Jeering Instigator - Morph, face up trigger, control-changing effects
    static func LeapingMaster() -> Card {
        let leapingMaster = Card(name: "Leaping Master", rarity: .Common, set: set, number: 114)
        leapingMaster.setManaCost("1R")
        leapingMaster.setType(.Creature, .Human, .Monk)
        leapingMaster.addActivatedAbility(
            string: "{2}{W}: ~ gains flying until end of turn.",
            cost: Cost.Mana("2W"),
            effect: { leapingMaster.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.flying = true; return $0 }))})
        leapingMaster.setFlavorText("\"Strength batters down barriers. Discipline ignores them.\"")
        leapingMaster.power = 2
        leapingMaster.toughness = 1
        return leapingMaster
    }
    // 115 Mardu Blazebringer - Sacrifice, delayed triggered ability
    // 116 Mardu Heart-Piercer - Raid
    // 117 Mardu Warshrieker - Raid
    static func MonasterySwiftspear() -> Card {
        let monasterySwiftspear = Card(name: "Monastery Swiftspear", rarity: .Uncommon, set: set, number: 118)
        monasterySwiftspear.setManaCost("R")
        monasterySwiftspear.setType(.Creature, .Human, .Monk)
        monasterySwiftspear.haste = true
        monasterySwiftspear.triggeredAbilities.append(Prowess(monasterySwiftspear))
        monasterySwiftspear.setFlavorText("The calligraphy of combat is written with strokes of sudden blood.")
        monasterySwiftspear.power = 1
        monasterySwiftspear.toughness = 2
        return monasterySwiftspear
    }
    // 119 Sarkhan, the Dragonspeaker - Planeswalkers, type-setting effects, base pt effects, emblem
    static func Shatter() -> Card {
        let shatter = Card(name: "Shatter", rarity: .Common, set: set, number: 120)
        shatter.setManaCost("1R")
        shatter.setType(.Instant)
        shatter.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) },
            effect: { target in let _ = target.destroy() }))
        shatter.setFlavorText("The ogre's mind snapped. The bow was next. The archer followed quickly after.")
        return shatter
    }
    static func SummitProwler() -> Card {
        let summitProwler = Card(name: "Summit Prowler", rarity: .Common, set: set, number: 121)
        summitProwler.setManaCost("2RR")
        summitProwler.setType(.Creature, .Yeti)
        summitProwler.setFlavorText("\"Do you hunt the yetis of the high peaks, stripling? They are as fierce as the bear that fears no foe and as sly as mink that creeps unseen. You will be as much prey as they.\"\n--Nitula, the Hunt Caller")
        summitProwler.power = 4
        summitProwler.toughness = 3
        return summitProwler
    }
    static func SwiftKick() -> Card {
        let swiftKick = Card(name: "Swift Kick", rarity: .Common, set: set, number: 122)
        swiftKick.setManaCost("1R")
        swiftKick.setType(.Instant)
        swiftKick.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === swiftKick.getController() },
                           { $0.isType(.Creature) && $0.getController() !== swiftKick.getController() }],
            effect: { targets in
                targets[0].pump(1, 0)
                targets[0].fight(targets[1])
        }))
        swiftKick.setFlavorText("Shintan sensed the malice in his opponent, but he did not strike until the orc's muscles tensed in preparation to throw the first punch.")
        return swiftKick
    }
    // 123 Tormenting Voice - Discarding card as cost
    static func TrumpetBlast() -> Card {
        let trumpetBlast = Card(name: "Trumpet Blast", rarity: .Common, set: set, number: 124)
        trumpetBlast.setManaCost("2R")
        trumpetBlast.setType(.Instant)
        trumpetBlast.addEffect {
            Game.shared.bothPlayers({ $0.getCreatures().filter({$0.attacking}).forEach({ $0.pump(2, 0) }) })
        }
        trumpetBlast.setFlavorText("Do you hear that, Sarkhan? The glory of the horde! I made a legend from what you abandoned.\"\n--Zurgo, khan of the Mardu")
        return trumpetBlast
    }
    // 125 Valley Dasher - Attacks if able
    // 126 War-Name Aspriant - Raid, can't be blocked by creatures power 1 or less effect
    static func AlpineGrizzly() -> Card {
        let alpineGrizzly = Card(name: "Alpine Grizzly", rarity: .Common, set: set, number: 127)
        alpineGrizzly.setManaCost("2G")
        alpineGrizzly.setType(.Creature, .Bear)
        alpineGrizzly.setFlavorText("The Temur welcome bears into the clan, fighting alongside them in battle. The relationship dates back to when they labored side by side under Sultai rule.")
        alpineGrizzly.power = 4
        alpineGrizzly.toughness = 2
        return alpineGrizzly
    }
    static func ArchersParapet() -> Card {
        let archersParapet = Card(name: "Archers' Parapet", rarity: .Common, set: set, number: 128)
        archersParapet.setManaCost("1G")
        archersParapet.setType(.Creature, .Wall)
        archersParapet.defender = true
        archersParapet.addActivatedAbility(
            string: "{1}{B}, {T}: Each opponent loses 1 life.",
            cost: Cost.Mana("1B").Tap(),
            effect: { archersParapet.getOpponent().loseLife(1) })
        archersParapet.setFlavorText("Every shaft is graven with a name from a kin tree, calling upon the spirits of the ancestors to make it fly true.")
        archersParapet.power = 0
        archersParapet.toughness = 5
        return archersParapet
    }
    // 129 Awaken the Bear - Trample
    // 130 Become Immense - Delve
    static func DragonscaleBoon() -> Card {
        let dragonscaleBoon = Card(name: "Dragonscale Boon", rarity: .Common, set: set, number: 131)
        dragonscaleBoon.setManaCost("3G")
        dragonscaleBoon.setType(.Instant)
        dragonscaleBoon.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.addCounters(.PlusOnePlusOne, 2)
                target.untap()
        }))
        dragonscaleBoon.setFlavorText("\"When we were lost and weary, the ainok showed us how to survive. They have earned the right to call themselves Abzan, and to wear the Scale.\"\n--Anafenze, khan of the Abzan")
        return dragonscaleBoon
    }
    static func FeedTheClan() -> Card {
        let feedTheClan = Card(name: "Feed the Clan", rarity: .Common, set: set, number: 132)
        feedTheClan.setManaCost("1G")
        feedTheClan.setType(.Instant)
        feedTheClan.addEffect {
            feedTheClan.getController().gainLife(feedTheClan.ferocious() ? 10 : 5)
        }
        feedTheClan.setFlavorText("The Temur believe three things only are needed in life: a hot fire, a full belly, and a strong companion.")
        return feedTheClan
    }
    // 133 Hardened Scales - Replacement effects
    // 134 Heir of the Wilds - Conditional triggered abilities
    static func HighlandGame() -> Card {
        let highlandGame = Card(name: "Highland Game", rarity: .Common, set: set, number: 135)
        highlandGame.setManaCost("1G")
        highlandGame.setType(.Creature, .Elk)
        highlandGame.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { highlandGame.getController().gainLife(2) })
        highlandGame.setFlavorText("\"Bring down a stag and fix its horns upon Arel's head. This one hears the whispers.\"\n--Chianul, at the weaving of Arel")
        highlandGame.power = 2
        highlandGame.toughness = 1
        return highlandGame
    }
    // 136 Hooded Hydra - X in mana cost, Morph, face up trigger
    // 137 Hooting Mandrills - Delve, Trample
    static func IncrementalGrowth() -> Card {
        let incrementalGrowth = Card(name: "Incremental Growth", rarity: .Uncommon, set: set, number: 138)
        incrementalGrowth.setManaCost("3GG")
        incrementalGrowth.setType(.Sorcery)
        incrementalGrowth.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) },
                           { $0.isType(.Creature) },
                           { $0.isType(.Creature) }],
            effect: { targets in
                targets[0].addCounter(.PlusOnePlusOne)
                targets[1].addCounters(.PlusOnePlusOne, 2)
                targets[2].addCounters(.PlusOnePlusOne, 3)
        }))
        incrementalGrowth.setFlavorText("The bonds of family cross the boundaries of race.")
        return incrementalGrowth
    }
    // 139 Kin-Tree Warden - Morph, Regenerate
    // 140 Mardu Longshot - Outlast
    // 141 Meandering Towershell - Landwalk, Exile, Delayed triggered abilities
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 142)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in let _ = target.destroy() }))
        naturalize.setFlavorText("The remains of ancient sky tyrants now feed the war-torn land.")
        return naturalize
    }
    // 143 Pine Walker - Morph, face up trigger
    // 144 Rattleclaw Mystic - Morph, face up trigger
    // 145 Roar of Challenge - all block if able effect
    // 146 Sagu Archer - Morph
    static func SavagePunch() -> Card {
        let savagePunch = Card(name: "Savage Punch", rarity: .Common, set: set, number: 147)
        savagePunch.setManaCost("1G")
        savagePunch.setType(.Sorcery)
        savagePunch.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === savagePunch.getController() },
                           { $0.isType(.Creature) && $0.getController() !== savagePunch.getController() }],
            effect: { targets in
                if savagePunch.ferocious() { targets[0].pump(2, 2) }
                targets[0].fight(targets[1])
        }))
        return savagePunch
    }
    // 148 Scout the Borders - Card selection
    // 149 See the Unwritten - Card selection
    // 150 Seek the Horizon - Card selection
    // 151 Smoke Teller - Morph, revealing morphs
    // 152 Sultai Flayer - Creature you control with toughness 4 or greater dies trigger
    // 153 Temur Charger - Morph, revealing card as cost, face up trigger, trample
    // 154 Trail of Mystery - Morph, face-down creature ETB trigger, card selection, face up trigger
    static func TuskedColossodon() -> Card {
        let tuskedColossodon = Card(name: "Tusked Colossodon", rarity: .Common, set: set, number: 155)
        tuskedColossodon.setManaCost("4GG")
        tuskedColossodon.setType(.Creature, .Beast)
        tuskedColossodon.setFlavorText("A band of Temur hunters, fleeing the Mardu, dug a hideout beneath such a creature as it slept. The horde found them and attacked. For three days the Temur held them at bay, and all the while the great beast slumbered.")
        tuskedColossodon.power = 6
        tuskedColossodon.toughness = 5
        return tuskedColossodon
    }
    // 156 Tuskguard Captain - Outlast, Trample
    // 157 Windstorm - X in casting cost
    // 158 Woolly Loxodon - Morph
    // 159 Abomination of Gudul - Combat damage to player trigger, optional effect, discard, morph
    // 160 Abzan Ascendancy - Nontoken creature you control dies trigger
    // 161 Abzan Charm - Modal spells, Exile, One or two targets
    // 162 Abzan Guide - Morph
    // 163 Anafenza, the Foremost - Exile, replacement effects
    // 164 Ankle Shanker - First strike
    // 165 Armament Corps - One or two targets
    // 166 Avalanche Tusker - Blocks if able effect
    static func BearsCompanion() -> Card {
        let bearsCompanion = Card(name: "Bear's Companion", rarity: .Uncommon, set: set, number: 167)
        bearsCompanion.setManaCost("2GUR")
        bearsCompanion.setType(.Creature, .Human, .Warrior)
        bearsCompanion.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { bearsCompanion.getController().createToken(Bear()) })
        bearsCompanion.setFlavorText("\"The Sultai came hunting for a bear hide. Now I have a belt of naga skin and my friend has a full belly.\"")
        bearsCompanion.power = 2
        bearsCompanion.toughness = 2
        return bearsCompanion
    }
    // 168 Butcher of the Horde - Sacrifice another creature as cost
    static func ChiefOfTheEdge() -> Card {
        let chiefOfTheEdge = Card(name: "Chief of the Edge", rarity: .Uncommon, set: set, number: 169)
        chiefOfTheEdge.setManaCost("WB")
        chiefOfTheEdge.setType(.Creature, .Human, .Warrior)
        chiefOfTheEdge.addStaticAbility({ object in
            if object.isType(.Warrior) && object.isType(.Creature) && object.getController() === chiefOfTheEdge.getController() && object != chiefOfTheEdge {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        chiefOfTheEdge.setFlavorText("\"We are the swift, the strong, the blade's sharp shriek! Fear nothing, and strike!\"")
        chiefOfTheEdge.power = 3
        chiefOfTheEdge.toughness = 2
        return chiefOfTheEdge
    }
    static func ChiefOfTheScale() -> Card {
        let chiefOfTheScale = Card(name: "Chief of the Scale", rarity: .Uncommon, set: set, number: 170)
        chiefOfTheScale.setManaCost("WB")
        chiefOfTheScale.setType(.Creature, .Human, .Warrior)
        chiefOfTheScale.addStaticAbility({ object in
            if object.isType(.Warrior) && object.isType(.Creature) && object.getController() === chiefOfTheScale.getController() && object != chiefOfTheScale {
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        chiefOfTheScale.setFlavorText("\"We are the shield unbroken. If we fall today, we will die well, and our trees will bear our names in honor.\"")
        chiefOfTheScale.power = 2
        chiefOfTheScale.toughness = 3
        return chiefOfTheScale
    }
    // 171 Crackling Doom - Sacrifice
    // 172 Death Frenzy - Adding triggered abilities to game state
    // 173 Deflecting Palm - Damage prevention, choosing damage source, reflexive trigger
    // 174 Duneblast - Up to one creature, choosing vs targeting
    // 175 Efreet Weaponmaster - First strike, morph, face up trigger
    // 176 Flying Crane Technique - Double Strike
    // 177 Highspire Mantis - Trample
    // 178 Icefeather Aven - Morph, face up trigger
    // 179 Ivorytusk Fortress - Untapping during both upkeeps (not a triggered ability)
    // 180 Jeskai Ascendancy - Optional effect, discard
    // 181 Jeskai Charm - Modal spells
    // 182 Kheru Lich Lord - Optional effects, trample, exile, delayed triggers, replacement effects
    // 183 Kin-Tree Invocation - Token with base power/toughness X
    static func MantisRider() -> Card {
        let mantisRider = Card(name: "Mantis Rider", rarity: .Rare, set: set, number: 184)
        mantisRider.setManaCost("URW")
        mantisRider.setType(.Creature, .Human, .Monk)
        mantisRider.flying = true
        mantisRider.vigilance = true
        mantisRider.haste = true
        mantisRider.setFlavorText("Mantis riders know their mounts owe them no allegience. Even a mantis ridden for years would consume a rider who loses focus for only a moment.")
        mantisRider.power = 3
        mantisRider.toughness = 3
        return mantisRider
    }
    // 185 Mardu Ascendanct - Whenever a nontoken creature you control attacks trigger, sacrifice this as cost
    // 186 Mardu Charm - Modal spells, first strike, revealing hand, card selection, discard
    // 187 Mardu Roughrider - Can't block effect
    static func MasterTheWay() -> Card {
        let masterTheWay = Card(name: "Master the Way", rarity: .Rare, set: set, number: 188)
        masterTheWay.setManaCost("3UR")
        masterTheWay.setType(.Sorcery)
        masterTheWay.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { target in
                masterTheWay.getController().drawCard()
                let cardsInHand = masterTheWay.getController().getHand().count
                masterTheWay.damage(to: target, cardsInHand)
        }))
        masterTheWay.setFlavorText("\"The Way has no beginning and no end. It is simply the path.\"\n--Narset, khan of the Jeskai")
        return masterTheWay
    }
    // 189 Mindswipe - Optional effects, countering spells
    // 190 Narset, Enlightened Master - First strike, hexproof, exile, cast without paying cost
    // 191 Ponyback Brigade - Morph, face up trigger
    // 192 Rakshasa Deathdealer - Regeneration
    // 193 Rakshasa Vizier - Exile, whenever cards are put into exile from graveyard trigger
    // 194 Ride Down - Trample
    static func SageOfTheInwardEye() -> Card {
        let sageOfTheInwardEye = Card(name: "Sage of the Inward Eye", rarity: .Rare, set: set, number: 195)
        sageOfTheInwardEye.setManaCost("2URW")
        sageOfTheInwardEye.setType(.Creature, .Djinn, .Wizard)
        sageOfTheInwardEye.flash = true
        sageOfTheInwardEye.addTriggeredAbility(
            trigger: .YouCastNoncreatureSpell,
            effect: { sageOfTheInwardEye.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.lifelink = true; return $0 }))
            })
        })
        sageOfTheInwardEye.setFlavorText("\"No one petal claims beauty for the lotus.\"")
        sageOfTheInwardEye.power = 3
        sageOfTheInwardEye.toughness = 4
        return sageOfTheInwardEye
    }
    // 196 Sagu Mauler - Trample, Hexproof, Morph
    // 197 Savage Knuckleblade - Activate this only once per turn
    // 198 Secret Plans - Morph, Face up trigger
    // 199 Sidisi, Brood Tyrant - Whenever one or more creature cards are put into your graveyard from your library trigger
    // 200 Siege Rhino - Trample
    // 201 Snowhorn Rider - Trample, Morph
    // 202 Sorin, Solemn Visitor - Planeswalkers, Emblem, Sacrifice
    // 203 Sultai Ascendancy - Card selection
    // 204 Sultai Charm - Modal Spells, Discard
    // 205 Sultai Soothsayer - Card selection
    // 206 Surrak Dragonclaw - Uncounterable, Trample
    // 207 Temur Ascendancy - Creature with power 4 or greater ETB trigger
    // 208 Temur Charm - Modal spells, Countering spells, Optional effects, can't block effect
    // 209 Trap Essence - Countering spells, up to one target
    // 210 Utter End - Exile
    // 211 Villainous Wealth - X in casting cost, exile, cast without paying cost
    // 212 Warden of the Eye - Targeting cards in graveyard
    // 213 Winterflame - Modal Spells
    // 214 Zurgo Helmsmasher - Attacks if able effect, Creature dealt damage by this dies trigger
    // 215 Abzan Banner - Sacrifice this as cost
    // 216 Altar of the Brood - Whenever another permanent enters the battlefield under your control trigger
    // 217 Briber's Purse - X in casting cost, Removing counters as cost, Can't attack effect, Can't block effect
    // 218 Cranial Archive - Exile this as cost
    // 219 Dragon Throne of Tarkir - Equipment, Giving activated abilities, Trample
    // 220 Ghostfire Blade - Equipment, Cost-reducing effects
    // 221 Heart-Piercer Bow - Equipment, Whenever equipped creature attacks trigger
    // 222 Jeskai Banner - Sacrifice this as cost
    // 223 Lens of Clarity - Revealed top of library, revealed face-down creatures, morph
    // 224 Mardu Banner - Sacrifice this as cost
    // 225 Sultai Banner - Sacrifice this as cost
    // 226 Temur  Banner - Sacrifice this as cost
    // 227 Ugin's Nexus - Extra turns, replacement effects, Exile
    // 228 Witness of the Ages - Morph
    static func BloodfellCaves() -> Card {
        let bloodfellCaves = Card(name: "Bloodfell Caves", rarity: .Common, set: set, number: 229)
        bloodfellCaves.setManaCost("")
        bloodfellCaves.setType(.Land)
        bloodfellCaves.entersTapped = true
        bloodfellCaves.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { bloodfellCaves.getController().gainLife(1) })
        bloodfellCaves.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { bloodfellCaves.getController().addMana(color: .Black) },
            manaAbility: true)
        bloodfellCaves.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { bloodfellCaves.getController().addMana(color: .Red) },
            manaAbility: true)
        return bloodfellCaves
    }
    // 230 Bloodstained Mire - Sacrificing this as cost, card selection
    static func BlossomingSands() -> Card {
        let blossomingSands = Card(name: "Blossoming Sands", rarity: .Common, set: set, number: 231)
        blossomingSands.setManaCost("")
        blossomingSands.setType(.Land)
        blossomingSands.entersTapped = true
        blossomingSands.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { blossomingSands.getController().gainLife(1) })
        blossomingSands.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { blossomingSands.getController().addMana(color: .Green) },
            manaAbility: true)
        blossomingSands.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { blossomingSands.getController().addMana(color: .White) },
            manaAbility: true)
        return blossomingSands
    }
    static func DismalBackwater() -> Card {
        let dismalBackwater = Card(name: "Dismal Backwater", rarity: .Common, set: set, number: 232)
        dismalBackwater.setManaCost("")
        dismalBackwater.setType(.Land)
        dismalBackwater.entersTapped = true
        dismalBackwater.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { dismalBackwater.getController().gainLife(1) })
        dismalBackwater.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { dismalBackwater.getController().addMana(color: .Blue) },
            manaAbility: true)
        dismalBackwater.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { dismalBackwater.getController().addMana(color: .Black) },
            manaAbility: true)
        return dismalBackwater
    }
    // 233 Flooded Strand - Sacrificing this as cost, card selection
    static func FrontierBivouac() -> Card {
        let frontierBivouac = Card(name: "Frontier Bivouac", rarity: .Uncommon, set: set, number: 234)
        frontierBivouac.setManaCost("")
        frontierBivouac.setType(.Land)
        frontierBivouac.entersTapped = true
        frontierBivouac.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { frontierBivouac.getController().addMana(color: .Green) },
            manaAbility: true)
        frontierBivouac.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { frontierBivouac.getController().addMana(color: .Blue) },
            manaAbility: true)
        frontierBivouac.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { frontierBivouac.getController().addMana(color: .Red) },
            manaAbility: true)
        frontierBivouac.setFlavorText("\"The most powerful dreams visit those who shelter in a dragon's skull.\"\n--Chinaul, Who Whispers Twice")
        return frontierBivouac
    }
    static func JungleHollow() -> Card {
        let jungleHollow = Card(name: "Jungle Hollow", rarity: .Common, set: set, number: 235)
        jungleHollow.setManaCost("")
        jungleHollow.setType(.Land)
        jungleHollow.entersTapped = true
        jungleHollow.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { jungleHollow.getController().gainLife(1) })
        jungleHollow.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { jungleHollow.getController().addMana(color: .Black) },
            manaAbility: true)
        jungleHollow.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { jungleHollow.getController().addMana(color: .Green) },
            manaAbility: true)
        return jungleHollow
    }
    static func MysticMonastery() -> Card {
        let mysticMonastery = Card(name: "Mystic Monastery", rarity: .Uncommon, set: set, number: 236)
        mysticMonastery.setManaCost("")
        mysticMonastery.setType(.Land)
        mysticMonastery.entersTapped = true
        mysticMonastery.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { mysticMonastery.getController().addMana(color: .Blue) },
            manaAbility: true)
        mysticMonastery.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { mysticMonastery.getController().addMana(color: .Red) },
            manaAbility: true)
        mysticMonastery.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { mysticMonastery.getController().addMana(color: .White) },
            manaAbility: true)
        mysticMonastery.setFlavorText("When asked how many paths reach enlightenment, the monk kicked a heap of sand. \"Count,\" he smiled, \"and then find more grains.\"")
        return mysticMonastery
    }
    static func NomadOutpost() -> Card {
        let nomadOutpost = Card(name: "Nomad Outpost", rarity: .Uncommon, set: set, number: 237)
        nomadOutpost.setManaCost("")
        nomadOutpost.setType(.Land)
        nomadOutpost.entersTapped = true
        nomadOutpost.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { nomadOutpost.getController().addMana(color: .Red) },
            manaAbility: true)
        nomadOutpost.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { nomadOutpost.getController().addMana(color: .White) },
            manaAbility: true)
        nomadOutpost.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { nomadOutpost.getController().addMana(color: .Black) },
            manaAbility: true)
        nomadOutpost.setFlavorText("\"Only the weak imprison themselves behind walls. We live free under the wind, and our freedom makes us strong.\"\n--Zurgo, khan of the Mardu")
        return nomadOutpost
    }
    static func OpulentPalace() -> Card {
        let opulentPalace = Card(name: "Opulent Palace", rarity: .Uncommon, set: set, number: 238)
        opulentPalace.setManaCost("")
        opulentPalace.setType(.Land)
        opulentPalace.entersTapped = true
        opulentPalace.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { opulentPalace.getController().addMana(color: .Black) },
            manaAbility: true)
        opulentPalace.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { opulentPalace.getController().addMana(color: .Green) },
            manaAbility: true)
        opulentPalace.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { opulentPalace.getController().addMana(color: .Blue) },
            manaAbility: true)
        opulentPalace.setFlavorText("The dense jungle surrenders to a lush and lavish expanse. At its center uncoil the spires of Qarsi Palace.")
        return opulentPalace
    }
    // 239 Polluted Delta - Sacrificing this as a cost, card selection
    static func RuggedHighlands() -> Card {
        let ruggedHighlands = Card(name: "Rugged Highlands", rarity: .Common, set: set, number: 240)
        ruggedHighlands.setManaCost("")
        ruggedHighlands.setType(.Land)
        ruggedHighlands.entersTapped = true
        ruggedHighlands.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { ruggedHighlands.getController().gainLife(1) })
        ruggedHighlands.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { ruggedHighlands.getController().addMana(color: .Red) },
            manaAbility: true)
        ruggedHighlands.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { ruggedHighlands.getController().addMana(color: .Green) },
            manaAbility: true)
        return ruggedHighlands
    }
    static func SandsteppeCitadel() -> Card {
        let sandsteppeCitadel = Card(name: "Sandsteppe Citadel", rarity: .Uncommon, set: set, number: 241)
        sandsteppeCitadel.setManaCost("")
        sandsteppeCitadel.setType(.Land)
        sandsteppeCitadel.entersTapped = true
        sandsteppeCitadel.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { sandsteppeCitadel.getController().addMana(color: .White) },
            manaAbility: true)
        sandsteppeCitadel.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { sandsteppeCitadel.getController().addMana(color: .Black) },
            manaAbility: true)
        sandsteppeCitadel.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { sandsteppeCitadel.getController().addMana(color: .Green) },
            manaAbility: true)
        sandsteppeCitadel.setFlavorText("That which endures, survives.")
        return sandsteppeCitadel
    }
    static func ScouredBarrens() -> Card {
        let scouredBarrens = Card(name: "Scoured Barrens", rarity: .Common, set: set, number: 242)
        scouredBarrens.setManaCost("")
        scouredBarrens.setType(.Land)
        scouredBarrens.entersTapped = true
        scouredBarrens.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { scouredBarrens.getController().gainLife(1) })
        scouredBarrens.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { scouredBarrens.getController().addMana(color: .White) },
            manaAbility: true)
        scouredBarrens.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { scouredBarrens.getController().addMana(color: .Black) },
            manaAbility: true)
        return scouredBarrens
    }
    static func SwiftwaterCliffs() -> Card {
        let swiftwaterCliffs = Card(name: "Swiftwater Cliffs", rarity: .Common, set: set, number: 243)
        swiftwaterCliffs.setManaCost("")
        swiftwaterCliffs.setType(.Land)
        swiftwaterCliffs.entersTapped = true
        swiftwaterCliffs.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { swiftwaterCliffs.getController().gainLife(1) })
        swiftwaterCliffs.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { swiftwaterCliffs.getController().addMana(color: .Blue) },
            manaAbility: true)
        swiftwaterCliffs.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { swiftwaterCliffs.getController().addMana(color: .Red) },
            manaAbility: true)
        return swiftwaterCliffs
    }
    static func ThornwoodFalls() -> Card {
        let thornwoodFalls = Card(name: "Thornwood Falls", rarity: .Common, set: set, number: 244)
        thornwoodFalls.setManaCost("")
        thornwoodFalls.setType(.Land)
        thornwoodFalls.entersTapped = true
        thornwoodFalls.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { thornwoodFalls.getController().gainLife(1) })
        thornwoodFalls.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { thornwoodFalls.getController().addMana(color: .Green) },
            manaAbility: true)
        thornwoodFalls.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { thornwoodFalls.getController().addMana(color: .Blue) },
            manaAbility: true)
        return thornwoodFalls
    }
    static func TombOfTheSpiritDragon() -> Card {
        let tombOfTheSpiritDragon = Card(name: "Tomb of the Spirit Dragon", rarity: .Uncommon, set: set, number: 245)
        tombOfTheSpiritDragon.setManaCost("")
        tombOfTheSpiritDragon.setType(.Land)
        tombOfTheSpiritDragon.addActivatedAbility(
            string: "{T}: Add {C}.",
            cost: Cost.Tap(),
            effect: { tombOfTheSpiritDragon.getController().addMana(color: nil) },
            manaAbility: true)
        tombOfTheSpiritDragon.addActivatedAbility(
            string: "{2}, {T}: You gain 1 life for each colorless creature you control.",
            cost: Cost.Mana("2").Tap(),
            effect: {
                let numColorlessCreatures = tombOfTheSpiritDragon.getController().getCreatures().filter({ $0.isColorless() }).count
                tombOfTheSpiritDragon.getController().gainLife(numColorlessCreatures)
        })
        tombOfTheSpiritDragon.setFlavorText("\"The voice calls me here, yet I see only bones. Is this more dragon trickery?\"\n--Sarkhan Vol")
        return tombOfTheSpiritDragon
    }
    static func TranquilCove() -> Card {
        let tranquilCove = Card(name: "Tranquil Cove", rarity: .Common, set: set, number: 246)
        tranquilCove.setManaCost("")
        tranquilCove.setType(.Land)
        tranquilCove.entersTapped = true
        tranquilCove.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { tranquilCove.getController().gainLife(1) })
        tranquilCove.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { tranquilCove.getController().addMana(color: .White) },
            manaAbility: true)
        tranquilCove.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { tranquilCove.getController().addMana(color: .Blue) },
            manaAbility: true)
        return tranquilCove
    }
    static func WindScarredCrag() -> Card {
        let windScarredCrag = Card(name: "Wind-Scarred Crag", rarity: .Common, set: set, number: 247)
        windScarredCrag.setManaCost("")
        windScarredCrag.setType(.Land)
        windScarredCrag.entersTapped = true
        windScarredCrag.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { windScarredCrag.getController().gainLife(1) })
        windScarredCrag.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { windScarredCrag.getController().addMana(color: .Red) },
            manaAbility: true)
        windScarredCrag.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { windScarredCrag.getController().addMana(color: .Green) },
            manaAbility: true)
        return windScarredCrag
    }
    // 248 Windswept Heath - Sacrificing this as a cost, card selection
    // 249 Wooded Foothills - Sacrificing this as a cost, card selection
    // 250 - 253 Plains
    // 254 - 257 Island
    // 258 - 261 Swamp
    // 262 - 265 Mountain
    // 266 - 269 Forest

    
    
    static func Bird() -> Token {
        let bird = Token(name: "Bird", set: set, number: 1)
        bird.colors = [.White]
        bird.setType(.Creature, .Bird)
        bird.flying = true
        bird.power = 3
        bird.toughness = 4
        return bird
    }
    static func Spirit() -> Token {
        let spirit = Token(name: "Spirit", set: set, number: 2)
        spirit.colors = [.White]
        spirit.setType(.Creature, .Spirit)
        spirit.flying = true
        spirit.power = 1
        spirit.toughness = 1
        return spirit
    }
    static func Warrior() -> Token {
        return (Int.random(in: 1 ... 2) == 1) ? Warrior3() : Warrior4()
    }
    static func Warrior3() -> Token {
        let warrior = Token(name: "Warrior", set: set, number: 3)
        warrior.colors = [.White]
        warrior.setType(.Creature, .Warrior)
        warrior.power = 1
        warrior.toughness = 1
        return warrior
    }
    static func Warrior4() -> Token {
        let warrior = Token(name: "Warrior", set: set, number: 4)
        warrior.colors = [.White]
        warrior.setType(.Creature, .Warrior)
        warrior.power = 1
        warrior.toughness = 1
        return warrior
    }
    static func Vampire() -> Token {
        let vampire = Token(name: "Vampire", set: set, number: 5)
        vampire.colors = [.Black]
        vampire.setType(.Creature, .Vampire)
        vampire.flying = true
        vampire.power = 2
        vampire.toughness = 2
        return vampire
    }
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 6)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Vampire)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    static func Goblin() -> Token {
        let goblin = Token(name: "Goblin", set: set, number: 7)
        goblin.colors = [.Red]
        goblin.setType(.Creature, .Goblin)
        goblin.power = 1
        goblin.toughness = 1
        return goblin
    }
    static func Bear() -> Token {
        let bear = Token(name: "Bear", set: set, number: 8)
        bear.colors = [.Green]
        bear.setType(.Creature, .Bear)
        bear.power = 4
        bear.toughness = 4
        return bear
    }
    static func Snake() -> Token {
        let snake = Token(name: "Snake", set: set, number: 9)
        snake.colors = [.Green]
        snake.setType(.Creature, .Snake)
        snake.power = 1
        snake.toughness = 1
        return snake
    }
    // 10 Spirit Warrior - */* power
    // 11 Morph token - Morph
    // 12 Sarkhan Emblem - Planeswalkers, Emblems
    // 13 Sorin Emblem - Planeswalkers, Emblems, Sacrifice
}
