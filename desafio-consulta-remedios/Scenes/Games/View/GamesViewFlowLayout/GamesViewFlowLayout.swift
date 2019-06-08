//
//  GamesViewFlowLayout.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 03/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GamesViewFlowLayout: UICollectionViewFlowLayout {
    fileprivate var numberOfColumns = 2
    fileprivate var cellPadding: CGFloat = 10
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return (collectionView.bounds.width / CGFloat(numberOfColumns)) - cellPadding * 1.5
    }
    
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = 1
        minimumLineSpacing = 10
        sectionInset = UIEdgeInsets(top: 10, left: cellPadding, bottom: cellPadding * 2, right: cellPadding)
        scrollDirection = .vertical
    }
    
    override var itemSize: CGSize {
        set { }
        get {
            return CGSize(width: Int(contentWidth), height: 260)
        }
    }
}
