import XCTest
@testable import ListModule

final class ListModuleTests: XCTestCase {

    func test_listModule_compose() {

        typealias DummyListCompose = ListModule<String, DummyConfigurableCell>

        var requestedStore = false
        var requestedMapper = false

        let sut = DummyListCompose.compose(
            title: "Teste",
            store: {
                requestedStore = true
                return [""]
            },
            mapping: {
                requestedMapper = true
                return $0.map { .init(id: $0) }
            },
            onSelection: { _ in

            })

        _ = sut.view

        XCTAssertEqual(sut.title, "Teste")
        XCTAssertTrue(requestedStore)
        XCTAssertTrue(requestedMapper)

    }

}
