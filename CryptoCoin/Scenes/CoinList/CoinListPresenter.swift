//
//  CoinListPresentor.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation

final class CoinListPresenter: ViewToPresenterCoinListProtocol {
    
    // MARK: - Variable
    
    var router: PresenterToRouterCoinListProtocol?
    weak var view: PresenterToViewCoinListProtocol?
    var interector: PresenterToInterectorCoinListProtocol?
    
    init(view: PresenterToViewCoinListProtocol, router: PresenterToRouterCoinListProtocol) {
        self.router = router
        self.view = view
    }
    
    // MARK: - ViewToPresenterCoinListProtocol
    
    func searchCoinList(coinListParams: CoinListParams) {
        interector?.searchCoinList(coinListParams: coinListParams)
    }
    
    func showAlert(message: String) {
        router?.showAlert(message: message, view:  view as? CoinListViewController)
    }
}

// MARK: - InterectorToPresenterCoinListProtocol

extension CoinListPresenter: InterectorToPresenterCoinListProtocol {
    
    func didReceived(error: Error) {
        view?.didReceived(error: error.localizedDescription)
    }
    
    func didReceived(data: Data, pageNumber: Int) {
        do {
            let rootModel = try JSONDecoder().decode(CoinRootModel<CoinModel>.self, from: data)
            view?.didReceived(coins: rootModel.data, pageNumber: pageNumber)
        } catch {
                view?.didReceived(error: error.localizedDescription)
        }
    }
    
    func didReceivedResponse() {
        view?.didReceivedResponse()
    }
}
