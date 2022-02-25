import Models

struct LocationCodable: Location {
    let id: String
    var name: String
    var climate: String
    var terrain: String
}

extension LocationCodable: Decodable { }
