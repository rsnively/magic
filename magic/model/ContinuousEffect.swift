import Foundation

protocol ContinuousEffect {
    func isUntilEndOfTurn() -> Bool
    func appliesInAllZones() -> Bool
    func apply(_ object: Object) -> Object
}

class ContinuousEffectUntilEndOfTurn: ContinuousEffect {
    private var effect: (Object) -> Object
    private var allZones: Bool

    init(_ effect: @escaping (Object) -> Object, allZones: Bool = false) {
        self.effect = effect
        self.allZones = allZones
    }
    
    func isUntilEndOfTurn() -> Bool {
        return true
    }
    
    func appliesInAllZones() -> Bool {
        return allZones
    }

    func apply(_ object: Object) -> Object {
        return effect(object)
    }
}

class StaticAbility: ContinuousEffect {
    private var effect: (Object) -> Object
    private var allZones: Bool
    
    init(_ effect: @escaping (Object) -> Object, allZones: Bool = false) {
        self.effect = effect
        self.allZones = allZones
    }
    
    func isUntilEndOfTurn() -> Bool {
        return false
    }
    
    func appliesInAllZones() -> Bool {
        return allZones
    }
    
    func apply(_ object: Object) -> Object {
        return effect(object)
    }
}
