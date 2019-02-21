//
//  GameCartItemCell.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 21/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain

class GameCartItemCell: UITableViewCell {
    
    // MARK: - Public Variables
    
    var didChangeQuantityHandler: ((_ orderItem: OrderItem) -> Void)?
    
    // MARK: - Private Variables
    
    private var orderItem: OrderItem!
    
    // MARK: Outlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet private weak var gameCoverImage: UIImageView!
    
    // MARK: - Public Methods
    
    func setup(with orderItem: OrderItem) {
        self.orderItem = orderItem
        
        nameLabel.text = orderItem.game.name
        priceLabel.text = orderItem.total.currencyDescription
        quantityLabel.text = "Quantidade: \(orderItem.quantity)"
        gameCoverImage.load(from: orderItem.game.image)
    }
    
    // MARK: - Private Methods
    
    @IBAction private func changeQuantity() {
        didChangeQuantityHandler?(orderItem)
    }
    
}
