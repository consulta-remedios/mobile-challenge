//
//  ShippingRepositoryProocol.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Shared

public protocol PurchaseRepositoryProtocol {
    
    func checkout(_ completion: @escaping (EmptyResult) -> Void)
    
}
