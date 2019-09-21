import Foundation

enum TEST {
    static var set = "test"

    static func Peek() -> Card {
        let peek = Card(name: "Peek", rarity: .Common, set: set, number: 1)
        peek.setManaCost("U")
        peek.setType(.Instant)
        peek.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.TargetPlayer(),
            effect: {
                $0.revealHandTo(peek.getController())
                peek.getController().drawCard()
        }))
        return peek
    }
    
    static func Mermaidify() -> Card {
        let mermaidify = Card(name: "Mermaidify", rarity: .Common, set: set, number: 1)
        mermaidify.setManaCost("{U/G}")
        mermaidify.setType(.Instant)
        mermaidify.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.addTypeUntilEndOfTurn(.Merfolk) }))
        return mermaidify
    }
    
    static func Animate() -> Card {
        let animate = Card(name: "Animate", rarity: .Common, set: set, number: 1)
        animate.setManaCost("1")
        animate.setType(.Instant)
        animate.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetPermanent(),
            effect: {
                $0.addTypeUntilEndOfTurn(.Creature)
                $0.setBasePowerAndToughnessUntilEndOfTurn(1, 1)
        }))
        return animate
    }
    
    static func EternalScourge() -> Card {
        let eternalScourge = Card(name: "Eternal Scourge", rarity: .Rare, set: set, number: 1)
        eternalScourge.setManaCost("3")
        eternalScourge.setType(.Creature, .Eldrazi, .Horror)
        eternalScourge.canCastFromExile = true
        eternalScourge.addTriggeredAbility(
            trigger: .ThisBecomesTargetOfSpellOrAbility,
            effect: { eternalScourge.exile() })
        eternalScourge.power = 3
        eternalScourge.toughness = 3
        return eternalScourge
    }
}
