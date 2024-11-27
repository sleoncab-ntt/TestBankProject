//
//  PersonalInfoViewController.swift
//  TestBankProject
//

import UIKit

final class PersonalInfoViewController: UIViewController {
    
    private let btnPersonalData: CustomEditButton = {
        let button = CustomEditButton()
        button.configure(title: "My personal information", subtitle: "Full Name and Birthday")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let btnEmail: CustomEditButton = {
        let button = CustomEditButton()
        button.configure(title: "E-mail", subtitle: SessionManager.shared.email!)
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
        // Action for Button Personal Data
        btnPersonalData.addTarget(self, action: #selector(btnPersonalDataTapped), for: .touchUpInside)
        // Action for Button Email
        btnEmail.addTarget(self, action: #selector(btnEmailTapped), for: .touchUpInside)
    }
    
    private func setupTitle() {
        let backLabel = UILabel()
        backLabel.text = "Personal Information"
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
        view.addSubview(btnPersonalData)
        view.addSubview(btnEmail)
        // Create constraints
        NSLayoutConstraint.activate([
            btnPersonalData.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            btnPersonalData.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnPersonalData.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnPersonalData.heightAnchor.constraint(equalToConstant: 60),
            btnEmail.topAnchor.constraint(equalTo: btnPersonalData.bottomAnchor, constant: 20),
            btnEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnEmail.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func btnPersonalDataTapped() {
        navigationController?.pushViewController(ChangeInfoViewController(), animated: true)
    }
    
    @objc private func btnEmailTapped() {
        navigationController?.pushViewController(ChangeEmailViewController(), animated: true)
    }
}

