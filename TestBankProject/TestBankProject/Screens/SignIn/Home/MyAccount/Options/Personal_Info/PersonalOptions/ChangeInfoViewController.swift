//
//  ChangeInfoViewController.swift
//  TestBankProject
//

import UIKit

final class ChangeInfoViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your full name"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your birthday"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let birthdayPicker: UIDatePicker = {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.maximumDate = Date()
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            return datePicker
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
        backLabel.text = "E-mail"
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
        view.addSubview(nameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(fullNameField)
        view.addSubview(birthdayPicker)
        view.addSubview(btnSaveInfo)
        // Create constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fullNameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            fullNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fullNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            birthdayLabel.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: 20),
            birthdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            birthdayPicker.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 20),
            birthdayPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            birthdayPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnSaveInfo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            btnSaveInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            btnSaveInfo.widthAnchor.constraint(equalToConstant: 320),
            btnSaveInfo.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func btnSaveInfoTapped() {
        guard let fullName = fullNameField.text, !fullName.isEmpty else {
            print("Error al guardar los datos")
            return
        }
        let selectedDate = birthdayPicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let formattedDate = dateFormatter.string(from: selectedDate)
        print("Datos guardados satisfactoriamente")
        print("Nombre completo: \(fullName)")
        print("Fecha de nacimiento: \(formattedDate)")
        navigationController?.popViewController(animated: true)
    }
}

