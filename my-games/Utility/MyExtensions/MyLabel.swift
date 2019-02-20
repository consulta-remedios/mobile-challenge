//
//  MyLabel.swift
//  my-games
//
//  Created by Caio Cardozo on 09/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit


extension UILabel {
    
    func colorString(text: String?, coloredText: String?, isColoredTextBold: Bool?, color: UIColor? = .orange, colorBase: UIColor? = .darkGray) {
        
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: colorBase!], range: (text! as NSString).range(of: text!))
        
        let range = (text! as NSString).range(of: coloredText!)
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: color!],
                                       range: range)
        if(isColoredTextBold == true) {
            attributedString.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: self.font.pointSize)],
                                           range: range)
        }
        self.attributedText = attributedString
    }
    
}
extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
