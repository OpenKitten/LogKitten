//
//  Convenience.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

extension _Logger {
    public func log(level: Level, subject: Message.Subject, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        let message = Message(level: level, subject: subject, date: Date(), source: self.componentIdentifier, origin: (function, file, line, column))
        self.log(message)
    }
    
    public func log(level: Level, subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        let message = Message(level: level, subject: .string(subject), date: Date(), source: self.componentIdentifier, origin: (function, file, line, column))
        self.log(message)
    }
    
    public func verbose(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .verbose, subject: subject, function, file, line, column)
    }
    
    public func debug(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .debug, subject: subject, function, file, line, column)
    }
    
    public func info(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .info, subject: subject, function, file, line, column)
    }
    
    public func success(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .success, subject: subject, function, file, line, column)
    }
    
    public func warning(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .warning, subject: subject, function, file, line, column)
    }
    
    public func error(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .error, subject: subject, function, file, line, column)
    }
    
    public func fatal(_ subject: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .fatal, subject: subject, function, file, line, column)
    }
}
