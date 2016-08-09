import XCTest
import LogKitten

class LogKittenTests: XCTestCase {
    func testVisual() {
        let log = Logger()
        log.verbose("Sample verbose log message")
        log.debug("Sample debug log message")
        log.info("Sample info log message")
        log.success("Sample success log message")
        log.warning("Sample warning log message")
        log.error("Sample error log message")
        log.fatal("Sample fatal log message")
    }

    func testSyslog() {
        let log = Logger()
        log.destinations = [SyslogDestination()]
        
        log.verbose("Sample verbose log message")
        log.debug("Sample debug log message")
        log.info("Sample info log message")
        log.success("Sample success log message")
        log.warning("Sample warning log message")
        log.error("Sample error log message")
        log.fatal("Sample fatal log message")
    }
    
    static var allTests : [(String, (LogKittenTests) -> () throws -> Void)] {
        return [
            ("testVisual", testVisual),
        ]
    }
}
