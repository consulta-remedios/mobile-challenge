//
//  ModalViewModel.swift
//  my-games
//
//  Created by Caio Cardozo on 07/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation

class ModalViewModel  {
    
    //MARK: - Variables
    var title: String?
    var message: String?
    var textButton: String?
    var okBlock: (() -> Void)?
    
    //MARK: - Getters
    func getTitle() -> String? { return self.title}
    
    func getMessage() -> String? { return self.message}
    
    func getTextButton() -> String? { return self.textButton}
    
    func getOkBlock() -> (() -> Void)? {return self.okBlock}
}
