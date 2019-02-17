//
//  GameAPI.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public enum GameAPI {
    
    case games
    case game(id: Int)
    case checkout
    
}

extension GameAPI: EndPointType {
    
    public var baseURL: URL {
        return NetworkManager.environment.baseURL
    }
    
    public var path: String {
        switch self {
        case .games:
            return "games"
        case .game(let id):
            return "games/\(id)"
        case .checkout:
            return "checkout"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .checkout:
            return .post
        default:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .game(let id):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .url, urlParameters: ["id": id])
        default:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        return ["token": "QceNFo1gHd09MJDzyswNqzStlxYGBzUG"]
    }
    
}
