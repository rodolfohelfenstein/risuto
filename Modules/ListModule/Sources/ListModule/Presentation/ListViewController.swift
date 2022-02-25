import UIKit

public class ListViewController<Cell: ConfigurableCell>: UICollectionViewController {

    lazy var loadingView: UIActivityIndicatorView = makeLoadingView()

    lazy var errorView: UIView = makeErrorView()

    typealias ListCollectionBuilder = CollectionBuilder<Cell>

    private var collectionBuilder: ListCollectionBuilder? {
        didSet {
            collectionView.dataSource = collectionBuilder
            collectionView.delegate = collectionBuilder
        }
    }

    public var onViewLoad: (() -> Void)?
    public var onSelection: ((Cell.ViewModel.ID) -> Void)?

    public init (
        title: String?,
        layout: UICollectionViewLayout = CardListLayout())
    {
        super.init(collectionViewLayout: layout)
        self.title = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(Cell.self)
        setupSubviews()
        setupAnchors()
        onViewLoad?()
    }

    private func setupSubviews() {
        view.addSubview(loadingView)
        view.addSubview(errorView)
    }

    private func setupAnchors() {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        errorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorView.topAnchor.constraint(equalTo: view.topAnchor),
            errorView.leftAnchor.constraint(equalTo: view.leftAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            errorView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func makeLoadingView() -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        return view
    }

    private func makeErrorView() -> UIView {
        let view = ErrorView()
        view.isHidden = true
        view.onRetry = onViewLoad
        return view
    }

}

extension ListViewController: DataDisplayer {

    public func display(data: [Cell.ViewModel]) {
        DispatchQueue.main.async {
            self.collectionBuilder = ListCollectionBuilder(models: data,
                                                           onSelection: self.onSelection)
        }
    }

}

extension ListViewController: LoadDisplayer {

    public func display(load: Bool) {
        DispatchQueue.main.async {
            load
            ? self.loadingView.startAnimating()
            : self.loadingView.stopAnimating()
        }
    }

}

extension ListViewController: ErrorDisplayer {

    public func display(error: Error?) {
        DispatchQueue.main.async {
            self.errorView.isHidden = error == nil
        }
    }

}
