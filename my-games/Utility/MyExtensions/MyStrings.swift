//
//  MyStrings.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

protocol Localizable {
    var localized: String { get }
}

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension String: Localizable {
    //para o localized aparecer na xib
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
}
