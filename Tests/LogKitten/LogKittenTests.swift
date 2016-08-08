import XCTest
import LogKitten

class LogKittenTests: XCTestCase {
    func testVisual() {
        let logger = Logger()
        logger.verbose("Sample verbose log message")
        logger.debug("Sample debug log message")
        logger.info("Sample info log message")
        logger.success("Sample success log message")
        logger.warning("Sample warning log message")
        logger.error("Sample error log message")
        logger.fatal("Sample fatal log message")
    }


    static var allTests : [(String, (LogKittenTests) -> () throws -> Void)] {
        return [
            ("testVisual", testVisual),
        ]
    }
}
