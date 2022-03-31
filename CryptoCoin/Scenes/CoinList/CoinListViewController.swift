//
//  CoinListViewController.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import UIKit

final class CoinListViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var noDataLable: UILabel!
    
    // MARK: - Variables
    
    private lazy var refreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlBeginRefreshing(_:)), for: .valueChanged)
        return refreshControl
    }()
    private var coins: [CoinModel] = []
    var presenter: ViewToPresenterCoinListProtocol!
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRefreshControl()
        setupSearchController()
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        refreshControlBeginRefreshing(nil)
        setTimer(seconds: 10)
    }
    
    // MARK: - Functions
    
    private func setTimer(seconds: TimeInterval) {
        let timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc private func timerSelector() {
       fetchCoinAPI()
    }
    
   private func setupSearchController() {
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
       searchController.searchBar.accessibilityIdentifier = "SearchCoinList"
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
        self.searchController.searchBar.placeholder = "Search Coin"
    }
    
    private func fetchCoinAPI() {
        let coinListParams = CoinListParams(search: self.searchController.searchBar.text, offset: 0)
        self.presenter.searchCoinList(coinListParams: coinListParams)
    }
    
    @objc private func refreshControlBeginRefreshing(_ sender: UIRefreshControl?) {
        fetchCoinAPI()
    }
    
    private func addRefreshControl() {
        tableView.addSubview(refreshControl)
    }
}

// MARK: - UITableViewDataSource

extension CoinListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coinCell: CoinTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        coinCell.loadCell(coins[indexPath.row])
        return coinCell
    }
}

// MARK: - PresenterToViewCoinListProtocol

extension CoinListViewController: PresenterToViewCoinListProtocol {
    
    func didReceived(error message: String) {
        presenter.showAlert(message: message)
    }
    
    func didReceived(coins: [CoinModel], pageNumber: Int) {
        self.coins = coins
        tableView.reloadData()
        noDataLable.isHidden = !self.coins.isEmpty
    }
    
    func didReceivedResponse() {
        refreshControl.endRefreshing()
    }
    
}

// MARK: - UISearchBarDelegate

extension CoinListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchCoinAPI()
    }
}

// MARK: - AlertProtocol

extension CoinListViewController: AlertProtocol {}
