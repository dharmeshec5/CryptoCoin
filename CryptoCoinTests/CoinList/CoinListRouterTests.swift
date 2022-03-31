//
//  CoinListRouterTests.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest
@testable import CryptoCoin

final class CoinListRouterTests: XCTestCase {
    
    // MARK: - Variable
    
    private var router: CoinListRouter!
    private var view: MockViewContoller!
    private var navigator: MockNavigationContoller!
    
    // MARK: - life cycle
    
    override func setUp() {
        super.setUp()
        router = CoinListRouter()
        view = MockViewContoller()
        navigator = MockNavigationContoller(rootViewController: view)
        
    }
    
    override func tearDown() {
        navigator = nil
        view = nil
        router = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testPresentAlert() {
        router.showAlert(message: "", view: view)
        XCTAssertTrue(view.presentAlertCalled)
    }

}

class MockViewContoller: UIViewController, AlertProtocol {
 
    private (set) var presentAlertCalled = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentAlertCalled = true
    }
}

class MockNavigationContoller: UINavigationController {
 
    private (set) var pushViewControllerCalled = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
    }
}
