import Foundation
import BasicCleanArch

class HttpBinGateway {
    let url = "https://httpbin.org/get"
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetch(completion: @escaping (Result<HttpRequestModel>) -> Void) {
        let request = URLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            guard let data = data else {
                completion(Result.failure(error!))
                return
            }
            do {
                let decoder = JSONDecoder()
                let item = try decoder.decode(HttpRequestModel.self,
                                              from: data)
                completion(Result<HttpRequestModel>.success(item))
            } catch {
                completion(Result.failure(error))
            }
        })
        task.resume()
    }
}
