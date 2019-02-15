//
//  CreditCard.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public struct CreditCard {
    
    public var number: String
    public var flag: CreditCardFlag
    
}

public extension CreditCard {
    
    public var ofuscatedNumber: String {
        return number
    }
    
}
