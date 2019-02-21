//
//  UIViewController+Banner.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 20/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import SwiftMessages

extension UIViewController {
    
    func showBanner(title: String, body: String = "", style: Theme = .success) {
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(backgroundColor: UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1), foregroundColor: .white, iconImage: Icon.success.image)
        success.configureContent(title: title, body: body)
        success.button?.isHidden = true
        
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .top
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        
        SwiftMessages.show(config: successConfig, view: success)
    }
    
}
