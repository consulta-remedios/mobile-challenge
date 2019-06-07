//
//  GameCollectionViewCell.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

/// A cell displaying a game's basic informations.
class GameCollectionViewCell: UICollectionViewCell {

    // MARK: Properties

    /// The image view displaying the game cover.
    @IBOutlet weak var gameImageView: UIImageView!

    /// The label displaying what is the platform of the game.
    @IBOutlet weak var platformLabel: UILabel!

    /// The label displaying the name of the game.
    @IBOutlet weak var gameNameLabel: UILabel!

    /// The label displaying the price of the game.
    @IBOutlet weak var priceLabel: UILabel!

    // MARK: Life Cycle

    override func prepareForReuse() {
        super.prepareForReuse()

        gameImageView.image = nil
        platformLabel.text = ""
        gameNameLabel.text = ""
        priceLabel.text = ""
    }
}
