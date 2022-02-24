import UIKit

public protocol ConfigurableCell: UICollectionViewCell {
    associatedtype ViewModel: Identifiable
    func configure(_ viewModel: ViewModel)
}
