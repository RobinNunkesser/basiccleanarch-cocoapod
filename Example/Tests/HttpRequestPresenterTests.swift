//
//  HttpRequestPresenterTests.swift
//
//  Created by Prof. Dr. Nunkesser, Robin on 02.02.19.
//  Copyright © 2019 Hochschule Hamm-Lippstadt. All rights reserved.
//

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
