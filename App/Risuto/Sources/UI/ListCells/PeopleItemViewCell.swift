import UIKit
import ListModule

class PeopleItemViewCell: UICollectionViewListCell { }

extension PeopleItemViewCell: ConfigurableCell {

    struct ViewModel: Identifiable {
        let id: String
        let name: String
        let age: String
        let gender: String
    }

    func configure(_ viewModel: ViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        content.secondaryText = "Age: \(viewModel.age) - Gender: \(viewModel.gender)"
        contentConfiguration = content
    }

}
