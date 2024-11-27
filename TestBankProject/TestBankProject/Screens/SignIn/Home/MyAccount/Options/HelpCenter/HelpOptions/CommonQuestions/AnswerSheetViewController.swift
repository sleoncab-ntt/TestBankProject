//
//  AnswerSheetViewController.swift
//  TestBankProject
//

import UIKit

final class AnswerSheetViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let question: CommonQuestion
    
    init(question: CommonQuestion) {
        self.question = question
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) no ha sido implementado.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        // Set labels text
        titleLabel.text = question.question
        answerLabel.text = question.answer
        // Set Background Color
        view.backgroundColor = .white
        // Add components to the view
        view.addSubview(titleLabel)
        view.addSubview(answerLabel)
        // Create constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            answerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            answerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18)
        ])
    }
}
