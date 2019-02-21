//
//  ShoppingCartViewModelController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 21/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain
import Shared

final class ShoppingCartViewModelController {
    
    // MARK: - Public Variables
    
    var updatedOrderHandler: (() -> Void)? {
        didSet {
            guard let handler = updatedOrderHandler else { return }
            shoppingCart.addOrderUpdatedHandler(handler)
        }
    }
    
    var price: String? {
        return shoppingCart.order.total.currencyDescription
    }
    
    var isEnableCheckoutButton: Bool {
        return shoppingCart.order.count > 0
    }
    
    var orderItemsCount: Int {
        return shoppingCart.order.orderItems.count
    }
    
    // MARK: - Private Variables
    
    private let repository: PurchaseRepositoryProtocol
    private let shoppingCart: ShoppingCart
    
    // MARK: - Life Cycle
    
    init(shoppingCart: ShoppingCart, repository: PurchaseRepositoryProtocol) {
        self.shoppingCart = shoppingCart
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    func cancel() {
        repository.cancel()
    }
    
    func orderItem(at indexPath: IndexPath) -> OrderItem {
        return shoppingCart.order.orderItems[indexPath.row]
    }
    
    func changeQuantity(to quantity: Int, from orderItem: OrderItem) {
        shoppingCart.change(quantity: quantity, from: orderItem.game)
    }
    
    func checkout(_ completion: @escaping (EmptyResult) -> Void) {
        repository.checkout { [weak self] result in
            switch result {
            case .success:
                self?.shoppingCart.clear()
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
