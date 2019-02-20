//
//  Game+SearchItemDisplay.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 19/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Domain
import Shared

extension Game: SearchDisplayItem {
    
    public var title: String {
        return name
    }
    
    public var subTitle: String? {
        return platform
    }
    
    public var imageURL: URL? {
        return image
    }
    
    public var detail: String? {
        return String(describing: score)
    }
    
}
