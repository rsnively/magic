import Foundation

class Targetable {
    func isHexproof() -> Bool { return false }
    func takeDamage(_ amount: Int) -> Void { assert(false) }
}
