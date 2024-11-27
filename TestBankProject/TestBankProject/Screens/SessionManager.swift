//
//  SessionManager.swift
//  TestBankProject
//

import Foundation

class SessionManager {
    static var shared = SessionManager()
    
    var userId: Int?
    var name: String?
    var user: String?
    var email: String?
    var password: String?
    
    private init() { }
    
    func clearSession() {
        userId = nil
        name = nil
        user = nil
        email = nil
        password = nil
    }
}
