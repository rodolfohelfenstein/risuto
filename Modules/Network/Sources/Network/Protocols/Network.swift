import Models

public protocol Network {
    func fetchFilms() async throws -> [Models.Film]
    func fetchPeoples() async throws -> [Models.People]
    func fetchLocations() async throws -> [Models.Location]
    func fetchSpecies() async throws -> [Models.Specie]
    func fetchVehicles() async throws -> [Models.Vehicle]
}
