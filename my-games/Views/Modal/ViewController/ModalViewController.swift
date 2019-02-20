//
//  ModalViewController.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    //MARK: - Constants
    let viewModel = ModalViewModel()
    
    //MARK: - Init
    convenience required init(title: String?, message: String?, textButton: String?, okBlock: (()->Void)?) {
        self.init()
        self.viewModel.title = title
        self.viewModel.message = message
        self.viewModel.textButton = textButton
        self.viewModel.okBlock = okBlock
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //MARK: - Setups
    func setup() {
        self.view.backgroundColor = UIColor.init(white: CGFloat(WHITE_BACKGROUD_MODAL), alpha: CGFloat(ALPHA_BACKGROUND_MODAL))
        self.titleLabel.text = self.viewModel.getTitle()
        self.messageLabel.text = self.viewModel.getMessage()
        self.button.setTitle(self.viewModel.getTextButton(), for: .normal)
    }
    
    //MARK: - TapOkButton
    @IBAction func tapOkButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.viewModel.okBlock?()
        })
    }
    
}
