import UIKit

class CategoryListViewController: UIViewController {

    typealias Configuration = CollectionViewConfiguration<CategoryItemViewCell,
                                                          CategoryListModels.ViewModel.Item>

    // MARK: Subviews

    lazy var collectionView: UICollectionView = makeCollectionView()

    // MARK: Properties

    private var router: CategoryListRouter
    private var interactor: CategoryListBusinessLogic
    private var configuration: Configuration? {
        didSet {
            collectionView.dataSource = configuration
            collectionView.delegate = configuration
        }
    }

    // MARK: Initialization

    init(router: CategoryListRouter,
         interactor: CategoryListBusinessLogic) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
        self.setupAnchors()
        self.setupAppearance()

        self.interactor.fetchCategories()
    }

    // MARK: Update

    func update(with viewModel: CategoryListModels.ViewModel) {

        self.configuration = CollectionViewConfiguration(
            models: viewModel.items,
            onCellConfigure: { cell, item in
                cell.configure(with: item.name, and: item.thumb)
                return cell
            },
            onSelectItem: { item in
                self.router.categoryList(self, didSelectItemWith: item.id)
            }
        )

    }

}

// MARK: View Setup

private extension CategoryListViewController {

    func setupSubviews() {
        view.addSubview(collectionView)
    }

    func setupAnchors() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

    func setupAppearance() {
        title = "Categorias"
        view.backgroundColor = .systemBackground
    }

}

// MARK: Subviews Setup

private extension CategoryListViewController {

    func makeCollectionViewLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))

        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)

        fullPhotoItem.contentInsets = .init(top: 20.0,
                                            leading: 20.0,
                                            bottom: 20.0,
                                            trailing: 20.0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(3/3))

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 1)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout

    }

    func makeCollectionView() -> UICollectionView {

        let layout = makeCollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(CategoryItemViewCell.self)

        return collectionView

    }

}

// MARK: Presenter Output

extension CategoryListViewController: CategoryListDisplayLogic {
    
}


