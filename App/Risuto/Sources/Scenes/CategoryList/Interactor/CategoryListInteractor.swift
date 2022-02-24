class CategoryListInteractor {

    let presenter: CategoryListPresentationLogic

    init(presenter: CategoryListPresentationLogic) {
        self.presenter = presenter
    }

}

extension CategoryListInteractor: CategoryListBusinessLogic {

    func fetchCategories() {

        let response = CategoryListModels.Response(items: Category.allCases.map { .init(id: $0.rawValue,
                                                                                        name: $0.name,
                                                                                        thumb: $0.thumb) })

        presenter.present(with: response)
    }

}
