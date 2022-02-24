class CategoryListPresenter {

    weak var viewController: CategoryListDisplayLogic?

}

extension CategoryListPresenter: CategoryListPresentationLogic {

    func present(with response: CategoryListModels.Response) {

        let viewModel = CategoryListModels.ViewModel(items: response.items.map { .init(id: $0.id,
                                                                                       name: $0.name,
                                                                                       thumb: $0.thumb) })

        viewController?.update(with: viewModel)
    }

}
