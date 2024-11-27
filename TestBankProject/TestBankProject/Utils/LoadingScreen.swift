//
//  LoadingScreen.swift
//  TestBankProject
//

import UIKit

final class LoadingScreen {
    
    static let shared = LoadingScreen()
    
    private var spinnerView: UIView?
    
    private init() {}
    
    func show(in viewController: UIViewController) {
        guard spinnerView == nil else { return }
        
        let spinnerView = UIView(frame: viewController.view.bounds)
        spinnerView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        spinnerView.addSubview(activityIndicator)
        viewController.view.addSubview(spinnerView)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor)
        ])
        
        self.spinnerView = spinnerView
    }
    
    func hide() {
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
}
