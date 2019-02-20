//
//  MyTableView.swift
//  my-games
//
//  Created by Caio Cardozo on 05/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNib(named name: String){
    register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
