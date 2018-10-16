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
    
    init(source: Object, trigger: Trigger, effect:@escaping () -> Void) {
        self.source = source
        self.trigger = trigger
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
        Game.shared.theStack.push(self)
    }
    
    override func getController() -> Player {
        return getSource().getController()
    }
    
    override func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve()
            }
        }
    }
}

class TargetedTriggeredAbility: Object, TriggeredAbility {
    private var source: Object
    private var trigger: Trigger
    
    init(source: Object, trigger: Trigger, restriction: @escaping (Object) -> Bool, effect: @escaping (Object) -> Void) {
        self.source = source
        self.trigger = trigger
        super.init(name: "Triggered Ability of" + source.getName())
        effects.append(TargetedEffect(restriction: restriction, effect: effect))
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
        if Game.shared.hasTargets(effect!) {
            Game.shared.targetingEffect = effect
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return getSource().getController()
    }
    
    override func resolve() {
        if !effects.isEmpty {
            for effect in effects {
                effect.resolve()
            }
        }
    }
}
