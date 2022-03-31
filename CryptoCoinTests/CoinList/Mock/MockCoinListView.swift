//
//  MockCoinListView.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class MockCoinListView: PresenterToViewCoinListProtocol {
   
    weak var presenter: InterectorToPresenterCoinListProtocol?

    // MARK: - Variable
    
    private (set) var didReceivedErrorCalled = false
    private (set) var didReceivedDataCalled = false
    private (set) var didReceivedResponseCalled = false
    
    func didReceived(error message: String) {
        didReceivedErrorCalled = true
    }
    
    func didReceived(coins: [CoinModel], pageNumber: Int) {
        didReceivedDataCalled = true
    }
    
    func didReceivedResponse() {
        didReceivedResponseCalled = true
    }
    
    
}
