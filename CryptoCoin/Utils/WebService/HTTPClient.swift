//
//  HTTPClient.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation
import UIKit

final class HTTPClient {
    
    // MARK: - Variable
    
    let session: HTTPDataTaskProtocol
    
    init(session: HTTPDataTaskProtocol) {
        self.session = session
    }
}

// MARK: - HTTPClientProtocol

extension HTTPClient: HTTPClientProtocol {
    
    @discardableResult
    func request(url: String, httpMethod: HttpMethod, params: [String: AnyObject]?, completion: @escaping (Swift.Result<Data, Error>) -> Void) -> URLSessionDataTask? {
        
        let request = Request(url: url, method: .get, parameters: params).request()
        let dataTask = session.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.sync {
                if let  data = data {
                    completion(.success(data))
                }
                if let error = error {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
        return dataTask
    }
}

// MARK: - HTTPDataTaskProtocol

extension URLSession: HTTPDataTaskProtocol {}
extension String: Error {}
