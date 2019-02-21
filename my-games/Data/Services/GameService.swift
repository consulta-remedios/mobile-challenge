//
//  GameService.swift
//  my-games
//
//  Created by Caio Cardozo on 19/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import Moya
import SwiftKeychainWrapper

enum GameService {
    case getGames()
    case getGameDetail(id: String)
}

extension GameService: TargetType {
    
    var baseURL: URL {
        return URL(string: GAME_URL_BASE)!
    }
    
    //MARK: - Path da URL
    var path: String {
        switch self {
        case .getGames:
            return GAME_ALL
        case .getGameDetail(let request):
            return GAME_DETAIL + request
        }
    }
    
    //MARK: - Metodo utilizado para requisicao
    var method: Moya.Method {
        switch self {
        case .getGames, .getGameDetail:
            return .get
        }
    }
    
    //MARK: - Retorno padrao, o que vai ser retornado por padrao
    var sampleData: Data {
        switch self {
        case .getGames, .getGameDetail:
            return "Half measures are as bad as nothing at all.".data(using: .utf8)!
        }
    }
    
    //MARK: - Tipo de request
    var task: Task {
        switch self {
        case .getGames, .getGameDetail:
            return .requestPlain
        }
    }
    
    //MARK: - Headers da Requisicao
    var headers: [String : String]? {
        let accessToken = KeychainWrapper.standard.string(forKey: ACCESS_TOKEN)
        return ["Content-Type": "application/json", "Token" : "\(String(describing: accessToken ?? ""))"]
    }
}
