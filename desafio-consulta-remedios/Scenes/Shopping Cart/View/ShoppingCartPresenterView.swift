//
//  ShoppingCartPresenterView.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol ShoppingCartPresenterView: AnyObject {
    func reloadData()
    func displayView(total: String)
    func displayView(title: String)
    func display(freight: String)
    func showMessage(
        icon: Icon,
        text: String,
        sizeIcon: Int,
        backgroundColor: UIColor,
        isButton: Bool,
        titleButton: String,
        completion: @escaping (() -> Void))
    func hideMessage()
    func startLoading(text: String, backgroundColor: UIColor)
    func stopLoading()
}
