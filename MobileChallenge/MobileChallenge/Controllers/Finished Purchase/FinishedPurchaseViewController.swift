//
//  FinishedPurchaseViewController.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 07/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit

/// Informs the user that the purchase was successful.
class FinishedPurchaseViewController: UIViewController {

    // MARK: Actions

    @IBAction func keepBuying(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
