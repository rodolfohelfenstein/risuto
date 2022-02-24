import Models

struct PeopleCodable: People {
    let id: String
}

extension PeopleCodable: Decodable { }
