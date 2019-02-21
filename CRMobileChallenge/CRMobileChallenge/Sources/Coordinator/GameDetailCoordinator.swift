//
//  GameDetailCoordinator.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit
import Domain

final class GameDetailCoordinator {
    
    // MARK: - Private Variables
    
    private let game: Game
    private let presenter: UINavigationController
    private let shoppingCart: ShoppingCart
    private let gameRepository: GameRepositoryProtocol
    private let purchaseRepository: PurchaseRepositoryProtocol
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController, game: Game, shoppingCart: ShoppingCart, gameRepository: GameRepositoryProtocol, purchaseRepository: PurchaseRepositoryProtocol) {
        self.game = game
        self.shoppingCart = shoppingCart
        self.presenter = presenter
        self.gameRepository = gameRepository
        self.purchaseRepository = purchaseRepository
    }
    
}

extension GameDetailCoordinator: Coordinator {
    
    func start() {
        let controller = GameDetailViewController(game: game, shoppingCart: shoppingCart, gameRepository: gameRepository)
        controller.delegate = self
        presenter.pushViewController(controller, animated: true)
    }
    
}

extension GameDetailCoordinator: GameDetailCoordinatorDelegate {
    
    func gameDetailShowShoppingCart() {
        let coordinator = ShoppingCartCoordinator(presenter: presenter, shoppingCart: shoppingCart, purchaseRepository: purchaseRepository)
        coordinator.start()
    }
    
}
