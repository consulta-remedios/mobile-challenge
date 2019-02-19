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
    
    // MARK: - Public Variables
    
    let purchaseRepository: PurchaseRepositoryProtocol
    
    // MARK: - Private Variables
    
    private let game: Game
    private let presenter: UINavigationController
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController, game: Game, purchaseRepository: PurchaseRepositoryProtocol) {
        self.game = game
        self.presenter = presenter
        self.purchaseRepository = purchaseRepository
    }
    
}

extension GameDetailCoordinator: Coordinator {
    
    func start() {
        let controller = GameDetailViewController(game: game)
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
