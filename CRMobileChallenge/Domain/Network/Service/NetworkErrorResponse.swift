//
//  NetworkErrorResponse.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public enum NetworkErrorResponse: LocalizedError {
    
    case authentication
    case badRequest
    case outdated
    case failed
    case noData
    case unableToDecode
    
}

public extension NetworkErrorResponse {
    
    public var localizedDescription: String {
        return errorDescription ?? ""
    }
    
    public var errorDescription: String? {
        switch self {
        case .authentication: return "You need to be authenticated first."
        case .badRequest: return "Bad request"
        case .outdated: return "The url you requested is outdated."
        case .failed: return "Network request failed."
        case .noData: return "Response returned with no data to decode."
        case .unableToDecode: return "We could not decode the response."
        }
    }
    
}
