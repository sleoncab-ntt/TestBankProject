//
//  MyCardsViewModel.swift
//  TestBankProject
//

import Foundation
import Networking

public struct UserCards {
    let id: Int
    let cardList: [Card]
}

public struct Card {
    let cardName: String
    let balance: Double
}

final class MyCardsViewModel {
    
    let networkingManager = NetworkingManager.shared

    let URL = "http://localhost:3000/Users/Cards"
    
    public func fetchCards() async -> [UserCards] {
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
    
    public func fetchCardsByID(for userId: Int) async -> [Card] {
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
