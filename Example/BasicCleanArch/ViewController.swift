//
//  ViewController.swift
//  BasicCleanArch
//
//  Created by Robin Nunkesser on 02/03/2019.
//  Copyright (c) 2019 Robin Nunkesser. All rights reserved.
//

import UIKit
import BasicCleanArch

class ViewController: UIViewController, Displayer {

    typealias ViewModelType = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = GetHttpRequestInteractor()
        interactor.execute(request: nil, displayer: self)
    }
    
    func display(result: Result<String>) {
        switch result {
        case let .success(value):
            debugPrint(value)
        case let .failure(error):
            self.present(error: error, handler: nil)
        }
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

