import Foundation

class Game: NSObject {
    var player1: Player
    var player2: AIPlayer
    var theStack: SpellStack
    private var currentPhase: Phase
    
    private var landPlayedThisTurn: Bool
    private var declaringAttackers: Bool
    private var declaringBlockers: Bool
    private var selectedBlocker: Object?
    var targetingEffects: [TargetedEffect] = []
    var isTargeting: Bool {
        return !targetingEffects.isEmpty
    }
    var selectingAbilityObject: Object?
    var isSelectingAbility: Bool {
        return selectingAbilityObject != nil
    }
    func selectTarget(_ target: Targetable) {
        assert(isTargeting)
        let targetingEffect = targetingEffects.last!
        targetingEffect.selectTarget(target)
        if targetingEffect.allTargetsSelected() {
            _ = targetingEffects.popLast()
        }
    }
    
    var isChoosingCardToDiscard: Bool {
        return player1.cardsToDiscard > 0 || player2.cardsToDiscard > 0
    }
    
    var choosingLegendaryToKeep : String? = nil
    var isChoosingLegendaryToKeep: Bool {
        return choosingLegendaryToKeep != nil
    }
    func chooseLegendaryToKeep(_ object: Object) {
        assert(isChoosingLegendaryToKeep)
        assert(object.name == choosingLegendaryToKeep)
        object.getController().getPermanents().forEach({ permanent in
            if permanent.isType(.Legendary) && permanent.id != object.id && permanent.name == object.name {
                let _ = permanent.destroy(ignoreIndestructible: true)
            }
        })
        choosingLegendaryToKeep = nil
        checkStateBasedActions()
    }
    
    func isSelectingBesidesAttackBlock() -> Bool {
        return isTargeting || isSelectingAbility || isChoosingCardToDiscard || isChoosingLegendaryToKeep
    }
    
    func isSelecting() -> Bool {
        return isSelectingBesidesAttackBlock() || declaringBlockers || declaringAttackers
    }
    
    private var turnNumber: Int
    
    static let shared = Game()
    
    override private init() {
        var deck1: [Card] = []
        var deck2: [Card] = []
        for _ in 0..<6 {
            
            deck1.append(GRN.Swamp())
            deck1.append(LEA.DarkRitual())
            deck1.append(GRN.BurglarRat())
            
            deck2.append(GRN.Swamp())
            deck2.append(GRN.BurglarRat())
        }
        
        player1 = Player(deck: deck1)
        player2 = AIPlayer(deck: deck2)
        theStack = SpellStack()
        currentPhase = Phase.Untap
        landPlayedThisTurn = false
        declaringAttackers = false
        declaringBlockers = false
        selectedBlocker = nil
        turnNumber = 0
        super.init()
        player1.active = true
        player1.hasPriority = true
    }
    
    func getActivePlayer() -> Player {
        return player1.active ? player1 : player2
    }
    
    func getNonActivePlayer() -> Player {
        return player1.active ? player2 : player1
    }
    
    func getOtherPlayer(_ player: Player) -> Player {
        if player === player1 {
            return player2
        }
        return player1
    }
    
    func bothPlayers(_ f: (_ player: Player) -> Void) {
        f(player1)
        f(player2)
    }
    func eitherPlayer(_ f: (_ player: Player) -> Bool) -> Bool {
        return f(player1) || f(player2)
    }
    
    func yourTurn() -> Bool {
        return player1.active
    }
    
    func getCurrentTurn() -> Int {
        return turnNumber
    }
    
    func getPlayerWithPriority() -> Player {
        return player1.hasPriority ? player1 : player2
    }
    
    func getPlayerWithoutPriority() -> Player {
        return player1.hasPriority ? player2 : player1
    }
    
    func passPriority() {
        checkStateBasedActions()
        swap(&player1.hasPriority, &player2.hasPriority)
        getPlayerWithPriority().givePriority()
    }
    
    func getCurrentPhase() -> Phase {
        return currentPhase
    }
    
    func landWasPlayedThisTurn() -> Bool {
        return landPlayedThisTurn
    }
    
    func isDeclaringAttackers() -> Bool {
        return declaringAttackers
    }
    func isDeclaringBlockers() -> Bool {
        return declaringBlockers
    }
    
    func selectBlocker(_ object: Object) {
        selectedBlocker = object
    }
    func deselectBlocker() {
        selectedBlocker = nil
    }
    func getSelectedBlocker() -> Object? {
        return selectedBlocker
    }
    
    func setLandPlayedThisTurn() {
        landPlayedThisTurn = true
    }
    
    func hasTargets(_ effect: TargetedEffect) -> Bool {
        return eitherPlayer({ player in
            if effect.meetsRestrictions(target: player) {
                return true
            }
            for permanent in player.getPermanents() {
                if effect.meetsRestrictions(target: permanent) {
                    return true
                }
            }
            return false
        })
    }
    
    func getStaticAbilities() -> [StaticAbility] {
        var abilities: [StaticAbility] = []
        abilities += player1.getStaticAbilities()
        abilities += player2.getStaticAbilities()
        return abilities
    }
    
    func nextPhase() {
        currentPhase = Phase(rawValue: currentPhase.rawValue + 1) ?? Phase.Untap
        getNonActivePlayer().hasPriority = false
        getActivePlayer().hasPriority = true
        bothPlayers({ $0.getManaPool().empty() })
        
        if currentPhase == .Untap {
            turnNumber = turnNumber + 1
            swap(&player1.active, &player2.active)
            landPlayedThisTurn = false
            getActivePlayer().untapAllPermanents()
            
            // would potential untap triggers get pushed to upkeep anyway?
            if theStack.isEmpty {
                nextPhase()
                return
            }
        }
        else if currentPhase == .Upkeep {
            bothPlayers({ $0.getPermanents().forEach({ $0.triggerAbilities(.EachUpkeep) }) })
            getActivePlayer().getPermanents().forEach({ $0.triggerAbilities(.YourUpkeep) })
        }
        else if currentPhase == .Draw {
            if turnNumber > 1 {
                getActivePlayer().drawCard()
            }
        }
        else if currentPhase == .BeginCombat {
            getActivePlayer().getPermanents().forEach({ $0.triggerAbilities(.YourBeginCombat) })
        }
        else if currentPhase == .Attack {
            declaringAttackers = true
            if !yourTurn() { advanceGame() }
            return
        }
        else if currentPhase == .Block && !getActivePlayer().getAttackers().isEmpty {
            declaringBlockers = true
            if yourTurn() { advanceGame() }
            return
        }
        else if currentPhase == .EndCombat {
            bothPlayers({ $0.dealCombatDamage() })
        }
        else if currentPhase == .SecondMain {
            bothPlayers({ $0.removeCreaturesFromCombat() })
        }
        else if currentPhase == .Cleanup {
            // todo, discard to hand size
            bothPlayers({ $0.getCreatures().forEach({ $0.removeDamage() })})
            bothPlayers({ $0.getPermanents().forEach({ $0.removeUntilEndOfTurnEffects() })})
            checkStateBasedActions()
            nextPhase()
            return
        }
        
        getActivePlayer().givePriority()
    }
    
    func advanceGame() {
        if declaringAttackers {
            getActivePlayer().declareAttackers()
            declaringAttackers = false
            getActivePlayer().givePriority()
            return
        }
        if declaringBlockers {
            getNonActivePlayer().declareBlockers()
            declaringBlockers = false
            getActivePlayer().givePriority()
            return
        }
        if getActivePlayer().hasPriority {
            passPriority()
            return
        }
        if !theStack.isEmpty {
            theStack.resolveTop()
            checkStateBasedActions()
            if getNonActivePlayer().hasPriority {
                passPriority()
            }
            return
        }
        if getNonActivePlayer().hasPriority {
            nextPhase()
            return
        }
        passPriority()
    }
    
    func checkStateBasedActions() {
        var actionPerformed = false
        
        // If a player has 0 or less life, that player loses the game
        // If a player has attempted to draw a card from a library with no cards in it since the last time SBA were checked, that player loses the game
        // If a player has 10 or more poison counters, that player loses the game
        // If a token is in a zone other than the battlefield, it ceases to exist
        // If a copy of a spell is in a zone other than the stack, it ceases to exist
        // If a copy of a card is in a zone other than the stack or battlefield, it ceases to exist
        
        // If a creature has toughness 0 or less, it's put into its owner's graveyard. Regeneration can't replace this event.
        bothPlayers({ player in
            player.getCreatures().forEach( { creature in
                if creature.getToughness() <= 0 {
                    actionPerformed = actionPerformed || creature.destroy(ignoreIndestructible: true)
                }
            })
        })
        
        // If a creature has toughness greater than 0, and the total damage marked on it is greater than or equal to its toughness, that creature has been dealt lethal damage and it is destroyed. Regeneration can replace this event.
        bothPlayers({ player in
            player.getCreatures().forEach( { creature in
                if creature.markedDamage >= creature.getToughness() {
                    actionPerformed = actionPerformed || creature.destroy()
                }
            })
        })
        
        // If a creature has toughness greater than 0, and it has been dealt damage by a source with deathtouch since the last time state-based actions have been checked, that creature is destroyed. Regeneration can replace this event.
        bothPlayers({ player in
            player.getCreatures().forEach({ creature in
                if creature.damagedByDeathtouch {
                    actionPerformed = actionPerformed || creature.destroy()
                }
                creature.damagedByDeathtouch = false
            })
        })
        
        // If a planeswalker has loyalty 0, it's put into its owner's graveyard.
        
        // If a player controls two or more legendary permanents with the same name, that player chooses one of them and puts the rest into their owners' graveyards.
        for permanent in getActivePlayer().getPermanents() {
            if permanent.isType(.Legendary) && permanent.getController().getPermanents().contains(where: { return $0.isType(.Legendary) && $0.name == permanent.name && $0.id != permanent.id }) {
                getActivePlayer().chooseLegendaryToKeep(name: permanent.getName())
                return
            }
        }
        for permanent in getNonActivePlayer().getPermanents() {
            if permanent.isType(.Legendary) && permanent.getController().getPermanents().contains(where: { return $0.isType(.Legendary) && $0.name == permanent.name && $0.id != permanent.id }) {
                getNonActivePlayer().chooseLegendaryToKeep(name: permanent.getName())
                return
            }
        }
        
        // If an aura is attached to an illegal object or player, or is not attached to an object or player, that aura is put into its owner's graveyard.
        // If an equipment or fortification is attached to an illegal permanent, it becomes unattached from that permanent. It remains on the battlefield.
        // If a creature (or any permanent that is not an aura, equipment, or fortification) is attached to an object or player, it becomes unattached and remains on the battlefield.
        // If a permanent has both a +1/+1 counter and a -1/-1 counter on it, N +1/+1 counters and N -1/-1 counters are removed from it, where N is the smaller of the number of +1/+1 and -1/-1 counters on it.
        // If a permanent with an ability that says it can’t have more than N counters of a certain kind on it has more than N counters of that kind on it, all but N of those counters are removed from it.
        // If the number of lore counters on a saga is greater than or equal to its final chapter number, and it isn't the source of a chapter ability on the stack, that saga's controller sacrifices it
        
        if actionPerformed {
            checkStateBasedActions()
        }
    }
}
