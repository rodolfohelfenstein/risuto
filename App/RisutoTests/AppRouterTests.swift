import XCTest
import Models
import Network
@testable import Risuto

class AppRouterTests: XCTestCase {

    func test_appRouter_makeFilms() {

        let navigationController = UINavigationController()
        let spy = SpyNetwork()

        let sut = AppRouter(navigationController: navigationController, network: spy)

        let viewController = sut.makeFilms()

        _ = viewController.view

        let exp = expectation(description: "Delay for ViewLoad")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(spy.fetchFilmsCalled)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_appRouter_makePeoples() {

        let navigationController = UINavigationController()
        let spy = SpyNetwork()

        let sut = AppRouter(navigationController: navigationController, network: spy)

        let viewController = sut.makePeoples()

        _ = viewController.view

        let exp = expectation(description: "Delay for ViewLoad")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(spy.fetchPeoplesCalled)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_appRouter_makeLocations() {

        let navigationController = UINavigationController()
        let spy = SpyNetwork()

        let sut = AppRouter(navigationController: navigationController, network: spy)

        let viewController = sut.makeLocations()

        _ = viewController.view

        let exp = expectation(description: "Delay for ViewLoad")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(spy.fetchLocationsCalled)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_appRouter_makeSpecies() {

        let navigationController = UINavigationController()
        let spy = SpyNetwork()

        let sut = AppRouter(navigationController: navigationController, network: spy)

        let viewController = sut.makeSpecies()

        _ = viewController.view

        let exp = expectation(description: "Delay for ViewLoad")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(spy.fetchSpeciesCalled)
        } else {
            XCTFail("Delay interrupted")
        }

    }

    func test_appRouter_makeVehicles() {

        let navigationController = UINavigationController()
        let spy = SpyNetwork()

        let sut = AppRouter(navigationController: navigationController, network: spy)

        let viewController = sut.makeVehicles()

        _ = viewController.view

        let exp = expectation(description: "Delay for ViewLoad")
        let result = XCTWaiter.wait(for: [exp], timeout: 1.0)

        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(spy.fetchVehiclesCalled)
        } else {
            XCTFail("Delay interrupted")
        }

    }


    class SpyNetwork: Network {

        var fetchFilmsCalled = false
        var fetchPeoplesCalled = false
        var fetchLocationsCalled = false
        var fetchSpeciesCalled = false
        var fetchVehiclesCalled = false

        func fetchFilms() async throws -> [Film] {
            fetchFilmsCalled = true
            return []
        }

        func fetchPeoples() async throws -> [People] {
            fetchPeoplesCalled = true
            return []
        }

        func fetchLocations() async throws -> [Location] {
            fetchLocationsCalled = true
            return []
        }

        func fetchSpecies() async throws -> [Specie] {
            fetchSpeciesCalled = true
            return []
        }

        func fetchVehicles() async throws -> [Vehicle] {
            fetchVehiclesCalled = true
            return []
        }

    }

}
