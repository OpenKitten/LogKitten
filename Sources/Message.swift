import Foundation

public struct Message {
    
    internal init(level: Level, subject: Subject, date: Date, source: String, origin: Origin) {
        self.level = level
        self.subject = subject
        self.date = date
        self.source = source
        self.origin = origin
    }
    
    public enum Subject {
        case string(String)
    }
    
    public typealias Origin = (function: String, filePath: String, line: Int, column: Int)
    
    public var level: Level
    public var subject: Subject
    public var date: Date
    public var source: String
    public var origin: Origin
    
}
