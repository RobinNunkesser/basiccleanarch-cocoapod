import Foundation
import BasicCleanArch

class GetHttpRequestInteractor : UseCase {
    typealias PresenterType = HttpRequestPresenter
    typealias DisplayerType = ViewController
    typealias RequestType = Void?
    
    var presenter: HttpRequestPresenter
    var gateway: HttpBinGateway

    init(presenter : HttpRequestPresenter, gateway: HttpBinGateway) {
        self.presenter = presenter
        self.gateway = gateway
    }
    
    required convenience init(presenter : HttpRequestPresenter) {
        self.init(presenter: presenter, gateway: HttpBinGateway())
    }
    
    convenience init() {
        self.init(presenter: HttpRequestPresenter(), gateway: HttpBinGateway())
    }
    
    func execute(request: Void?,
              displayer: ViewController) {
        gateway.fetch(completion:
            {
                switch $0 {
                case let .success(response):
                    displayer.display(result:
                        Result.success(
                            self.presenter.present(model: response)))
                case let .failure(error):
                    displayer.display(result: Result.failure(error))
                }
        })
    }
}

