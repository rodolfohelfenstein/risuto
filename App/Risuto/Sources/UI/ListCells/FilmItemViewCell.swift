import UIKit
import ListModule

class FilmItemViewCell: UICollectionViewListCell, ConfigurableCell {

    struct ViewModel: Identifiable {
        let id: String
        let originName: String
        let name: String
    }

    func configure(_ viewModel: ViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.originName
        content.secondaryText = viewModel.name
        contentConfiguration = content
    }

}
