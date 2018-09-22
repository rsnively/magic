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
    static func CageTheCulprit() -> Card {
        let cageTheCulprit = Card(name: "Cage the Culprit", rarity: .Common, set: set, number: 5)
        cageTheCulprit.setManaCost("3W")
        cageTheCulprit.setType(.Instant)
        cageTheCulprit.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature) && potentialTarget.getToughness() >= 4
        }, { source, target in
                target.destroy()
        }))
        cageTheCulprit.setFlavorText("\"Reports of Gruul rioters in four districts. Start with the big ones and work your way up.\"\n--Libuse, Boros sergeant")
        return cageTheCulprit
    }
    
}
