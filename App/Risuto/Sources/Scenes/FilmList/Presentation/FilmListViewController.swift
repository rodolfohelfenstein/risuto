import UIKit

class FilmListViewController: UIViewController {

    lazy var codableView: FilmListView = makeCodableView()

    override func loadView() {
        view = codableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Films"
        fetchFilms()
    }

    func fetchFilms() {

        Task.init {
            do {
                let films = try await API.shared.fetchFilms()
                codableView.update(with: films)
            } catch {
                print(error)
            }
        }

    }

    private func makeCodableView() -> FilmListView {
        let codableView = FilmListView(frame: .zero)
        return codableView
    }

}
