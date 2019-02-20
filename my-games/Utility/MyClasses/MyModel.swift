//
//  MyModel.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import EVReflection

class MyModel: EVNetworkingObject {
    
    override func skipPropertyValue(_ value: Any, key: String) -> Bool {
        if let value = value as? String, value.count == 0 || value == "null" {
            return true
        } else if let value = value as? NSArray, value.count == 0 {
            return true
        } else if value is NSNull {
            return true
        }
        return false
    }
    
}

