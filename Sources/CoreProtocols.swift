public protocol _Logger {
    var componentIdentifier: String { get }
    func log<L: Level>(_ message: Message<L>, fromFramework: Framework)
    
    var frameworks: [(UInt8, Framework)] { get }
    var subjects: [UInt8: [(UInt8, SubjectRepresentable.Type)]] { get }
}

public protocol Destination {
    func log<L: Level>(_ message: Message<L>, fromFramework: Framework)
}

public protocol PlaintextRenderer {
    func render<L: Level>(_ message: Message<L>, fromFramework: Framework) -> String
}

public protocol PlaintextTransformer {
    func transform<L: Level>(_ input: String, context: Message<L>, fromFramework: Framework) -> String
}

public protocol Framework: class {
    var logKittenID: UInt8? { get set }
    var name: String { get }
    var logger: Logger { get }
}

public protocol SubjectRepresentable {
    func makeSubject() -> Subject
    static func convertToString(fromData: [UInt8]) -> String
    
    static var name: String { get }
}

extension SubjectRepresentable {
    static public func convertToString(fromData: [UInt8]) -> String {
        return "Unknown"
    }
}

extension String: SubjectRepresentable {
    public func makeSubject() -> Subject {
        return .string(self)
    }
    
    public static var name: String = "String"
}
