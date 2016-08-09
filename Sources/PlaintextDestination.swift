import Foundation

public class PlaintextDestination : Destination {
    public init() {}
    
    public var renderer: PlaintextRenderer = ConfigurableRenderer()
    public var transformers: [PlaintextTransformer] = []
    
    public func log(_ message: Message) {
        var renderedMessage = renderer.render(message)
        for transformer in transformers {
            renderedMessage = transformer.transform(renderedMessage, context: message)
        }
        self.log(renderedMessage)
    }
    
    public func log(_ message: String) {
        fatalError("func log(_ message: String) must be overridden in a subclass of PlaintextDestination")
    }
}
