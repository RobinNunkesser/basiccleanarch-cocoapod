import XCTest
@testable import BasicCleanArch_Example

class HttpRequestModelTests : XCTestCase {
    
    func testFromJSON() {
        let jsonString = """
{
  "args": {},
  "headers": {
    "Accept": "text/html,application/xml",
    "Accept-Encoding": "br, gzip, deflate",
    "Accept-Language": "de-de",
    "Connection": "close",
    "Cookie": "_gauges_cookie=1; _gauges_unique=1;",
    "Host": "httpbin.org",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14)..."
  },
  "origin": "188.109.174.240",
  "url": "https://httpbin.org/get"
}
"""
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(HttpRequestModel.self, from: jsonData)
        XCTAssert(model.headers["Accept"]=="text/html,application/xml")
        XCTAssert(model.origin=="188.109.174.240")
        XCTAssert(model.url=="https://httpbin.org/get")
    }
}
