import Foundation

protocol Effect {
    func isOptional() -> Bool
    func requiresTarget() -> Bool
    func numPossibleTargets() -> Int
    func resolve() -> Void
    func resetTargets() -> Void
}

class UntargetedEffect: Effect {
    private var effect:() -> Void
    private var optional: Bool
    
    init(
        effect: @escaping () -> Void,
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
    
    func resolve() {
        effect()
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
    static func TargetLand(optional: Bool = false) -> TargetingRestriction {
        return TargetingRestriction.SingleObject(
            restriction: { $0.isType(.Land) },
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
    private var effect: ([Targetable?]) -> Void
    private var distinctTargets: Bool
    private var optional: Bool
    
    private var targets: [Targetable] = []
    
    init(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Targetable?]) -> Void,
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
        effect: @escaping (Targetable?) -> Void,
        effectOptional: Bool = false
    ) {
        self.init(
            restrictions: [restriction],
            effect: { objects in effect(objects.first!) },
            distinctTargets: false,
            effectOptional: effectOptional
        )
    }
    
    static func SingleObject(
        restriction: TargetingRestriction,
        effect: @escaping (Object) -> Void,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: (Targetable?) -> Void = {
            if let target = $0 {
                if let object = target as? Object {
                    effect(object)
                }
            }
        }
        return TargetedEffect(
            restriction: restriction,
            effect: targetableEffect,
            effectOptional: effectOptional
        )
    }
    
    static func MultiObject(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Object?]) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: ([Targetable?]) -> Void = { targets in
            var objectTargets: [Object?] = []
            for target in targets {
                objectTargets.append(target as? Object)
            }
            effect(objectTargets)
        }
        return TargetedEffect(
            restrictions: restrictions,
            effect: targetableEffect,
            distinctTargets: distinctTargets,
            effectOptional: effectOptional
        )
    }
    
    static func SinglePlayer(
        restriction: TargetingRestriction,
        effect: @escaping (Player) -> Void,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: (Targetable?) -> Void = {
            if let target = $0 {
                if let player = target as? Player {
                    effect(player)
                }
            }
        }
        return TargetedEffect(
            restriction: restriction,
            effect: targetableEffect,
            effectOptional: effectOptional
        )
    }
    
    static func MultiPlayer(
        restrictions: [TargetingRestriction],
        effect: @escaping ([Player?]) -> Void,
        distinctTargets: Bool = false,
        effectOptional: Bool = false
    ) -> TargetedEffect {
        let targetableEffect: ([Targetable?]) -> Void = { targets in
            var playerTargets: [Player?] = []
            for target in targets {
                playerTargets.append(target as? Player)
            }
            effect(playerTargets)
        }
        return TargetedEffect(
            restrictions: restrictions,
            effect: targetableEffect,
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
        return !target.isHexproof() && restrictions[targets.count].meetsRestriction(target: target) && !(distinctTargets && targetAlreadySelected(target))
    }
    
    func selectTarget(_ target: Targetable) {
        self.targets.append(target)
    }
    
    func allTargetsSelected() -> Bool {
        return targets.count == restrictions.count
    }
    
    func resolve() {
        // TODO: Still need to be able to partially invalidate effects with multiple targets (ie: Destroy two target creatures - if one target is no longer valid, the other creature still needs to get destroyed)
        var targetsValid = true
        for i in 0..<restrictions.count {
            if i < targets.count {
                if targets[i].isHexproof() || !restrictions[i].meetsRestriction(target: targets[i]) {
                    targetsValid = false
                }
            }
        }
        if targetsValid {
            effect(targets)
        }
        resetTargets()
    }
    
    func resetTargets() {
        targets.removeAll()
    }
}
