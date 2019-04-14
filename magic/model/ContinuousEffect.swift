import Foundation

enum EffectDuration {
    case Static
    case UntilEndOfTurn
}

class ContinuousEffect {
    internal var effect: (Object) -> Object
    internal var duration: EffectDuration
    internal var allZones: Bool

    init(effect: @escaping (Object) -> Object, duration: EffectDuration,  allZones: Bool = false) {
        self.effect = effect
        self.duration = duration
        self.allZones = allZones
    }
    
    static func UntilEndOfTurn(_ effect: @escaping (Object) -> Object, allZones: Bool = false) -> ContinuousEffect {
        return ContinuousEffect(
            effect: effect,
            duration: .UntilEndOfTurn,
            allZones: allZones
        )
    }
    
    func getDuration() -> EffectDuration {
        return duration
    }
    
    func appliesInAllZones() -> Bool {
        return allZones
    }

    func apply(_ object: Object) -> Object {
        return effect(object)
    }
}
