//
//  Game.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Shared

public struct Game: Entity {
    
    public var name: String
    public var platform: String
    public var description: String
    public var price: Price
    public var score: Score
    public var imageURL: URL
    
}
