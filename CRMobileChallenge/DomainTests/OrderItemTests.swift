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
            id: 1,
            name: "Zelda Breath Of The Wild",
            platform: "Switch",
            description: "Melhor Zelda já feito",
            price: 250,
            score: 100,
            image: URL(string: "https://sm.ign.com/ign_br/video/t/the-legend/the-legend-of-zelda-breath-of-the-wild-15-minutos-de-gamepla_w2ua.jpg")!)
    }
    
    func testeValorTotalDoItemDeveSerQuantidadeVezesSeuValor() {
        let orderItem = OrderItem(game: game, quantitiy: 10)
        XCTAssertEqual(orderItem.total, 2500)
    }
    
    func testeQuantidadeNegativasNaoPodeGerarValorNegativoESimZero() {
        let orderItem = OrderItem(game: game, quantitiy: -10)
        XCTAssertEqual(orderItem.total, 0)
    }

}
