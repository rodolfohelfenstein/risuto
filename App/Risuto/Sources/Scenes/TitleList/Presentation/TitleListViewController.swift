import UIKit

class TitleListViewController: UIViewController {

    lazy var codableView: TitleListView = makeCodableView()

    override func loadView() {
        view = codableView
    }

    private func makeCodableView() -> TitleListView {
        let codableView = TitleListView(frame: .zero)
        return codableView
    }

}
