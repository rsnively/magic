import Foundation

enum EffectDuration {
    case Static
    case UntilEndOfTurn
    case UntilYourNextTurn
}

enum EffectLayer: Int {
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
    
    case CostIncrease
    case CostReduction
    case CostSetting
    
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
    static func UntilYourNextTurn(effect: @escaping (Object) -> Object, layer: EffectLayer, allZones: Bool = false) -> ContinuousEffect {
        return ContinuousEffect(
            effect: effect,
            layer: layer,
            duration: .UntilYourNextTurn,
            allZones: allZones
        )
    }
    
    static func GiveKeywordUntilEndOfTurn(_ keyword: KeywordAbility) -> ContinuousEffect {
        return UntilEndOfTurn(effect: { return $0.withKeyword(keyword) }, layer: .AbilityAddingOrRemoving)
    }
    static func RemoveKeywordUntilEndOfTurn(_ keyword: KeywordAbility) -> ContinuousEffect {
        return UntilEndOfTurn(effect: { return $0.withoutKeyword(keyword) }, layer: .AbilityAddingOrRemoving)
    }
    static func PlusOnePlusOneCounters(amount: Int) -> ContinuousEffect {
        return ContinuousEffect(
            effect: { return $0.hasPowerAndToughness() ? $0.pumped(amount, amount) : $0 },
            layer: .PowerToughnessChangesFromCounters,
            duration: .Static)
    }
    
    func getLayer() -> EffectLayer {
        return layer
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
