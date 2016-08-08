public protocol _Logger {
    var componentIdentifier: String { get }
    func log(_ message: Message)
}

public protocol Destination {
    func log(_ message: Message)
}

public protocol PlaintextRenderer {
    func render(_ message: Message) -> String
}

public protocol PlaintextTransformer {
    func transform(_ input: String, context: Message) -> String
}
