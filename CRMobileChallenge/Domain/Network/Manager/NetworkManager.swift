//
//  NetworkManager.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    // MARK: - Variables
    
    static let environment: NetworkEnvironment = .production
    
    // MARK: - Private Variables
    
    private let router = Router<GameAPI>()
    
    // MARK: - Methods
    
    func games(_ completion: @escaping (ResultValue<[Game]>) -> Void) {
        router.request(.games) { (data: [Game]?, _, error: Error?) in
            if let error = error {
                return completion(.failure(error))
            } else if let games = data {
                completion(.success(games))
            } else {
                completion(.failure(NetworkErrorResponse.noData))
            }
        }
    }
    
    func game(id: Int, _ completion: @escaping (ResultValue<Game>) -> Void) {
        router.request(.game(id: id)) { (data: Game?, _, error: Error?) in
            if let error = error {
                return completion(.failure(error))
            } else if let game = data {
                completion(.success(game))
            } else {
                completion(.failure(NetworkErrorResponse.noData))
            }
        }
    }
    
    func checkout(_ completion: @escaping (EmptyResult) -> Void) {
        router.request(.checkout) { (data: Bool?, _, error: Error?) in
            if let error = error {
                return completion(.failure(error))
            } else {
                return completion(.success)
            }
        }
    }
    
    func cancel() {
        router.cancel()
    }
    
}
