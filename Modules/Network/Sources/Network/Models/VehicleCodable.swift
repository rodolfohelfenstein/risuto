import Models

struct VehicleCodable: Vehicle {
    let id: String
}

extension VehicleCodable: Decodable { }
