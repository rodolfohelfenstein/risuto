import UIKit
import Network
import Models
import ListModule

class AppRouter {

    private let navigationController: UINavigationController
    private let network: Network

    init(navigationController: UINavigationController, network: Network) {
        self.navigationController = navigationController
        self.network = network
    }

    func start() {

        let viewController = makeCategory()

        navigationController.viewControllers = [viewController]

    }

    func navigateTo(_ item: String) {

        guard let category = Category(rawValue: item) else { return }

        switch category {
        case .film:
            navigationController.pushViewController(makeFilms(), animated: true)
        case .people:
            navigationController.pushViewController(makePeoples(), animated: true)
        case .locations:
            navigationController.pushViewController(makeLocations(), animated: true)
        case .specie:
            navigationController.pushViewController(makeSpecies(), animated: true)
        case .vehicles:
            navigationController.pushViewController(makeVehicles(), animated: true)
        }

    }

    func makeCategory() -> UIViewController {

        typealias CategoryListComposer = ListModule<Category, CategoryItemViewCell>

        return CategoryListComposer.compose(
            title: "Categorias",
            layout: CardListLayout(),
            store: {
                return Category.allCases
            },
            mapping: {
                $0.map { CategoryItemViewCell.ViewModel(id: $0.rawValue,
                                                        name: $0.name,
                                                        thumb: $0.thumb) }
            },
            onSelection: { self.navigateTo($0) })
    }

    func makeFilms() -> UIViewController {

        typealias FilmsListComposer = ListModule<Film, FilmItemViewCell>

        return FilmsListComposer.compose(
            title: "Filmes",
            store: network.fetchFilms,
            mapping: {
                $0.map { FilmItemViewCell.ViewModel(id: $0.id,
                                                    name: $0.title,
                                                    originalTitle: $0.originalTitle,
                                                    originalTitleRomanised: $0.originalTitleRomanised) }
            },
            onSelection: { item in })
    }

    func makePeoples() -> UIViewController {

        typealias FilmsListComposer = ListModule<People, PeopleItemViewCell>

        return FilmsListComposer.compose(
            title: "Personagens",
            store: network.fetchPeoples,
            mapping: { $0.map { .init(id: $0.id,
                                      name: $0.name,
                                      age: $0.age,
                                      gender: $0.gender) }
            },
            onSelection: { item in })
    }

    func makeLocations() -> UIViewController {

        typealias FilmsListComposer = ListModule<Location, LocationItemViewCell>

        return FilmsListComposer.compose(
            title: "Locais",
            store: network.fetchLocations,
            mapping: { $0.map { .init(id: $0.id,
                                      name: $0.name,
                                      climate: $0.climate,
                                      terrain: $0.terrain) }
            },
            onSelection: { item in })
    }

    func makeSpecies() -> UIViewController {

        typealias FilmsListComposer = ListModule<Specie, SpecieItemViewCell>

        return FilmsListComposer.compose(
            title: "Species",
            store: network.fetchSpecies,
            mapping: { $0.map { .init(id: $0.id,
                                      name: $0.name,
                                      classification: $0.classification) }
            },
            onSelection: { item in })
    }

    func makeVehicles() -> UIViewController {

        typealias FilmsListComposer = ListModule<Vehicle, VehicleItemViewCell>

        return FilmsListComposer.compose(
            title: "Vehicles",
            store: network.fetchVehicles,
            mapping: { $0.map { .init(id: $0.id,
                                      name: $0.name,
                                      description: $0.description,
                                      vehicleClass: $0.vehicleClass) }
            },
            onSelection: { item in })
    }

}
