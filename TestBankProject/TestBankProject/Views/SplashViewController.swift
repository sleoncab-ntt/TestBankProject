//
//  SplashViewController.swift
//  MultiView
//
//  Created by Sebastian Leon Cabanillas on 16/11/24.
//

import UIKit

final class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Background Color
        view.backgroundColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.toSignInVC()
        }
    }
    
    private func toSignInVC(){
        let navigationController = UINavigationController(rootViewController: SignInViewController())
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navigationController
        }
    }
}
