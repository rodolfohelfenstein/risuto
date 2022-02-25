import XCTest
@testable import Risuto

class SpecieItemViewCellTests: XCTestCase {

    func test_specieItemViewCell_configuration() {

        let sut = SpecieItemViewCell(frame: .zero)

        let viewModel = SpecieItemViewCell.ViewModel(id: "some id",
                                                     name: "some name",
                                                     classification: "some classification")

        sut.configure(viewModel)

        guard let content = sut.contentConfiguration as? UIListContentConfiguration else {
            XCTFail()
            return
        }

        XCTAssertEqual(content.text, viewModel.name)
        XCTAssertEqual(content.secondaryText, "Classification: \(viewModel.classification)")

    }

}
