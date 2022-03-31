//
//  CryptoCoinUITests.swift
//  CryptoCoinUITests
//
//  Created by Dharmesh Patel on 31/03/22.
//

import XCTest

class DharmeshPracticalUITests: XCTestCase {
    
    enum Identifire: String {
        case searchButton = "Search"
        case coinCell = "CoinTableViewCell"
    }
    
    private var app = XCUIApplication()

    private var searchTextField: XCUIElement {
        app.searchFields.firstMatch
    }
    
    private var searchButton: XCUIElement {
        app.buttons[Identifire.searchButton.rawValue]
    }
    
    private var tableView: XCUIElement {
        app.tables.firstMatch
    }
    
    private var cellsQuery: XCUIElementQuery {
        tableView.cells
    }
    
    private var coinCell: XCUIElement {
        cellsQuery.matching(identifier: Identifire.coinCell.rawValue).element
    }
    
    
    func testPullToRefereshe() {
        app.launch()
        if coinCell.waitForExistence(timeout: 8) {
            let firstCell = tableView.cells.firstMatch
            let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
            let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 100))
            start.press(forDuration: 0, thenDragTo: finish)
        } else {
            XCTFail("Failed to get respose from API")
        }
    }
    
    func testSearchCoin() {
        app.launch()
        searchTextField.tap()
        searchTextField.typeText("Bitcoin")
        searchButton.tap()
        
        if coinCell.waitForExistence(timeout: 8) {
            let firstCell = tableView.cells.firstMatch
            let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
            let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 100))
            start.press(forDuration: 0, thenDragTo: finish)
        } else {
            XCTFail("Failed to get respose from API")
        }
    }
    
    func testLoadMor() {
        app.launch()
        if coinCell.waitForExistence(timeout: 8) {
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
            tableView.swipeUp()
        } else {
            XCTFail("Failed to get respose from API")
        }
    }
}
