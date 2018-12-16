//import Foundation
//
//enum UMA {
//    static var set = "uma"
//    static var count = 254
//    
//    static let cards = [
//        AllIsDust, /* ArtisanOfKozilek, EldraziConscription, EmrakulTheAeonsTurn, KarnLiberated, KozilekButcherOfTruth, UlamogTheInfiniteGyre, UlamogsCrusher, */ AncestorsChosen, /* AngelicRenewal, ContainmentPriest, Conviction, DawnCharm, DaybreakCoronet, */ EmancipationAngel
//    ]
//    
//    static func RandomCard() -> Card {
//        return cards[Int.random(in: 0 ..< cards.count)]()
//    }
//    
//    static func AllIsDust() -> Card {
//        let allIsDust = Card(name: "All Is Dust", rarity: .Rare, set: set, number: 1)
//        allIsDust.setManaCost("7")
//        allIsDust.setType(.Sorcery)
//        allIsDust.addEffect({
//            Game.shared.bothPlayers({ player in
//                player.getPermanents().filter({ !$0.isColorless() }).forEach({ permanent in
//                    permanent.sacrifice()
//                })
//            })
//        })
//        allIsDust.setFlavorText("\"The emergence of the Eldrazi isn't necessarily a bad thing, as long as you've lived a fulfilling and complete life without regrets.\"\n--Javad Nasrin, Ondu relic hunter")
//        return allIsDust
//    }
//    // 2 Artisan of Kozilek
//    // 3 Eldrazi Conscription
//    // 4 Emrakul, the Aeons Torn
//    // 5 Karn Liberated
//    // 6 Kozilek, Butcher of Truth
//    // 7 Ulamog, the Infinite Gyre
//    // 8 Ulamog's Crusher
//    static func AncestorsChosen() -> Card {
//        let ancestorsChosen = Card(name: "Ancestor's Chosen", rarity: .Uncommon, set: set, number: 9)
//        ancestorsChosen.setManaCost("5WW")
//        ancestorsChosen.setType(.Creature, .Human, .Cleric)
//        ancestorsChosen.firstStrike = true
//        ancestorsChosen.addTriggeredAbility(
//            trigger: .ThisETB,
//            effect: {
//                let cardsInGraveyard = ancestorsChosen.getController().getGraveyard().count
//                ancestorsChosen.getController().gainLife(cardsInGraveyard)
//        })
//        ancestorsChosen.setFlavorText("The will of all, by my hand done.")
//        ancestorsChosen.power = 4
//        ancestorsChosen.toughness = 4
//        return ancestorsChosen
//    }
//    // 10 Angelic Renewal
//    // 11 Containment Priest
//    // 12 Conviction
//    // 13 Dawn Charn
//    // 14 Daybreak Coronet
//    static func EmancipationAngel() -> Card {
//        let emancipationAngel = Card(name: "Emancipation Angel", rarity: .Uncommon, set: set, number: 15)
//        emancipationAngel.setManaCost("1WW")
//        emancipationAngel.setType(.Creature, .Angel)
//        emancipationAngel.flying = true
//        emancipationAngel.addTriggeredAbility(
//            trigger: .ThisETB,
//            effect: TargetedEffect.SingleObject(
//                restriction: { $0.isPermanent() && $0.getController() === emancipationAngel.getController() },
//                effect: { $0.bounce() }))
//        emancipationAngel.setFlavorText("\"You have done your best. I give you leave to rest.\"")
//        emancipationAngel.power = 3
//        emancipationAngel.toughness = 3
//        return emancipationAngel
//    }
//}
