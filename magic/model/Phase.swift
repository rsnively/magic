import Foundation

enum Phase: Int {
    case Untap
    case Upkeep
    case Draw
    case FirstMain
    case BeginCombat
    case Attack
    case Block
    //todo: case FirstStrike
    case Damage
    case EndCombat
    case SecondMain
    case End
    case Cleanup
    
    func toString() -> String {
        switch self {
        case .Untap: return "Untap Step"
        case .Upkeep: return "Upkeep Step"
        case .Draw: return "Draw Step"
        case .FirstMain: return "1st Main Phase"
        case .BeginCombat: return "Beginning of Combat Step"
        case .Attack: return "Declare Attackers Step"
        case .Block: return "Declare Blockers Step"
        case .Damage: return "Combat Damage Step"
        case .EndCombat: return "End of Combat Step"
        case .SecondMain: return "2nd Main Phase"
        case .End: return "End Step"
        case .Cleanup: return "Cleanup Step"
        }
    }
    
    func sorcerySpeed() -> Bool {
        return (self == .FirstMain) || (self == .SecondMain)
    }
}
