import UIKit
@testable import ListModule

class DummyConfigurableCell: UICollectionViewCell, ConfigurableCell {

    var calledConfigure: Bool = false
    var viewModel: ViewModel?

    struct ViewModel: Identifiable {
        var id: String
    }

    func configure(_ viewModel: ViewModel) {
        calledConfigure = true
        self.viewModel = viewModel
    }

}
