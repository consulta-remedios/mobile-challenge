//
//  ShoppingCartCell.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class ShoppingCartCell: UITableViewCell {
    class var identifier: String { return String(describing: type(of: ShoppingCartCell.self)) }

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ShoppingCartCell: ShoppingCartCellPresenterView {
    func displayView(name: String) {
        nameLabel.text = name
    }
    
    func displayView(price: String) {
        priceLabel.text = price
    }
    
    func displayView(platform: String) {
        platformLabel.text = platform
    }
    
    func displayView(image: String) {
        guard let url = URL(string: image) else { return }
        photoImageView.kf.setImage(with: url)
    }
    
    func displayView(quantity: String) {
        quantityLabel.text = quantity
    }
    
    
}
