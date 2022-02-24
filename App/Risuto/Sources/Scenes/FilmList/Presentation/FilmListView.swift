import UIKit

class FilmListView: UIView {

    lazy var collectionView: UICollectionView = makeCollectionView()

    var films: [Film] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupSubviews()
        setupAnchors()
        setupAppearance()
    }

    private func setupSubviews() {
        addSubview(collectionView)
    }

    private func setupAnchors() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
        ])
    }

    private func setupAppearance() {
        backgroundColor = .systemBackground
    }

    func update(with films: [Film]) {
        self.films = films
        self.collectionView.reloadData()
    }

    private func makeCollectionView() -> UICollectionView {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(UICollectionViewListCell.self)
        collectionView.dataSource = self

        return collectionView
    }

}

extension FilmListView: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int
    {
        films.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {

        let film = films[indexPath.row]

        let cell = collectionView.dequeueReusableCell(UICollectionViewListCell.self, for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.text = film.original_title
        content.secondaryText = film.title

        cell.contentConfiguration = content

        return cell

    }


}
