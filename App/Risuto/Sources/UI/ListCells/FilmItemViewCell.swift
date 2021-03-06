import UIKit
import ListModule

class FilmItemViewCell: UICollectionViewListCell { }

extension FilmItemViewCell: ConfigurableCell {

    struct ViewModel: Identifiable {
        let id: String
        let name: String
        let originalTitle: String
        let originalTitleRomanised: String
    }

    func configure(_ viewModel: ViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = viewModel.originalTitle + " (\(viewModel.originalTitleRomanised))"
        contentConfiguration = content
    }

}
