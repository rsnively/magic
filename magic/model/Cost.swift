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
}
