//
//  Convenience.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

extension FrameworkLogger {
    public func fatal(_ string: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.fatal(string.makeSubject(fromFramework: framework), fromFramework: framework)
    }
    
    public func error(_ string: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.error(string.makeSubject(fromFramework: framework), fromFramework: framework)
    }
    
    public func warning(_ string: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.warning(string.makeSubject(fromFramework: framework), fromFramework: framework)
    }
    
    public func info(_ string: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.info(string.makeSubject(fromFramework: framework), fromFramework: framework)
    }
    
    public func debug(_ string: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.debug(string.makeSubject(fromFramework: framework), fromFramework: framework)
    }
    
    public func verbose(_ string: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.verbose(string.makeSubject(fromFramework: framework), fromFramework: framework)
    }
    
    // MARK: Subject
    
    public func fatal(_ subject: SubjectRepresentable, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.fatal(subject.makeSubject(fromFramework: framework), fromFramework: framework, function, file, line, column)
    }
    
    public func error(_ subject: SubjectRepresentable, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.error(subject.makeSubject(fromFramework: framework), fromFramework: framework, function, file, line, column)
    }
    
    public func warning(_ subject: SubjectRepresentable, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.warning(subject.makeSubject(fromFramework: framework), fromFramework: framework, function, file, line, column)
    }
    
    public func info(_ subject: SubjectRepresentable, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.info(subject.makeSubject(fromFramework: framework), fromFramework: framework, function, file, line, column)
    }
    
    public func debug(_ subject: SubjectRepresentable, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.debug(subject.makeSubject(fromFramework: framework), fromFramework: framework, function, file, line, column)
    }
    
    public func verbose(_ subject: SubjectRepresentable, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        logger.verbose(subject.makeSubject(fromFramework: framework), fromFramework: framework, function, file, line, column)
    }
}

extension Logger {
    public func log<L: Level>(level: L, subject: Subject, _ framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        let message = Message(level: level, subject: subject, date: Date(), source: self.componentIdentifier, origin: (function, file, line, column))
        self.log(message, fromFramework: framework)
    }
    
    public func log<L: Level>(level: L, subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        let message = Message(level: level, subject: subject, date: Date(), source: self.componentIdentifier, origin: (function, file, line, column))
        self.log(message, fromFramework: framework)
    }
    
    public func verbose(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.verbose, subject: subject, fromFramework: framework, function, file, line, column)
    }
    
    public func debug(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.debug, subject: subject, fromFramework: framework, function, file, line, column)
    }
    
    public func info(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.info, subject: subject, fromFramework: framework, function, file, line, column)
    }
    
    public func success(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.success, subject: subject, fromFramework: framework, function, file, line, column)
    }
    
    public func warning(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.warning, subject: subject, fromFramework: framework, function, file, line, column)
    }
    
    public func error(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.error, subject: subject, fromFramework: framework, function, file, line, column)
    }
    
    public func fatal(_ subject: Subject, fromFramework framework: String, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: DefaultLevel.fatal, subject: subject, fromFramework: framework, function, file, line, column)
    }
}
