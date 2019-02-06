import Foundation
import BasicCleanArch

class HttpRequestPresenter : Presenter {
    typealias Model = HttpRequestModel
    typealias ViewModel = String
    
    func present(model: HttpRequestModel) -> String {
        return "Origin: \(model.origin), URL: \(model.url)"
    }
}
