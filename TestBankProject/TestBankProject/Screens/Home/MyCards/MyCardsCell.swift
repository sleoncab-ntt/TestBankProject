//
//  MyCardsCell.swift
//  TestBankProject
//

import Foundation
import UIKit

class MyCardsCell: UITableViewCell {

    let cardNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        // Add background color
        contentView.backgroundColor = .white
        // Add components to the view
        contentView.addSubview(cardNameLabel)
        contentView.addSubview(balanceLabel)
        // Add constraints
        NSLayoutConstraint.activate([
            cardNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cardNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            cardNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            balanceLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10),
            balanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            balanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
    }

    func configure(with card: Card) {
        cardNameLabel.text = card.cardName
        if card.cardName == "Cuenta Soles SBP" {
            balanceLabel.text = String(format: "S/ %.2f", card.balance)
        } else {
            balanceLabel.text = String(format: "US$ %.2f", card.balance)
        }
    }
}
