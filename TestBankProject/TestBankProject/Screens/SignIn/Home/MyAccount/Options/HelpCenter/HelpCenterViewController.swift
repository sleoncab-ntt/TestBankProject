//
//  HelpCenterViewController.swift
//  TestBankProject
//

import UIKit

final class HelpCenterViewController: UIViewController {
    
    private let btnQuestions: CustomArrowButton = {
        let button = CustomArrowButton()
        button.configure(title: "Common Questions", subtitle: "About the functionalities about the app")
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
        // Action for Button Common Questions
        btnQuestions.addTarget(self, action: #selector(btnQuestionsTapped), for: .touchUpInside)
    }
    
    private func setupTitle() {
        let backLabel = UILabel()
        backLabel.text = "Help Center"
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
        view.addSubview(btnQuestions)
        // Create constraints
        NSLayoutConstraint.activate([
            btnQuestions.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            btnQuestions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnQuestions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnQuestions.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func btnQuestionsTapped() {
        navigationController?.pushViewController(CommonQuestionsViewController(), animated: true)
    }
    
}

