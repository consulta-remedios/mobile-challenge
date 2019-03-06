//
//  GameDetailViewController.swift
//  my-games
//
//  Created by Caio Cardozo on 21/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit
import RxSwift

class GameDetailViewController: UIViewController {

    //MARK: - Outlets

    
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Constants
    let viewModel = GameDetailViewModel()
    
    //MARK: - Init
    convenience required init(with id: String) {
        self.init()
        self.viewModel.setId(id: id)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }

    //MARk: - Setup
    private func setup(){
         self.loadData()
        self.createBackButton()
        self.title = self.viewModel.getTitle()
        self.setupBiding()
    }
    
    private func setupBiding(){
        self.viewModel.gameResponse.asObservable().subscribe(onNext: {game in
            self.nameLabel.text = game.name
            self.pictureImageView.setImage
            }).disposed(by: self.viewModel.getDisposadBag())
    }
    
    
    private func loadData(){
        self.showLoader()
        self.viewModel.fetchData(success: {
            self.hideLoader()
        }, error: { (messageError) in
            self.hideLoader()
            self.showModalDefault(title:"modal_title_error".localized, message: messageError, textButton: "Ok".localized)
        })
    }
}
