import UIKit
import ListModule

class CategoryItemViewCell: UICollectionViewListCell {

    struct ViewModel: Identifiable {
        var id: String
        var name: String
        var thumb: URL
    }

    private lazy var categoryNameLabel: UILabel = makeCategoryNameLabel()

    private lazy var categoryContainerView: UIView = makeContainerView()

    private lazy var categoryThumbImageView: UIImageView = makeCategoryThumbImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupAnchors()
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with name: String, and url: URL) {
        categoryNameLabel.text = name
        categoryThumbImageView.load(url: url)
    }

}

extension CategoryItemViewCell: ConfigurableCell {

    func configure(_ viewModel: ViewModel) {
        categoryNameLabel.text = viewModel.name
        categoryThumbImageView.load(url: viewModel.thumb)
    }

}

extension CategoryItemViewCell {

    private func setupSubviews() {
        categoryContainerView.addSubview(categoryThumbImageView)
        contentView.addSubview(categoryContainerView)
        contentView.addSubview(categoryNameLabel)
    }

    private func setupAnchors() {
        categoryThumbImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryContainerView.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoryContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            categoryThumbImageView.topAnchor.constraint(equalTo: categoryContainerView.topAnchor),
            categoryThumbImageView.leftAnchor.constraint(equalTo: categoryContainerView.leftAnchor),
            categoryThumbImageView.bottomAnchor.constraint(equalTo: categoryContainerView.bottomAnchor),
            categoryThumbImageView.rightAnchor.constraint(equalTo: categoryContainerView.rightAnchor),

            categoryNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
            categoryNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            categoryNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20.0)
        ])

    }

    private func setupAppearance() { }

    private func makeCategoryNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false

        return label
    }

    private func makeContainerView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 12.0
        view.layer.shadowOpacity = 0.7
        return view
    }

    private func makeCategoryThumbImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20.0
        imageView.layer.masksToBounds = true
        return imageView
    }

}
