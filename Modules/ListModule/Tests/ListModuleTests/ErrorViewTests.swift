import XCTest

@testable import ListModule

class ErrorViewTests: XCTestCase {

    func test_errorView_initialization_frame() {

        let sut = ErrorView(frame: .zero)

        XCTAssertEqual(sut.subviews.count, 1)
        XCTAssertEqual(sut.stackView.arrangedSubviews.count, 2)

    }

    func test_errorView_retryButton() {

        let sut = ErrorView(frame: .zero)

        var onRetryCalled = false

        let expectation = expectation(description: "OnRetry")
        sut.onRetry = {
            onRetryCalled = true
            expectation.fulfill()
        }

        sut.retryButton.sendActions(for: .touchUpInside)

        waitForExpectations(timeout: 1.0, handler: nil)
        XCTAssertTrue(onRetryCalled)
    }

}
