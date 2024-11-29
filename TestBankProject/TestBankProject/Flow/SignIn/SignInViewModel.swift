//
//  SignInViewModel.swift
//  TestBankProject
//

import Foundation
import Networking

struct UserCredentials {
    let id: Int
    let name: String
    let user: String
    let email: String
    let password: String
}

final class SignInViewModel {
    
    let networkingManager = NetworkingManager.shared
    
    final func fetchCredentials() async -> [UserCredentials] {
        let credentialsList: CredentialsListResponse? = await networkingManager.fetchData(url: "http://localhost:3000/Users/Credentials")

        if let credentials = credentialsList?.users {
            let userCredentialsArray = credentials.map { user in
                UserCredentials(id: user.id, name: user.name, user: user.user, email: user.email, password: user.password)
            }
            return userCredentialsArray
        } else {
            print("error al obtener las credenciales")
            return []
        }
    }
    
    final func authANDSaveCredentials(user: String, password: String) async -> Bool {
        let credentialsList = await fetchCredentials()
        
        if let user = credentialsList.first(where: { $0.user == user && $0.password == password }) {
            SessionManager.shared.userId = user.id
            SessionManager.shared.name = user.name
            SessionManager.shared.user = user.user
            SessionManager.shared.email = user.email
            SessionManager.shared.password = user.password
            return true
        }
        return false
    }
}
