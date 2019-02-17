//
//  Encoder+Parse.swift
//  Domain
//
//  Created by Adriano Souza Costa on 17/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public extension Encodable {
    
    public func toDictionary() throws -> [String: Any] {
        let jsonData = try JSONEncoder().encode(self)
        return try JSONSerialization.jsonObject(with: jsonData, options: [.mutableContainers]) as? [String: Any] ?? [:]
    }
    
    public func toJson() throws -> String {
        let jsonData = try JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8) ?? ""
    }
    
    public func toData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
}
