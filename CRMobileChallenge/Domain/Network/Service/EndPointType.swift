//
//  EndPoint.swift
//  Domain
//
//  Created by Adriano Souza Costa on 16/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

protocol EndPointType {
    
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var timeoutInterval: TimeInterval { get }
    var cachePolicy: NSURLRequest.CachePolicy { get }
    
}

extension EndPointType {
    
    var timeoutInterval: TimeInterval {
        return 10.0
    }
    
    var cachePolicy: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalAndRemoteCacheData
    }
    
}
