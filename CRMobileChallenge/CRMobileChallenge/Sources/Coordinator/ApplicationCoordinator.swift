//
//  ApplicationCoordinator.swift
//  Domain
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Domain

final class ApplicationCoordinator {
    
    // MARK: - Private Variables
    
    private let window: UIWindow
    private let gameRepository: GameRepositoryProtocol = GameRepository()
    private let purchaseRepository: PurchaseRepositoryProtocol = PurchaseRepository()
    private let navigationController = UINavigationController()
    
    // MARK: - Life Cycle
    
    public init(window: UIWindow) {
        self.window = window
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
}

extension ApplicationCoordinator: Coordinator {
    
    func start() {
        window.rootViewController = navigationController
        
        let coordinator = GamesListCoordinator(presenter: navigationController, gameRepository: gameRepository, purchaseRepository: purchaseRepository)
        coordinator.start()
        
        window.makeKeyAndVisible()
    }
    
}
