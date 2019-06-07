//
//  ShoppingCartCellPresenterView.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol ShoppingCartCellPresenterView: AnyObject {
    func displayView(name: String)
    func displayView(price: String)
    func displayView(platform: String)
    func displayView(image: String)
    func displayView(quantity: String)
}
