import Foundation

protocol ContinuousEffect {
    func isUntilEndOfTurn() -> Bool
    func apply(_ object: Object) -> Object
}

class ContinuousEffectUntilEndOfTurn: ContinuousEffect {
    private var effect: (Object) -> Object

    init(_ effect: @escaping (Object) -> Object) {
        self.effect = effect
    }
    
    func isUntilEndOfTurn() -> Bool {
        return true
    }

    func apply(_ object: Object) -> Object {
        return effect(object)
    }
}

class StaticAbility: ContinuousEffect {
    private var effect: (Object) -> Object
    
    init(_ effect: @escaping (Object) -> Object) {
        self.effect = effect
    }
    
    func isUntilEndOfTurn() -> Bool {
        return false
    }
    
    func apply(_ object: Object) -> Object {
        return effect(object)
    }
}
