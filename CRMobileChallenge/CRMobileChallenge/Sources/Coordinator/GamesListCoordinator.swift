//
//  GamesListCoordinator.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Domain

class GamesListCoordinator {
    
    // MARK: - Public Variables
    
    let gameRepository: GameRepositoryProtocol
    let shippingRepository: ShippingRepositoryProtocol
    
    // MARK: - Private Variables
    
    private let presenter: UINavigationController
    
    // MARK: - Life Cycle
    
    init(presenter: UINavigationController, gameRepository: GameRepositoryProtocol, shippingRepository: ShippingRepositoryProtocol) {
        self.presenter = presenter
        self.gameRepository = gameRepository
        self.shippingRepository = shippingRepository
    }
    
}

extension GamesListCoordinator: Coordinator {
    
    func start() {
        let viewController = GamesListViewController(gamesListCoordinator: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
}
