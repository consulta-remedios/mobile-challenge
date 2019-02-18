//
//  File.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    
    case dev
    case production
    case staging
    
}

extension NetworkEnvironment {
    
    var baseURL: URL {
        return URL(string: "https://game-checkout.herokuapp.com")!
    }
    
}
