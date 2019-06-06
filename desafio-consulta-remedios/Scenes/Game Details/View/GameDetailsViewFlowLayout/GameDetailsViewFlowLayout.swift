//
//  GameDetailsViewFlowLayout.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GameDetailsViewFlowLayout: UICollectionViewFlowLayout {
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.bounds.width
    }
    fileprivate var contentHeight: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.bounds.height
    }
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .horizontal
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    override var itemSize: CGSize {
        set { }
        get {
            return CGSize(width: Int(contentWidth), height: Int(contentHeight))
        }
    }
}
