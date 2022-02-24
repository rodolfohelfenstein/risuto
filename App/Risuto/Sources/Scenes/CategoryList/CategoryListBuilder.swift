import UIKit

struct CategoryListBuilder {

    static func build(_ router: CategoryListRouter) -> UIViewController {

        let presenter       = CategoryListPresenter()
        let interactor      = CategoryListInteractor(presenter: presenter)
        let viewController  = CategoryListViewController(router: router, interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }

}
