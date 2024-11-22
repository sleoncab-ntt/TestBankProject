//
//  UsersListResponse.swift
//  Networking
//

import Foundation

public struct UsersListResponse: Decodable {
    public let count: Int
    public let users: [Users]
    
    enum CodingKeys: String, CodingKey {
        case count
        case users
    }
}

public struct Users: Decodable {
    public let id: Int
    public let user: String
    public let email: String
    public let password: String
    public let cardList: [Cards]
    
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case email
        case password
        case cardList
    }
}

public struct Cards: Decodable {
    public let cardName: String
    public let balance: Double
    
    enum CodingKeys: String, CodingKey {
        case cardName
        case balance
    }
}
