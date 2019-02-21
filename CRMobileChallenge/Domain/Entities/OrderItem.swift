//
//  OrderItem.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Shared

public class OrderItem: UniqueRepresentable, Equatable {
    
    public var game: Game
    public var quantity: Int
    
    public init(game: Game, quantity: Int = 1) {
        self.game = game
        self.quantity = quantity
    }
    
    public static func == (lhs: OrderItem, rhs: OrderItem) -> Bool {
        return lhs.uid == rhs.uid
    }
    
}

public extension OrderItem {
    
    public var freight: Double {
        return Double(quantity) * game.freight
    }
    
    public var total: Double {
        guard quantity > 0 else { return 0 }
        return Double(quantity) * game.price
    }
    
}
