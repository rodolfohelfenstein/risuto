import XCTest

@testable import ListModule

class ListViewControllerTests: XCTestCase {

    func test_listViewController_initialization() {

        let sut = ListViewController<DummyConfigurableCell>(title: "DummyListViewController",
                                                            layout: CardListLayout())

        XCTAssertEqual(sut.title, "DummyListViewController")

    }

    func test_listViewController_displayData() {

        let sut = ListViewController<DummyConfigurableCell>(title: "DummyListViewController",
                                                            layout: CardListLayout())

        let oldCollectionBuilder = sut.collectionBuilder

        sut.display(data: [.init(id: "old value")])

        let exp = expectation(description: "Delay for DispatchQueue")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            let newCollectionBuilder = sut.collectionBuilder
            XCTAssert(oldCollectionBuilder != newCollectionBuilder)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_listViewController_displayLoad_turnOn() {

        let sut = ListViewController<DummyConfigurableCell>(title: "DummyListViewController",
                                                            layout: CardListLayout())

        sut.display(load: true)

        let exp = expectation(description: "Delay for DispatchQueue")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.loadingView.isAnimating)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_listViewController_displayLoad_turnOff() {

        let sut = ListViewController<DummyConfigurableCell>(title: "DummyListViewController",
                                                            layout: CardListLayout())

        sut.display(load: false)

        let exp = expectation(description: "Delay for DispatchQueue")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.loadingView.isAnimating)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_listViewController_displayError() {

        let sut = ListViewController<DummyConfigurableCell>(title: "DummyListViewController",
                                                            layout: CardListLayout())

        XCTAssertTrue(sut.errorView.isHidden)

        sut.display(error: NSError(domain: "Test Error", code: 0, userInfo: nil))

        let exp = expectation(description: "Delay for DispatchQueue")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.errorView.isHidden)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    class DummyConfigurableCell: UICollectionViewCell, ConfigurableCell {

        struct ViewModel: Identifiable {
            var id: String
        }

        func configure(_ viewModel: ViewModel) {
            print(viewModel)
        }

    }

}
