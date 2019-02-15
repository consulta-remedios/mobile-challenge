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
    public var address: Address
    public var paymentType: PaymentType
    
}

public extension Order {
    
    public var freight: Double {
        let total = Double(orderItems.count * 10)
        return total > 250 ? 0 : total
    }
    
    public var total: Double {
        return orderItems.map { $0.total }.reduce(0, +) + freight
    }
    
}
