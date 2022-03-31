//
//  MockCoinListPresenter.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class MockCoinListPresenter: ViewToPresenterCoinListProtocol {
    
    // MARK: - Variable
    
    private (set) var searchCoinListCalled = false
    private (set) var showAlertCalled = false
    private (set) var showCoinDetailCalled = false
    private (set) var showLocationServiceErrorCalled = false
    private (set) var coinListParams: CoinListParams!
    
    private (set) var didReceivedErrorCalled = false
    private (set) var didReceivedDataCalled = false
    private (set) var didReceivedResponseCalled = false
    
    var view: PresenterToViewCoinListProtocol?
    var router: PresenterToRouterCoinListProtocol?
    var interector: PresenterToInterectorCoinListProtocol?
    
    func searchCoinList(coinListParams: CoinListParams) {
        searchCoinListCalled = true
        self.coinListParams = coinListParams
    }
    
    func showCoinDetail(coin: CoinModel) {
        showCoinDetailCalled = true
    }
    
    func showAlert(message: String) {
        showAlertCalled = true
    }
    
}

extension MockCoinListPresenter: InterectorToPresenterCoinListProtocol {
    
    func didReceived(error: Error) {
        self.didReceivedErrorCalled = true
    }
    
    func didReceived(data: Data, pageNumber: Int) {
        self.didReceivedDataCalled = true
    }
    
    func didReceivedResponse() {
        self.didReceivedResponseCalled = true
    }
    
}
