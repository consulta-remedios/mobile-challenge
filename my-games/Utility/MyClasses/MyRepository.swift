//
//  MyRepository.swift
//  my-games
//
//  Created by Caio Cardozo on 05/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit
import Moya
import Alamofire

class MyRepository {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func errorBlock(subscribeError: Error, error: @escaping (String)->()) {
        var errorMessage = "unknown_error".localized
        if let response1 = subscribeError as? MoyaError, let response = response1.response {
            if let statusCode = response.response?.statusCode {
                if statusCode == 401 {
                    error("session_error".localized)
                } else if let optionalDic = try? JSONSerialization.jsonObject(with: response.data, options: []) as? NSDictionary, let responseDictionary = optionalDic {
                    let errorJson = ErrorResponse(json: responseDictionary.toJsonString())
                    if let message = errorJson.message { errorMessage = message }
                }
            }
        }
        error(errorMessage)
    }
}
