import XCTest
@testable import Network

class SpecieCodableTests: XCTestCase {

    func test_specieCodable_initialization() {

        let data = TestHelpers.getMock("SpecieCodableMock")

        let decoded = try? JSONDecoder().decode(SpecieCodable.self, from: data)

        XCTAssertEqual(decoded?.id, "e2cfaa78-fb19-11eb-9a03-0242ac130003")
        XCTAssertEqual(decoded?.name, "Dragon")
        XCTAssertEqual(decoded?.classification, "Dragon")

    }

}
