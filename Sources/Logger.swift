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

public class Logger : _Logger {
    public init(minimumLogLevel: Int) {
        self.minimumLevel = minimumLogLevel
        
        if Logger.componentLogger == nil {
            self.useForComponents = true
        }
    }
    
    public init(minimumLogLevel: DefaultLevel = .info) {
        self.minimumLevel = minimumLogLevel.compareValue
        
        if Logger.componentLogger == nil {
            self.useForComponents = true
        }
    }
    
    var minimumLevel: Int
    
    public func log<L : Level>(_ message: Message<L>, fromFramework framework: Framework) {
        guard message.level.compareValue >= minimumLevel else {
            return
        }
        
        for destination in destinations {
            destination.log(message, fromFramework: framework)
        }
    }
    
    public private(set) var frameworks = [(UInt8, Framework)]()
    public private(set) var subjects = [UInt8: [(UInt8, SubjectRepresentable.Type)]]()
    
    public func registerFramework(_ framework: Framework) {
        let id: UInt8 = self.frameworks.last?.0 ?? 0
        
        frameworks.append((id, framework))
        
        framework.logKittenID = id
    }
    
    @discardableResult
    public func registerSubject(_ subject: SubjectRepresentable.Type, forFramework framework: Framework) throws -> UInt8 {
        guard let id = framework.logKittenID else {
            throw LogKittenError.noRegisteredFrameworkFound
        }
        
        var subjects = self.subjects[id] ?? []
        let subjectId: UInt8 = subjects.last?.0 ?? 0
        
        // Add the subject
        subjects.append((subjectId, subject))
        self.subjects[id] = subjects
        
        return subjectId
    }
    
    public static let `default` = Logger()
    
    internal static weak var componentLogger: Logger? = nil
    
    public var componentIdentifier: String = "Main"
    
    public var destinations: [Destination] = [ConsoleDestination()]
    
    public var useForComponents: Bool {
        get { return self === Logger.componentLogger }
        set { Logger.componentLogger = self }
    }
    
    public class func logger(forComponent identifier: String) -> _Logger {
        fatalError()
    }
    
}
