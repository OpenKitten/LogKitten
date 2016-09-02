import XCTest
import LogKitten

class LogKittenTests: XCTestCase {
    
    func logSamples(using log: _Logger) {
        log.verbose("Sample verbose log message")
        log.debug("Sample debug log message")
        log.info("Kittens are adorable")
        log.success("Sample success log message")
        log.warning("Sample warning log message")
        log.error("Sample error log message")
        log.fatal("Sample fatal log message")
        log.info("This is a cow: 🐮")
        log.warning("This is percent s: %s")
    }
    
    func testVisual() {
        let log = Logger()
        logSamples(using: log)
    }

    func testSyslogDestination() {
        let log = Logger()
        log.destinations = [SyslogDestination()]
        
        logSamples(using: log)
    }
    
//    func testFileDestination() throws {
//        let log = Logger()
//        log.destinations = [try FileDestination(path: "/Users/robbert/Desktop/unittest.log")]
//        
//        logSamples(using: log)
//    }
    
    static var allTests : [(String, (LogKittenTests) -> () throws -> Void)] {
        return [
            ("testVisual", testVisual),
        ]
    }
}
