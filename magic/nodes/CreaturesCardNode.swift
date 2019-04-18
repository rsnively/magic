import Foundation
import SpriteKit

class CreaturesCardNode: CardNode {
    private var moved: Bool = false
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
        moved = false
        if card.canAttack() {
            Game.shared.selectAttacker(self.card)
        }
        else if card.isAttacking && Game.shared.isDeclaringAttackers() {
            card.isAttacking = false
        }
        else if card.canBlock() {
            if self.card.blocking {
                self.card.unblock()
            }
            Game.shared.selectBlocker(self.card)
        }
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            if let abilitySelector = self.abilitySelector {
                abilitySelector.touchUp(atPoint: convert(pos, from: parent!))
                return
            }
            if Game.shared.isChoosingLegendaryToKeep && card.name == Game.shared.choosingLegendaryToKeep {
                Game.shared.chooseLegendaryToKeep(card)
                return
            }
            if Game.shared.isTargeting {
                if Game.shared.targetingEffects.last!.meetsRestrictions(target: card) {
                    Game.shared.selectTarget(card)
                    return
                }
            }
            if let selectedBlocker = Game.shared.getSelectedBlocker() {
                if card.isAttacking && selectedBlocker.canBlockAttacker(card) {
                    selectedBlocker.block(card)
                    return
                }
            }
            if card.canActivateAbilities() {
                if card.activatedAbilities.count > 1 {
                    Game.shared.selectingAbilityObject = self.card
                } else {
                    let ability = card.activatedAbilities.first!
                    if card.getController().canAfford(ability.getCost(), source: card) && ability.hasValidTargets() && (!ability.isSorcerySpeed() || card.getController().canCastSorcery()) && !(card.isType(.Planeswalker) && card.hasActivatedLoyaltyAbilityThisTurn) {
                        card.getController().payFor(ability.getCost(), card)
                        ability.activate()
                        return
                    }
                }
            }
        }
    }
}
