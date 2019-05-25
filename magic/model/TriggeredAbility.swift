import Foundation

typealias AssociatedObjects = [String: [Object]]

protocol TriggeredAbility {
    func getTrigger() -> Trigger
    func getSource() -> Object
    func requiresTarget() -> Bool
    func doesTriggerInGraveyard() -> Bool
    func triggerAbility(associatedObjects: AssociatedObjects) -> Void
}

class UntargetedTriggeredAbility: Object, TriggeredAbility {
    private var source: Object
    private var trigger: Trigger
    private var restriction: () -> Bool
    private var triggersInGraveyard: Bool
    private var associatedObjects: AssociatedObjects?
    
    init(
        source: Object,
        trigger: Trigger,
        effect: @escaping (AssociatedObjects) -> Void,
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
    
    convenience init(
        source: Object,
        trigger: Trigger,
        effect: @escaping () -> Void,
        effectOptional: Bool = false,
        restriction: @escaping () -> Bool = { return true },
        triggersInGraveyard: Bool = false
        ) {
        self.init(
            source: source,
            trigger: trigger,
            effect: { _ in effect() },
            effectOptional: effectOptional,
            restriction: restriction,
            triggersInGraveyard: triggersInGraveyard
        )
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
    func triggerAbility(associatedObjects: AssociatedObjects) {
        if restriction() {
            self.associatedObjects = associatedObjects
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
                    effect.resolve(associatedObjects!)
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
    private var associatedObjects: AssociatedObjects?

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
    func triggerAbility(associatedObjects: AssociatedObjects) {
        let effect = spellAbility as! TargetedEffect
        if restriction() && Game.shared.hasTargets(effect) {
            self.associatedObjects = associatedObjects
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
                    effect.resolve(associatedObjects!)
                }
            }
        }
    }
}
