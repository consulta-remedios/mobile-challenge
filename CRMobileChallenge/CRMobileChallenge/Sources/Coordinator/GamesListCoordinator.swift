//
//  GamesListCoordinator.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Domain

final class GamesListCoordinator {
    
    // MARK: - Private Variables
    
    private let shoppingCart: ShoppingCart = ShoppingCartManager.instance
    private let gameRepository: GameRepositoryProtocol
    private let purchaseRepository: PurchaseRepositoryProtocol
    private let presenter: UINavigationController
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController, gameRepository: GameRepositoryProtocol, purchaseRepository: PurchaseRepositoryProtocol) {
        self.presenter = presenter
        self.gameRepository = gameRepository
        self.purchaseRepository = purchaseRepository
    }
    
}

extension GamesListCoordinator: Coordinator {
    
    func start() {
        let controller = GamesListViewController(repository: gameRepository)
        controller.delegate = self
        presenter.pushViewController(controller, animated: true)
    }
    
}

extension GamesListCoordinator: GamesListCordinatorDelegate {
    
    func gamesListDidSelect(game: Game) {
        let coordinator = GameDetailCoordinator(presenter: presenter, game: game, shoppingCart: shoppingCart, gameRepository: gameRepository, purchaseRepository: purchaseRepository)
        coordinator.start()
    }
    
    func gamesListShowShoppingCart() {
        let coordinator = ShoppingCartCoordinator(presenter: presenter, shoppingCart: shoppingCart, purchaseRepository: purchaseRepository)
        coordinator.start()
    }
    
}
