//
//  MyColors.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

enum AssetsColor {
    case main
    case textMainColor
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .main:
            return UIColor(named: "MainColor")
        
        case .textMainColor:
            return UIColor(named: "TextMainColor")
        }
    }
}
