import Foundation

class Cost {
    private var manaCost: ManaCost
    private var tapCost: Bool
    private var lifeCost: Int
    private var sacrificeSelf: Bool
    private var removeCountersCost: [Counter]
    private var addCountersCost: [Counter]
    
    private init(_ manaString: String, tap: Bool = false, life: Int = 0, sacrificeSelf: Bool = false, removeCounters: [Counter] = [], addCounters: [Counter] = []) {
        self.manaCost = ManaCost(manaString)
        self.tapCost = tap
        self.lifeCost = life
        self.sacrificeSelf = sacrificeSelf
        self.removeCountersCost = removeCounters
        self.addCountersCost = addCounters
    }
    
    static func AddCounters(_ type: Counter, _ amount: Int) -> Cost {
        return Cost("").AddCounters(type, amount)
    }
    static func Life(_ amount: Int) -> Cost {
        return Cost("", tap: false, life: amount)
    }
    static func Mana(_ manaString: String) -> Cost {
        return Cost(manaString)
    }
    static func RemoveCounters(_ type: Counter, _ amount: Int) -> Cost {
        return Cost("").RemoveCounters(type, amount)
    }
    static func Sacrifice() -> Cost {
        return Cost("", tap: false, life: 0, sacrificeSelf: true)
    }
    static func Tap() -> Cost {
        return Cost("", tap: true)
    }
    
    func AddCounters(_ type: Counter, _ amount: Int) -> Cost {
        for _ in 0 ..< amount {
            self.addCountersCost.append(type)
        }
        return self
    }
    func Life(_ amount: Int) -> Cost {
        self.lifeCost = amount
        return self
    }
    func RemoveCounters(_ type: Counter, _ amount: Int) -> Cost {
        for _ in 0 ..< amount {
            self.removeCountersCost.append(type)
        }
        return self
    }
    func Sacrifice() -> Cost {
        self.sacrificeSelf = true
        return self
    }
    func Tap() -> Cost {
        self.tapCost = true
        return self
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
    
    func getRemoveCountersCost() -> [Counter] {
        return removeCountersCost
    }
    func getAddCountersCost() -> [Counter] {
        return addCountersCost
    }
}
