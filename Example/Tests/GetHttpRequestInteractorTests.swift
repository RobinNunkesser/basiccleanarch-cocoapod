//
//  GetHttpRequestInteractorTests.swift
//
//  Created by Prof. Dr. Nunkesser, Robin on 02.02.19.
//  Copyright © 2019 Hochschule Hamm-Lippstadt. All rights reserved.
//

import XCTest
import BasicCleanArch
@testable import Pods_BasicCleanArch_Example

class GetHttpRequestInteractorTests : XCTestCase {
    
    class MockPresenter : HttpRequestPresenter {
        override func present(entity: HttpRequestModel) -> String {
            return ("VALUE")
        }
    }
    
    class MockViewController : ViewController {
        var displayExpectation: XCTestExpectation!
        
        override func display(response: Result<String>) {
            displayExpectation.fulfill()
        }
    }
    
    class MockGateway : HttpBinGateway {
        var fetchExpectation: XCTestExpectation!
        
        override func fetch(completion: @escaping (Result<HttpRequestModel>) -> Void) {
            fetchExpectation.fulfill()
        }
    }
    
    func testCallDisplayer() {
        let interactor = GetHttpRequestInteractor(presenter: MockPresenter())
        let displayer = MockViewController()
        displayer.displayExpectation = expectation(description: "display expectation")
        interactor.execute(request: nil, displayer: displayer)
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testCallGateway() {
        let gateway = MockGateway()
        gateway.fetchExpectation = expectation(description: "fetch expectation")
        let interactor = GetHttpRequestInteractor(presenter: MockPresenter(), gateway: gateway)
        let displayer = ViewController()
        interactor.execute(request: nil, displayer: displayer)
        waitForExpectations(timeout: 10, handler: nil)
    }
}
