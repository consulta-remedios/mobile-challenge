//
//  ShoppingCartManager.swift
//  Domain
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public class ShoppingCartManager: ShoppingCart {
    
    // MARK: - Public Variables
    
    public static var instance = ShoppingCartManager()
    
    public var paymentType: PaymentType = .paymentSlip {
        didSet { _order.paymentType = paymentType }
    }
    
    public var address: Address? {
        didSet { _order.address = address }
    }
    
    public var order: Order {
        return _order
    }
    
    private(set) var orderItems: [OrderItem] = [] {
        didSet { _order.orderItems = orderItems }
    }
    
    // MARK: - Private Variables
    
    private var updatedOrderHandlers: [(() -> Void)] = []
    
    private lazy var _order: Order = {
        return Order(orderItems: orderItems, address: nil, paymentType: paymentType)
    }()
    
    // MARK: - Public Methods
    
    public func addOrderUpdatedHandler(_ handler: @escaping () -> Void) {
        updatedOrderHandlers.append(handler)
    }
    
    public func add(game: Game) {
        if let orderItem = orderItem(at: game) {
            orderItem.quantity += 1
        } else {
            orderItems.append(OrderItem(game: game, quantity: 1))
        }
        
        callUpdatedHandler()
    }
    
    public func remove(game: Game) {
        guard let index = orderItemIndex(at: game) else { return }
        orderItems.remove(at: index)
        callUpdatedHandler()
    }
    
    public func change(quantity: Int, from game: Game) {
        guard let orderItem = orderItem(at: game) else { return }
        orderItem.quantity = quantity
        callUpdatedHandler()
    }
    
    public func clear() {
        orderItems.removeAll()
        callUpdatedHandler()
    }
    
    // MARK: - Private Methods
    
    private func orderItem(at game: Game) -> OrderItem? {
        return orderItems.first(where: { $0.game == game })
    }
    
    private func orderItemIndex(at game: Game) -> Int? {
        return orderItems.lastIndex(where: { $0.game == game })
    }
    
    private func callUpdatedHandler() {
        updatedOrderHandlers.forEach { $0() }
    }
    
}
