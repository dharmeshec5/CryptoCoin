//
//  EncodableExtension.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

extension Encodable {
    var toDictionary: [String: AnyObject]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: AnyObject] }
    }
}
