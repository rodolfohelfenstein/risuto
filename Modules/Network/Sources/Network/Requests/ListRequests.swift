enum Request {
    case listFilms
    case listPeoples
    case listLocations
    case listSpecies
    case listVehicles
}

extension Request: NetworkRequest {

    var path: String {
        switch self {
        case .listFilms: return "films"
        case .listPeoples: return "people"
        case .listLocations: return "locations"
        case .listSpecies: return "species"
        case .listVehicles: return "vehicles"
        }
    }

}
