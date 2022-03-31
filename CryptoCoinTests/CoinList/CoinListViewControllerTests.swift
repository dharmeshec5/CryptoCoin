//
//  CoinListViewControllerTests.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class CoinListViewControllerTests: XCTestCase {
    
    // MARK: - Variable
    
   private var viewController: CoinListViewController!
    
    // MARK: - life cycle
    
    override func setUp() {
        super.setUp()
        viewController = CoinListConfigurator().makeViewController() as? CoinListViewController
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSetViewControllerPresenter() {
        XCTAssertNotNil(viewController.presenter)
    }
    
    func testSetPresenterRouter() {
        XCTAssertNotNil(viewController.presenter.router)
    }
    
    func testSetPresenterInterector() {
        XCTAssertNotNil(viewController.presenter.interector)
    }
    
    func testSetPresenterView() {
        XCTAssertNotNil(viewController.presenter.view)
    }
    
    func testSetInterectorProtocol() {
        XCTAssertNotNil(viewController.presenter.interector as? CoinListIntrector)
    }
    
    func testSetRouterProtocol() {
        XCTAssertNotNil(viewController.presenter.router as? CoinListRouter)
    }
    
    func testSetPresenterProtocol() {
        XCTAssertNotNil(viewController.presenter.interector?.presenter as? CoinListPresenter)
    }
    
    func testShowAlert() {
        let presenter = MockCoinListPresenter()
        viewController.presenter = presenter
        viewController.didReceived(error: "")
        XCTAssertTrue(presenter.showAlertCalled)
    }

    func testSearchCoinList() {
        let presenter = MockCoinListPresenter()
        viewController.presenter = presenter
        let params = CoinListParams(offset: 0)
        viewController.presenter.searchCoinList(coinListParams: params)
        XCTAssertTrue(presenter.searchCoinListCalled)
        XCTAssertEqual(presenter.coinListParams.search, params.search)
        XCTAssertEqual(presenter.coinListParams.limit, params.limit)
        XCTAssertEqual(presenter.coinListParams.offset, params.offset)
    }
    
    func testCoderNil() {
       XCTAssertNil(CoinTableViewCell(coder: NSCoder()))
    }
    
}
