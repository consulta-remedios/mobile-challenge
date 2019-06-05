//
//  GameCell.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 03/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import Kingfisher

class GameCell: UICollectionViewCell {
    class var identifier: String { return String(describing: type(of: GameCell.self)) }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension GameCell: GameCellPresenterView {
    func displayView(name: String) {
        nameLabel.text = name
    }
    
    func displayView(price: Double) {
        priceLabel.text = "R$ " + String(price)
    }
    
    func displayView(platform: String) {
        platformLabel.text = platform
    }
    
    func displayView(image: String) {
        guard let url = URL(string: image) else { return }
        photoImageView.kf.setImage(with: url)
    }
}
