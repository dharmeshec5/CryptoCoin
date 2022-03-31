//
//  Request.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

final class Request {
    
    // MARK: - Variable
    
    var url: String
    var method: HttpMethod
    var parameters: [String : AnyObject]?
    
    init(url: String, method: HttpMethod, parameters: [String : AnyObject]? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
    }
    
    // MARK: - Function
    
    func request() -> URLRequest {
        let url = URL(string: self.urlWithEncoding())!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    private func urlWithEncoding() -> String {
        var retUrl = url
        if let parameters = parameters {
            if !parameters.isEmpty {
                retUrl.append("?")
                parameters.keys.forEach {
                    guard let value = parameters[$0] else { return }
                    let escapedValue = String(describing: value).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowedCharacterSet())
                    if let escapedValue = escapedValue {
                        retUrl.append("\($0)=\(escapedValue)&")
                    }
                }
                retUrl.removeLast()
            }
        }
        return retUrl
    }
}
