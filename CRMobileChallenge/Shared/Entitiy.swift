//
//  Entitiy.swift
//  Shared
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public protocol Entity {
    
    var id: Int { get }
    
}

public extension Entity {
    
    var id: Int {
        return UUID().hashValue
    }
    
}
