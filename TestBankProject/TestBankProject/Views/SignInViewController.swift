//
//  ViewController.swift
//  MultiView
//
//  Created by Sebastian Leon Cabanillas on 12/11/24.
//

import UIKit

final class SignInViewController: UIViewController {

    var isChecked = false
    
    let trustLabel: UILabel = {
        let label = UILabel()
        label.text = "Trust this device"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let underlinePsswd: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let underlineUser: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.tintColor = .red
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.textColor = .blue
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btnSignIn: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let userField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User"
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
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
        addActions()
        setup()
    }
    
    private func addActions() {
        // Action for Sign In Button
        btnSignIn.addTarget(self, action: #selector(btnSignInTapped), for: .touchUpInside)
        // Action for Register Label
        registerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(btnRegisterTapped)))
        // Action for Trust Label
        trustLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkBoxTapped)))
        // Action for Check Box Button
        checkBoxButton.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
    }
    
    private func setup() {
        // Set Background Color
        view.backgroundColor = .white
        // Add components to the view
        view.addSubview(titleLabel)
        view.addSubview(btnSignIn)
        view.addSubview(userField)
        view.addSubview(passwordField)
        view.addSubview(registerLabel)
        view.addSubview(userIcon)
        view.addSubview(underlineUser)
        view.addSubview(underlinePsswd)
        view.addSubview(subtitleLabel)
        view.addSubview(checkBoxButton)
        view.addSubview(trustLabel)
        // Create constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            userIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            userIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userIcon.widthAnchor.constraint(equalToConstant: 80),
            userIcon.heightAnchor.constraint(equalToConstant: 80),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            subtitleLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            userField.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 40),
            userField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            underlineUser.topAnchor.constraint(equalTo: userField.bottomAnchor, constant: 5),
            underlineUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            underlineUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            underlineUser.heightAnchor.constraint(equalToConstant: 0.5),
            
            passwordField.topAnchor.constraint(equalTo: userField.bottomAnchor, constant: 30),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            underlinePsswd.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5),
            underlinePsswd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            underlinePsswd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            underlinePsswd.heightAnchor.constraint(equalToConstant: 0.5),
            
            registerLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            registerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            registerLabel.widthAnchor.constraint(equalToConstant: 200),
            
            checkBoxButton.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            checkBoxButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 50),
            
            trustLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            trustLabel.leadingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor, constant: 30),
            trustLabel.heightAnchor.constraint(equalToConstant: 50),
            
            btnSignIn.topAnchor.constraint(equalTo: checkBoxButton.bottomAnchor, constant: 30),
            btnSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            btnSignIn.widthAnchor.constraint(equalToConstant: 330),
            btnSignIn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func btnSignInTapped() {
        if (userField.text == "Admin" && passwordField.text == "123" && isChecked){
            navigationController?.pushViewController(MyAccountViewController(), animated: true)
            print("Sesión iniciada")
        } else {
            print("Error al iniciar sesión")
        }
    }
    
    @objc private func btnRegisterTapped() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    @objc private func checkBoxTapped() {
        isChecked.toggle()
        checkBoxButton.isSelected = isChecked
    }
    
}
