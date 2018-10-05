import Foundation

protocol ActivatedAbility {
    func requiresTargets() -> Bool
    func getSource() -> Object
    func getCost() -> ManaCost
    func activate() -> Void
    func resolve() -> Void
}

class UntargetedActivatedAbility: Object, ActivatedAbility {
    private var source: Object
    private var cost: ManaCost
    
    init(source: Object, cost: ManaCost, effect:@escaping (Object) -> ()) {
        self.source = source
        self.cost = cost
        super.init(name: "Activated Ability of " + source.getName())
        effects.append(UntargetedEffect(effect))
    }
    
    func getSource() -> Object {
        return source
    }
    
    func getCost() -> ManaCost {
        return cost
    }
    
    func activate() {
        Game.shared.theStack.push(self)
    }
    
    override func getController() -> Player {
        return source.getController()
    }
    
    override func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve(source: getSource())
            }
        }
    }
}
