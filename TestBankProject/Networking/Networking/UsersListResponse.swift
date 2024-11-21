//
//  UsersListResponse.swift
//  Networking
//

import Foundation

public struct UsersListResponse: Decodable {
    public let count: Int
    public let users: [Users]
}

public struct Users: Decodable {
    public let id: Int
    public let user: String
    public let email: String
    public let password: String
    public let cardList: [Cards]
}

public struct Cards: Decodable {
    public let cardName: String
    public let balance: Double
}
