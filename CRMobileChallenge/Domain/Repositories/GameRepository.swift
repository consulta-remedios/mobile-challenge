//
//  GameRepository.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Shared

public class GameRepository: BaseRepository, GameRepositoryProtocol {
    
    public func games(_ completion: @escaping (ResultValue<[Game]>) -> Void) {
        manager.games(completion)
    }
    
    public func game(_ game: Game, _ completion: @escaping (ResultValue<Game>) -> Void) {
        manager.game(id: game.id, completion)
    }
    
}
