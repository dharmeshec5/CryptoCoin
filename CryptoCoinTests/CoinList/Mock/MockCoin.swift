//
//  MockCoin.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation
@testable import CryptoCoin

struct MockCoin {
    
    static func getCoinModel() -> CoinModel {
        let path = Bundle(for: CoinListPresenterTests.self).path(forResource: "MockCoinResponse", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let rootModel = try! JSONDecoder().decode(CoinRootModel<CoinModel>.self, from: data)
        return rootModel.data.first!
    }
}
