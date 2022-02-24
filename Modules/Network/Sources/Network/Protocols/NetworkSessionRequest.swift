import Foundation

public protocol NetworkSessionRequest {
    func request(_ request: URLRequest) async throws -> (Data, URLResponse)
}
