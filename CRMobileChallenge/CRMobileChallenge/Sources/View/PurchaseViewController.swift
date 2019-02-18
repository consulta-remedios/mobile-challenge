//
//  PurchaseViewController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 18/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import Foundation
import UIKit

protocol PurchaseCoordinatorDelegate {
    
    func purchaseDismiss()
    
}

class PurchaseViewController: UIViewController {
    
    // MARK: - Public Variables
    
    var delegate: PurchaseCoordinatorDelegate?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
