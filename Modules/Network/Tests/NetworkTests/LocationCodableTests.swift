import XCTest
@testable import Network

class LocationCodableTests: XCTestCase {

    func test_locationCodable_initialization() {

        let data = TestHelpers.getMock("LocationCodableMock")

        let decoded = try? JSONDecoder().decode(LocationCodable.self, from: data)

        XCTAssertEqual(decoded?.id, "398e3e1e-9912-4eb6-91fe-a9f8b932b67d")
        XCTAssertEqual(decoded?.name, "St. Morwald's Home for Children")
        XCTAssertEqual(decoded?.terrain, "City")
        XCTAssertEqual(decoded?.climate, "Mild")

    }

}
