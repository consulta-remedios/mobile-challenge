//
//  MyResponse.swift
//  my-games
//
//  Created by Caio Cardozo on 06/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Moya
import EVReflection
import RxSwift


extension Response {
    func parse(success: @escaping (Response)->(), error: @escaping (Int, String, String?)->()) {
        if (statusCode >= 200 && statusCode < 300) {
            // Inserir mais checagens se precisar
            var responseString = STRING_EMPTY
            do {
                responseString = try self.mapString()
                print(responseString)
            } catch {
                
            }
            success(self)
        } else {
            if statusCode == 500 { //
                error(statusCode, "error_five_hundred".localized, nil)
            } else {
                var responseString = STRING_EMPTY
                do {
                    responseString = try self.mapString()
                } catch {
                    responseString = "error_map_response".localized
                }
                error(statusCode, responseString, nil)
            
            }
        }
    }
}

