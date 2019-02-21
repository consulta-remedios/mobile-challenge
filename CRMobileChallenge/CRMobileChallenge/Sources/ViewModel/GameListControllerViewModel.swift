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
    
    private(set) var hasError: Bool = false
    private(set) var isLoading: Bool = true
    
    var isEmpty: Bool {
        return games.count == 0 && !isLoading
    }
    
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
        search(with: nil) { [weak self] result in
            switch result {
            case .success(let games):
                self?.games = games
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func game(at indexPath: IndexPath) -> Game {
        return games[indexPath.row]
    }
    
    func search(with term: String?, _ completion: @escaping (ResultValue<[Game]>) -> Void) {
        isLoading = true
        hasError = false
        
        repository.games { [weak self] result in
            self?.isLoading = false
            
            switch result {
            case .success(let games):
                guard let term = term, !term.isEmpty else { return completion(.success(games)) }
                let games = games.filter { ($0.name + $0.platform + String(describing: $0.score)).lowercased().contains(term.lowercased()) }
                completion(.success(games))
            case .failure(let error):
                self?.hasError = true
                completion(.failure(error))
            }
        }
    }
    
}
