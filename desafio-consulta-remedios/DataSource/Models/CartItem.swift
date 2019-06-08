//
//  CartItem.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

class CartItem {
    var quantity : Int = 1
    var game : Game
    
    var subTotal : Double { get { return game.price * Double(quantity) } }
    
    init(game: Game) {
        self.game = game
    }
}
