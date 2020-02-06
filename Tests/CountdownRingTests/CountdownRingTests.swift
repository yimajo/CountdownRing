import XCTest
@testable import CountdownRing

final class CountdownRingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CountdownRing().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
