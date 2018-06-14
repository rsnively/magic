import Foundation

// TODO - nowhere near done

enum M19 {
    static func OreskosSwiftclaw(owner: Player) -> Card {
        let oreskosSwiftclaw = Card(name: "Oreskos Swifclaw", owner: owner, rarity:Rarity.Common)
        oreskosSwiftclaw.setManaCost("1W")
        oreskosSwiftclaw.addType(Type.Creature)
        oreskosSwiftclaw.addType(Subtype.Cat)
        oreskosSwiftclaw.addType(Subtype.Warrior)
        oreskosSwiftclaw.setFlavorText("The leonin of Oreskos are quick to take offense -- not because they are thin-skinned, but because they are always ready for a fight.")
        oreskosSwiftclaw.power = 3
        oreskosSwiftclaw.toughness = 1
        return oreskosSwiftclaw
    }
    
    static func Plains(owner: Player) -> Card {
        let plains = Card(name: "Plains", owner: owner, rarity:Rarity.Common)
        plains.setManaCost("")
        plains.addType(Supertype.Basic)
        plains.addType(Type.Land)
        plains.addType(Subtype.Plains)
        return plains
    }
}
