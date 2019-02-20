//
//  GameRepository.swift
//  my-games
//
//  Created by Caio Cardozo on 19/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class GameRepository: MyRepository {
    
    static let remoteDataSource = GameRemoteDataSource()
    
    static func getGames(success: @escaping ([GameResponse])->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.getGames().subscribe(onSuccess: { (response) in
            response.parse(success: { (response) in
                //converter para a response aqui. ex: UserResponse(data: response.data)
                success([GameResponse](data: response.data))
            }, error: { (statusCode, message, highlight) in
                error(message)
            })
        }, onError: { (subscribeError) in
            if !isConnectedToInternet {
                error("unavailable_network".localized)
            }
            let moyaError: MoyaError? = subscribeError as? MoyaError
            let response : Response? = moyaError?.response
            if let _ : Int? = response?.statusCode {
                self.errorBlock(subscribeError: subscribeError, error: { (message) in
                    error(message)
                })
            }
        })
    }
    
    static func getGame(id: String, success: @escaping (GameResponse)->(), error: @escaping (String)->()) -> Disposable {
        return remoteDataSource.getGame(id: id).subscribe(onSuccess: { (response) in
            response.parse(success: { (response) in
                //converter para a response aqui. ex: UserResponse(data: response.data)
                success(GameResponse(data: response.data))
            }, error: { (statusCode, message, highlight) in
                error(message)
            })
        }, onError: { (subscribeError) in
            if !isConnectedToInternet {
                error("unavailable_network".localized)
            }
            let moyaError: MoyaError? = subscribeError as? MoyaError
            let response : Response? = moyaError?.response
            if let _ : Int? = response?.statusCode {
                self.errorBlock(subscribeError: subscribeError, error: { (message) in
                    error(message)
                })
            }
        })
    }
}
