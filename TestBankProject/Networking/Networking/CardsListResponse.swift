//
//  CardsListResponse.swift
//  Networking
//

import Foundation

public struct CardsListResponse: Decodable {
    public let users: [CardsUsers]
}

public struct CardsUsers: Decodable {
    public let id: Int
    public let cardList: [CardsList]
}

public struct CardsList: Decodable {
    public let cardName: String
    public let balance: Double
}
