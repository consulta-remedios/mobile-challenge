//
//  OrderTests.swift
//  DomainTests
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import XCTest

@testable import Domain

class OrderTests: XCTestCase {

    private var address: Address {
        return Address(
            postalCode: "36025-590",
            street: "Imaculda Conceição",
            number: 110,
            neighborhood: "Dom Bosco",
            city: "Juiz de Fora",
            state: "Minas Gerais")
    }
    
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
    
    func testeCadaItemDeveAdicionar10ReaisNoValorDoFrete() {
        var order = Order(orderItems: [OrderItem(game: game)], address: address, paymentType: .paymentSlip)
        
        XCTAssertEqual(order.freight, 10)
        
        let orderItems = (1...10).map { _ in
            return OrderItem(game: game)
        }
        
        order.orderItems.append(contentsOf: orderItems)
        
        XCTAssertEqual(order.freight, 110)
    }
    
    func testeFreteAcimaDe250DeveSerGratis() {
        let orderItems = (1...100).map { _ in
            return OrderItem(game: game)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .paymentSlip)
        
        XCTAssertEqual(order.freight, 0)
    }
    
    func testeFreteAbaixoDe250NaoDeveSerGratis() {
        let orderItems = (1...5).map { _ in
            return OrderItem(game: game)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .paymentSlip)
        
        XCTAssertNotEqual(order.freight, 0)
    }
    
    func testeFreteIgualA250NaoDeveSerGratis() {
        let orderItems = (1...25).map { _ in
            return OrderItem(game: game)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .paymentSlip)
        
        XCTAssertNotEqual(order.freight, 0.0)
    }
    
    func testeValorTotalDoPedidoDeveSerQuantidadeDeItemsPedidoVezesSeuValorTotalMaisFrete() {
        let orderItems = (0...2).map { _ in
            return OrderItem(game: game, quantity: 1)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .paymentSlip)
        
        XCTAssertEqual(order.total, 780)
    }

}
