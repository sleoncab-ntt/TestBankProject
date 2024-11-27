//
//  SettingsViewController.swift
//  TestBankProject
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private let btnDeleteAccount: CustomArrowButton = {
        let button = CustomArrowButton()
        button.configure(title: "Delete Account", subtitle: "Deletes your bank account")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
        setupTitle()
        setup()
    }
    
    private func addActions() {
        // Action for Button Delete Account
        btnDeleteAccount.addTarget(self, action: #selector(btnDeleteAccountTapped), for: .touchUpInside)
    }
    
    private func setupTitle() {
        let backLabel = UILabel()
        backLabel.text = "Settings"
        backLabel.textColor = .black
        backLabel.font = UIFont.boldSystemFont(ofSize: 20)
        backLabel.textAlignment = .center
        navigationItem.titleView = backLabel
    }
    
    private func setup() {
        navigationController?.navigationBar.tintColor = .black
        // Set Background Color
        view.backgroundColor = .white
        // Add object to the View
        view.addSubview(btnDeleteAccount)
        // Create constraints
        NSLayoutConstraint.activate([
            btnDeleteAccount.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            btnDeleteAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnDeleteAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnDeleteAccount.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func btnDeleteAccountTapped() {
        let alertController = UIAlertController(
            title: "Delete Account",
            message: "This action will permanently delete your bank account. Are you sure?",
            preferredStyle: .alert
        )
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let sureAction = UIAlertAction(title: "Sure", style: .destructive) { _ in
            print("Account deleted")
            let splashViewController = SplashViewController()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let keyWindow = windowScene.windows.first {
                keyWindow.rootViewController = splashViewController
                keyWindow.makeKeyAndVisible()
            }
        }
        alertController.addAction(noAction)
        alertController.addAction(sureAction)
        present(alertController, animated: true, completion: nil)
    }
}

