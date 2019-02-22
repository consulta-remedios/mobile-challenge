//
//  GameCollectionViewCell.swift
//  my-games
//
//  Created by Caio Cardozo on 20/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setup(game: GameResponse){
        self.pictureImageView.setImage(imageURL: game.image)
        self.descriptionLabel.text = game.name
        self.priceLabel.text = "R$ \(String(describing: game.price!).floatValue)"
        self.platformLabel.text = game.platform
    }

}
