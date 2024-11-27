//
//  CustomArrowButton.swift
//  TestBankProject
//

import UIKit

final class CustomArrowButton: UIButton {

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

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        // Add components to the view
        addSubview(principalLabel)
        addSubview(secondLabel)
        addSubview(arrowImageView)
        // Create Constraints
        NSLayoutConstraint.activate([
            principalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            principalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            principalLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImageView.leadingAnchor, constant: -10),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            secondLabel.topAnchor.constraint(equalTo: principalLabel.bottomAnchor, constant: 2),
            secondLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImageView.leadingAnchor, constant: -10),
            secondLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(title: String, subtitle: String) {
        principalLabel.text = title
        secondLabel.text = subtitle
    }
}

