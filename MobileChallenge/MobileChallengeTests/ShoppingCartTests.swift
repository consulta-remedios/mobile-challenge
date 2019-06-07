//
//  ShoppingCartTests.swift
//  MobileChallengeTests
//
//  Created by Tiago Maia Lopes on 06/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import XCTest
@testable import MobileChallenge

class ShoppingCartTests: XCTestCase {

    // MARK: Tests

    func testCartHasATotalPriceInitiallySetToZero() {
        XCTAssertEqual(ShoppingCart().totalPrice, 0)
    }

    func testCartAcceptsNewItems() {
        var cart = ShoppingCart()

        let item = Item(
            identifier: 242,
            name: "The Lord Of The Rings",
            price: 100,
            platform: "ps3",
            imagePath: ""
        )

        cart.addItem(item)

        guard let cartItem = cart.items.first else {
            XCTFail("An item should've been added.")
            return
        }

        XCTAssertEqual(cartItem, item)
    }

    func testCartRemovesAnItem() {
        var cart = ShoppingCart(items: [
            Item(identifier: 104,
                 name: "Super Mario Bros",
                 price: 142,
                 platform: "Super Nintendo",
                 imagePath: "")
            ])

        guard let removedItem = cart.removeItem(at: 0) else {
            XCTFail("The item should've been removed.")
            return
        }

        XCTAssertEqual(removedItem.identifier, 104)
    }

    func testCartHasHigherShoppingPriceIfMoreItemsAreAdded() {
        let cart = ShoppingCart(items: [
            Item(identifier: 104,
                 name: "Super Mario Bros",
                 price: 142,
                 platform: "Super Nintendo",
                 imagePath: ""),
            Item(identifier: 242,
                 name: "The Lord Of The Rings",
                 price: 100,
                 platform: "ps3",
                 imagePath: ""
            )
            ])

        XCTAssertEqual(cart.totalPrice, 242)
    }

    func testCartHasAFreightInitiallySetToZero() {
        XCTAssertEqual(ShoppingCart().freight, 0)
    }

    func testFreightHasValueEquivalentToThePassedItems() {
        let cart = ShoppingCart(items: (0..<3).map {
            Item(
                identifier: $0,
                name: "\($0)",
                price: 57,
                platform: "PS4",
                imagePath: ""
            )
        })
        XCTAssertEqual(cart.freight, 30)
    }

    func testFreightIncreasesValueIfItemsAreAdded() {
        var cart = ShoppingCart()

        (0..<5).map {
            Item(
                identifier: $0,
                name: "\($0)",
                price: 18,
                platform: "Wii",
                imagePath: ""
            )}.forEach { cart.addItem($0) }

        XCTAssertEqual(cart.freight, 50)
    }

    func testFreightDecreasesValueIfItemsAreRemoved() {
        var cart = ShoppingCart(items: (0..<5).map {
            Item(
                identifier: $0,
                name: "\($0)",
                price: 28,
                platform: "PS4",
                imagePath: ""
            )
        })

        _ = cart.removeItem()

        XCTAssertEqual(cart.freight, 40)
    }

    func testFreightBecomesFreeForPuchasesGreaterThan250() {
        let cart = ShoppingCart(items: (0..<5).map {
            Item(
                identifier: $0,
                name: "\($0)",
                price: 51,
                platform: "XBox",
                imagePath: ""
            )
        })

        XCTAssertEqual(cart.freight, 0)
    }
}
