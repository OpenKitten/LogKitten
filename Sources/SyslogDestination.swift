import Foundation

public class SyslogDestination : Destination {
    public init() {}
    
    public var renderer: PlaintextRenderer = ConfigurableRenderer()
    
    public func log(_ message: Message) {
        let renderedMessage = renderer.render(message)
        
        withVaList([]) {
            vsyslog(0, renderedMessage, $0)
        }
    }
}
