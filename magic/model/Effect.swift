import Foundation

protocol Effect {
    func requiresTarget() -> Bool
    func resolve(source: Object)
}

class UntargetedEffect: Effect {
    private var effect:(Object) -> ()
    
    init(_ effect:@escaping (Object) -> ()) {
        self.effect = effect
    }
    
    func requiresTarget() -> Bool {
        return false
    }
    
    func resolve(source: Object) {
        effect(source)
    }
}

class TargetedEffect: Effect {
    private var restriction:(Object) -> Bool
    private var effect:(Object, Object) -> ()
    
    weak var target: Object?
    
    init(restriction: @escaping (Object) -> Bool, effect:@escaping (Object, Object) -> ()) {
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
    
    func resolve(source: Object) {
        // todo only if target is still valid
        if let target = target {
            effect(source, target)
        }
    }
}
