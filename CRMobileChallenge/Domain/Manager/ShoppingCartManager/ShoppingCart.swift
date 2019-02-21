//
//  ShippingCart.swift
//  Domain
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public protocol ShoppingCart: class {
    
    var order: Order { get }
    
    func add(game: Game)
    func remove(game: Game)
    func change(quantity: Int, from game: Game)
    func addOrderUpdatedHandler(_ handler: @escaping () -> Void)
    func clear()
    
}
