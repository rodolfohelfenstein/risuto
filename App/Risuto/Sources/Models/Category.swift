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

    var thumb: String {
        switch self {
        case .film:
            return "image1"
        case .people:
            return "image2"
        case .locations:
            return "image4"
        case .specie:
            return "image3"
        case .vehicles:
            return "image5"
        }
    }
}
