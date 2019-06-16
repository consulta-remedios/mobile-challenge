//
//  GamesStoreTests.swift
//  GamesStoreTests
//
//  Created by Marcio Habigzang Brufatto on 11/06/19.
//  Copyright © 2019 Marcio Habigzang Brufatto. All rights reserved.
//

import XCTest
import RealmSwift
@testable import GamesStore


class GamesStoreTests: XCTestCase {

    override func setUp() {
        let testRealm = try! Realm()
        try! testRealm.write {
            testRealm.deleteAll()
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddGameInCart() {
        let game = Game()
        game.id = 1
        game.name = "F1"
        game.gameDescription = "Jogo de corrida"
        game.price = 10
        game.score = 20
        game.platform = "PS4"
        game.image = "f1.png"
        
        let cart = Cart()
        cart.addGameInCart(game: game)
        
        let gameInCart = cart.searchGame(gameId: game.id)
        
        XCTAssertEqual(gameInCart.count, 1)
    }
    
    func testAddGamesInCartSomeId() {
        let cart = Cart()
        let game = Game()
        game.id = 1
        game.name = "F1"
        game.gameDescription = "Jogo de corrida"
        game.price = 10.0
        game.score = 20
        game.platform = "PS4"
        game.image = "f1.png"
        cart.addGameInCart(game: game)
        cart.addGameInCart(game: game)
        
        let gameInCart = cart.searchGame(gameId: game.id)
        
        XCTAssertEqual(gameInCart[0].count, 2)
    }
    
    func testShippingBuy() {
        let cart = Cart()
        let game1 = Game()
        game1.id = 1
        game1.name = "F1"
        game1.gameDescription = "Jogo de corrida"
        game1.price = 10.0
        game1.score = 20
        game1.platform = "PS4"
        game1.image = "f1.png"
        cart.addGameInCart(game: game1)
        
        let game2 = Game()
        game2.id = 2
        game2.name = "Mortal Kombat 4"
        game2.gameDescription = "Jogo de muita pancadaria"
        game2.price = 30.0
        game2.score = 24
        game2.platform = "PS4"
        game2.image = "mk4.png"
        cart.addGameInCart(game: game2)
        
        let shippingValue = cart.calculateShipping(total: (game1.price + game2.price))
        
        XCTAssertEqual(shippingValue, 20)
    }
    
    func testShippingFree() {
        let cart = Cart()
        let game1 = Game()
        game1.id = 1
        game1.name = "F1"
        game1.gameDescription = "Jogo de corrida"
        game1.price = 125.0
        game1.score = 20
        game1.platform = "PS4"
        game1.image = "f1.png"
        cart.addGameInCart(game: game1)
        
        let game2 = Game()
        game2.id = 2
        game2.name = "Mortal Kombat 4"
        game2.gameDescription = "Jogo de muita pancadaria"
        game2.price = 130.0
        game2.score = 24
        game2.platform = "PS4"
        game2.image = "mk4.png"
        cart.addGameInCart(game: game2)
        
        let shippingValue = cart.calculateShipping(total: (game1.price + game2.price))
        
        XCTAssertEqual(shippingValue, 0)
    }
    
    func testCalculateTotal() {
        let cart = Cart()
        let game1 = Game()
        game1.id = 1
        game1.name = "F1"
        game1.gameDescription = "Jogo de corrida"
        game1.price = 125.0
        game1.score = 20
        game1.platform = "PS4"
        game1.image = "f1.png"
        cart.addGameInCart(game: game1)
        
        let game2 = Game()
        game2.id = 2
        game2.name = "Mortal Kombat 4"
        game2.gameDescription = "Jogo de muita pancadaria"
        game2.price = 130.0
        game2.score = 24
        game2.platform = "PS4"
        game2.image = "mk4.png"
        cart.addGameInCart(game: game2)
        
        let total = cart.calculateTotal()
        
        XCTAssertEqual(total, 255)
    }
}
