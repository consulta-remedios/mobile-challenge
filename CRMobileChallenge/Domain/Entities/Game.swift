//
//  Game.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Shared

public struct Game: Entity, Codable, Equatable {
    
    public var id: Int
    public var name: String
    public var platform: String
    public var description: String
    public var price: Double
    public var score: Double
    public var image: URL
    
    public init(id: Int, name: String, platform: String, description: String, price: Double, score: Double, image: URL) {
        self.id = id
        self.name = name
        self.platform = platform
        self.description = description
        self.price = price
        self.score = score
        self.image = image
    }
    
}

public extension Game {
    
    public var freight: Double {
        return 10.0
    }
    
}
