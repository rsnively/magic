import Foundation

protocol TriggeredAbility {
    func getTrigger() -> Trigger
    func getSource() -> Object
    func requiresTarget() -> Bool
    func doesTriggerInGraveyard() -> Bool
    func triggerAbility() -> Void
}

class UntargetedTriggeredAbility: Object, TriggeredAbility {
    private var source: Object
    private var trigger: Trigger
    private var restriction: () -> Bool
    private var triggersInGraveyard: Bool
    
    init(
        source: Object,
        trigger: Trigger,
        effect: @escaping () -> Void,
        effectOptional: Bool = false,
        restriction: @escaping () -> Bool = { return true },
        triggersInGraveyard: Bool = false
    ) {
        self.source = source
        self.trigger = trigger
        self.restriction = restriction
        self.triggersInGraveyard = triggersInGraveyard
        super.init(name: "Triggered Ability of " + source.getName())
        self.spellAbility = UntargetedEffect(effect: effect, optional: effectOptional)
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
    func doesTriggerInGraveyard() -> Bool {
        return triggersInGraveyard
    }
    func triggerAbility() {
        if restriction() {
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return getSource().getController()
    }
    
    override func isSpell() -> Bool {
        return false
    }
    
    override func resolve() {
        if restriction() {
            if let effect = spellAbility {
                if effect.isOptional() {
                    Game.shared.resolvingOptionalEffect = effect
                }
                else {
                    effect.resolve()
                }
            }
        }
    }
}

class TargetedTriggeredAbility: Object, TriggeredAbility {
    private var source: Object
    private var trigger: Trigger
    private var restriction: () -> Bool
    private var triggersInGraveyard: Bool

    init(
        source: Object,
        trigger: Trigger,
        effect: TargetedEffect,
        restriction: @escaping () -> Bool = { return true },
        triggersInGraveyard: Bool = false
    ) {
        self.source = source
        self.trigger = trigger
        self.restriction = restriction
        self.triggersInGraveyard = triggersInGraveyard
        super.init(name: "Triggered Ability of" + source.getName())
        self.spellAbility = effect
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
    func doesTriggerInGraveyard() -> Bool {
        return triggersInGraveyard
    }
    func triggerAbility() {
        let effect = spellAbility as! TargetedEffect
        if restriction() && Game.shared.hasTargets(effect) {
            Game.shared.targetingEffects.append(effect)
            Game.shared.theStack.push(self)
        }
    }
    
    override func getController() -> Player {
        return getSource().getController()
    }
    
    override func isSpell() -> Bool {
        return false
    }
    
    override func resolve() {
        if restriction() {
            if let effect = spellAbility {
                if effect.isOptional() {
                    Game.shared.resolvingOptionalEffect = effect
                }
                else {
                    effect.resolve()
                }
            }
        }
    }
}
