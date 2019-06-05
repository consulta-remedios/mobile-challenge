//
//  GameService.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Moya

enum GameService {
    case getGames
    case getGameDetail(id: NSInteger)
}

extension GameService: TargetType {
    var baseURL: URL { return URL(string: "https://game-checkout.herokuapp.com")! }
    
    var path: String {
        switch self {
        case .getGames:
            return "/game"
        case .getGameDetail(let id):
            return "/game/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .getGames:
            return "[{id: 312, name: Super Mario Odyssey, price: 197.88, platform: Switch, image: https://raw.githubusercontent.com/ConsultaRemedios/frontend-challenge/master/assets/super-mario-odyssey.png}]".data(using: String.Encoding.utf8)!
        case .getGameDetail(let id):
            return "{id: \(id),name: Super Mario Odyssey,description: Lorem ipsum dolor sit amet, Super Mario Odyssey, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sagittis purus sit amet volutpat. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis. Placerat vestibulum lectus mauris ultrices eros in cursus turpis.\n Augue ut lectus arcu bibendum at varius vel pharetra vel. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Et malesuada fames ac turpis egestas integer eget aliquet nibh. Diam quis enim lobortis scelerisque fermentum dui faucibus in.,price: 197.88,score: 100,platform: Switch,image: https://raw.githubusercontent.com/ConsultaRemedios/frontend-challenge/master/assets/super-mario-odyssey.png,images: [https://raw.githubusercontent.com/ConsultaRemedios/frontend-challenge/master/assets/super-mario-odyssey.png,https://raw.githubusercontent.com/ConsultaRemedios/frontend-challenge/master/assets/super-mario-odyssey.png,https://raw.githubusercontent.com/ConsultaRemedios/frontend-challenge/master/assets/super-mario-odyssey.png]}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getGames:
            return .requestPlain
        case .getGameDetail(_ ):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["TOKEN": "QceNFo1gHd09MJDzyswNqzStlxYGBzUG"]
    }
}
