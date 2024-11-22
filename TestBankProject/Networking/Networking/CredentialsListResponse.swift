//
//  CredentialsListResponse.swift
//  Networking
//

import Foundation

public struct CredentialsListResponse: Decodable {
    public let users: [CredentialUsers]
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}

public struct CredentialUsers: Decodable {
    public let id: Int
    public let user: String
    public let email: String
    public let password: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case email
        case password
    }
}
