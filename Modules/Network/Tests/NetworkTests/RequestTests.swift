import XCTest

@testable import Network

class RequestTests: XCTestCase {

    func test_request_listFilms() {

        let sut = Request.listFilms

        XCTAssertEqual(sut.path, "films")

    }

    func test_request_listPeoples() {

        let sut = Request.listPeoples

        XCTAssertEqual(sut.path, "people")

    }

    func test_request_listLocations() {

        let sut = Request.listLocations

        XCTAssertEqual(sut.path, "locations")

    }

    func test_request_listSpecies() {

        let sut = Request.listSpecies

        XCTAssertEqual(sut.path, "species")

    }

    func test_request_listVehicles() {

        let sut = Request.listVehicles

        XCTAssertEqual(sut.path, "vehicles")

    }

}
