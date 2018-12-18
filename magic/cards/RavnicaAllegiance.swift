import Foundation

extension Object {
    func afterlife(_ amount: Int) {
        addTriggeredAbility(
            trigger: .ThisDies,
            effect: { self.getController().createToken(RNA.Spirit()) }
        )
    }
}

enum RNA {
    static var set = "rna"
    static var count = 259
    
    static let cards = [
        
        GrowthSpiral,
        
        ImperiousOligarch,
        
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
        growthSpiral.setFlavorText("Cyclical and spiral patterns are the specialty of the Gyre Clade, which seeks to revitalize the cycles of nature.")
        return growthSpiral
    }
    // 179
    // 180
    // 181
    // 182
    // 183
    static func ImperiousOligarch() -> Card {
        let imperiousOligarch = Card(name: "Imperious Oligarch", rarity: .Common, set: set, number: 184)
        imperiousOligarch.setManaCost("WB")
        imperiousOligarch.setType(.Creature, .Human, .Cleric)
        imperiousOligarch.afterlife(1)
        imperiousOligarch.setFlavorText("The rights of ghosts are strictly protected under Orzhov bylaws, and those who enforce them can count on the ghosts' assistance.")
        imperiousOligarch.power = 2
        imperiousOligarch.toughness = 1
        return imperiousOligarch
    }
    // 185
    // 186
    // 187
    // 188
    // 189 Lavinia, Azorius Renegade
    // 190
    // 191
    static func Mortify() -> Card {
        let mortify = Card(name: "Mortify", rarity: .Rare, set: set, number: 192)
        mortify.setManaCost("1WB")
        mortify.setType(.Instant)
        mortify.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) || $0.isType(.Enchantment) },
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }
        ))
        mortify.setFlavorText("\"Your debt is erased.\"\n--Hilgar, Orzhov euthanist")
        return mortify
    }
    // 193
    // 194
    // 195
    // 196
    // 196 Rafter Demon
    static func RakdosFirewheeler() -> Card {
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
        rakdosFirewheeler.setFlavorText("Ever wonder why you don't see an old Rakdos cultist?")
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
    
    static func Spirit() -> Token {
        let spirit = Token(name: "Spirit", set: set, number: 10)
        spirit.colors = [.White, .Black]
        spirit.setType(.Creature, .Spirit)
        spirit.flying = true
        spirit.power = 1
        spirit.toughness = 1
        return spirit
    }
}
