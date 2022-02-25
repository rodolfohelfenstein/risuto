import XCTest
@testable import ListModule

class CollectionBuilderTests: XCTestCase {

    func test_collectionBuilder_cellForItem() {

        let sut = CollectionBuilder<DummyConfigurableCell>(models: [.init(id: "test")]) { _ in
            
        }

        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = sut

        collectionView.register(DummyConfigurableCell.self)

        guard let cell = sut.collectionView(collectionView,
                                            cellForItemAt: IndexPath(row: 0,
                                                                     section: 0)) as? DummyConfigurableCell
        else {
            XCTFail()
            return
        }

        XCTAssertTrue(cell.calledConfigure)
        XCTAssert(cell.viewModel?.id == "test")
    }

    func test_collectionBuilder_numberOfItems() {

        let sut = CollectionBuilder<DummyConfigurableCell>(models: [.init(id: "test")]) { _ in

        }

        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = sut

        collectionView.register(DummyConfigurableCell.self)

        let itemsCount = sut.collectionView(collectionView, numberOfItemsInSection: 0)

        XCTAssert(itemsCount == 1)
    }

    func test_collectionBuilder_selectItem() {

        let expectation = expectation(description: "Select Item in CollectionBuilder")

        var didCalledSelectItem = false

        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

        let sut = CollectionBuilder<DummyConfigurableCell>(models: [.init(id: "test")]) { _ in
            didCalledSelectItem = true
            expectation.fulfill()
        }

        collectionView.delegate = sut

        sut.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))

        waitForExpectations(timeout: 1.0)

        XCTAssertTrue(didCalledSelectItem)

    }

}
