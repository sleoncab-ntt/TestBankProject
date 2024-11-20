//
//  SignInViewModel.swift
//  TestBankProject
//

import Foundation
import Networking

class SignInViewModel {
    
    private let networkingManager = NetworkingManager()
    
    func fechData() {
        Task {
            let usersList: UsersListResponse? = await networkingManager.fetchData(url: "http://localhost:3000/users")
            print(usersList ?? "error")
        }
    }
    
}
