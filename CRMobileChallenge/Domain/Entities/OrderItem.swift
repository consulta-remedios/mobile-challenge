//
//  OrderItem.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public struct OrderItem {
    
    public var game: Game
    public var quantitiy: Int
    
}

public extension OrderItem {
    
    public var total: Double {
        guard quantitiy > 0 else { return 0 }
        return Double(quantitiy) * game.price.value
    }
    
}
