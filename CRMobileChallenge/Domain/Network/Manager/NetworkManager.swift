//
//  NetworkManager.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public struct NetworkManager {
    
    // MARK: - Public Variables
    
    public static let environment: NetworkEnvironment = .dev
    
    // MARK: - Private Variables
    
    private let router = Router<GameAPI>()
    
    // MARK: - Public Methods
    
    public func games(_ completion: @escaping (Result<[Game]>) -> Void) {
        router.request(.games) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            if let teste = response as? HTTPURLResponse {
                
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> EmptyResult {
        switch response.statusCode {
            case 200...299: return .success
            case 401...500: return .failure(NetworkErrorResponse.authentication)
            case 501...599: return .failure(NetworkErrorResponse.badRequest)
            case 600: return .failure(NetworkErrorResponse.outdated)
            default: return .failure(NetworkErrorResponse.failed)
        }
    }
    
}

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
