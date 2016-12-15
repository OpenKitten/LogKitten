public protocol Destination {
    func log<L: Level>(_ message: Message<L>, fromFramework: String)
}

public protocol PlaintextRenderer {
    func render<L: Level>(_ message: Message<L>, fromFramework: String) -> String
}

public protocol PlaintextTransformer {
    func transform<L: Level>(_ input: String, context: Message<L>, fromFramework: String) -> String
}

public protocol SubjectRepresentable {
    // [Framework: Subject]
    static var logKittenId: [UInt8: UInt8] { get set }
    
    func makeSubject(fromFramework: String) -> Subject
    static func convertToString(fromData: [UInt8]) -> String
    
    static var name: String { get }
}

extension SubjectRepresentable {
    static public func convertToString(fromData: [UInt8]) -> String {
        return "Unknown"
    }
}

extension String: SubjectRepresentable {
    public func makeSubject(fromFramework: String) -> Subject {
        return .string(self)
    }
    
    // [Framework: Subject]
    public static var logKittenId = [UInt8: UInt8]()
    
    public static var name: String = "String"
}
