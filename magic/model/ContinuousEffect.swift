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

class StaticAbility : ContinuousEffect {
    private var requirement: (Object) -> Bool
    
    init(requirement: @escaping (Object) -> Bool, effect: @escaping (Object) -> Object, allZones: Bool = false) {
        self.requirement = requirement
        super.init(effect: effect, duration: .Static, allZones: allZones)
    }
    
    override func apply(_ object: Object) -> Object {
        return requirement(object) ? effect(object) : object
    }
}
