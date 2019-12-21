import XCTest
@testable import BasicCleanArch

final class BasicCleanArchTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BasicCleanArch().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
