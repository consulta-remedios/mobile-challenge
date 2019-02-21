//
//  UIViewController+Navigation.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 21/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func popToRootViewController(animated: Bool = true) {
        (navigationController ?? (self as? UINavigationController))?.popToRootViewController(animated: true)
    }
    
}
