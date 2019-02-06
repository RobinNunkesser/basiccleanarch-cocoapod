//
//  HttpBinGatewayTests.swift
//
//  Created by Prof. Dr. Nunkesser, Robin on 02.02.19.
//  Copyright © 2019 Hochschule Hamm-Lippstadt. All rights reserved.
//

import XCTest
@testable import Pods_BasicCleanArch_Example

class HttpBinGatewayTests : XCTestCase {
    
    func testFetch() {
        let expectation = self.expectation(description: "Async complete")
        let gateway = HttpBinGateway()
        gateway.fetch(completion:
            {
                switch $0 {
                case let .success(response):
                    XCTAssertNotNil(response.url)
                    XCTAssertNotNil(response.origin)
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                }
                expectation.fulfill()
        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
