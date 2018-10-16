import Foundation

protocol Effect {
    func requiresTarget() -> Bool
    func resolve() -> Void
}

class UntargetedEffect: Effect {
    private var effect:() -> Void
    
    init(_ effect:@escaping () -> Void) {
        self.effect = effect
    }
    
    func requiresTarget() -> Bool {
        return false
    }
    
    func resolve() {
        effect()
    }
}

class TargetedEffect: Effect {
    private var restriction:(Object) -> Bool
    private var effect:(Object) -> Void
    
    weak var target: Object?
    
    init(restriction: @escaping (Object) -> Bool, effect:@escaping (Object) -> Void) {
        self.restriction = restriction
        self.effect = effect
    }
    
    func requiresTarget() -> Bool {
        return true
    }
    
    func meetsRestrictions(target: Object) -> Bool{
        return restriction(target)
    }
    
    func selectTarget(_ target: Object) {
        self.target = target
    }
    
    func resolve() {
        // todo only if target is still valid
        if let target = target {
            effect(target)
        }
    }
}
