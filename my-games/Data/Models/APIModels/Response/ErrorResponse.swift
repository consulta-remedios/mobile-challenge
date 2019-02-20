//
//  ErrorResponse.swift
//  my-games
//
//  Created by Caio Cardozo on 05/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation

class ErrorResponse: MyModel {
    var message: String?
    var status: NSNumber?
    var error: String?
    var code: NSNumber?
    var exception: String?
}
