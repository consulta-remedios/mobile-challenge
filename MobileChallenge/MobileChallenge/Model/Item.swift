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
    let description: String?

    // MARK: Coding keys

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case price
        case platform
        case description
        case imagePath = "image"
    }
}
