import XCTest

@testable import ListModule

class UICollectionViewTests: XCTestCase {

    func test_collectionView_register_dequeue() {

        let layout = UICollectionViewFlowLayout()
        let sut = UICollectionView(frame: .zero, collectionViewLayout: layout)

        sut.register(UICollectionViewListCell.self)

        let cell = sut.dequeueReusableCell(UICollectionViewListCell.self, for: IndexPath(row: 0, section: 0))

        XCTAssertNotNil(cell)

    }

}
