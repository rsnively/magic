import Foundation

class Emblem : Object {
    private var setCode: String
    private var collectorsNumber: Int
    
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
