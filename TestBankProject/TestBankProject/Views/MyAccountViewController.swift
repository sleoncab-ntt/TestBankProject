
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
        label.text = "My Account"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
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
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        // Add object to HomeView
        view.addSubview(titleLabel)
        view.addSubview(userIcon)
        view.addSubview(subtitleLabel)
        view.addSubview(btnLogout)
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
            subtitleLabel.leadingAnchor.constraint(equalTo: userIcon.leadingAnchor, constant: 55),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 50),
            btnLogout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            btnLogout.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            btnLogout.widthAnchor.constraint(equalToConstant: 320),
            btnLogout.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func btnLogOutTapped() {
        navigationController?.popViewController(animated: true)
    }
}
