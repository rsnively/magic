import Foundation

enum RNA {
    static var set = "rna"
    static var count = 259
    
    static let cards = [
        
        GrowthSpiral,
        
        Mortify,
        
        RakdosFirewheeler,
        
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 27 Tithe Taker
    
    // 107 Light Up the Stage
    // 108
    // 109 Rix Maadi Reveler
    
    static func GrowthSpiral() -> Card {
        // TODO Card image
        let growthSpiral = Card(name: "Growth Spiral", rarity: .Rare, set: set, number: 178)
        growthSpiral.setManaCost("GU")
        growthSpiral.setType(.Instant)
        growthSpiral.addEffect({
            growthSpiral.getController().drawCard()
            growthSpiral.getController().chooseCard(
                from: growthSpiral.getController().getHand(),
                restriction: { $0.isType(.Land) },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield()
            })
        })
        // TODO is this the flavor text on non-promo version?
        growthSpiral.setFlavorText("Cyclical and spiral patterns are the specialty of the Gyre Clade, which seeks to revitalize the cycles of nature.")
        return growthSpiral
    }
    // 179
    // 180
    // 181
    // 182
    // 183
    // 184
    // 185
    // 186
    // 187
    // 188
    // 189 Lavinia, Azorius Renegade
    // 190
    // 191
    static func Mortify() -> Card {
        // TODO Card image
        let mortify = Card(name: "Mortify", rarity: .Rare, set: set, number: 192)
        mortify.setManaCost("1WB")
        mortify.setType(.Instant)
        mortify.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) || $0.isType(.Enchantment) },
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }
        ))
        // TODO is this the flavor text on non-promo version?
        mortify.setFlavorText("\"Your debt is erased.\"\n--Hilgar, Orzhov euthanist")
        return mortify
    }
    // 193
    // 194
    // 195
    // 196
    // 196 Rafter Demon
    static func RakdosFirewheeler() -> Card {
        // TODO Card image
        let rakdosFirewheeler = Card(name: "Rakdos Firewheeler", rarity: .Uncommon, set: set, number: 197)
        rakdosFirewheeler.setManaCost("BBRR")
        rakdosFirewheeler.setType(.Creature, .Human, .Rogue)
        rakdosFirewheeler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect(
                restrictions: [
                    TargetingRestriction.SinglePlayer(
                        restriction: { $0 !== rakdosFirewheeler.getController() }
                    ),
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Creature) || $0.isType(.Planeswalker) },
                        zones: [.Battlefield],
                        optional: true
                    )
                ],
                effect: { targets in
                    for target in targets {
                        rakdosFirewheeler.damage(to: target, 2)
                    }
        }))
        // TODO Is there flavor text on non-promo version?
        rakdosFirewheeler.power = 4
        rakdosFirewheeler.toughness = 3
        return rakdosFirewheeler
    }
    // 198
    // 199
    // 200
    // 201
    // 202
    // 203
    // 204
    // 205
    // 206
    // 207 Simic Ascendancy
    
    // 232 Gate Colossus
}
