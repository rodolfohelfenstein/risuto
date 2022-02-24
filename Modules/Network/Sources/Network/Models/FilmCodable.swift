import Models

struct FilmCodable: Film {
    let id: String
}

extension FilmCodable: Decodable { }
