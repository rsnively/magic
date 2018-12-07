import Foundation

class Emblem : Object {
    private var setCode: String
    private var collectorsNumber: Int
    
    // TODO: Technically, an emblem doens't have name, but we want to be able to display name (and preferably source) when abilities trigger and stuff
    override func getName() -> String {
        return "Emblem"
    }
    
    init(set: String, number: Int) {
        self.setCode = set
        self.collectorsNumber = number
        
        super.init(name: nil)
    }
    
    func getSetCode() -> String {
        return setCode
    }
    
    func getCollectorsNumber() -> Int {
        return collectorsNumber
    }
}
