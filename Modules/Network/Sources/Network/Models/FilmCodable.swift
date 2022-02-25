import Models

struct FilmCodable: Film {
    let id: String
    let title: String
    let originalTitle: String
    let originalTitleRomanised: String
    let image: String
    let banner: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: Int
    let rottenTomatoes: Int
}

extension FilmCodable: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case image
        case banner = "movie_banner"
        case description
        case director
        case producer
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rottenTomatoes = "rt_score"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id                      = try container.decode(String.self, forKey: .id)
        title                   = try container.decode(String.self, forKey: .title)
        originalTitle           = try container.decode(String.self, forKey: .originalTitle)
        originalTitleRomanised  = try container.decode(String.self, forKey: .originalTitleRomanised)
        image                   = try container.decode(String.self, forKey: .image)
        banner                  = try container.decode(String.self, forKey: .banner)
        description             = try container.decode(String.self, forKey: .description)
        director                = try container.decode(String.self, forKey: .director)
        producer                = try container.decode(String.self, forKey: .producer)
        releaseDate             = try container.decode(String.self, forKey: .releaseDate)
        runningTime             = try Int(container.decode(String.self, forKey: .runningTime)) ?? 0
        rottenTomatoes          = try Int(container.decode(String.self, forKey: .rottenTomatoes)) ?? 0
    }

}
