//
//  HomeViewController.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets

    
    //MARK: - Constants
    let viewModel = HomeViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    //MARk: - Setup
    private func setup(){
        self.setupBack()
        self.title = self.viewModel.getTitle()
    }
    
    
    //MARK: - LoadData
    private func loadData() {
        self.showLoader()
        self.viewModel.fetchData(success: {
             self.hideLoader()
        }) { (message) in
                self.hideLoader()
                self.showModalDefault(title:"modal_title_error".localized, message: message, textButton: "Ok".localized)
    
        }
    }
}

