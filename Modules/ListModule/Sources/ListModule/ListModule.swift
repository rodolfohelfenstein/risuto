import UIKit

public class ListModule<DataModel, Cell: ConfigurableCell> {

    public typealias StoreRequest = () async throws -> [DataModel]
    public typealias DataMapping = ([DataModel]) -> [Cell.ViewModel]
    public typealias OnSelection = (Cell.ViewModel.ID) -> Void

    public static func compose(
        title: String?,
        layout: UICollectionViewLayout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .plain)),
        store: @escaping StoreRequest,
        mapping: @escaping DataMapping,
        onSelection: @escaping OnSelection) -> UIViewController
    {

        let interactor = ListInteractor<DataModel, Cell>(store: store)

        let viewController = ListViewController<Cell>(title: title, layout: layout)
        viewController.onViewLoad = interactor.loadResource
        viewController.onSelection = onSelection

        interactor.presenter = ListPresenter<[DataModel], ListViewController<Cell>>(
            dataDisplayer: viewController,
            loadDisplayer: viewController,
            errorDisplayer: viewController,
            mapper: mapping
        )

        return viewController

    }

}
