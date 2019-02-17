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
    
    public init() {}
    
    public func games(_ completion: @escaping (Result<[Game]>) -> Void) {
        router.request(.games) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            let result = self.handleNetworkResponse(response)
            
            switch result {
                case .success:
                    if let responseData = data {
                        print(responseData)
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
            
        }
    }
    
    // MARK: - Private Methods
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> EmptyResult {
        switch response.statusCode {
            case 200...203, 205, 206: return .success
            case 204, 444: return .failure(NetworkErrorResponse.noData)
            case 401...407: return .failure(NetworkErrorResponse.authentication)
            case 500...511: return .failure(NetworkErrorResponse.badRequest)
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
