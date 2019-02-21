//
//  ShoppingCartCoordinator.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Domain

final class ShoppingCartCoordinator {
    
    // MARK: - Private Variables
    
    private let shoppingCart: ShoppingCart
    private let purchaseRepository: PurchaseRepositoryProtocol
    private let presenter: UIViewController
    private let navigation = UINavigationController()
    
    // MARK: - Life Cycle
    
    init(presenter: UIViewController, shoppingCart: ShoppingCart, purchaseRepository: PurchaseRepositoryProtocol) {
        self.presenter = presenter
        self.shoppingCart = shoppingCart
        self.purchaseRepository = purchaseRepository
    }
    
}

extension ShoppingCartCoordinator: Coordinator {
    
    func start() {
        let controller = ShoppingCartViewController(shoppingCart: shoppingCart, repository: purchaseRepository)
        controller.delegate = self
        navigation.setViewControllers([controller], animated: false)
        presenter.present(navigation, animated: true)
    }
    
}

extension ShoppingCartCoordinator: ShoppingCartCoordinatorDelegate {
    
    func shoppingCardDismiss() {
        navigation.dismiss(animated: true)
    }
    
    func shoppingCardChangeAddress() {
        
    }
    
    func shoppingCardChangePaymentMethod() {
        
    }
    
    func shoppingCardPurchaseCompleted() {
        let coordinator = PurchaseCoordinator(presenter: navigation)
        coordinator.start()
    }
    
}
