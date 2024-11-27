//
//  MyCardsViewController.swift
//  TestBankProject
//

import UIKit

final class MyCardsViewController: UIViewController {
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .red
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let viewModel = MyCardsViewModel()
    
    private var cardList: [Card] = []
        
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .quaternarySystemFill
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Testbank"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Products"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lineTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setup()
    }
    
    private func setupTableView() {
        tableView.register(MyCardsCell.self, forCellReuseIdentifier: "MyCardsCell")
        tableView.delegate = self
        tableView.dataSource = self
        Task {
            cardList = await saveCardListOfUser()
            tableView.reloadData()
        }
    }
    
    private func setup() {
        // Set Background Color
        view.backgroundColor = .white
        // Add components to the view
        view.addSubview(loadingIndicator)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(underline)
        view.addSubview(lineTabBar)
        view.addSubview(tableView)
        // Create constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            underline.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            underline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            underline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            underline.heightAnchor.constraint(equalToConstant: 3),
            tableView.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            tableView.bottomAnchor.constraint(equalTo: lineTabBar.bottomAnchor, constant: -0.5),
            lineTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            lineTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            lineTabBar.heightAnchor.constraint(equalToConstant: 0.5),
            lineTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func saveCardListOfUser() async -> [Card] {
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.startAnimating()
            self?.loadingIndicator.isHidden = false
        }
        let cardList = await viewModel.fetchCardsByID(for: SessionManager.shared.userId!)
        DispatchQueue.main.async { [weak self] in
            self?.loadingIndicator.stopAnimating()
            self?.loadingIndicator.isHidden = true
        }
        return cardList
    }
    
    @objc func btnLogOutTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyCardsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCardsCell", for: indexPath) as! MyCardsCell
        let card = cardList[indexPath.row]
        cell.setupCard(with: card)
        return cell
    }
}
