import XCTest
@testable import Risuto

class LocationItemViewCellTests: XCTestCase {

    func test_locationItemViewCell_configuration() {

        let sut = LocationItemViewCell(frame: .zero)

        let viewModel = LocationItemViewCell.ViewModel(id: "some id",
                                                       name: "some name",
                                                       climate: "some climate",
                                                       terrain: "some terrain")

        sut.configure(viewModel)

        guard let content = sut.contentConfiguration as? UIListContentConfiguration else {
            XCTFail()
            return
        }

        XCTAssertEqual(content.text, viewModel.name)
        XCTAssertEqual(content.secondaryText, "Climate: \(viewModel.climate) - Terrain: \(viewModel.terrain)")

    }

}
