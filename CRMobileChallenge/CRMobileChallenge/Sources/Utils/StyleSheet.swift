//
//  StyleSheet.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 21/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit

class StyleSheet {
    
    // MARK: - Public Methods
    
    static func setup() {        
        let navigationBar = UINavigationBar.appearance()
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 5/255, green: 122/255, blue: 255/255, alpha: 1)]
        navigationBar.isTranslucent = true
    }
    
}
