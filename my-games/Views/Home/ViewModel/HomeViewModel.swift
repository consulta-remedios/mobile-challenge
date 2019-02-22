//
//  HomeViewModel.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    //MARK: - Constants
    let bag = DisposeBag()
    let title = "home_title".localized
    let heightCellEmpty: CGFloat = 500
    let gamesResponse = BehaviorRelay<[GameResponse]>(value: [])
    private let GAME_COLLECTION_VIEW_CELL = "GameCollectionViewCell"
    
    //MARK: - Variables
    var localDataExist = false
    
    //MARK: - Getters
    func getCellCollectionIdentifier() -> String {return self.GAME_COLLECTION_VIEW_CELL}
    
    func getTitle() -> String {
        return self.title
    }
    
    //MARK: - Setters
   
    //MARK: - LoadData
    func fetchData(success: @escaping () -> (), error: @escaping (String) -> ()) {
        GameRepository.getGames(success: { (response) in
          self.gamesResponse.accept(response)
            success()
        }) { (message) in
            error(message)
            }.disposed(by: bag)
    }
    
    
   
}
