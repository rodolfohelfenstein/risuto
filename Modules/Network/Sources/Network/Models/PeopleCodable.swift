import Models

struct PeopleCodable: People {
    let id: String
    var name: String
    var age: String
    var gender: String
}

extension PeopleCodable: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case age
        case gender
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id                      = try container.decode(String.self, forKey: .id)
        name                    = try container.decode(String.self, forKey: .name)
        age                     = try container.decode(String.self, forKey: .age)
        gender                  = (try? container.decode(String.self, forKey: .gender)) ?? "NA"

    }

}
