import UIKit

class CollectionViewConfiguration<Cell: UICollectionViewCell, Model>: NSObject,
                                                                      UICollectionViewDataSource,
                                                                      UICollectionViewDelegate {

    typealias OnSelectItem = (Model) -> Void
    typealias OnCellConfigure = (Cell, Model) -> Cell

    private let models: [Model]
    private let onCellConfigure: OnCellConfigure
    private let onSelectItem: OnSelectItem?

    init(models: [Model],
         onCellConfigure: @escaping OnCellConfigure,
         onSelectItem: OnSelectItem? = nil) {
        self.models = models
        self.onCellConfigure = onCellConfigure
        self.onSelectItem = onSelectItem
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
        let cell  = collectionView.dequeueReusableCell(Cell.self, for: indexPath)

        return onCellConfigure(cell, model)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: false)

        onSelectItem?(models[indexPath.row])
    }

}
