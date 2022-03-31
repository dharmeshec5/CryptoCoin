//
//  MockSession.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation
@testable import CryptoCoin

final class MockSession: HTTPDataTaskProtocol {
    
    // MARK: - Variable
    
    let error: Error?
    let data: Data?
    
    init(error: Error?, data: Data?) {
        self.error = error
        self.data = data
    }
    
    // MARK: - HTTPDataTaskProtocol
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
       
        DispatchQueue.global(qos: .userInitiated).async {
            if let error = self.error {
                completionHandler(nil, nil, error)
            } else {
                completionHandler(self.data, nil, nil)
            }
        }
        
        return URLSession.init(configuration: .default).dataTask(with: URLRequest(url: URL(string: "https://")!))
    }
}
