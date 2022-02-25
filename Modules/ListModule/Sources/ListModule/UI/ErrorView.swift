import UIKit

class ErrorView: UIView {

    lazy var stackView: UIStackView = makeStackView()
    lazy var errorLabel: UILabel = makeErrorLabel()
    lazy var retryButton: UIButton = makeRetryButton()

    var onRetry: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupAnchors()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupAnchors()
    }

    private func setupSubviews() {
        stackView.addArrangedSubview(errorLabel)
        stackView.addArrangedSubview(retryButton)

        addSubview(stackView)
    }

    private func setupAnchors() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

}

extension ErrorView {

    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 32.0
        return stackView
    }

    private func makeErrorLabel() -> UILabel {
        let label = UILabel()
        label.text = "Ops...\nOcorreu um problema"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }

    private func makeRetryButton() -> UIButton {

        let action = UIAction { _ in
            self.onRetry?()
        }

        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.cornerStyle = .medium
        config.title = "TENTAR NOVAMENTE"
        config.baseBackgroundColor = .black

        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
            return outgoing
        }


        let button = UIButton()
        button.configuration = config
        button.addAction(action, for: .touchUpInside)
        return button
    }

}
