protocol CategoryListBusinessLogic: AnyObject {
    func fetchCategories()
}

protocol CategoryListPresentationLogic: AnyObject {
    func present(with response: CategoryListModels.Response)
}

protocol CategoryListDisplayLogic: AnyObject {
    func update(with viewModel: CategoryListModels.ViewModel)
}
