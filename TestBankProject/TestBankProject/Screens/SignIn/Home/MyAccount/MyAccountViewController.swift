//
//  MyAccountViewController.swift
//  TestBankProject
//

import UIKit

final class MyAccountViewController: UIViewController {
    
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
        label.text = SessionManager.shared.name
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "person.circle")
        imgView.tintColor = .red
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let btnLogout: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let lineTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let options: [(icon: String, title: String)] = [
        ("person.circle", "Personal Information"),
        ("gearshape", "Settings"),
        ("questionmark.circle", "Help Center")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
        setupTableView()
        setup()
    }
    
    private func addActions() {
        // Action for Log Out Button
        btnLogout.addTarget(self, action: #selector(btnLogOutTapped), for: .touchUpInside)
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setup() {
        // Set Background Color
        view.backgroundColor = .white
        // Add components to the view
        view.addSubview(titleLabel)
        view.addSubview(userIcon)
        view.addSubview(subtitleLabel)
        view.addSubview(btnLogout)
        view.addSubview(lineTabBar)
        view.addSubview(tableView)
        // Create constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            userIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userIcon.widthAnchor.constraint(equalToConstant: 50),
            userIcon.heightAnchor.constraint(equalToConstant: 50),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 10),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 50),
            tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            tableView.bottomAnchor.constraint(equalTo: btnLogout.topAnchor, constant: -25),
            btnLogout.bottomAnchor.constraint(equalTo: lineTabBar.topAnchor, constant: -25),
            btnLogout.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            btnLogout.widthAnchor.constraint(equalToConstant: 320),
            btnLogout.heightAnchor.constraint(equalToConstant: 60),
            lineTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            lineTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            lineTabBar.heightAnchor.constraint(equalToConstant: 0.5),
            lineTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    @objc func btnLogOutTapped() {
        let splashViewController = SplashViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first {
            keyWindow.rootViewController = splashViewController
            keyWindow.makeKeyAndVisible()
            print("Sesión cerrada")
        }
    }
}

extension MyAccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let option = options[indexPath.row]
        
        cell.textLabel?.text = option.title
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.imageView?.image = UIImage(systemName: option.icon)
        cell.imageView?.tintColor = .black
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedOption = options[indexPath.row].title
        
        let nextViewController: UIViewController
        switch selectedOption {
        case "Personal Information":
            nextViewController = PersonalInfoViewController()
        case "Settings":
            nextViewController = SettingsViewController()
        case "Help Center":
            nextViewController = HelpCenterViewController()
        default:
            return
        }
        
        nextViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
