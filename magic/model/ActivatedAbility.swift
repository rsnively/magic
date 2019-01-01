import Foundation

protocol ActivatedAbility {
    func getSource() -> Object
    func getCost() -> Cost
    func getString() -> String
    func hasValidTargets() -> Bool // TODO: I hate this name / decision. Untargeted abilities don't have valid targets
    func activate() -> Void
    func resolve() -> Void
    func isSorcerySpeed() -> Bool
    func isManaAbility() -> Bool
    func isLoyaltyAbility() -> Bool
}

class UntargetedActivatedAbility: Object, ActivatedAbility {
    private var source: Object
    private var string: String
    private var cost: Cost
    private var manaAbility: Bool
    private var sorcerySpeed: Bool
    private var loyaltyAbility: Bool
    
    init(source: Object, string: String, cost: Cost, effect:@escaping () -> Void, manaAbility: Bool = false, sorcerySpeed: Bool = false, loyaltyAbility: Bool = false) {
        self.source = source
        self.string = string
        self.cost = cost
        self.manaAbility = manaAbility
        self.sorcerySpeed = sorcerySpeed
        self.loyaltyAbility = loyaltyAbility
        super.init(name: "Activated Ability of " + source.getName())
        spellAbility = UntargetedEffect(effect: effect)
    }
    
    
    func getSource() -> Object {
        return source
    }
    
    func getString() -> String {
        return string
    }
    
    func getCost() -> Cost {
        return cost
    }
    
    func isSorcerySpeed() -> Bool {
        return sorcerySpeed
    }
    func isManaAbility() -> Bool {
        return manaAbility
    }
    func isLoyaltyAbility() -> Bool {
        return loyaltyAbility
    }
    
    func hasValidTargets() -> Bool {
        return true
    }
    
    func activate() {
        if loyaltyAbility {
            source.hasActivatedLoyaltyAbilityThisTurn = true
        }
        if manaAbility {
            resolve()
        } else {
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return source.getController()
    }
    
    override func isSpell() -> Bool {
        return false
    }
    
    override func resolve() {
        spellAbility?.resolve()
    }
}

class TargetedActivatedAbility: Object, ActivatedAbility {
    private var source: Object
    private var string: String
    private var cost: Cost
    private var manaAbility: Bool
    private var sorcerySpeed: Bool
    private var loyaltyAbility: Bool
    
    init(source: Object, string: String, cost: Cost, effect: TargetedEffect, manaAbility: Bool = false, sorcerySpeed: Bool = false, loyaltyAbility: Bool = false) {
        self.source = source
        self.string = string
        self.cost = cost
        self.manaAbility = manaAbility
        self.sorcerySpeed = sorcerySpeed
        self.loyaltyAbility = loyaltyAbility
        super.init(name: "Activated Ability of " + source.getName())
        self.spellAbility = effect
    }
    
    func getSource() -> Object {
        return source
    }
    func getCost() -> Cost {
        return cost
    }
    func getString() -> String {
        return string
    }
    
    func isSorcerySpeed() -> Bool {
        return sorcerySpeed
    }
    func isManaAbility() -> Bool {
        return manaAbility
    }
    func isLoyaltyAbility() -> Bool {
        return loyaltyAbility
    }
    
    func hasValidTargets() -> Bool {
        if let targetedEffect = self.spellAbility as? TargetedEffect {
            return targetedEffect.canFinishTargeting() || Game.shared.hasTargets(targetedEffect)

        }
        return false
    }
    
    func activate() {
        if loyaltyAbility {
            source.hasActivatedLoyaltyAbilityThisTurn = true
        }
        
//        let effect = effects.first(where: { return $0.requiresTarget() }) as! TargetedEffect?
        let effect = spellAbility as! TargetedEffect
        if Game.shared.hasTargets(effect) {
            Game.shared.targetingEffects.append(effect)
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return source.getController()
    }
    
    override func isSpell() -> Bool {
        return false
    }
    
    override func resolve() {
        spellAbility?.resolve()
    }
}
