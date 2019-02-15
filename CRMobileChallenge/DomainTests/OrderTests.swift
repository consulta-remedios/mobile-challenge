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
            city: "Juiz de Fora",
            state: "Minas Gerais")
    }
    
    private var game: Game {
        return Game(
            name: "Zelda Breath Of The Wild",
            platform: "Switch",
            description: "Melhor Zelda já feito",
            price: Price(value: 250),
            score: Score(value: 100),
            imageURL: URL(string: "https://sm.ign.com/ign_br/video/t/the-legend/the-legend-of-zelda-breath-of-the-wild-15-minutos-de-gamepla_w2ua.jpg")!)
    }
    
    func testeCadaItemDeveAdicionar10ReaisNoValorDoFrete() {
        var order = Order(orderItems: [OrderItem(game: game, quantitiy: 1)], address: address, paymentType: .bankSlip)
        
        XCTAssertEqual(order.freight, 10)
        
        let orderItems = (1...10).map { _ in
            return OrderItem(game: game, quantitiy: 1)
        }
        
        order.orderItems.append(contentsOf: orderItems)
        
        XCTAssertEqual(order.freight, 110)
    }
    
    func testeFreteAcimaDe250DeveSerGratis() {
        let orderItems = (1...100).map { _ in
            return OrderItem(game: game, quantitiy: 1)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .bankSlip)
        
        XCTAssertEqual(order.freight, 0)
    }
    
    func testeFreteAbaixoDe250NaoDeveSerGratis() {
        let orderItems = (1...5).map { _ in
            return OrderItem(game: game, quantitiy: 1)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .bankSlip)
        
        XCTAssertNotEqual(order.freight, 0)
    }
    
    func testeFreteIgualA250NaoDeveSerGratis() {
        let orderItems = (1...25).map { _ in
            return OrderItem(game: game, quantitiy: 1)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .bankSlip)
        
        XCTAssertNotEqual(order.freight, 0)
    }
    
    func testeValorTotalDoPedidoDeveSerQuantidadeDeItemsPedidoVezesSeuValorTotalMaisFrete() {
        let orderItems = (0...2).map { _ in
            return OrderItem(game: game, quantitiy: 1)
        }
        
        let order = Order(orderItems: orderItems, address: address, paymentType: .bankSlip)
        
        XCTAssertEqual(order.total, 780)
    }

}
