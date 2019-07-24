import UIKit
import BasicCleanArch

class ViewController: UIViewController, Displayer {
    typealias ViewModelType = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = GetHttpRequestInteractor()
        interactor.execute(request: nil, displayer: self)
    }
    
    func display(success: String) {
        debugPrint(success)
    }
    
    func display(failure: Error) {
        self.present(error: failure, handler: nil)
    }
    
    func present(error: Error,
                 handler: ((UIAlertAction) -> Swift.Void)?) {
        let alertView = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
}

