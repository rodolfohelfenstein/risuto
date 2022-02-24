import UIKit

class AppRouter {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {

        navigationController.viewControllers = [makeCategory()]

    }

    func makeCategory() -> UIViewController {
        return CategoryListBuilder.build(self)
    }

    func makeFilms() -> UIViewController {
        return UIViewController()
    }

}

extension AppRouter: CategoryListRouter {

    func categoryList(
        _ viewController: UIViewController,
        didSelectItemWith identifier: String)
    {
        let viewController = FilmLi
        navigationController.pushViewController(, animated: <#T##Bool#>)
    }

}
