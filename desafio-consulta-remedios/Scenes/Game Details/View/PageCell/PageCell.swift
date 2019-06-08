//
//  PageCell.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit
import Kingfisher

class PageCell: UICollectionViewCell {
    class var identifier: String { return String(describing: type(of: PageCell.self)) }
    @IBOutlet weak var gameImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PageCell: PageCellPresenterView {
    func displayView(image: String) {
        guard let url = URL(string: image) else { return }
        gameImageView.kf.setImage(with: url)
    }
}
