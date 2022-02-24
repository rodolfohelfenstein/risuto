import Foundation
import Network

extension URLSession: NetworkSessionRequest {

    public func request(_ request: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: request)
    }

}
