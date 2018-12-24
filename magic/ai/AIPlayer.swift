import Foundation

class AIPlayer: Player {
    
    override func givePriority() {
        var actionTaken = false
        getHand().filter({($0 as! Card).canPlay()}).forEach({ card in
            let availableMana = getLands().count
            if card.isType(.Land) {
                if !Game.shared.landWasPlayedThisTurn() {
                    play(card: card as! Card)
                }
            }
            else if availableMana >= card.getConvertedManaCost() && (card.spellAbility == nil || !card.spellAbility!.requiresTarget()) && !actionTaken {
                var paid = 0
                getLands().filter({!$0.isTapped}).forEach({ land in
                    if paid < card.getConvertedManaCost() {
                        land.tap()
                        addMana(color: getColorForLandType(subtype: land.subtypes.first ?? .Island ))
                        paid += 1
                    }
                })
                play(card: card as! Card)
                actionTaken = true
            }
        })
        
        Game.shared.advanceGame()
    }
    
    override func declareAttackers() {
        getCreatures().filter({$0.canAttack()}).forEach({ $0.attack(getOpponent()) })
        super.declareAttackers()
    }
    
    override func declareBlockers() {
        super.declareBlockers()
    }
    
    override func chooseLegendaryToKeep(name: String) {
        super.chooseLegendaryToKeep(name: name)
        Game.shared.chooseLegendaryToKeep(getPermanents().first(where: { $0.name == Game.shared.choosingLegendaryToKeep })!)
    }
    
    override func discard(_ amount: Int) {
        super.discard(amount)
        for _ in 0 ..< cardsToDiscard {
            let r = Int.random(in: 0 ..< getHand().count)
            chooseCardToDiscard(getHand()[r])
        }
    }
    
    override func chooseCards(from: [Object], restrictions: [(Object) -> Bool], action: @escaping ([Object], inout [Object]) -> Void) {
        super.chooseCards(from: from, restrictions: restrictions, action: action)
        Game.shared.doneSelectingCards()
    }
}
