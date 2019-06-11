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
    private(set) var mappedItems: [(Item, amount: Int)] = []

    /// The total price of the shopping cart.
    var totalPrice: Double = 0

    /// The freight of the shopping cart.
    var freight: Double {
        return totalPrice > 250 ? 0 : Double(mappedItems.count * 10)
    }

    /// Informs if the cart is empty or not.
    var isEmpty: Bool {
        return mappedItems.isEmpty
    }

    // MARK: Initializers

    init(items: [Item] = []) {
        mappedItems = items.reduce([(Item, amount: Int)](), appendItemIntoMapped)
        totalPrice = items.reduce(0) { $0 + $1.price }
    }

    // MARK: Imperatives

    /// Given an item, add it to the shopping cart.
    /// - Parameter item: the item to be added.
    mutating func addItem(_ item: Item) {
        mappedItems = appendItemIntoMapped(mappedItems, item)
        totalPrice += item.price
    }

    /// Given a mapped array of items (containing the item and its quantity), and an item,
    /// appends the item into the mapped array of items.
    /// - Parameters:
    ///     - mapped: an array containing the items with their respective amount in the list.
    ///     - item: an item to be appended into the mapped items.
    /// - Returns: the mapped array of items with the item appended into it.
    private func appendItemIntoMapped(
        _ mapped: [(Item, amount: Int)],
        _ item: Item
        ) -> [(Item, amount: Int)] {

        var mappedItems = mapped
        var wasFound = false

        for (index, mappedItem) in mappedItems.enumerated() where mappedItem.0 == item {
            wasFound = true
            mappedItems[index].amount += 1
        }

        if !wasFound {
            mappedItems.append((item, amount: 1))
        }

        return mappedItems
    }

    /// Given the index of an item in the shopping cart, removes it.
    /// - Parameter index: the index of the item to be removed, if not specified, the last item is removed.
    /// - Returns: the removed item.
    mutating func removeItem(at index: Int? = nil) -> Item? {
        let index = index ?? mappedItems.count - 1

        guard !isEmpty,
            index >= 0,
            index < mappedItems.count else {
            return nil
        }

        var item: Item!

        if mappedItems[index].amount == 1 {
            let mappedItem = mappedItems.remove(at: index)
            item = mappedItem.0
        } else {
            mappedItems[index].amount -= 1
            item = mappedItems[index].0
        }

        if let item = item {
            totalPrice -= item.price
        }

        return item
    }

    /// Clears the shopping cart. This is tipically done after a purchase.
    mutating func clear() {
        mappedItems = []
        totalPrice = 0
    }
}
