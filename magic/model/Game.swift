import Foundation

class Game: NSObject {
    var player1: Player
    var player2: Player
    var opponent: Opponent
    var theStack: SpellStack
    private var currentPhase: Phase
    
    private var landPlayedThisTurn: Bool
    private var declaringAttackers: Bool
    var targetingEffect: TargetedEffect?
    var isTargeting: Bool {
        return targetingEffect != nil
    }
    func selectTarget(_ target: Object) {
        assert(isTargeting)
        targetingEffect?.selectTarget(target)
        targetingEffect = nil
    }
    
    private var turnNumber: Int
    
    static let shared = Game()
    
    override private init() {
        var deck1: [Card] = []
        var deck2: [Card] = []
        for _ in 0..<15 {

            deck2.append(M19.Plains())
            deck2.append(M19.Swamp())
            deck1.append(GRN.ChildOfNight())
            deck1.append(GRN.RitualOfSoot())
            deck1.append(GRN.SwornCompanions())
            
            deck2.append(M19.Plains())
            deck2.append(M19.OreskosSwiftclaw())
            deck2.append(M19.FieldCreeper())
            deck2.append(M19.LoxodonLineBreaker())
        }
        
        player1 = Player(deck: deck1)
        player2 = Player(deck: deck2)
        opponent = Opponent(player: player2)
        theStack = SpellStack()
        currentPhase = Phase.Untap
        landPlayedThisTurn = false
        declaringAttackers = false
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
    
    func bothPlayers(_ f: (_ player: Player) -> Void) {
        f(player1)
        f(player2)
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
        swap(&player1.hasPriority, &player2.hasPriority)
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
    
    func setLandPlayedThisTurn() {
        landPlayedThisTurn = true
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
        else if currentPhase == .Draw {
            if turnNumber > 1 {
                getActivePlayer().drawCard()
            }
        }
        else if currentPhase == .Attack {
            declaringAttackers = true
            if player2.hasPriority {
                opponent.declareAttackers()
            }
        }
        else if currentPhase == .EndCombat {
            bothPlayers({ $0.dealCombatDamage() })
        }
        else if currentPhase == .SecondMain {
            bothPlayers({ $0.removeCreaturesFromCombat() })
        }
        else if currentPhase == .Cleanup {
            // todo, discard to hand size
            nextPhase()
            return
        }
        
        if player2.hasPriority {
            opponent.givePriority()
        }
    }
    
    func advanceGame() {
        if declaringAttackers {
            getActivePlayer().declareAttackers()
            declaringAttackers = false
            return
        }
        if !theStack.isEmpty {
            theStack.resolveTop()
            return
        }
        if getNonActivePlayer().hasPriority {
            nextPhase()
            return
        }
        passPriority()
        if player2.hasPriority {
            opponent.givePriority()
        }
    }
}
