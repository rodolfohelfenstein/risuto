import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(
        _ type: T.Type)
    {
        let className = String(describing: type)
        register(T.self, forCellWithReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(
        _ type: T.Type,
        for indexPath: IndexPath) -> T?
    {
        let className = String(describing: type)

        return dequeueReusableCell(withReuseIdentifier: className,
                                   for: indexPath) as? T

    }

}
