import Foundation

protocol APIProtocol {
    func fetchFilms() async throws -> [Film]
}

struct Film: Decodable {
    var id: String
    var title: String
    var original_title: String
    var movie_banner: String
}

enum Category: String, CaseIterable {
    case films
    case peoples
    case locations
    case species
    case vehicles

    var name: String {
        switch self {
        case .films: return "Filmes"
        case .peoples: return "Personagens"
        case .locations: return "Locais"
        case .species: return "Espécies"
        case .vehicles: return "Veículos"
        }
    }

    var thumb: URL {
        return URL(string: "https://picsum.photos/200/200")!
    }

}

class API: APIProtocol {

    static var shared: APIProtocol = API()

    private var session = URLSession.shared

    private var baseURL: URL = URL(string: "https://ghibliapi.herokuapp.com")!

    func fetchFilms() async throws -> [Film] {

        let requestURL = baseURL.appendingPathComponent("films")

        let (data, _ ) = try await session.data(from: requestURL)

        return try JSONDecoder().decode([Film].self, from: data)
    }

}
