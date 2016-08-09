import Foundation

public final class ConsoleDestination : PlaintextDestination {
    public override init() {
        super.init()
        self.transformers = [Colorizer()]
    }
    
    public override func log(_ message: String) {
        print(message)
    }
}
