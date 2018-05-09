import Foundation

class Object: NSObject {
    var name:String?
    var colors:[Color] = []
    var supertypes:[Supertype] = []
    var types:[Type] = []
    var subtypes:[Subtype] = []
    
    init(name:String) {
        self.name = name
        super.init()
    }
}
