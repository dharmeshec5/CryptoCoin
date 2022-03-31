//
//  CoinListPresenterTests.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class CoinListPresenterTests: XCTestCase {
    
    // MARK: - Variable
    
    private var presenter: CoinListPresenter!
    private var view: MockCoinListView!
    private var interactor: MockCoinListInteractor!
    private var router: MockCoinListRouter!
    
    // MARK: - life cycle
    
    override func setUp() {
        super.setUp()
        view = MockCoinListView()
        presenter = CoinListPresenter(view: view, router: CoinListRouter())
        interactor = MockCoinListInteractor()
        router = MockCoinListRouter()
        presenter.interector = interactor
        presenter.router = router
        
    }
    
    override func tearDown() {
        presenter = nil
        interactor = nil
        view = nil
        router = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testReceivedSuccess() {
        let path = Bundle(for: CoinListPresenterTests.self).path(forResource: "MockCoinResponse", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        presenter.didReceived(data: data, pageNumber: 1)
        XCTAssertTrue(view.didReceivedDataCalled)
    }
    
    func testReceivedError() {
        let path = Bundle(for: CoinListPresenterTests.self).path(forResource: "MockErrorResponse", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        presenter.didReceived(data: data, pageNumber: 1)
        XCTAssertTrue(view.didReceivedErrorCalled)
    }
    
    func testReceivedInvalidJson() {
        let path = Bundle(for: CoinListPresenterTests.self).path(forResource: "MockErrorInvalidResponse", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        presenter.didReceived(data: data, pageNumber: 1)
        XCTAssertTrue(view.didReceivedErrorCalled)
    }
    
    func testReceivedAPIError() {
        presenter.didReceived(error: "")
        XCTAssertFalse(view.didReceivedDataCalled)
        XCTAssertTrue(view.didReceivedErrorCalled)
    }
    
    func testReceivedRespons() {
        presenter.didReceivedResponse()
        XCTAssertFalse(view.didReceivedDataCalled)
        XCTAssertTrue(view.didReceivedResponseCalled)
    }
    
    func testSearchCoinList() {
        let params = CoinListParams(offset: 0)
        presenter.searchCoinList(coinListParams: params)
        XCTAssertTrue(interactor.searchCoinListCalled)
    }
    
    func testShowAlert() {
        presenter.showAlert(message: "")
        XCTAssertTrue(router.showAlertCalled)
    }
}
