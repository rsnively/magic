import Foundation

class Game: NSObject {
    var player1: Player
    var player2: Player
    var theStack: SpellStack
    private var currentPhase: Phase
    private var landPlayedThisTurn: Bool
    private var declaringAttackers: Bool
    private var turnNumber: Int
    
    static let shared = Game()
    
    override private init() {
        var deck1: [Card] = []
        var deck2: [Card] = []
        for _ in 0..<15 {
//            deck1.append(M19.Forest())
//            deck1.append(M19.Forest())
//            deck1.append(M19.Forest())
//            deck1.append(M19.CentaurCourser())
//            deck1.append(M19.Gigantosaurus())
//            deck1.append(M19.GreenwoodSentinel())
//            deck1.append(M19.VigilantBaloth())
            deck1.append(M19.Island())
            deck1.append(M19.Island())
            deck1.append(M19.Plains())
            deck1.append(M19.Plains())
            deck1.append(M19.Divination())
            deck1.append(M19.Revitalize())
            deck1.append(M19.OreskosSwiftclaw())
            deck1.append(M19.FieldCreeper())
            deck1.append(M19.OneWithTheMachine())
            
            deck2.append(M19.Plains())
            deck2.append(M19.OreskosSwiftclaw())
            deck2.append(M19.FieldCreeper())
            deck2.append(M19.LoxodonLineBreaker())
        }
        
        player1 = Player(deck: deck1)
        player2 = Player(deck: deck2)
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
        }
        else if currentPhase == .Draw {
            if turnNumber > 1 {
                getActivePlayer().drawCard()
            }
        }
        else if currentPhase == .Attack {
            declaringAttackers = true
            if !yourTurn() { advanceGame() } // TODO: AI
        }
        else if currentPhase == .EndCombat {
            bothPlayers({ $0.dealCombatDamage() })
        }
        else if currentPhase == .SecondMain {
            bothPlayers({ $0.removeCreaturesFromCombat() })
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
        // todo: priority passing
        nextPhase()
    }
}
