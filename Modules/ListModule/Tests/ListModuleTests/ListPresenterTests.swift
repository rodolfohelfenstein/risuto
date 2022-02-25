import XCTest
@testable import ListModule

class ListPresenterTests: XCTestCase {

    func test_listPresenter_load() {

        let spy = SpyDisplayer()

        let sut = ListPresenter<String,
                                SpyDisplayer>(dataDisplayer: spy,
                                              loadDisplayer: spy,
                                              errorDisplayer: spy,
                                              mapper: { item in
                                    return ""
        })

        sut.load()

        XCTAssertTrue(spy.didDisplayLoadCalled)
        XCTAssertTrue(spy.loadValue)

    }

    func test_listPresenter_didLoad_Resource() {

        let spy = SpyDisplayer()

        let sut = ListPresenter<String,
                                SpyDisplayer>(dataDisplayer: spy,
                                              loadDisplayer: spy,
                                              errorDisplayer: spy,
                                              mapper: { item in
                                    return "TESTE-MAPPER"
        })

        sut.didLoad(with: "TESTE")

        XCTAssertTrue(spy.didDisplayLoadCalled)
        XCTAssertTrue(spy.dataValue == "TESTE-MAPPER")

    }

    func test_listPresenter_didLoad_Error() {

        let spy = SpyDisplayer()

        let sut = ListPresenter<String,
                                SpyDisplayer>(dataDisplayer: spy,
                                              loadDisplayer: spy,
                                              errorDisplayer: spy,
                                              mapper: { item in
                                    return ""
        })

        let error = NSError(domain: "", code: 0, userInfo: nil)

        sut.didLoad(with: error)

        XCTAssertTrue(spy.didDisplayErrorCalled)
        XCTAssertTrue(spy.errorValue?.localizedDescription == error.localizedDescription)

    }

    class SpyDisplayer: DataDisplayer, LoadDisplayer, ErrorDisplayer {

        var didDisplayLoadCalled = false
        var didDisplayErrorCalled = false
        var didDisplayDataCalled = false

        var loadValue: Bool = false
        var errorValue: Error? = nil
        var dataValue: String = ""

        func display(load: Bool) {
            self.didDisplayLoadCalled = true
            self.loadValue = load
        }

        func display(error: Error?) {
            self.didDisplayErrorCalled = true
            self.errorValue = error
        }

        func display(data: String) {
            self.didDisplayDataCalled = true
            self.dataValue = data
        }

    }

}
