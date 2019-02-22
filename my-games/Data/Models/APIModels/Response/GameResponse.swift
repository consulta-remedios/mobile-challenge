//
//  GameResponse.swift
//  my-games
//
//  Created by Caio Cardozo on 19/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation

class GameResponse: MyModel {
    var id: NSNumber?
    var name: String?
    var desc: String?
    var price: NSNumber?
    var score: NSNumber?
    var platform: String?
    var image: String?
    
    override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "desc",keyInResource: "description")]
    }
}


