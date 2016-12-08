import Foundation

public enum Subject {
    case string(String)
    case attributedData(type: UInt8, data: [UInt8])
}

public struct Message<L: Level> {
    internal init(level: L, subject: Subject, date: Date, source: String, origin: Origin) {
        self.level = level
        self.subject = subject
        self.date = date
        self.source = source
        self.origin = origin
    }
    
    public typealias Origin = (function: String, filePath: String, line: Int, column: Int)
    
    public var level: L
    public var subject: Subject
    public var date: Date
    public var source: String
    public var origin: Origin
}
