import Foundation

protocol Effect {
    func isOptional() -> Bool
    func requiresTarget() -> Bool
    func numPossibleTargets() -> Int
    func resolve(_ associatedObjects: AssociatedObjects) -> Void
    func resetTargets() -> Void
}

class UntargetedEffect: Effect {
    private var effect:(AssociatedObjects) -> Void
    private var optional: Bool
    
    init(
        effect: @escaping (AssociatedObjects) -> Void,
        optional: Bool = false
    ) {
        self.effect = effect
        self.optional = optional
    }

    func isOptional() -> Bool {
        return optional
    }
    func requiresTarget() -> Bool {
        return false
    }
    func numPossibleTargets() -> Int {
        return 0
    }
    
    func resolve(_ associatedObjects: AssociatedObjects) {
        effect(associatedObjects)
    }
    
    func resetTargets() {}
}

class TargetingRestriction {
    private var restriction: (Targetable) -> Bool
    private var zones: [Zone]
    private var optional: Bool
    
    init(
        restriction: @escaping (Targetable) -> Bool,
        zones: [Zone],
        optional: Bool = false
    ) {
        self.restriction = restriction
        self.zones = zones
        self.optional = optional
    }
    
    static func SingleObject(
        restriction: @escaping (Object) -> Bool,
        zones: [Zone],
        optional: Bool = false
    ) -> TargetingRestriction {
        let targetableRestriction: (Targetable) -> Bool = { target in
            if let objectTarget = target as? Object {
                return restriction(objectTarget)
            }
            return false
        }
        return TargetingRestriction(
            restriction: targetableRestriction,
            zones: zones,
            optional: optional
        )
    }
    static func SinglePlayer(
        restriction: @escaping (Player) -> Bool,
        optional: Bool = false
    ) -> TargetingRestriction {
        let targetableRestriction: (Targetable) -> Bool = { target in
            if let playerTarget = target as? Player {
                return restriction(playerTarget)
            }
            return false
        }
        return TargetingRestriction(
            restriction: targetableRestriction,
            zones: [],
            optional: optional
        )
    }
    
    static func AnyTarget(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction(
            restriction: { targetable in
                if let object = targetable as? Object {
                    return object.isType(.Creature) || object.isType(.Planeswalker)
                }
                if let _ = targetable as? Player {
                    return true
                }
                return false
            },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetPlayer(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SinglePlayer(
            restriction: { _ in return true },
            optional: optional
        )
    }
    static func TargetPlayerOrPlaneswalker(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction(
            restriction: { targetable in
                if let object = targetable as? Object {
                    return object.isType(.Planeswalker)
                }
                if let _ = targetable as? Player {
                    return true
                }
                return false
            },
            zones: [.Battlefield],
            optional: optional
        )
    }
    
    static func TargetArtifact(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Artifact) },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetCreature(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Creature) },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func AnotherTargetCreature(source: Object, optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0 != source && $0.isType(.Creature) },
            zones: [.Battlefield])
    }
    static func TargetCreatureYouControl(source: Object, optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Creature) && $0.getController() === source.getController() },
            zones: [.Battlefield])
    }
    static func AnotherTargetCreatureYouControl(source: Object, optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0 != source && $0.isType(.Creature) && $0.getController() === source.getController() },
            zones: [.Battlefield])
    }
    static func TargetCreatureAnOpponentControl(source: Object, optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Creature) && $0.getController() !== source.getController() },
            zones: [.Battlefield])
    }
    static func TargetAttackingCreature(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isAttacking && $0.isType(.Creature) },
            zones: [.Battlefield])
    }
    static func TargetCreatureOrPlaneswalker(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Creature) || $0.isType(.Planeswalker) },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetEnchantment(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Enchantment) },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetLand(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Land) },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetNonlandPermanent(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { !$0.isType(.Land) && $0.isPermanent() },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetPermanent(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isPermanent() },
            zones: [.Battlefield],
            optional: optional
        )
    }
    static func TargetArtifactOrEnchantment(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Artifact) || $0.isType(.Enchantment) },
            zones: [.Battlefield],
            optional: optional
        )
    }
    
    static func TargetSpell(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isSpell() },
            zones: [.Stack],
            optional: optional
        )
    }
    static func TargetCreatureSpell(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Creature) && $0.isSpell() },
            zones: [.Stack],
            optional: optional
        )
    }
    static func TargetNonCreatureSpell(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { !$0.isType(.Creature) && $0.isSpell() },
            zones: [.Stack],
            optional: optional
        )
    }
    
    func meetsRestriction(target: Targetable) -> Bool {
        if let playerTarget = target as? Player {
            return restriction(playerTarget)
        }
        else if let objectTarget = target as? Object {
            return zones.contains(objectTarget.getZone()) && restriction(objectTarget)
        }
        return false
    }
    
    func isOptional() -> Bool {
        return optional
    }
}

class TargetedEffect: Effect {
    private var restrictions: [TargetingRestriction]
    private var effect: ([Targetable?], AssociatedObjects) -> Void
    private var distinctTargets: Bool
    private var optional: Bool
    
    private var targets: [Targetable] = []
    
    init(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Targetable?], AssociatedObjects) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
    ) {
        self.restrictions = restrictions
        self.effect = effect
        self.distinctTargets = distinctTargets
        self.optional = effectOptional
    }
    
    convenience init(
        restriction: TargetingRestriction,
        effect: @escaping (Targetable?, AssociatedObjects) -> Void,
        effectOptional: Bool = false
    ) {
        self.init(
            restrictions: [restriction],
            effect: { targets, associatedObjects in effect(targets.first!, associatedObjects) },
            distinctTargets: false,
            effectOptional: effectOptional
        )
    }
    convenience init(
        restriction: TargetingRestriction,
        effect: @escaping (Targetable?) -> Void,
        effectOptional: Bool = false
        ) {
        self.init(
            restrictions: [restriction],
            effect: { targets, associatedObjects in effect(targets.first!) },
            distinctTargets: false,
            effectOptional: effectOptional
        )
    }
    convenience init(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Targetable?]) -> Void,
        effectOptional: Bool = false
        ) {
        self.init(
            restrictions: restrictions,
            effect: { targets, associatedObjects in effect(targets) },
            distinctTargets: false,
            effectOptional: effectOptional
        )
    }
    
    static func SingleObject(
        restriction: TargetingRestriction,
        effect: @escaping (Object, AssociatedObjects) -> Void,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: (Targetable?, AssociatedObjects) -> Void = { target, associatedObjects in
            if let target = target {
                if let object = target as? Object {
                    effect(object, associatedObjects)
                }
            }
        }
        return TargetedEffect(
            restriction: restriction,
            effect: targetableEffect,
            effectOptional: effectOptional
        )
    }
    static func SingleObject(
        restriction: TargetingRestriction,
        effect: @escaping (Object) -> Void,
        effectOptional: Bool = false
        ) -> TargetedEffect {
        return SingleObject(
            restriction: restriction,
            effect: { object, associatedObjects in effect(object) },
            effectOptional: effectOptional
        )
    }
    
    static func MultiObject(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Object?], AssociatedObjects) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: ([Targetable?], AssociatedObjects) -> Void = { targets, associatedObjects in
            var objectTargets: [Object?] = []
            for target in targets {
                objectTargets.append(target as? Object)
            }
            effect(objectTargets, associatedObjects)
        }
        return TargetedEffect(
            restrictions: restrictions,
            effect: targetableEffect,
            distinctTargets: distinctTargets,
            effectOptional: effectOptional
        )
    }
    static func MultiObject(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Object?]) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
        ) -> TargetedEffect {
        return MultiObject(
            restrictions: restrictions,
            effect: { targets, associatedObjects in effect(targets) },
            distinctTargets: distinctTargets,
            effectOptional: effectOptional
        )
    }
    
    static func SinglePlayer(
        restriction: TargetingRestriction,
        effect: @escaping (Player, AssociatedObjects) -> Void,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: (Targetable?, AssociatedObjects) -> Void = { target, associatedObjects in
            if let target = target {
                if let player = target as? Player {
                    effect(player, associatedObjects)
                }
            }
        }
        return TargetedEffect(
            restriction: restriction,
            effect: targetableEffect,
            effectOptional: effectOptional
        )
    }
    static func SinglePlayer(
        restriction: TargetingRestriction,
        effect: @escaping (Player) -> Void,
        effectOptional: Bool = false
        ) -> TargetedEffect {
        return SinglePlayer(
            restriction: restriction,
            effect: { player, associatedObjects in effect(player) },
            effectOptional: effectOptional
        )
    }
    
    static func MultiPlayer(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Player?], AssociatedObjects) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: ([Targetable?], AssociatedObjects) -> Void = { targets, associatedObjects in
            var playerTargets: [Player?] = []
            for target in targets {
                playerTargets.append(target as? Player)
            }
            effect(playerTargets, associatedObjects)
        }
        return TargetedEffect(
            restrictions: restrictions,
            effect: targetableEffect,
            distinctTargets: distinctTargets,
            effectOptional: effectOptional
        )
    }
    static func MultiPlayer(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Player?]) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
        ) -> TargetedEffect {
        return MultiPlayer(
            restrictions: restrictions,
            effect: { players, associatedObjects in effect(players) },
            distinctTargets: distinctTargets,
            effectOptional: effectOptional
        )
    }
    
    func isOptional() -> Bool {
        return optional
    }
        
    func requiresTarget() -> Bool {
        return true
    }
    
    func numPossibleTargets() -> Int {
        return restrictions.count
    }
    
    // TODO: Skipping optional target in middle?
    func canFinishTargeting() -> Bool {
        for index in targets.count ..< restrictions.count {
            if !restrictions[index].isOptional() {
                return false
            }
        }
        return true
    }
    
    func targetAlreadySelected(_ target: Targetable) -> Bool {
        return targets.contains(where: { $0 === target })
    }
    
    func meetsRestrictions(target: Targetable) -> Bool {
        // TODO: Hexproof shouldn't stop spells/abilities you control
        return !target.isHexproof() && restrictions[targets.count].meetsRestriction(target: target) && !(distinctTargets && targetAlreadySelected(target))
    }
    
    func selectTarget(_ target: Targetable) {
        self.targets.append(target)
    }
    
    func allTargetsSelected() -> Bool {
        return targets.count == restrictions.count
    }
    
    func resolve(_ associatedObjects: AssociatedObjects) {
        // TODO: Still need to be able to partially invalidate effects with multiple targets (ie: Destroy two target creatures - if one target is no longer valid, the other creature still needs to get destroyed)
        var targetsValid = true
        for i in 0..<restrictions.count {
            if i < targets.count {
                // TODO: Hexproof shouldn't stop spells/abilities you control
                if targets[i].isHexproof() || !restrictions[i].meetsRestriction(target: targets[i]) {
                    targetsValid = false
                }
            }
        }
        if targetsValid {
            effect(targets, associatedObjects)
        }
        resetTargets()
    }
    
    func resetTargets() {
        targets.removeAll()
    }
}
