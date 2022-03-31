//
//  CoinListIntrector.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

final class CoinListIntrector: PresenterToInterectorCoinListProtocol {
    
    // MARK: - Variable
    
    private let apiManager: HTTPClientProtocol
    private weak var dataTask: URLSessionDataTask?
    weak var presenter: InterectorToPresenterCoinListProtocol?
    
    init(presenter: InterectorToPresenterCoinListProtocol,
         apiManager: HTTPClientProtocol) {
        self.presenter = presenter
        self.apiManager = apiManager
    }
    
    // MARK: - PresenterToInterectorCoinListProtocol
    
    func searchCoinList(coinListParams: CoinListParams) {
        
        self.dataTask?.cancel()
        let dataTask = apiManager.request(url: APIName.coinList, httpMethod: .get, params: coinListParams.toDictionary) { [weak self] (result) in
            guard let self = self else {return}
            self.presenter?.didReceivedResponse()
            switch result {
            case .success(let data):
                self.presenter?.didReceived(data: data, pageNumber: coinListParams.offset)
            case .failure(let error):
                if (error as NSError).code == NSURLErrorCancelled {
                    return
                }
                self.presenter?.didReceived(error: error)
            }
        }
        self.dataTask = dataTask
    }
    
}
