//
//  BaseRepository.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public class BaseRepository: RepositoryProtocol {
    
    // MARK: - Public Variables
    
    let manager = NetworkManager()
    
    // MARK: - Life Cycle
    
    public init() {}
    
    // MARK: - Public Methods
    
    public func cancel() {
        manager.cancel()
    }
    
}
