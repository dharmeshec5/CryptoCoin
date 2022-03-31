//
//  MockCoinListRouter.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class MockCoinListRouter: PresenterToRouterCoinListProtocol {
    
    // MARK: - Variable
    
    private (set) var showCoinDetailCalled = false
    private (set) var showAlertCalled = false
    
    func showCoinDetail(coin: CoinModel, view: UIViewController?) {
        showCoinDetailCalled = true
    }
    
    func showAlert(message: String, view: AlertProtocol?) {
        showAlertCalled = true
    }
    
}
