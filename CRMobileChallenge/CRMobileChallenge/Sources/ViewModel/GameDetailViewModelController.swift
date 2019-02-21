//
//  GameDetailViewModelController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain

final class GameDetailViewModelController {
    
    // MARK: - Public Variables
    
    private(set) var hasError: Bool = false
    
    var updatedOrderHandler: (() -> Void)? {
        didSet {
            guard let handler = updatedOrderHandler else { return }
            shoppingCart.addOrderUpdatedHandler(handler)
        }
    }
    
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
    
    var isPriceHidden: Bool {
        return _isPriceHidden
    }
    
    // MARK: - Private Variables
    
    private let repository: GameRepositoryProtocol
    private let shoppingCart: ShoppingCart
    
    private var game: Game
    private var _isPriceHidden: Bool = true
    
    // MARK: - Life Cycle
    
    init(game: Game, shoppingCart: ShoppingCart, repository: GameRepositoryProtocol) {
        self.game = game
        self.shoppingCart = shoppingCart
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    func fetch(_ completion: @escaping (EmptyResult) -> Void) {
        hasError = false
        
        repository.game(game) { [weak self] result in
            switch result {
            case .success(let game):
                self?.game = game
                self?._isPriceHidden = false
                completion(.success)
            case .failure(let error):
                self?.hasError = true
                completion(.failure(error))
            }
        }
    }
    
    func cancel() {
        repository.cancel()
    }
    
    func addToCart() {
        shoppingCart.add(game: game)
    }
    
}
