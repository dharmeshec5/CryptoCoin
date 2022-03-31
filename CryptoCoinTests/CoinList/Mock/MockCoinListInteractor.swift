//
//  MockCoinListInteractor.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class MockCoinListInteractor: PresenterToInterectorCoinListProtocol {
    
    weak var presenter: InterectorToPresenterCoinListProtocol?
    
    // MARK: - Variable
    
    private (set) var searchCoinListCalled = false
    
    func searchCoinList(coinListParams: CoinListParams) {
        searchCoinListCalled = true
    }
    
}
