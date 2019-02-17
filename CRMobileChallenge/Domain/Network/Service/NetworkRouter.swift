//
//  NetworkRouter.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkRouter: class {
    
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
    
}
