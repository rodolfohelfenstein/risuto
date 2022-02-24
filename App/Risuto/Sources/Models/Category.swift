import Foundation

public enum Category: String, CaseIterable {
    case film
    case people
    case locations
    case specie
    case vehicles

    var name: String {
        switch self {
        case .film:
            return  "Filmes"
        case .people:
            return  "Personagens"
        case .locations:
            return  "Locais"
        case .specie:
            return  "Especies"
        case .vehicles:
            return  "Veículos"
        }
    }

    var thumb: URL {
        return URL(string: "https://picsum.photos/200/200")!
    }
}
