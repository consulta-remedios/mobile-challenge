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
    
    public var isValid: Bool {
        return number.matches(flag.expression)
    }
    
    public var ofuscatedNumber: String? {
        guard isValid else { return nil }
        let secret = number.substring(from: 3, length: 8).map { _ in "*" }.joined()
        return "\(number.prefix(4))\(secret)\(number.suffix(4))"
    }
    
}
