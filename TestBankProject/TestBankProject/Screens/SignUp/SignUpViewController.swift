//
//  SignUpViewController.swift
//  TestBankProject
//

import UIKit

final class SignUpViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userRegField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User"
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailRegField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordRegField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Create Password"
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let btnSignUp: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .blue
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let underlineUserReg: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let underlineEmailReg: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let underlinePsswdReg: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
        setup()
    }
    
    private func addActions() {
        // Action for Sign Up Button
        btnSignUp.addTarget(self, action: #selector(btnSignUnTapped), for: .touchUpInside)
        // Action for Sign In Label
        signInLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(btnSignInTapped)))
    }
    
    private func setup() {
        // Set Background Color
        view.backgroundColor = .white
        // Add object to the HomeView
        view.addSubview(titleLabel)
        view.addSubview(signInLabel)
        view.addSubview(userRegField)
        view.addSubview(passwordRegField)
        view.addSubview(btnSignUp)
        view.addSubview(emailRegField)
        view.addSubview(underlineUserReg)
        view.addSubview(underlineEmailReg)
        view.addSubview(underlinePsswdReg)
        // Create constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            userRegField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            userRegField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            userRegField.widthAnchor.constraint(equalToConstant: 320),
            underlineUserReg.topAnchor.constraint(equalTo: userRegField.bottomAnchor, constant: 5),
            underlineUserReg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            underlineUserReg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            underlineUserReg.heightAnchor.constraint(equalToConstant: 0.5),
            emailRegField.topAnchor.constraint(equalTo: userRegField.bottomAnchor, constant: 40),
            emailRegField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            emailRegField.widthAnchor.constraint(equalToConstant: 320),
            underlineEmailReg.topAnchor.constraint(equalTo: emailRegField.bottomAnchor, constant: 5),
            underlineEmailReg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            underlineEmailReg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            underlineEmailReg.heightAnchor.constraint(equalToConstant: 0.5),
            passwordRegField.topAnchor.constraint(equalTo: emailRegField.bottomAnchor, constant: 40),
            passwordRegField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            passwordRegField.widthAnchor.constraint(equalToConstant: 320),
            underlinePsswdReg.topAnchor.constraint(equalTo: passwordRegField.bottomAnchor, constant: 5),
            underlinePsswdReg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            underlinePsswdReg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            underlinePsswdReg.heightAnchor.constraint(equalToConstant: 0.5),
            btnSignUp.topAnchor.constraint(equalTo: passwordRegField.bottomAnchor, constant: 40),
            btnSignUp.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            btnSignUp.widthAnchor.constraint(equalToConstant: 320),
            btnSignUp.heightAnchor.constraint(equalToConstant: 60),
            signInLabel.topAnchor.constraint(equalTo: btnSignUp.bottomAnchor, constant: 20),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            signInLabel.widthAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    @objc func btnSignUnTapped() {
        if (userRegField.text == "" || emailRegField.text == "" || passwordRegField.text == ""){
            print("Error al registrar usuario")
        } else {
            navigationController?.popViewController(animated: true)
            print("Usuario creado con éxito")
        }
    }
    
    @objc func btnSignInTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
