//
//  SessionManager.swift
//  TestBankProject
//

import Foundation

class SessionManager {
    static var shared = SessionManager()
    
    var userId: Int?
    var userName: String?
    var email: String?
    var password: String?
    
    private init() { }
    
    func clearSession() {
        userId = nil
        userName = nil
        email = nil
        password = nil
    }
}
