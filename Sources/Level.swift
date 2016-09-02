//
//  LogLevel.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

public enum Level : CustomStringConvertible, Equatable, Comparable, Hashable {
    case verbose, debug, info, success, warning, error, fatal
    
    private var compareValue: Int {
        switch self {
        case .verbose:
            return 10
        case .debug:
            return 20
        case .info:
            return 30
        case .success:
            return 40
        case .warning:
            return 50
        case .error:
            return 60
        case .fatal:
            return 70
        }
    }
    
    public var hashValue: Int {
        return self.compareValue
    }
    
    public var description: String {
        switch self {
        case .verbose:
            return "Verbose"
        case .debug:
            return "Debug"
        case .info:
            return "Info"
        case .success:
            return "Success"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        case .fatal:
            return "Fatal"
        }
    }
    
    public static func ==(lhs: Level, rhs: Level) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public static func <(lhs: Level, rhs: Level) -> Bool {
        return lhs.compareValue < rhs.compareValue
    }
}
