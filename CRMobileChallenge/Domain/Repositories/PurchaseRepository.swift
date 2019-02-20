//
//  PurchaseRepository.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import Shared

public class PurchaseRepository: BaseRepository, PurchaseRepositoryProtocol {
    
    public func checkout(_ completion: @escaping (EmptyResult) -> Void) {
        manager.checkout(completion)
    }
    
}
