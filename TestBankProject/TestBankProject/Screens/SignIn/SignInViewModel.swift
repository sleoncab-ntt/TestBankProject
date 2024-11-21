//
//  SignInViewModel.swift
//  TestBankProject
//

import Foundation
import Networking

class SignInViewModel {
    
    private let networkingManager = NetworkingManager()
    
    struct UserCredentials {
        let id: Int
        let user: String
        let email: String
        let password: String
    }
    
    func fetchCredentials() async -> [UserCredentials] {
        let credentialsList: CredentialsListResponse? = await networkingManager.fetchData(url: "http://localhost:3000/Users/Credentials")

        if let credentials = credentialsList?.users {
            let userCredentialsArray = credentials.map { user in
                UserCredentials(id: user.id, user: user.user, email: user.email, password: user.password)
            }
            return userCredentialsArray
        } else {
            print("error al obtener las credenciales")
            return []
        }
    }
    
//    func fetchData() {
//        Task {
//            let usersList: UsersListResponse? = await networkingManager.fetchData(url: "http://localhost:3000/Users")
//            print(usersList ?? "error")
//        }
//    }
    
}
