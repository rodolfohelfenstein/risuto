import XCTest
@testable import Network

class FilmCodableTests: XCTestCase {

    func test_filmCodable_initialization() {

        let data = TestHelpers.getMock("FilmCodableMock")

        let decoded = try? JSONDecoder().decode(FilmCodable.self, from: data)

        XCTAssertEqual(decoded?.id, "790e0028-a31c-4626-a694-86b7a8cada40")
        XCTAssertEqual(decoded?.title, "Earwig and the Witch")
        XCTAssertEqual(decoded?.originalTitle, "アーヤと魔女")
        XCTAssertEqual(decoded?.originalTitleRomanised, "Āya to Majo")
        XCTAssertEqual(decoded?.description, "An orphan girl, Earwig, is adopted by a witch and comes home to a spooky house filled with mystery and magic.")
        XCTAssertEqual(decoded?.director, "Gorō Miyazaki")
        XCTAssertEqual(decoded?.releaseDate, "2021")

    }

}
