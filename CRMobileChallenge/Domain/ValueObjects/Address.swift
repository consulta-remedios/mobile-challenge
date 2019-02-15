//
//  Address.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public struct Address {
    
    public var postalCode: String
    public var street: String
    public var number: Int
    public var city: String
    public var state: String
    
}

public extension Address {
    
    public var description: String {
        return "\(postalCode) - \(street), \(number) - \(city), \(state)"
    }
    
}
