//
//  Game.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Shared

public struct Game: Entity, Codable {
    
    public var name: String
    public var platform: String
    public var description: String
    public var price: Double
    public var score: Double
    public var image: URL
    
}
