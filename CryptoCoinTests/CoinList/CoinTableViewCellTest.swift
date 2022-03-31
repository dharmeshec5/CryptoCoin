//
//  CoinTableViewCellTest.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

@testable import CryptoCoin
import XCTest

final class CoinTableViewCellTest: XCTestCase {
    
    // MARK: - Variable
    
    private var coin: CoinModel!
    private var cell: CoinTableViewCell!
    
    // MARK: - life cycle
    
    override func setUp() {
        super.setUp()
        let tableView = UITableView()
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        let coinCell: CoinTableViewCell = tableView.dequeueReusableCell(for: IndexPath())
        cell = coinCell
        coin = MockCoin.getCoinModel()
    }
    
    override func tearDown() {
        coin = nil
        cell = nil
        super.tearDown()
    }
    
    func testCellLabelValue() {
        cell.loadCell(coin)
        XCTAssertEqual(cell.nameLabel.text, "Hive")
        XCTAssertEqual(cell.priceLabel.text, "$1.21")
        XCTAssertEqual(cell.changeIn24HrLabel.text, "5.87%")
    }
    
    func testCellLabelTextColorPlus() {
        cell.loadCell(coin)
        XCTAssertEqual(cell.nameLabel.textColor, Color.blackColor)
        XCTAssertEqual(cell.priceLabel.textColor, Color.greenColor)
        XCTAssertEqual(cell.changeIn24HrLabel.textColor, Color.greenColor)
    }
    
    func testCellLabelTextColorMinus() {
        coin.changeIn24Hr = "-1.0"
        cell.loadCell(coin)
        XCTAssertEqual(cell.nameLabel.textColor, Color.blackColor)
        XCTAssertEqual(cell.priceLabel.textColor, Color.redColor)
        XCTAssertEqual(cell.changeIn24HrLabel.textColor, Color.redColor)
    }
    
}
