//
//  MyTableViewController.swift
//  my-games
//
//  Created by Caio Cardozo on 05/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    func registerNib(named: String){
        self.tableView.register(UINib(nibName: named, bundle: nil), forCellReuseIdentifier: named)
    }
    
}
