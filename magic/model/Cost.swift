import Foundation

class Cost {
    private var manaCost: ManaCost
    private var tapCost: Bool
    private var lifeCost: Int
    private var sacrificeSelf: Bool
    private var counterCost: [Counter]
    
    init(_ manaString: String, tap: Bool = false, life: Int = 0, sacrificeSelf: Bool = false, counters: [Counter] = []) {
        self.manaCost = ManaCost(manaString)
        self.tapCost = tap
        self.lifeCost = life
        self.sacrificeSelf = sacrificeSelf
        self.counterCost = counters
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
    
    func getCounterCost() -> [Counter] {
        return counterCost
    }
}
