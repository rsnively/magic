import Foundation

class AIPlayer: Player {
    
    private func couldAfford(_ card: Object) -> Bool {
        let temp: ManaPool = ManaPool()
        getLands().filter({ !$0.isTapped }).forEach({ land in
            if land.isBasicLand() {
                temp.add(Mana(getColorForLandType(subtype: land.subtypes.first! )))
            }
            // TODO: AI using non-basic lands
        })
        return temp.canAfford(card.manaCost!)
    }
    
    private func tapLandsToPayFor(_ card: Object) {
        for land in getLands().filter({ !$0.isTapped }) {
            if getManaPool().canAfford(card.manaCost!) {
                return
            }
            if let ability = land.activatedAbilities.first {
                // TODO: Only activate if would help pay for cost
                payFor(ability.getCost(), land)
                ability.activate()
            }
        }
    }
    
    override func givePriority() {
        var actionTaken = false
        getHand().filter({($0 as! Card).canPlay()}).forEach({ card in
            if card.isType(.Land) {
                if !Game.shared.landWasPlayedThisTurn() {
                    play(card: card as! Card)
                }
            }
            else if couldAfford(card) && (card.spellAbility == nil || !card.spellAbility!.requiresTarget()) && !actionTaken {
                tapLandsToPayFor(card)
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
