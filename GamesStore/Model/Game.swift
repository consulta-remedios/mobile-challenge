//
//  Game.swift
//  GamesStore
//
//  Created by Marcio Habigzang Brufatto on 11/06/19.
//  Copyright © 2019 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation
import ObjectMapper

class Game: Mappable {
    
    var id: Int = 0
    var name: String = ""
    var gameDescription: String = ""
    var price: Double = 0
    var score: Int = 0
    var platform: String = ""
    var image: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        gameDescription <- map["description"]
        price <- map["price"]
        score <- map["score"]
        platform <- map["platform"]
        image <- map["image"]
    }
}
