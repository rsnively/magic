import Foundation

class Game: NSObject {
    var player1: Player
    var player2: Player
    var theStack: SpellStack
    private var currentPhase: Phase
    
    static let shared = Game()
    
    override private init() {
        var deck1: [Card] = []
        var deck2: [Card] = []
        for _ in 0..<15 {
            deck1.append(KLD.Forest())
            deck1.append(KLD.Forest())
            deck1.append(M19.CentaurCourser())
            deck1.append(M19.Gigantosaurus())
            
            deck2.append(M19.Plains())
            deck2.append(M19.OreskosSwiftclaw())
            deck2.append(M19.FieldCreeper())
            deck2.append(M19.LoxodonLineBreaker())
        }
        
        player1 = Player(deck: deck1)
        player2 = Player(deck: deck2)
        theStack = SpellStack()
        currentPhase = Phase.Untap
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
    
    func nextPhase() {
        func nextTurn() -> Phase {
            swap(&player1.active, &player2.active)
            return Phase.Untap
        }
        currentPhase = Phase(rawValue: currentPhase.rawValue + 1) ?? Phase.Untap
        getNonActivePlayer().hasPriority = false
        getActivePlayer().hasPriority = true
    }
    
    func advanceGame() {
        if !theStack.isEmpty {
            theStack.resolveTop()
        }
        // todo: priority passing
        nextPhase()
    }
}
