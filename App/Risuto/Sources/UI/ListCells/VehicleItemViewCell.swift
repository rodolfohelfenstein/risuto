import UIKit
import ListModule

class VehicleItemViewCell: UICollectionViewListCell { }

extension VehicleItemViewCell: ConfigurableCell {

    struct ViewModel: Identifiable {
        let id: String
        let name: String
        let description: String
        let vehicleClass: String
    }

    func configure(_ viewModel: ViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = "Class: \(viewModel.vehicleClass) \n\n\(viewModel.description)"
        contentConfiguration = content
    }

}
