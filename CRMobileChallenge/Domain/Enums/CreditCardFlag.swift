//
//  CreditCardFlag.swift
//  Domain
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public enum CreditCardFlag {
    
    case visa
    case masterCard
    
}

public extension CreditCardFlag {
    
    var expression: String {
        switch self {
        case .visa:
            return "^4[0-9]{12}(?:[0-9]{3})?$"
        default:
            return "^5[1-5][0-9]{14}$"
        }
    }
    
    var mask: String {
        return ""
    }
    
    var image: UIImage? {
        switch self {
        case .visa:
            return UIImage(named: "icon_visa")
        default:
            return UIImage(named: "icon_mastercard")
        }
    }
    
}
