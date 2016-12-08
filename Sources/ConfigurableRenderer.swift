//
//  ConfigurableRenderer.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

/**
 The format string can contain:
 
 - %fullfilepath
 - %filename
 - %function
 - %line
 - %column
 - %message
 - %level
 - %source
 - %date
 
 */


public class ConfigurableRenderer : PlaintextRenderer {
    public init() {}
    
    public lazy var dateFormatter: DateFormatter = {
        let dfm = DateFormatter()
        dfm.dateFormat = "HH:mm:ss"
        return dfm
    }()
    
    let format = "%date [%level] %message    [%source:%filename:%function] %framework"
    
    private func render(_ subject: Subject, fromFramework framework: Framework) -> String {
        switch subject {
        case .string(let s): return s
        case .attributedData(let type, let data):
            guard let frameworkId = framework.logKittenID else {
                return "Unknown"
            }
            
            guard let (_, type) = framework.logger.subjects[frameworkId]?.first(where: {
                $0.0 == type
            }) else {
                return "Unknown"
            }
            
            return type.convertToString(fromData: data)
        }
    }
    
    public func render<L: Level>(_ message: Message<L>, fromFramework framework: Framework) -> String {
        let path = message.origin.filePath
        let filename = NSString(string: path).lastPathComponent
        
        func toStringOrEmptyString(int: Int?) -> String {
            if let int = int {
                return "\(int)"
            } else {
                return ""
            }
        }
        
        let details = [
            "%fullfilepath": path,
            "%filename": filename,
            "%function": message.origin.function,
            "%line": "\(message.origin.line)",
            "%column": "\(message.origin.column)",
            "%message": render(message.subject, fromFramework: framework),
            "%level": message.level.description,
            "%source": message.source,
            "%date": dateFormatter.string(from: message.date),
            "%framework": framework.name
        ]
        
        var finalMessage = self.format
        for (key, replacement) in details {
            finalMessage = finalMessage.replacingOccurrences(of: key, with: replacement)
        }
        
        return finalMessage
    }
}
