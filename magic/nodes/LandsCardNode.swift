import Foundation
import SpriteKit

class LandsCardNode: CardNode {
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
                if Game.shared.targetingEffects.last!.meetsRestrictions(target: card) {
                    Game.shared.selectTarget(card)
                    (self.scene as! GameScene).redraw()
                }
            } else if card.canActivateAbilities() {
                // todo: multiple activated abilities
                let ability = card.activatedAbilities.first!
                if card.getController().getManaPool().canAfford(ability) && (!card.isTapped || !ability.getCost().getTapCost())  {
                    card.getController().payFor(ability.getCost(), card)
                    ability.activate()
                    (self.scene as! GameScene).redraw()
                    return
                }
            }
        }
    }
}

