//
//  CharacterSet.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

// MARK: - CharacterSet
 
extension CharacterSet {
    
    static func urlQueryAllowedCharacterSet() -> CharacterSet {
        let generalDelimitersToEncode = ":#[]@!$&'()*+,;="
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: generalDelimitersToEncode)
        return allowedCharacterSet
    }
}
