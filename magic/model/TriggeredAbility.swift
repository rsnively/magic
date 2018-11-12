import Foundation

protocol TriggeredAbility {
    func getTrigger() -> Trigger
    func getSource() -> Object
    func requiresTarget() -> Bool
    func triggerAbility() -> Void
}

class UntargetedTriggeredAbility: Object, TriggeredAbility {
    private var source: Object
    private var trigger: Trigger
    private var restriction: () -> Bool
    
    init(source: Object, trigger: Trigger, effect:@escaping () -> Void, restriction: @escaping () -> Bool = { return true }) {
        self.source = source
        self.trigger = trigger
        self.restriction = restriction
        super.init(name: "Triggered Ability of " + source.getName())
        effects.append(UntargetedEffect(effect))
    }
    
    func getTrigger() -> Trigger {
        return trigger
    }
    func getSource() -> Object {
        return source
    }
    func requiresTarget() -> Bool {
        return false
    }
    func triggerAbility() {
        if restriction() {
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return getSource().getController()
    }
    
    override func resolve() {
        if restriction() {
            for effect in effects {
                effect.resolve()
            }
        }
    }
}

class TargetedTriggeredAbility: Object, TriggeredAbility {
    private var source: Object
    private var trigger: Trigger
    private var restriction: () -> Bool
    
    init(source: Object, trigger: Trigger, effect: TargetedEffect, restriction: @escaping () -> Bool = { return true }) {
        self.source = source
        self.trigger = trigger
        self.restriction = restriction
        super.init(name: "Triggered Ability of" + source.getName())
        effects.append(effect)
    }
    
    func getTrigger() -> Trigger {
        return trigger
    }
    func getSource() -> Object {
        return source
    }
    func requiresTarget() -> Bool {
        return true
    }
    func triggerAbility() {
        let effect = effects.first(where: { return $0.requiresTarget() }) as! TargetedEffect?
        if restriction() && Game.shared.hasTargets(effect!) {
            Game.shared.targetingEffects.append(effect!)
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return getSource().getController()
    }
    
    override func resolve() {
        if restriction() {
            for effect in effects {
                effect.resolve()
            }
        }
    }
}
