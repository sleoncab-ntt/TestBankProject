//
//  SplashviewController.swift
//  TestBankProject
//

import UIKit

final class SplashViewController: UIViewController {
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .red
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Testbank"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.startAnimating()
            self?.loadingIndicator.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.loadingIndicator.isHidden = true
            self?.toSignInVC()
        }
    }
    
    private func setup() {
        // Set Background Color
        view.backgroundColor = .white
        // Add components to the view
        view.addSubview(titleLabel)
        view.addSubview(loadingIndicator)
        // Create Constraints
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func toSignInVC(){
        let navigationController = UINavigationController(rootViewController: SignInViewController())
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navigationController
        }
    }
}
