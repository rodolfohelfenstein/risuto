import UIKit
import ListModule

class LocationItemViewCell: UICollectionViewListCell { }

extension LocationItemViewCell: ConfigurableCell {

    struct ViewModel: Identifiable {
        let id: String
        let name: String
        let climate: String
        let terrain: String
    }

    func configure(_ viewModel: ViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = "Climate: \(viewModel.climate) - Terrain: \(viewModel.terrain)"
        contentConfiguration = content
    }

}
