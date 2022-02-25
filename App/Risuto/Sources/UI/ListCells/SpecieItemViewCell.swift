import UIKit
import ListModule

class SpecieItemViewCell: UICollectionViewListCell { }

extension SpecieItemViewCell: ConfigurableCell {

    struct ViewModel: Identifiable {
        let id: String
        let name: String
        let classification: String
    }

    func configure(_ viewModel: ViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = "Classification: \(viewModel.classification)"
        contentConfiguration = content
    }

}
