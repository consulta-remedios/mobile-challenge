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
    
    // MARK: - Private Variables
    
    private lazy var closeButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "icon-close"), style: .done, target: self, action: #selector(close))
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupControls()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = "Compra concluída"
    }
    
    private func setupControls() {
        navigationItem.leftBarButtonItem = closeButton
    }
    
    // MARK: Actions
    
    @IBAction private func close() {
        delegate?.purchaseDismiss()
    }
    
}
