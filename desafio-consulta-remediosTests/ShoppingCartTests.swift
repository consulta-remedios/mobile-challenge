//
//  ShoppingCartTests.swift
//  desafio-consulta-remediosTests
//
//  Created by Arthur Rocha on 08/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import XCTest
import Swinject

@testable import desafio_consulta_remedios

class ShoppingCartTests: XCTestCase {
    
    private let container = Container()
    private var repository: CartSingleton!

    override func setUp() {
        container.register(CartSingleton.self) { _ in CartSingleton.shared}
        container.register(CartRepository.self) { resolver in
            let cart = resolver.resolve(CartSingleton.self)!
            return CartRepository(cart: cart)
        }
        container.register(Game.self) { _ in Game(id: 1, name: "The Last of Us", price: 100.00, platform: "PS4", image: "")}
        repository = container.resolve(CartSingleton.self)!
    }

    override func tearDown() {
        container.removeAll()
        repository.removeAll()
    }
    
    func testHasFreightPriceInitializedWithZero() {
        XCTAssertEqual(repository.freight, 0.0)
    }
    
    func testHasFreightPriceWithTen() {
        repository.add(value: container.resolve(Game.self)!)
        XCTAssertEqual(repository.freight, 10.0)
    }
    
    func testHasFreeFreight() {
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        XCTAssertEqual(repository.freight, 0.0)
    }
    
    func testTotalCartWithFreight() {
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        XCTAssertEqual(repository.total, 220.0)
    }
    
    func testTotalCartWithoutFreight() {
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        XCTAssertEqual(repository.subTotal, 200.0)
    }
    
    func testTotalCartOver250() {
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        XCTAssertGreaterThan(repository.total, 250)
    }
    
    func testClearCart() {
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        repository.add(value: container.resolve(Game.self)!)
        repository.removeAll()
        XCTAssertEqual(repository.totalQuantity, 0)
        XCTAssertEqual(repository.subTotal, 0)
        XCTAssertEqual(repository.total, 0)
        XCTAssertEqual(repository.freight, 0)
        
    }
}
