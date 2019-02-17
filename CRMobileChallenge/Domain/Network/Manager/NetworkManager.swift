//
//  NetworkManager.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public struct NetworkManager {
    
    // MARK: - Public Variables
    
    public static let environment: NetworkEnvironment = .production
    
    // MARK: - Private Variables
    
    private let router = Router<GameAPI>()
    
    // MARK: - Life Cycle
    
    public init() {}
    
    // MARK: - Public Methods
    
    public func games(_ completion: @escaping (Result<[Game]>) -> Void) {
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
    
    public func game(id: Int, _ completion: @escaping (Result<Game>) -> Void) {
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
    
    public func checkout(_ completion: @escaping (EmptyResult) -> Void) {
        router.request(.checkout) { (data: Bool?, _, error: Error?) in
            if let error = error {
                return completion(.failure(error))
            } else {
                return completion(.success)
            }
        }
    }
    
}
