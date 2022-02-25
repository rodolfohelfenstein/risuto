import UIKit

class CollectionBuilder<Cell: ConfigurableCell>: NSObject,
                                                 UICollectionViewDataSource,
                                                 UICollectionViewDelegate {

    typealias OnSelection = (Cell.ViewModel.ID) -> Void

    private let models: [Cell.ViewModel]
    private let onSelection: OnSelection?

    init(models: [Cell.ViewModel],
         onSelection: OnSelection?)
    {
        self.models = models
        self.onSelection = onSelection
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int
    {
        return models.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(Cell.self, for: indexPath)

        cell?.configure(model)

        return cell ?? UICollectionViewCell()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        onSelection?(models[indexPath.row].id)
    }

}
