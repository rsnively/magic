import Foundation

class Cost {
    private var manaCost: ManaCost
    private var tapCost: Bool
    
    init(_ manaString: String, tap: Bool = false) {
        self.manaCost = ManaCost(manaString)
        self.tapCost = tap
    }
    
    func getManaCost() -> ManaCost {
        return manaCost
    }
    
    func getTapCost() -> Bool {
        return tapCost
    }
    
    func getString() -> String {
        var ret = ""
        if manaCost.converted() > 0 {
            ret += manaCost.getString()
        }
        if tapCost {
            if !ret.isEmpty {
                ret += ", "
            }
            ret += "TAP"
        }
        ret += ": "
        return ret
    }
}
