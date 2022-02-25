import XCTest
@testable import Network

final class NetworkManagerTests: XCTestCase {

    func test_networkManager_fetchFilms() async {

        let spy = NetworkSessionSpy()

        let sut: Network = NetworkManager(session: spy)

        _ = try? await sut.fetchFilms()

        XCTAssertTrue(spy.requestCalled)

    }

    func test_networkManager_fetchPeoples() async {

        let spy = NetworkSessionSpy()

        let sut: Network = NetworkManager(session: spy)

        _ = try? await sut.fetchPeoples()

        XCTAssertTrue(spy.requestCalled)

    }

    func test_networkManager_fetchLocations() async {

        let spy = NetworkSessionSpy()

        let sut: Network = NetworkManager(session: spy)

        _ = try? await sut.fetchLocations()

        XCTAssertTrue(spy.requestCalled)

    }

    func test_networkManager_fetchSpecies() async {

        let spy = NetworkSessionSpy()

        let sut: Network = NetworkManager(session: spy)

        _ = try? await sut.fetchSpecies()

        XCTAssertTrue(spy.requestCalled)

    }

    func test_networkManager_fetchVehicles() async {

        let spy = NetworkSessionSpy()

        let sut: Network = NetworkManager(session: spy)

        _ = try? await sut.fetchVehicles()

        XCTAssertTrue(spy.requestCalled)

    }

    class NetworkSessionSpy: NetworkSessionRequest {

        var requestCalled = false

        func request(_ request: URLRequest) async throws -> (Data, URLResponse) {
            requestCalled = true
            return (Data(),URLResponse())
        }

    }

}
