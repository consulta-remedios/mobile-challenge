//
//  MyCollectionView.swift
//  my-games
//
//  Created by Caio Cardozo on 08/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerNib(named name: String){
        register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
    
}

