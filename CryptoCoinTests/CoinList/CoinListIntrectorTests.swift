//
//  CoinListIntrectorTests.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class CoinListIntrectorTests: XCTestCase {
    
    // MARK: - Variable
    
    private var intrector: CoinListIntrector!
    private var presenter: MockCoinListPresenter!
    private var httpClient: HTTPClient!
    
    // MARK: - life cycle
    
    override func setUp() {
        super.setUp()
        presenter = MockCoinListPresenter()
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSearchCoinListError() {
        httpClient = HTTPClient(session: MockSession(error: "error", data: nil))
        intrector = CoinListIntrector(presenter: presenter, apiManager: httpClient)
        let coinListParams = CoinListParams(offset: 0)
        intrector.searchCoinList(coinListParams: coinListParams)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.presenter.didReceivedErrorCalled)
            XCTAssertTrue(self.presenter.didReceivedResponseCalled)
        }
    }
    
    func testSearchCoinListCancelTask() {
        httpClient = HTTPClient(session: MockSession(error: NSError(domain: "", code: -999, userInfo: nil), data: nil))
        intrector = CoinListIntrector(presenter: presenter, apiManager: httpClient)
        let coinListParams = CoinListParams(offset: 0)
        intrector.searchCoinList(coinListParams: coinListParams)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertFalse(self.presenter.didReceivedErrorCalled)
            XCTAssertTrue(self.presenter.didReceivedResponseCalled)
        }
    }
    
    func testSearchCoinListInvalidRequest() {
        httpClient = HTTPClient(session: MockSession(error: NSError(domain: "", code: -999, userInfo: nil), data: nil))
        intrector = CoinListIntrector(presenter: presenter, apiManager: httpClient)
        let coinListParams = CoinListParams(search: "😃😃😃", offset: -1, limit: 20)
        intrector.searchCoinList(coinListParams: coinListParams)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.presenter.didReceivedErrorCalled)
            XCTAssertTrue(self.presenter.didReceivedResponseCalled)
        }
    }
    
    func testSearchCoinListSuccess() {
        httpClient = HTTPClient(session: MockSession(error: nil, data: Data()))
        intrector = CoinListIntrector(presenter: presenter, apiManager: httpClient)
         let coinListParams = CoinListParams(offset: 0)
        intrector.searchCoinList(coinListParams: coinListParams)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.presenter.didReceivedDataCalled)
            XCTAssertTrue(self.presenter.didReceivedResponseCalled)
        }
    }
    
}
