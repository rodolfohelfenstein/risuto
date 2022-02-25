import Foundation
import XCTest

class TestHelpers: XCTestCase {

    func test_getMock_success() {

        XCTAssert(!TestHelpers.getMock("VehicleCodableMock").isEmpty)

    }

    func test_getMock_failure() {

        XCTAssert(TestHelpers.getMock("SOME FAILURE FILE").isEmpty)

    }

    static func getMock(_ name: String) -> Data {

        let testBundle = Bundle(for: TestHelpers.self)

        guard
            let resourceBundlePath = testBundle.path(forResource: "Network_NetworkTests", ofType: "bundle"),
            let resourceBundle = Bundle(path: resourceBundlePath),
            let mockFilePath = resourceBundle.path(forResource: name, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: mockFilePath), options: .alwaysMapped)
        else {
            return Data()
        }

        return data

    }

}
