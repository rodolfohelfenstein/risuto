import XCTest
@testable import Risuto

class VehicleItemViewCellTests: XCTestCase {

    func test_vehicleItemViewCell_configuration() {

        let sut = VehicleItemViewCell(frame: .zero)

        let viewModel = VehicleItemViewCell.ViewModel(id: "some id",
                                                      name: "some name",
                                                      description: "some description",
                                                      vehicleClass: "some vehicleClass")

        sut.configure(viewModel)

        guard let content = sut.contentConfiguration as? UIListContentConfiguration else {
            XCTFail()
            return
        }

        XCTAssertEqual(content.text, viewModel.name)
        XCTAssertEqual(content.secondaryText, "Class: \(viewModel.vehicleClass) \n\n\(viewModel.description)")

    }

}
