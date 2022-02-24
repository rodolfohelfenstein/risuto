import Foundation
import Models

public class NetworkManager {

    public let baseURL: URL = URL(string: "https://ghibliapi.herokuapp.com")!

    public let session: NetworkSessionRequest

    public init(session: NetworkSessionRequest) {
        self.session = session
    }

    private func fetch<Request, Response>(_ request: Request) async throws -> Response where Request: NetworkRequest,
                                                                                             Response: Decodable
    {
        let url = baseURL.appendingPathComponent(request.path)
        let urlRequest = URLRequest(url: url)

        let (data, _) = try await session.request(urlRequest)

        return try JSONDecoder().decode(Response.self, from: data)
    }

}

extension NetworkManager: Network {

    public func fetchFilms() async throws -> [Models.Film] {
        return try await self.fetch(Request.listFilms) as [FilmCodable]
    }

    public func fetchPeoples() async throws -> [Models.People] {
        return try await self.fetch(Request.listPeoples) as [PeopleCodable]
    }

    public func fetchLocations() async throws -> [Models.Location] {
        return try await self.fetch(Request.listLocations) as [LocationCodable]
    }

    public func fetchSpecies() async throws -> [Models.Specie] {
        return try await self.fetch(Request.listSpecies) as [SpecieCodable]
    }

    public func fetchVehicles() async throws -> [Models.Vehicle] {
        return try await self.fetch(Request.listVehicles) as [VehicleCodable]
    }

}
