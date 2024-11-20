//
//  UsersListResponse.swift
//  Networking
//

import Foundation

public struct UsersListResponse: Decodable {
    let count: Int
    let users: [Users]
}

struct Users: Decodable {
    let id: Int
    let user: String
    let email: String
    let password: String
    let cardList: [Cards]
}

struct Cards: Decodable {
    let cardName: String
    let balance: Double
}
