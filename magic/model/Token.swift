import Foundation

class Token : Object {
    private var setCode: String
    private var collectorsNumber: Int
    
    init(name: String, set: String, number: Int) {
        self.setCode = set
        self.collectorsNumber = number
        
        super.init(name: name)
        
        self.setManaCost("", setColorAccordingly: false);
    }

    func getSetCode() -> String {
        return setCode
    }
    
    func getCollectorsNumber() -> Int {
        return collectorsNumber
    }
    
    override func isToken() -> Bool {
        return true
    }
    
    override func isSpell() -> Bool {
        return false
    }
}
