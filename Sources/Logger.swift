//
//  Logger.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

public class Logger : _Logger {
    public init() {
        if Logger.componentLogger == nil {
            self.useForComponents = true
        }
    }
    
    public func log(_ message: Message) {
        for destination in destinations {
            destination.log(message)
        }
    }
    
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
