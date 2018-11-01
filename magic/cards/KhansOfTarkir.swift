import Foundation

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
            cost: Cost("1W", tap: true),
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
        highSentinelsOfArashin.addStaticAbility { object in
            if object.id == highSentinelsOfArashin.id {
                let numOtherCreaturesWithCounters = highSentinelsOfArashin.getController().getCreatures().filter({ $0.id != highSentinelsOfArashin.id && $0.getCounters(.PlusOnePlusOne) > 0}).count
                object.power = object.getBasePower() + numOtherCreaturesWithCounters
                object.toughness = object.getBaseToughness() + numOtherCreaturesWithCounters
            }
            return object
        }
        highSentinelsOfArashin.addActivatedAbility(
            string: "{3}{W}: Put a +1/+1 counter on target creature.",
            cost: Cost("3W"),
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
            cost: Cost("B"),
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
            cost: Cost("U"),
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
