import Foundation

enum ELD {
    static var set = "eld"
    static var count = 269
    
    static let cards = [
        
        AllThatGliters,
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 1
    static func AllThatGliters() -> Card {
        let allThatGlitters = Card(name: "AllThatGlitters", rarity: .Uncommon, set: set, number: 2)
        allThatGlitters.setManaCost("1W")
        allThatGlitters.setType(.Enchantment, .Aura)
        allThatGlitters.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                let numArtifactsEnchantments = allThatGlitters.getController().getArtifactsAndEnchantments().count
                return object.pumped(numArtifactsEnchantments, numArtifactsEnchantments)
            },
            layer: .PowerToughnessChanging)
        allThatGlitters.setFlavorText("A faerie's glee at her trove quickly fades to contentment, then to boredom, then to an urge to steal more.")
        return allThatGlitters
    }
    
}
