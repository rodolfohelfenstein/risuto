import XCTest
@testable import Network

class VehicleCodableTests: XCTestCase {

    func test_vehicleCodable_initialization() {

        let data = TestHelpers.getMock("VehicleCodableMock")

        let decoded = try? JSONDecoder().decode(VehicleCodable.self, from: data)

        XCTAssertEqual(decoded?.id, "923d70c9-8f15-4972-ad53-0128b261d628")
        XCTAssertEqual(decoded?.name, "Sosuke's Boat")
        XCTAssertEqual(decoded?.description, "A toy boat where Sosuke plays")
        XCTAssertEqual(decoded?.vehicleClass, "Boat")

    }

}
