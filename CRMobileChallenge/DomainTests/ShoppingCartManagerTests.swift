//
//  ShoppingCartManagerTests.swift
//  DomainTests
//
//  Created by Adriano Souza Costa on 21/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import XCTest

@testable import Domain

class ShoppingCartManagerTests: XCTestCase {

    private let shoppingCart = ShoppingCartManager()
    
    private lazy var game: Game = {
        return Game(
            id: 1,
            name: "Zelda Breath Of The Wild",
            platform: "Switch",
            description: "Melhor Zelda já feito",
            price: 250,
            score: 100,
            image: URL(string: "https://sm.ign.com/ign_br/video/t/the-legend/the-legend-of-zelda-breath-of-the-wild-15-minutos-de-gamepla_w2ua.jpg")!)
    }()
    
    func testeAoAdicionarOMesmoGameManagerDeveAssociarOMesmoAUmaOrdemDeSericoExistente() {
        shoppingCart.add(game: game)
        shoppingCart.add(game: game)
        
        XCTAssertEqual(shoppingCart.order.count, 2)
        XCTAssertEqual(shoppingCart.orderItems.count, 1)
    }
    
    func testeMudarQuantidadeDeGamesDeUmOrdemNaoDeveGerarNovaOrdem() {
        shoppingCart.add(game: game)
        
        shoppingCart.change(quantity: 10, from: game)
        
        XCTAssertEqual(shoppingCart.order.count, 10)
        XCTAssertEqual(shoppingCart.orderItems.count, 1)
    }
    
    func testeRemoverUmGameDeveLimparSuaOrdemDeServico() {
        shoppingCart.add(game: game)
        
        shoppingCart.remove(game: game)
        
        XCTAssertEqual(shoppingCart.order.count, 0)
        XCTAssertEqual(shoppingCart.orderItems.count, 0)
    }
    
    func testeClearDeveRemoverTodosOsItemsDoPedido() {
        shoppingCart.add(game: game)
        shoppingCart.add(game: game)
        
        shoppingCart.clear()
        
        XCTAssertEqual(shoppingCart.order.count, 0)
        XCTAssertEqual(shoppingCart.orderItems.count, 0)
    }

}
