import Foundation

enum EffectDuration {
    case Static
    case UntilEndOfTurn
}

enum EffectLayer {
    case Copy
    case ControlChanging
    case TextChanging
    case TypeChanging
    case ColorChanging
    case AbilityAddingOrRemoving
    case PowerToughnessCDA
    case PowerToughnessSetting
    case PowerToughnessChanging
    case PowerToughnessChangesFromCounters
    case PowerToughnessSwitching
    
    // Are these handled by the layer system?
    // https://pucatrade.com/articles/2015/judgecorner3 says to do this order, but can they effecy other layers?
    case CostIncrease
    case CostReduction
    
    case NoEffect
}

class ContinuousEffect {
    internal var effect: (Object) -> Object
    internal var layer: EffectLayer
    internal var duration: EffectDuration
    internal var allZones: Bool

    init(effect: @escaping (Object) -> Object, layer: EffectLayer, duration: EffectDuration,  allZones: Bool = false) {
        self.effect = effect
        self.layer = layer
        self.duration = duration
        self.allZones = allZones
    }
    
    static func UntilEndOfTurn(effect: @escaping (Object) -> Object, layer: EffectLayer, allZones: Bool = false) -> ContinuousEffect {
        return ContinuousEffect(
            effect: effect,
            layer: layer,
            duration: .UntilEndOfTurn,
            allZones: allZones
        )
    }
    
    static func GiveKeywordUntilEndOfTurn(_ keyword: KeywordAbility) -> ContinuousEffect {
        return UntilEndOfTurn(effect: { return $0.withKeyword(keyword) }, layer: .AbilityAddingOrRemoving)
    }
    static func RemoveKeywordUntilEndOfTurn(_ keyword: KeywordAbility) -> ContinuousEffect {
        return UntilEndOfTurn(effect: { return $0.withoutKeyword(keyword) }, layer: .AbilityAddingOrRemoving)
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
