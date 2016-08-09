//
//  FileDestination.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 09-08-16.
//
//

import Foundation

enum FileDestinationError : Error {
    case fileOpenFailed
}

public final class FileDestination : PlaintextDestination {
    public init(path: String) throws {
        self.file = fopen(path, "a")
        guard self.file != nil else {
            throw FileDestinationError.fileOpenFailed
        }
    }
    
    public override func log(_ message: String) {
        message.withCString { message in
            let _ = withVaList([message]) {
                vfprintf(file, "%s\n", $0)
            }
        }
    }
    
    deinit {
        fclose(file)
    }
    
    var file: UnsafeMutablePointer<FILE>!
}
