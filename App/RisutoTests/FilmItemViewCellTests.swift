import XCTest
@testable import Risuto

class FilmItemViewCellTests: XCTestCase {

    func test_filmItemViewCell_configuration() {

        let sut = FilmItemViewCell(frame: .zero)

        let viewModel = FilmItemViewCell.ViewModel(id: "some id",
                                                   name: "some name",
                                                   originalTitle: "some originalTitle",
                                                   originalTitleRomanised: "some originalTitleRomanised")

        sut.configure(viewModel)

        guard let content = sut.contentConfiguration as? UIListContentConfiguration else {
            XCTFail()
            return
        }

        XCTAssertEqual(content.text, viewModel.name)
        XCTAssertEqual(content.secondaryText, viewModel.originalTitle + " (\(viewModel.originalTitleRomanised))")

    }

}
