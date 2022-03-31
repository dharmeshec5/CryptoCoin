//
//  CoinListCollectionViewCelll.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import UIKit

final class CoinTableViewCell: UITableViewCell {
    
    // MARK: - UI element
    
    var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 2
        nameLabel.textColor = Color.blackColor
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return nameLabel
    }()
    
    var changeIn24HrLabel : UILabel = {
        let changeIn24HrLabel = UILabel()
        changeIn24HrLabel.translatesAutoresizingMaskIntoConstraints = false
        changeIn24HrLabel.font = UIFont.systemFont(ofSize: 15)
        return changeIn24HrLabel
    }()
    
    var priceLabel : UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        priceLabel.textAlignment = .right
        return priceLabel
    }()
    
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.axis = .horizontal
        return stackView
    }()
    
    // MARK: - TableViewCelll cell life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {return nil}
    
    // MARK: - Functions
    
    func setupViews() {
        accessibilityIdentifier = CoinTableViewCell.identifier
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(changeIn24HrLabel)
        stackView.addArrangedSubview(priceLabel)
        
        let defaultSpace: CGFloat = 12
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -defaultSpace),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: defaultSpace),
            topAnchor.constraint(equalTo: stackView.topAnchor, constant: -defaultSpace),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: defaultSpace),
            changeIn24HrLabel.widthAnchor.constraint(equalToConstant: 80),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
            
    }
    
    func loadCell(_ coin: CoinModel) {
        nameLabel.text = coin.name
        changeIn24HrLabel.text = coin.formattedChangeIn24Hr
        priceLabel.text = coin.formattedPrice
        changeIn24HrLabel.textColor = coin.change24HrInDouble < 0 ? Color.redColor : Color.greenColor
        priceLabel.textColor = changeIn24HrLabel.textColor
    }
}
