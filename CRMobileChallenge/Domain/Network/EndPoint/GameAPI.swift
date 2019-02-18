//
//  GameAPI.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

enum GameAPI {
    
    case games
    case game(id: Int)
    case checkout
    
}

extension GameAPI: EndPointType {
    
    var baseURL: URL {
        return NetworkManager.environment.baseURL
    }
    
    var path: String {
        switch self {
        case .games:
            return "game"
        case .game(let id):
            return "game/\(id)"
        case .checkout:
            return "checkout"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .checkout:
            return .post
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .game(let id):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .url, urlParameters: ["id": id])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return ["token": "QceNFo1gHd09MJDzyswNqzStlxYGBzUG"]
    }
    
}
