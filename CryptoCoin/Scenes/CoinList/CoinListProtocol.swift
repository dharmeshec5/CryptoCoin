//
//  CoinListProtocol.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

// MARK: - PresenterToViewCoinListProtocol

protocol PresenterToViewCoinListProtocol: AnyObject {
    func didReceived(error message: String)
    func didReceived(coins: [CoinModel], pageNumber: Int)
    func didReceivedResponse()
}

// MARK: - InterectorToPresenterCoinListProtocol

protocol InterectorToPresenterCoinListProtocol: AnyObject {
    func didReceived(error: Error)
    func didReceived(data: Data, pageNumber: Int)
    func didReceivedResponse()
}

// MARK: - PresenterToInterectorCoinListProtocol

protocol PresenterToInterectorCoinListProtocol: AnyObject {
    var presenter: InterectorToPresenterCoinListProtocol? {get set}
    func searchCoinList(coinListParams: CoinListParams)
}

// MARK: - PresenterToRouterCoinListProtocol

protocol PresenterToRouterCoinListProtocol: AnyObject {
    func showAlert(message: String, view: AlertProtocol?)
}

// MARK: - ViewToPresenterCoinListProtocol

protocol ViewToPresenterCoinListProtocol: AnyObject {
    var view: PresenterToViewCoinListProtocol? {get set}
    var router: PresenterToRouterCoinListProtocol? {get set}
    var interector: PresenterToInterectorCoinListProtocol? {get set}
    func searchCoinList(coinListParams: CoinListParams)
    func showAlert(message: String) 
    
}

// MARK: - HTTPClientProtocol

protocol HTTPClientProtocol: AnyObject {
    @discardableResult func request(url: String, httpMethod: HttpMethod, params: [String: AnyObject]?, completion: @escaping (Swift.Result<Data, Error>) -> Void) -> URLSessionDataTask?
}

// MARK: - HTTPDataTaskProtocol

protocol HTTPDataTaskProtocol: AnyObject {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
