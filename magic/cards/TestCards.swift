//import Foundation
//
//enum TEST {
//    static var set = "test"
//
//    static func Peek() -> Card {
//        let peek = Card(name: "Peek", rarity: .Common, set: set, number: 1)
//        peek.setManaCost("U")
//        peek.setType(.Instant)
//        peek.addEffect(TargetedEffect.SinglePlayer(
//            restriction: TargetedEffect.AnyPlayer,
//            effect: {
//                $0.revealHandTo(peek.getController())
//                peek.getController().drawCard()
//        }))
//        return peek
//    }
//}
