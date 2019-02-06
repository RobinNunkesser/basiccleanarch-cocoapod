//
//  HttpRequestModelTests.swift
//
//  Created by Prof. Dr. Nunkesser, Robin on 02.02.19.
//  Copyright © 2019 Hochschule Hamm-Lippstadt. All rights reserved.
//

import XCTest
@testable import Pods_BasicCleanArch_Example

class HttpRequestModelTests : XCTestCase {
    
    func testFromJSON() {
        let jsonString = """
{
  "args": {},
  "headers": {
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Encoding": "br, gzip, deflate",
    "Accept-Language": "de-de",
    "Connection": "close",
    "Cookie": "_gauges_cookie=1; _gauges_unique=1; _gauges_unique_day=1; _gauges_unique_hour=1; _gauges_unique_month=1; _gauges_unique_year=1",
    "Host": "httpbin.org",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Safari/605.1.15"
  },
  "origin": "188.109.174.240",
  "url": "https://httpbin.org/get"
}
"""
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(HttpRequestModel.self, from: jsonData)
        XCTAssert(model.headers["Accept"]=="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
        XCTAssert(model.origin=="188.109.174.240")
        XCTAssert(model.url=="https://httpbin.org/get")
    }
}
