//
//  LogLevel.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

public protocol Level: CustomStringConvertible, Equatable, Comparable, Hashable {
    var compareValue: Int { get }
    var name: String { get }
}

extension Level {
    public var hashValue: Int {
        return self.compareValue
    }
    
    public var name: String {
        return self.description
    }
}

public func <<A: Level, B: Level>(lhs: A, rhs: B) -> Bool {
    return lhs.compareValue < rhs.compareValue
}

public func ==<A: Level, B: Level>(lhs: A, rhs: B) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

public enum DefaultLevel : Level, AnsiColorRepresentable {
    case verbose, debug, info, success, warning, error, fatal
    
    public var ansiColor: AnsiColor {
        switch self {
        case .verbose:
            return AnsiColor.darkGray
        case .debug:
            return AnsiColor.purple
        case .info:
            return AnsiColor.cyan
        case .success:
            return AnsiColor.green
        case .warning:
            return AnsiColor.yellow
        case .error:
            return AnsiColor.red
        case .fatal:
            return AnsiColor.lightRed
        }
    }
    
    public var compareValue: Int {
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
}
