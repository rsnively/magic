import Foundation

enum KTK {
    static let set = "ktk"
    static let count = 269
    
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
}
