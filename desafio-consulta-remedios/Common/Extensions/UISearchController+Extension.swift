//
//  UISearchController+Extension.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 03/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

extension UISearchController {
    func setBackground(_ color: UIColor) {
        for subView in self.searchBar.subviews {
            for subView1 in subView.subviews {
                if subView1.isKind(of: UITextField.self) {
                    subView1.backgroundColor = color
                }
            }
        }
    }
}
