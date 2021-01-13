import XCTest
@testable import SteamKit

final class SteamKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SteamKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
