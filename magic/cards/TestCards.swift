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
}
