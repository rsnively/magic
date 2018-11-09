import Foundation

class Cost {
    private var manaCost: ManaCost
    private var tapCost: Bool
    private var lifeCost: Int
    private var sacrificeSelf: Bool
    
    init(_ manaString: String, tap: Bool = false, life: Int = 0, sacrificeSelf: Bool = false) {
        self.manaCost = ManaCost(manaString)
        self.tapCost = tap
        self.lifeCost = life
        self.sacrificeSelf = sacrificeSelf
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
    
    func getSacrificeSelf() -> Bool {
        return sacrificeSelf
    }
}
