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
    private let presenter: UIViewController
    private let navigation = UINavigationController()
    
    // MARK: - Life Cycle
    
    init(presenter: UIViewController, game: Game, purchaseRepository: PurchaseRepositoryProtocol) {
        self.game = game
        self.presenter = presenter
        self.purchaseRepository = purchaseRepository
    }
    
}

extension GameDetailCoordinator: Coordinator {
    
    func start() {
        let controller = GameDetailViewController(game: game)
        controller.delegate = self
        navigation.setViewControllers([controller], animated: false)
        presenter.present(navigation, animated: true)
    }
    
}

extension GameDetailCoordinator: GameDetailCoordinatorDelegate {
    
    func gameDetailShowShoppingCart() {
        
    }
    
    func gameDetailDismiss() {
        navigation.dismiss(animated: true)
    }
    
}
