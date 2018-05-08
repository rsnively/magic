import Foundation

class Object: NSObject {
    var name:String?
    var colors:[Color] = []
    
    init(name:String) {
        self.name = name
        super.init()
    }
}
