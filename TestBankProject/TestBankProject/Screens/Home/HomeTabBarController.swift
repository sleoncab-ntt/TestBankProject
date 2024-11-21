//
//  HomeTabBarController.swift
//  TestBankProject
//

import UIKit

final class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myCardsViewController = MyCardsViewController()
        myCardsViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        let myAccountViewController = MyAccountViewController()
        myAccountViewController.tabBarItem = UITabBarItem(title: "My Account", image: UIImage(systemName: "person.fill"), tag: 1)

        viewControllers = [UINavigationController(rootViewController: myCardsViewController),
                           UINavigationController(rootViewController: myAccountViewController)]
        
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .gray
    }
}
