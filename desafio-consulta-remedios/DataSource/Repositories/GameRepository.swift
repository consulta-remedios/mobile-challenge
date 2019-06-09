//
//  GameRepository.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Moya

protocol GameRepositoryProtocol {
    func fetchAll(response: @escaping ([Game]?, String) -> Void)
    func fetchId(id: NSInteger, response: @escaping (GameDetail?, String) -> Void)
    func purchase(response: @escaping (Bool, String) -> Void)
}

struct GameRepository: GameRepositoryProtocol {
    let provider: MoyaProvider<GameService>
    
    init(provider: MoyaProvider<GameService>) {
        self.provider = provider
    }
    
    func fetchAll(response: @escaping ([Game]?, String) -> Void) {
        provider.request(.getGames) { (result) in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let games = try decoder.decode([Game].self, from: res.data)
                    response(games, "Success! We were able to decode an answer!")
                } catch {
                    response(nil, "We could not decode the response!")
                }
            case .failure(let err):
                response(nil, err.localizedDescription)
            }
        }
    }
    
    func fetchId(id: NSInteger, response: @escaping (GameDetail?, String) -> Void) {
        provider.request(.getGameDetail(id: id)) { (result) in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let game = try decoder.decode(GameDetail.self, from: res.data)
                    response(game, "Success! We were able to decode an answer!")
                } catch {
                    response(nil, "We could not decode the response!")
                }
            case .failure(let err):
                response(nil, err.localizedDescription)
            }
        }
    }
    
    func purchase(response: @escaping (Bool, String) -> Void) {
        provider.request(.purchase) { (result) in
            switch result {
            case .success( _):
                response(true, "Approved purchase!")
            case .failure(let err):
                response(false, err.localizedDescription)
            }
        }
    }
}
