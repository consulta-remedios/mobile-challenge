//
//  HomeViewModel.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import RxSwift
import SwiftKeychainWrapper

class HomeViewModel {
    //MARK: - Constants
    let bag = DisposeBag()
    let title = "home_title".localized
    let heightCellEmpty: CGFloat = 500
    
    //MARK: - Variables
    private var games = [GameResponse]()
    var localDataExist = false
    
    //MARK: - Getters
    
    
    func getTitle() -> String {
        return self.title
    }
    
    //MARK: - Setters
   
    //MARK: - LoadData
    func fetchData(success: @escaping () -> (), error: @escaping (String) -> ()) {
        GameRepository.getGames(success: { (response) in
          
            success()
        }) { (message) in
            error(message)
            }.disposed(by: bag)
    }
    
    
   
}
