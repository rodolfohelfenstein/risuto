import Models

struct FilmCodable: Film {
    let id: String
    let title: String
    let originalTitle: String
    let originalTitleRomanised: String
    let description: String
    let director: String
    let releaseDate: String
}

extension FilmCodable: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case description
        case director
        case releaseDate = "release_date"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id                      = try container.decode(String.self, forKey: .id)
        title                   = try container.decode(String.self, forKey: .title)
        originalTitle           = try container.decode(String.self, forKey: .originalTitle)
        originalTitleRomanised  = try container.decode(String.self, forKey: .originalTitleRomanised)
        description             = try container.decode(String.self, forKey: .description)
        director                = try container.decode(String.self, forKey: .director)
        releaseDate             = try container.decode(String.self, forKey: .releaseDate)
    }

}
