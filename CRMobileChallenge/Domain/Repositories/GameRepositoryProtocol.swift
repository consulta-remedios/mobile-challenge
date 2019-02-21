//
//  GameRepository.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public protocol GameRepositoryProtocol: RepositoryProtocol {
    
    func games(_ completion: @escaping (ResultValue<[Game]>) -> Void)
    func game(_ game: Game, _ completion: @escaping (ResultValue<Game>) -> Void)
    
}
