//
//  ParameterEncoding.swift
//  Domain
//
//  Created by Adriano Souza Costa on 16/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    
    func encoder(urlRequest: inout URLRequest, with parameters: Parameters) throws
    
}

public enum ParameterEncoding {
    
    case url
    case json
    case all
    
}

public extension ParameterEncoding {
    
    func encode(urlRequest: inout URLRequest, bodyParameters: Parameters?, urlParameters: Parameters?) throws {
        do {
            switch self {
            case .url:
                guard let url = urlParameters else { return }
                try URLParameterEncoder().encoder(urlRequest: &urlRequest, with: url)
            case .json:
                guard let body = bodyParameters else { return }
                try JSONParameterEncoder().encoder(urlRequest: &urlRequest, with: body)
            case .all:
                guard let body = bodyParameters, let url = urlParameters else { return }
                try JSONParameterEncoder().encoder(urlRequest: &urlRequest, with: body)
                try URLParameterEncoder().encoder(urlRequest: &urlRequest, with: url)
            }
        } catch {
            throw error
        }
    }
    
}
