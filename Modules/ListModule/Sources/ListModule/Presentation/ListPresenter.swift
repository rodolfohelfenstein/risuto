public class ListPresenter<DataModel, ListDataDisplayer: DataDisplayer> {

    public typealias Mapper = (DataModel) -> ListDataDisplayer.Data

    private weak var dataDisplayer: ListDataDisplayer?
    private weak var loadDisplayer: LoadDisplayer?
    private weak var errorDisplayer: ErrorDisplayer?

    private let mapper: Mapper

    public init(
        dataDisplayer: ListDataDisplayer,
        loadDisplayer: LoadDisplayer,
        errorDisplayer: ErrorDisplayer,
        mapper: @escaping Mapper)
    {
        self.dataDisplayer = dataDisplayer
        self.loadDisplayer = loadDisplayer
        self.errorDisplayer = errorDisplayer
        self.mapper = mapper
    }

    public func load() {
        errorDisplayer?.display(error: nil)
        loadDisplayer?.display(load: true)
    }

    public func didLoad(with resource: DataModel) {
        let data = mapper(resource)
        dataDisplayer?.display(data: data)
        loadDisplayer?.display(load: false)
    }

    public func didLoad(with error: Error) {
        errorDisplayer?.display(error: error)
        loadDisplayer?.display(load: false)
    }

}
