//
//  Double+Formatter.swift
//  Shared
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation

public extension Double {
    
    public var currencyDescription: String? {
        return currencyDescription(with: Locale(identifier: "pt_br"))
    }
    
    public func currencyDescription(with locale: Locale) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        
        return formatter.string(from: self as NSNumber)
    }
    
}
