//
//  ViewController.swift
//  CRMobileChallenge
//
//  Created by Adriano Souza Costa on 14/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import UIKit
import Domain

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkManager = NetworkManager()
        
        networkManager.checkout { result in
            switch result {
            case .success:
                print("aeeee \\o/")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

