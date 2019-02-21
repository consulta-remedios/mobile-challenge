//
//  Result.swift
//  Shared
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public enum ResultValue<T> {
    
    case success(T)
    case failure(Error)
    
}

public enum EmptyResult {
    
    case success
    case failure(Error)
    
}
