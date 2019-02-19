//
//  GameListControllerViewModel.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Domain

final class GameListControllerViewModel {
    
    typealias Handler = (EmptyResult) -> Void
    
    // MARK: - Public Variables
    
    var itemsCount: Int {
        return games.count
    }
    
    // MARK: - Private Variables
    
    private let repository: GameRepositoryProtocol
    
    private var games: [Game] = []
    
    // MARK: - Life Cycle
    
    init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    func fetch(_ completion: @escaping (EmptyResult) -> Void) {
        repository.games { [weak self] result in
            switch result {
            case .success(let games):
                self?.games = games
                DispatchQueue.main.async {
                    completion(.success)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func game(at indexPath: IndexPath) -> Game {
        return games[indexPath.row]
    }
    
}
