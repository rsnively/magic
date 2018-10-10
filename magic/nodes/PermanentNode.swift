import Foundation
import SpriteKit

class PermanentNode: CardNode {
    private var moved: Bool = false
    
    override func touchDown(atPoint pos: CGPoint) {
        touchPoint = convert(pos, from:parent!)
        moved = false
    }
    
    override func touchMoved(toPoint pos: CGPoint) {
        assert(touching)
        moved = true
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        touchPoint = nil
        if !moved {
            if Game.shared.isTargeting {
                if Game.shared.targetingEffect!.meetsRestrictions(target: card) {
                    Game.shared.selectTarget(card)
                    (self.scene as! GameScene).redraw()
                    return
                }
            } else if card.canActivateAbilities() {
                // todo: multiple activated abilities
                let ability = card.activatedAbilities.first!
                if card.getController().getManaPool().canAfford(ability) && (!(card.isTapped || card.hasSummoningSickness()) || !ability.getCost().getTapCost()) {
                    card.getController().payFor(ability.getCost(), card)
                    ability.activate()
                    (self.scene as! GameScene).redraw()
                    return
                }
            }
            (self.scene as! GameScene).expandedCard = self.card
        }
    }
}
