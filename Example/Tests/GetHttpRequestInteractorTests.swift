import XCTest
import BasicCleanArch
@testable import BasicCleanArch_Example

class GetHttpRequestInteractorTests : XCTestCase {
    
    class MockPresenter : HttpRequestPresenter {
        override func present(model: HttpRequestModel) -> String {
            return ("VALUE")
        }
    }
    
    class MockViewController : ViewController {
        var displayExpectation: XCTestExpectation!
        
        override func display(result: Result<String>) {
            displayExpectation.fulfill()
        }
    }
    
    class MockGateway : HttpBinGateway {
        var fetchExpectation: XCTestExpectation!
        
        override func fetch(
            completion: @escaping (Result<HttpRequestModel>) -> Void) {
            fetchExpectation.fulfill()
        }
    }
    
    func testCallDisplayer() {
        let interactor = GetHttpRequestInteractor(presenter: MockPresenter())
        let displayer = MockViewController()
        displayer.displayExpectation = expectation(description: "displayexpect")
        interactor.execute(request: nil, displayer: displayer)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCallGateway() {
        let gateway = MockGateway()
        gateway.fetchExpectation = expectation(description: "fetchexpect")
        let interactor = GetHttpRequestInteractor(presenter: MockPresenter(),
                                                  gateway: gateway)
        let displayer = ViewController()
        interactor.execute(request: nil, displayer: displayer)
        waitForExpectations(timeout: 10, handler: nil)
    }
}
