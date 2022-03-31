//
//  CoinListRouter.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

// MARK: - PresenterToRouterCoinListProtocol

final class CoinListRouter : PresenterToRouterCoinListProtocol {
    
    func showAlert(message: String, view: AlertProtocol?) {
        view?.showAlert(title: "Error", message: message)
    }
}
