//
//  GameListCell.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain
//import Shared

final class GameListCell: UICollectionViewCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private weak var platformLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var gameCoverImage: UIImageView!
    
    // MARK: - Public Methods
    
    func setup(with game: Game) {
        platformLabel.text = game.platform
        nameLabel.text = game.name
        priceLabel.text = game.price.currencyDescription
        gameCoverImage.load(from: game.image)
    }
    
}
