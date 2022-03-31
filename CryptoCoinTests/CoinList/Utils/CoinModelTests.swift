//
//  CoinModelTests.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation
@testable import CryptoCoin
import XCTest

final class CoinModelTests: XCTestCase {
    
    // MARK: - Variable
    
   private var coin: CoinModel!
    
    // MARK: - life cycle
    
    override func setUp() {
        super.setUp()
        coin = MockCoin.getCoinModel()
    }
    
    override func tearDown() {
        coin = nil
        super.tearDown()
    }
    
    func testCoinFormattedValue() {
        XCTAssertEqual(coin.formattedPrice, "$1.21")
        XCTAssertEqual(coin.formattedChangeIn24Hr, "5.87%")
    }
    
    func testCoinFormattedValueEmpty() {
        coin.price = ""
        coin.changeIn24Hr = nil
        XCTAssertEqual(coin.formattedPrice, "$0.0")
        XCTAssertEqual(coin.formattedChangeIn24Hr, "0.0%")
        coin.changeIn24Hr = ""
        XCTAssertEqual(coin.formattedChangeIn24Hr, "0.0%")
        
    }
}
