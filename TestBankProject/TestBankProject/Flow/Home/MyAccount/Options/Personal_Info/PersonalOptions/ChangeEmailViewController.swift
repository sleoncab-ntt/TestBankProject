//
//  ChangeEmailViewController.swift
//  TestBankProject
//

import UIKit

final class ChangeEmailViewController: UIViewController {
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your new e-mail so we can validate it."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.borderStyle = .bezel
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let btnSaveInfo: UIButton = {
        let button = UIButton()
        button.setTitle("Save Changes", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.masksToBounds = true
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
        // Action for Sign Up Button
        btnSaveInfo.addTarget(self, action: #selector(btnSaveInfoTapped), for: .touchUpInside)
    }
    
    private func setupTitle() {
        let backLabel = UILabel()
        backLabel.text = "My Personal Information"
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
        view.addSubview(emailLabel)
        view.addSubview(emailField)
        view.addSubview(btnSaveInfo)
        // Create constraints
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnSaveInfo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            btnSaveInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            btnSaveInfo.widthAnchor.constraint(equalToConstant: 320),
            btnSaveInfo.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func btnSaveInfoTapped() {
        guard let email = emailField.text, !email.isEmpty else {
            print("Error al guardar los datos")
            return
        }
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailPredicate.evaluate(with: email) {
            print("Datos guardados satisfactoriamente")
            print("E-mail: \(email)")
            navigationController?.popViewController(animated: true)
        } else {
            print("Email inválido")
        }
    }
}

