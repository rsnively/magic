import Foundation

class Cost {
    private var manaCost: ManaCost
    private var tapCost: Bool
    private var lifeCost: Int
    
    init(_ manaString: String, tap: Bool = false, life: Int = 0) {
        self.manaCost = ManaCost(manaString)
        self.tapCost = tap
        self.lifeCost = life
    }
    
    func getManaCost() -> ManaCost {
        return manaCost
    }
    
    func getTapCost() -> Bool {
        return tapCost
    }
    
    func getLifeCost() -> Int {
        return lifeCost
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
