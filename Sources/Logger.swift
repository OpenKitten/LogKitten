//
//  Logger.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

public enum LogKittenError: Error {
    case noRegisteredFrameworkFound
}

public class FrameworkLogger {
    public func log<L : Level>(_ message: Message<L>) {
        logger.log(message, fromFramework: framework)
    }

    let logger: Logger
    let framework: String
    
    init(toLogger logger: Logger, withIdentifier frameworkIdentifier: String) {
        self.logger = logger
        self.framework = frameworkIdentifier
    }
    
    @discardableResult
    public func registerSubject(_ subject: SubjectRepresentable.Type) throws {
        if logger.subjects[framework] != nil {
            logger.subjects[framework]!.append(subject)
        } else {
            logger.subjects[framework] = [subject]
        }
    }
}

public class Logger {
    public init(minimumLogLevel: DefaultLevel = .info) {
        self.minimumLogLevel = minimumLogLevel.compareValue
        
        if Logger.componentLogger == nil {
            self.useForComponents = true
        }
    }
    
    public static func forFramework(withIdentifier frameworkIdentifier: String) -> FrameworkLogger {
        return FrameworkLogger(toLogger: Logger.default, withIdentifier: frameworkIdentifier)
    }
    
    public var minimumLogLevel: Int
    
    public func log<L : Level>(_ message: Message<L>, fromFramework framework: String) {
        guard message.level.compareValue >= minimumLogLevel else {
            return
        }
        
        for destination in destinations {
            destination.log(message, fromFramework: framework)
        }
    }
    
    var subjects = [String: [SubjectRepresentable.Type]]()
    private let lock = NSLock()
    
    public static let `default` = Logger()
    
    internal static weak var componentLogger: Logger? = nil
    
    public var componentIdentifier: String = "Main"
    
    public var destinations: [Destination] = [ConsoleDestination()]
    
    public var useForComponents: Bool {
        get { return self === Logger.componentLogger }
        set { Logger.componentLogger = self }
    }
}
