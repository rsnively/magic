import Foundation

// TODO - nowhere near done

enum KLD {
    static func Forest() -> Card {
        let forest = Card(name: "Forest", rarity: Rarity.Common, number: 262)
        forest.setManaCost("")
        forest.addType(Supertype.Basic)
        forest.addType(Type.Land)
        forest.addType(Subtype.Forest)
        return forest
    }
    
    static func TerrainElemental() -> Card {
        let terrainElemental = Card(name: "Terrain Elemental", rarity: Rarity.Common, number: 272)
        terrainElemental.setManaCost("1G")
        terrainElemental.addType(Type.Creature)
        terrainElemental.addType(Subtype.Elemental)
        terrainElemental.setFlavorText("\"You tread upon the land all the time, yet you seem dismayed when it moves to step on you.\"\n--Nissa Revane")
        terrainElemental.power = 3
        terrainElemental.toughness = 2
        return terrainElemental
    }
}

