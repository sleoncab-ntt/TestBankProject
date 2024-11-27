//
//  CustomEditButton.swift
//  TestBankProject
//

import UIKit

final class CustomEditButton: UIButton {

    private let principalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let editLabel: UILabel = {
        let label = UILabel()
        label.text = "Editar"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .right
        let attributedText = NSMutableAttributedString(string: "Editar")
        attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Add subviews
        addSubview(principalLabel)
        addSubview(secondLabel)
        addSubview(editLabel)
        // Add constraints
        NSLayoutConstraint.activate([
            principalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            principalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            principalLabel.trailingAnchor.constraint(lessThanOrEqualTo: editLabel.leadingAnchor, constant: -10),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            secondLabel.topAnchor.constraint(equalTo: principalLabel.bottomAnchor, constant: 2),
            secondLabel.trailingAnchor.constraint(lessThanOrEqualTo: editLabel.leadingAnchor, constant: -10),
            secondLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            editLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            editLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(title: String, subtitle: String) {
        principalLabel.text = title
        secondLabel.text = subtitle
    }
}
