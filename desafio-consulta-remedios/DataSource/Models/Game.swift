//
//  Game.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Game: Codable {
    var id: NSInteger
    var name: String
    var price: Double
    var platform: String
    var image: String
}
