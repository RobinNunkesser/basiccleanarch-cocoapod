import Foundation
import BasicCleanArch

class HttpRequestPresenter : Presenter {
    typealias Entity = HttpRequestModel
    typealias ViewModel = String
    
    func present(entity: HttpRequestModel) -> String {
        return "Origin: \(entity.origin), URL: \(entity.url)"
    }
}
