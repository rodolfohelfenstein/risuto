import XCTest
@testable import Network

class PeopleCodableTests: XCTestCase {

    func test_peopleCodable_initialization() {

        let data = TestHelpers.getMock("PeopleCodableMock")

        let decoded = try? JSONDecoder().decode(PeopleCodable.self, from: data)

        XCTAssertEqual(decoded?.id, "835f8c7c-2fc6-4f54-b545-c02ab066cd69")
        XCTAssertEqual(decoded?.name, "Custard")
        XCTAssertEqual(decoded?.age, "NA")
        XCTAssertEqual(decoded?.gender, "Male")

    }

}
