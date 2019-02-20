//
//  GameRemoteDataSource.swift
//  my-games
//
//  Created by Caio Cardozo on 19/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class GameRemoteDataSource {
    
    let provider = MoyaProvider<GameService>()
    
    func getGames() -> Single<Response>{
        return provider.rx.request(.getGames())
    }
    
    func getGame(id: String) -> Single<Response>{
        return provider.rx.request(.getGameDetail(id: id))
    }
}

