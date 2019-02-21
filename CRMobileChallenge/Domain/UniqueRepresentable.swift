//
//  UniqueRepresentable.swift
//  Shared
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public protocol UniqueRepresentable {
    
    var uid: String { get }
    
}

fileprivate struct AssociatedKeys {
    static var uniqueKey = "unique.key"
}

public extension UniqueRepresentable {
    
    public var uid: String {
        if let uid = objc_getAssociatedObject(self, &AssociatedKeys.uniqueKey) as? String {
            return uid
        }
        
        let newUID = UUID().uuidString
        
        objc_setAssociatedObject(self, &AssociatedKeys.uniqueKey, newUID, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        return newUID
    }
    
}
