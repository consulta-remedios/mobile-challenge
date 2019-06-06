//
//  GameDetailsPresenterView.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

protocol GameDetailsPresenterView: AnyObject {
    func startLoading(text: String, backgroundColor: UIColor)
    func stopLoading()
    func reloadData()
    func showMessage(icon: Icon, text: String, sizeIcon: Int, backgroundColor: UIColor, isButton: Bool, titleButton: String)
    func hideMessage()
    func displayView(numberPages: Int)
    func displayView(name: String)
    func displayView(price: String)
    func displayView(title: String)
    func displayView(description: String, isMore: Bool)
    func displayView(freight: String)
}
