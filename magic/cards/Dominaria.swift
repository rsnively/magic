import Foundation

enum DOM {
    static var set = "dom"
    static var count = 269
    
    // 1 Karn, Scion of Urza
    // 2 Adamant Will
    // 3 Aven Sentry
    // 4 Baird, Steward of Argive
    // 5 Benalish Honor Guard
    // 6 Benalish Marshal
    // 7 Blessed Light
    // 8 Board the Weatherlight
    static func CallTheCavalry() -> Card {
        let callTheCavalry = Card(name: "Call the Cavalry", rarity: .Common, set: set, number: 9)
        callTheCavalry.setManaCost("3W")
        callTheCavalry.setType(.Sorcery)
        callTheCavalry.addEffect(UntargetedEffect({ source in
            source.getController().createToken(Knight())
            source.getController().createToken(Knight())
        }))
        callTheCavalry.setFlavorText("Benalish citizens born under the same constellation share a star-clan. Their loyalty to one another interlaces the Seven Houses.")
        return callTheCavalry
    }
    
    
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
    // 3 Soldier
    // 4 Cleric
    // 5 Zombie Knight
    // 6 Nightmare Horror
    // 7 Demon
    // 8 Elemental
    // 9 Goblin
    // 10 Karox Bladewing
    // 11 Saproling
    // 12 Saproling
    // 13 Saproling
    // 14 Construct
    // 15 Jaya Emblem
    // 16 Teferi Emlem
}
