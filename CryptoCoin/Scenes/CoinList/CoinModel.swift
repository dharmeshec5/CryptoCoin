//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

struct CoinRootModel<T: Decodable>: Decodable {
    var data: [T]
}

struct CoinModel: Decodable {
    var id: String
    var name: String
    var symbol: String
    var price: String
    var changeIn24Hr: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case price = "priceUsd"
        case changeIn24Hr = "changePercent24Hr"
    }
    
    private var formattedPriceInDouble: Double {
        if let price = Double(price) {
            return (round(100 * price)/100)
        }
        return 0.0
    }
    var formattedPrice: String {
        "$" + formattedPriceInDouble.description
    }
    var change24HrInDouble: Double {
        if let changeIn24Hr = Double(changeIn24Hr ?? "0") {
            return (round(100 * changeIn24Hr)/100)
        }
        return 0.0
    }
    var formattedChangeIn24Hr: String? {
        change24HrInDouble.description + "%"
    }
}

struct CoinListParams: Codable {
    let search: String?
    let limit: Int
    let offset : Int
    
    init(search: String? = nil,
         offset: Int,
         limit: Int = 20) {
        self.search = search
        self.offset = offset
        self.limit = limit
    }
    
}
