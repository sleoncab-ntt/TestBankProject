//
//  CommonQuestionsViewController.swift
//  TestBankProject
//

import UIKit

struct CommonQuestion {
    let question: String
    let answer: String
}

final class CommonQuestionsViewController: UIViewController {
    
    private let commonQuestions: [CommonQuestion] = [
        CommonQuestion(question: "How can I change my e-mail?",
                       answer: "You can change your e-mail in Personal Information section in My Account."
                      ),
        CommonQuestion(question: "How can I change my Full name and Birthday?",
                       answer: "You can change your Full name and Birthday in My Account section."
                      )
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .quaternarySystemFill
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTableView()
        setup()
    }
    
    private func setupTitle() {
        let backLabel = UILabel()
        backLabel.text = "Common Questions"
        backLabel.textColor = .black
        backLabel.font = UIFont.boldSystemFont(ofSize: 20)
        backLabel.textAlignment = .center
        navigationItem.titleView = backLabel
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setup() {
        navigationController?.navigationBar.tintColor = .black
        // Set Background Color
        view.backgroundColor = .white
        // Add components to the View
        view.addSubview(tableView)
        // Create constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func showBottomSheet(for question: CommonQuestion) {
        let bottomSheetVC = AnswerSheetViewController(question: question)
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [
                .custom { _ in 150 }
            ]
        }
        present(bottomSheetVC, animated: true)
    }
    
}

extension CommonQuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commonQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = commonQuestions[indexPath.row].question
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let question = commonQuestions[indexPath.row]
        showBottomSheet(for: question)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
