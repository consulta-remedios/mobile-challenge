//
//  Item.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 05/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

/// An item from the store.
struct Item: Codable, Equatable {

    // MARK: Parameters

    /// The identifier of this item in the store.
    let identifier: Int

    /// The name of the item.
    let name: String

    /// The price of the item.
    let price: Double

    /// The platform of the item.
    let platform: String

    /// The path of the cover image in the server.
    let imagePath: String

    /// The text description of the item.
    var description: String?

    // MARK: Initalizers

    init(identifier: Int,
         name: String,
         price: Double,
         platform: String,
         imagePath: String,
         description: String? = nil) {
        self.identifier = identifier
        self.name = name
        self.price = price
        self.platform = platform
        self.imagePath = imagePath
        self.description = description
    }

    // MARK: Coding keys

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case price
        case platform
        case description
        case imagePath = "image"
    }

    // MARK: Equatable

    public static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
