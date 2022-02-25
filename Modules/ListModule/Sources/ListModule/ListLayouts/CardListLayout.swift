import UIKit

public class CardListLayout: UICollectionViewCompositionalLayout, ListLayout  {

    public init() {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))

        let fullItem = NSCollectionLayoutItem(layoutSize: itemSize)

        fullItem.contentInsets = .init(top: 20.0,
                                            leading: 20.0,
                                            bottom: 20.0,
                                            trailing: 20.0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullItem,
            count: 1)

        let section = NSCollectionLayoutSection(group: group)

        super.init(section: section)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
