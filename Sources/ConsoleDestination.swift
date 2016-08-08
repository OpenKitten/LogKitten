import Foundation

public class ConsoleDestination : Destination {
    public init() {}
    
    public var renderer: PlaintextRenderer = ConfigurableRenderer()
    public var transformers: [PlaintextTransformer] = [Colorizer()]
    
    public func log(_ message: Message) {
        var renderedMessage = renderer.render(message)
        for transformer in transformers {
            renderedMessage = transformer.transform(renderedMessage, context: message)
        }
        print(renderedMessage)
    }
}
