//
//  CoinListConfigurator.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation
import UIKit

final public class CoinListConfigurator {
    
    // MARK: - Functions
    
    public init () {}
    
    public func makeViewController() -> UIViewController {
        let viewController: CoinListViewController = UIStoryboard.main.created()
        let router = CoinListRouter()
        let presenter = CoinListPresenter(view: viewController, router: router)
        let interactor = CoinListIntrector(presenter: presenter, apiManager: HTTPClient(session: URLSession(configuration: .default)))
        viewController.presenter = presenter
        presenter.interector = interactor
        return viewController
    }
}
