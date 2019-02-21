//
//  Order.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public struct Order {
    
    public var orderItems: [OrderItem]
    public var address: Address?
    public var paymentType: PaymentType
    
}

public extension Order {
    
    public var freight: Double {
        let total = orderItems.map { $0.freight }.reduce(0, +)
        guard total <= 250 else { return 0 }
        return total
    }
    
    public var total: Double {
        return orderItems.map { $0.total }.reduce(0, +) + freight
    }
    
}
