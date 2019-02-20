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
    private let gameRepository: GameRepositoryProtocol
    private let purchaseRepository: PurchaseRepositoryProtocol
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController, game: Game, gameRepository: GameRepositoryProtocol, purchaseRepository: PurchaseRepositoryProtocol) {
        self.game = game
        self.presenter = presenter
        self.gameRepository = gameRepository
        self.purchaseRepository = purchaseRepository
    }
    
}

extension GameDetailCoordinator: Coordinator {
    
    func start() {
        let controller = GameDetailViewController(game: game, gameRepository: gameRepository)
        controller.delegate = self
        presenter.pushViewController(controller, animated: true)
    }
    
}

extension GameDetailCoordinator: GameDetailCoordinatorDelegate {
    
    func gameDetailShowShoppingCart() {
        let coordinator = ShoppingCartCoordinator(presenter: presenter, purchaseRepository: purchaseRepository)
        coordinator.start()
    }
    
}
