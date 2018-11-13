import Foundation

class ReplacementEffect {
    private var source: Object
    private var event: Trigger
    private var effect: () -> Void
    
    init (source: Object, event: Trigger, effect: @escaping () -> Void) {
        self.source = source
        self.event = event
        self.effect = effect
    }
    
    func replace() {
        effect()
    }
    
    func getEvent() -> Trigger {
        return event
    }
}
