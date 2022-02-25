import XCTest
@testable import Risuto

class PeopleItemViewCellTests: XCTestCase {

    func test_peopleItemViewCell_configuration() {

        let sut = PeopleItemViewCell(frame: .zero)

        let viewModel = PeopleItemViewCell.ViewModel(id: "some id",
                                                     name: "some name",
                                                     age: "some age",
                                                     gender: "some gender")

        sut.configure(viewModel)

        guard let content = sut.contentConfiguration as? UIListContentConfiguration else {
            XCTFail()
            return
        }

        XCTAssertEqual(content.text, viewModel.name)
        XCTAssertEqual(content.secondaryText, "Age: \(viewModel.age) - Gender: \(viewModel.gender)")

    }

}
