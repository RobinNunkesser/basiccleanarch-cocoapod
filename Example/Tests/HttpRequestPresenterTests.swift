import XCTest
@testable import BasicCleanArch_Example

class HttpRequestPresenterTests : XCTestCase {

    let presenter = HttpRequestPresenter()

    func testPresent() {
        let model = HttpRequestModel(origin: "origin", url: "url", headers: [:])
        let viewModel = presenter.present(model: model)
        XCTAssert(viewModel == "Origin: origin, URL: url")
    }
}
