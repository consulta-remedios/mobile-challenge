//
//  OrderItemTests.swift
//  DomainTests
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import XCTest

@testable import Domain

class OrderItemTests: XCTestCase {
    
    private var game: Game {
        return Game(
            name: "Zelda Breath Of The Wild",
            platform: "Switch",
            description: "Melhor Zelda já feito",
            price: Price(value: 250),
            score: Score(value: 100),
            imageURL: URL(string: "https://sm.ign.com/ign_br/video/t/the-legend/the-legend-of-zelda-breath-of-the-wild-15-minutos-de-gamepla_w2ua.jpg")!)
    }
    
    func testeValorTotalDoItemDeveSerQuantidadeVezesSeuValor() {
        let orderItem = OrderItem(game: game, quantitiy: 10)
        XCTAssertEqual(orderItem.total, 2500)
    }

}
