import XCTest
@testable import ListModule

class ListInteractorTests: XCTestCase {

    func test_listInteractor_initialization() async {

        let sut = ListInteractor<String, DummyConfigurableCell>(store: {
            return ["test"]
        })

        do {
            let values = try await sut.store()
            XCTAssertFalse(values.isEmpty)
            XCTAssert(values[0] == "test")
        } catch {
            XCTFail()
        }

    }

    func test_listInteractor_loadResource() {

        let sut = ListInteractor<String, DummyConfigurableCell>(store: {
            return ["test"]
        })

        sut.loadResource()

        XCTAssertTrue(sut.isLoading)

    }

    func test_listInteractor_loadResource_storeError() {

        let expectation = expectation(description: "Simulate Store Error")

        let sut = ListInteractor<String, DummyConfigurableCell>(store: {
            expectation.fulfill()
            throw NSError(domain: "Error", code: 0, userInfo: nil)
        })

        sut.loadResource()

        waitForExpectations(timeout: 1)

        XCTAssertFalse(sut.isLoading)

    }

}
