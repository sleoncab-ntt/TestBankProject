//
//  CardsListResponse.swift
//  Networking
//

import Foundation

public struct CardsListResponse: Decodable {
    public let users: [CardsUsers]
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}

public struct CardsUsers: Decodable {
    public let id: Int
    public let cardList: [CardsList]
    
    enum CodingKeys: String, CodingKey {
        case id
        case cardList
    }
}

public struct CardsList: Decodable {
    public let cardName: String
    public let balance: Double
    
    enum CodingKeys: String, CodingKey {
        case cardName
        case balance
    }
}
