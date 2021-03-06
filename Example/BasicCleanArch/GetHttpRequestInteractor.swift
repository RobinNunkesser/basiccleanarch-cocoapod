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

    func execute(request: Void?, displayer: ViewController, resultCode: Int) {
        gateway.fetch(completion:
            {
                switch $0 {
                case let .success(response):
                    let viewModel = self.presenter.present(model: response)                    
                    displayer.display(success: viewModel)                    
                case let .failure(error):
                    displayer.display(failure: error)
                }
        })
    }
}

