//
//  CredentialsListResponse.swift
//  Networking
//

import Foundation

public struct CredentialsListResponse: Decodable {
    public let users: [CredentialUsers]
}

public struct CredentialUsers: Decodable {
    public let id: Int
    public let user: String
    public let email: String
    public let password: String
}
