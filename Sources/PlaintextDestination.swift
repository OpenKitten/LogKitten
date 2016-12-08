import Foundation

public class PlaintextDestination : Destination {
    public init() {}
    
    public var renderer: PlaintextRenderer = ConfigurableRenderer()
    public var transformers: [PlaintextTransformer] = []
    
    public func log<L: Level>(_ message: Message<L>, fromFramework framework: Framework) {
        var renderedMessage = renderer.render(message, fromFramework: framework)
        for transformer in transformers {
            renderedMessage = transformer.transform(renderedMessage, context: message, fromFramework: framework)
        }
        self.log(renderedMessage)
    }
    
    public func log(_ message: String) {
        fatalError("func log(_ message: String) must be overridden in a subclass of PlaintextDestination")
    }
}
