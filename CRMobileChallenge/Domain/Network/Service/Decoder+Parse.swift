//
//  Decoder+Parse.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public extension Decodable {
    
    public init(_ data: Data, options: JSONSerialization.WritingOptions = []) throws {
        let json = try JSONSerialization.data(withJSONObject: data, options: options)
        self = try JSONDecoder().decode(Self.self, from: json)
    }
    
}
