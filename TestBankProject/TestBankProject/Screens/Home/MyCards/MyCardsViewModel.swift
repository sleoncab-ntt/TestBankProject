//
//  MyCardsViewModel.swift
//  TestBankProject
//

import Foundation
import Networking

public struct UserCards {
    public let id: Int
    public let cardList: [Card]
}

public struct Card {
    public let cardName: String
    public let balance: Double
}

class MyCardsViewModel {
    
    private let networkingManager = NetworkingManager()
    
    let URL = "http://localhost:3000/Users/Cards"
    
    func fetchCards() async -> [UserCards] {
        let cardsListResponse: CardsListResponse? = await networkingManager.fetchData(url: URL)
        
        if let users = cardsListResponse?.users {
            let userCardsArray = users.map { user in
                UserCards(id: user.id, cardList: user.cardList.map { card in
                    Card(cardName: card.cardName, balance: card.balance)
                })
            }
            return userCardsArray
        } else {
            print("error al obtener las tarjetas de los usuarios")
            return []
        }
    }
    
    func fetchCardsByID(for userId: Int) async -> [Card] {
        let cardsListResponse: CardsListResponse? = await networkingManager.fetchData(url: URL)
        
        if let users = cardsListResponse?.users {
            if let user = users.first(where: { $0.id == userId }) {
                let userCards = user.cardList.map { card in
                    Card(cardName: card.cardName, balance: card.balance)
                }
                return userCards
            }
            print("error al obtener las tarjetas de un usuario")
            return []
        } else {
            print("error al obtener las tarjetas de un usuario")
            return []
        }
    }
}
