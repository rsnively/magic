import Foundation

class AbilityRequirement {
    private var requirement: (Object) -> Bool
    
    init(_ requirement: @escaping (Object) -> Bool) {
        self.requirement = requirement
    }
    
    func And(_ other: AbilityRequirement) -> AbilityRequirement {
        return AbilityRequirement({ self.meetsRequirement($0) && other.meetsRequirement($0) })
    }
    func Or(_ other: AbilityRequirement) -> AbilityRequirement {
        return AbilityRequirement({ self.meetsRequirement($0) || other.meetsRequirement($0) })
    }
    
    static func This(_ source: Object) -> AbilityRequirement {
        return AbilityRequirement({ $0 == source })
    }
    
    static func ArtifactsYourOpponentsControl(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isType(.Artifact) && $0.getController() !== source.getController() && additionalRequirement($0) })
    }
    static func AuraAndEquipmentSpellsYouCast(source: Object) -> AbilityRequirement {
        return AbilityRequirement({ ($0.isType(.Aura) || $0.isType(.Equipment)) && $0.isSpell() && $0.getOwner() === source.getController() })
    }
    static func CreatureSpellsYouCast(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isType(.Creature) && $0.isSpell() && $0.getOwner() === source.getOwner() && additionalRequirement($0) })
    }
    static func Creatures(additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isType(.Creature) && additionalRequirement($0) })
    }
    static func CreaturesYouControl(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isType(.Creature) && $0.getController() === source.getController() && additionalRequirement($0) })
    }
    static func CreaturesYourOpponentsControl(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isType(.Creature) && $0.getController() !== source.getController() && additionalRequirement($0) })
    }
    static func EnchantedObject(aura: Object) -> AbilityRequirement {
        return AbilityRequirement({ aura.isAttachedTo($0) })
    }
    static func EquippedObject(equipment: Object) -> AbilityRequirement {
        return AbilityRequirement({ equipment.isAttachedTo($0) })
    }
    static func InstantAndSorcerySpellsYouCast(source: Object) -> AbilityRequirement {
        return AbilityRequirement({ ($0.isType(.Instant) || $0.isType(.Sorcery)) && $0.isSpell() && $0.getOwner() === source.getController() })
    }
    static func OtherCreaturesYouControl(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0 != source && $0.isType(.Creature) && $0.getController() === source.getController() && additionalRequirement($0) })
    }
    static func OtherSubtypeYouControl(source: Object, subtype: Subtype, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0 != source && $0.isType(subtype) && $0.getController() === source.getController() && additionalRequirement($0) })
    }
    static func SpellsYouCast(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isSpell() && $0.getOwner() === source.getOwner() && additionalRequirement($0) })
    }
    static func SpellsYourOpponentsCast(source: Object, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isSpell() && $0.getOwner() !== source.getOwner() && additionalRequirement($0) })
    }
    static func SubtypeYouControl(source: Object, subtype: Subtype, additionalRequirement: @escaping (Object) -> Bool = {_ in return true }) -> AbilityRequirement {
        return AbilityRequirement({ $0.isType(subtype) && $0.getController() === source.getController() && additionalRequirement($0) })

    }
    
    func meetsRequirement(_ object: Object) -> Bool {
        return requirement(object)
    }
}

class StaticAbility : ContinuousEffect {
    private var requirement: AbilityRequirement
    
    init(requirement: AbilityRequirement, effect: @escaping (Object) -> Object, layer: EffectLayer, allZones: Bool = false) {
        self.requirement = requirement
        super.init(effect: effect, layer: layer, duration: .Static, allZones: allZones)
    }
    
    override func apply(_ object: Object) -> Object {
        return requirement.meetsRequirement(object) ? effect(object) : object
    }
}
