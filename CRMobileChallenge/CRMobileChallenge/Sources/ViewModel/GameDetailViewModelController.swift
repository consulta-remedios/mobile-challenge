//
//  GameDetailViewModelController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain
import Shared

final class GameDetailViewModelController {
    
    // MARK: - Public Variables
    
    var title: String {
        return game.title
    }
    
    var platform: String {
        return game.platform
    }
    
    var description: NSAttributedString {
        return NSAttributedString(string: game.description)
    }
    
    var coverURL: URL {
        return game.image
    }
    
    var price: String? {
        return game.price.currencyDescription
    }
    
    var freight: String? {
        return game.freight.currencyDescription
    }
    
    // MARK: - Private Variables
    
    private var game: Game
    private var repository: GameRepositoryProtocol
    
    // MARK: - Life Cycle
    
    init(game: Game, repository: GameRepositoryProtocol) {
        self.game = game
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    func fetch(_ completion: @escaping (EmptyResult) -> Void) {
        repository.game(game) { [weak self] result in
            switch result {
            case .success(let game):
                self?.game = game
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
