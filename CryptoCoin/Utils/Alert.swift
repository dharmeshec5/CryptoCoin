//
//  AlertProtocol.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import UIKit

// MARK: - AlertProtocol

protocol AlertProtocol: AnyObject {
    func showAlert(title: String?, message: String?)
    func showAlert(title: String?, message: String?, actions: UIAlertAction...)
}

extension AlertProtocol where Self: UIViewController {
    
    func showAlert(title: String?, message: String?) {
        showAlert(title: title, message: message, actions: UIAlertAction(title: "OK", style: .default, handler:nil))
    }
    
    func showAlert(title: String?, message: String?, actions: UIAlertAction...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}
