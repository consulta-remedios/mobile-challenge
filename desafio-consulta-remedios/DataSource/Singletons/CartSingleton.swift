//
//  CartSingleton.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

class CartSingleton {
    static let shared = CartSingleton()
    
    var items: [CartItem] = []
    var subTotal: Double {
        get { return items.reduce(0.0) { value, item in
            value + item.subTotal
            }
        }
    }
    var totalQuantity: Int {
        get { return items.reduce(0) { value, item in
            value + item.quantity
            }
        }
    }
    var freight: Double {
        get {
            return subTotal > 250 ? 0.0 : Double(totalQuantity * 10)
        }
    }
    var total: Double {
        get { return subTotal + freight }
    }
    
    func add(value: Game) {
        let item = items.filter { $0.game.id == value.id }
        guard let game = item.first else {
            items.append(CartItem(game: value))
            return }
        game.quantity += 1
    }
    
    func removeAll() {
        items.removeAll()
    }
}
