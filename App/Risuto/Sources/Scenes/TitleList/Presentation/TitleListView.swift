import UIKit

class TitleListView: UIView {

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

    private func setupSubviews() { }

    private func setupAnchors() { }

    private func setupAppearance() {
        backgroundColor = .systemBackground
    }

}
