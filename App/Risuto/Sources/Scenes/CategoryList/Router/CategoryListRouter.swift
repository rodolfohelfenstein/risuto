import UIKit

protocol CategoryListRouter: AnyObject {
    func categoryList(_ viewController: UIViewController, didSelectItemWith identifier: String)
}
