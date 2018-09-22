import Foundation

enum GRN {
    static var set = "grn"
    static var count = 259
    
    // 1 Blade Instructor
    // 2 Bounty Agent
    // 3 Candlelight Vigil
    static func CitywideBust() -> Card {
        let citywideBust = Card(name: "Citywide Bust", rarity: .Rare, set: set, number: 4)
        citywideBust.setManaCost("1WW")
        citywideBust.setType(.Sorcery)
        citywideBust.addEffect(UntargetedEffect({_ in
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getToughness() >= 4 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }))
        citywideBust.setFlavorText("\"Oh, you fellas are going to love the lockup. Excellent gruel. Very low ceilings.\"\n--Libuse, Boros sergeant")
        return citywideBust
    }
    
}
