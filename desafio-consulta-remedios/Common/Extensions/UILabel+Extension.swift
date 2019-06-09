//
//  UILabel+Extension.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UILabel {
    func addTrailing(
        with trailingText: String,
        moreText: String,
        moreTexFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
        moreTextColor: UIColor,
        numbersCaracters: Int = 200) {
        let readMoreText: String = trailingText + moreText
        guard let textWrapper = text, textWrapper.count > numbersCaracters else {
            return
        }
        var textRange = (textWrapper as NSString).substring(with: NSRange(location: 0, length: numbersCaracters))
        textRange += readMoreText
        text = textRange
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(
            string: textRange,
            attributes: [NSAttributedString.Key.font: font as Any])
        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: moreTextColor, range: NSRange(
                location: numbersCaracters,
                length: readMoreText.count))
        attributedString.addAttribute(
            NSAttributedString.Key.font,
            value: moreTexFont, range: NSRange(
                location: numbersCaracters,
                length: readMoreText.count))
        attributedText = attributedString
    }
    
    func addColor(with textColor: String, color: UIColor) {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text ?? "")
        attributeString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: color,
            range: NSRange(location: 0, length: textColor.count))
        attributeString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: font.pointSize),
            range: NSRange(location: 0, length: textColor.count))
        attributedText = attributeString
    }
}
