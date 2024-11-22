//
//  MyAccountViewController.swift
//  TestBankProject
//

import UIKit

final class MyAccountViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Testbank"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = SessionManager.shared.userName
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "person.circle")
        imgView.tintColor = .red
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let btnLogout: UIButton = {
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
    
    let lineTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
        setup()
    }
    
    private func addActions() {
        // Action for Log Out Button
        btnLogout.addTarget(self, action: #selector(btnLogOutTapped), for: .touchUpInside)
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
            btnLogout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
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
