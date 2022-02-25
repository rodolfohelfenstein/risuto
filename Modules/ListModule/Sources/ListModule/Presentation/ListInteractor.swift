public final class ListPresentationAdapter<DataModel, Cell: ConfigurableCell> {

    var store: () async throws -> [DataModel]
    var presenter: ListPresenter<[DataModel], ListViewController<Cell>>?

    var isLoading = false

    init(store: @escaping () async throws -> [DataModel]) {
        self.store = store
    }

    func loadResource() {

        guard !isLoading else { return }

        presenter?.load()

        isLoading = true

        Task.init {
            do {
                let resource = try await store()
                presenter?.didLoad(with: resource)
                isLoading = false
            } catch {
                presenter?.didLoad(with: error)
                isLoading = false
            }
        }

    }

}
