//
//  ApplicationCoordinator.swift
//  Domain
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Domain

struct ApplicationCoordinator {
    
    // MARK: - Private Variables
    
    private let window: UIWindow
    private let gameRepository: GameRepositoryProtocol = GameRepository()
    private let shippingRepository: ShippingRepositoryProtocol = ShippingRepository()
    private let navigationController: UINavigationController
    private let gamesListCoordinator: GamesListCoordinator
    
    // MARK: - Life Cycle
    
    public init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        
        gamesListCoordinator = GamesListCoordinator(presenter: navigationController, gameRepository: gameRepository, shippingRepository: shippingRepository)
    }
    
}

extension ApplicationCoordinator: Coordinator {
    
    func start() {
        window.rootViewController = navigationController
        gamesListCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}
