import Models

struct LocationCodable: Location {
    let id: String
}

extension LocationCodable: Decodable { }
