import Models

struct VehicleCodable: Vehicle {
    let id: String
    var name: String
    var description: String
    var vehicleClass: String
}

extension VehicleCodable: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case vehicleClass = "vehicle_class"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id                      = try container.decode(String.self, forKey: .id)
        name                    = try container.decode(String.self, forKey: .name)
        description             = try container.decode(String.self, forKey: .description)
        vehicleClass            = try container.decode(String.self, forKey: .vehicleClass)

    }

}
