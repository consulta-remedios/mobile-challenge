//
//  ShoppingCart.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 05/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

/// The user's cart.
struct ShoppingCart {

    /// The items currently in the cart.
    private(set) var items: [Item] = []

    /// The total price of the shopping cart.
    var totalPrice: Double = 0

    /// The freight of the shopping cart.
    var freight: Double {
        return totalPrice > 250 ? 0 : Double(items.count * 10)
    }

    /// Informs if the cart is empty or not.
    var isEmpty: Bool {
        return items.isEmpty
    }

    // MARK: Initializers

    init(items: [Item] = []) {
        self.items = items
        totalPrice = items.reduce(0) { $0 + $1.price }
    }

    // MARK: Imperatives

    /// Given an item, add it to the shopping cart.
    /// - Parameter item: the item to be added.
    mutating func addItem(_ item: Item) {
        items.append(item)
        totalPrice += item.price
    }

    /// Given the index of an item in the shopping cart, removes it.
    /// - Parameter index: the index of the item to be removed, if not specified, the last item is removed.
    /// - Returns: the removed item.
    mutating func removeItem(at index: Int? = nil) -> Item? {
        var item: Item?

        if let index = index, index <= items.count - 1 {
            item = items.remove(at: index)
        } else {
            item = items.popLast()
        }

        if let item = item {
            totalPrice -= item.price
        }

        return item
    }

    /// Clears the shopping cart. This is tipically done after a purchase.
    mutating func clear() {
        items = []
        totalPrice = 0
    }
}
