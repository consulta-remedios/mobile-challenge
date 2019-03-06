//
//  GameDetailViewModel.swift
//  my-games
//
//  Created by Caio Cardozo on 21/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class GameDetailViewModel {
    
    //MARK: - Constants
    let bag = DisposeBag()
    let title = "game_detail_title".localized
    let gameResponse = BehaviorRelay<GameResponse>(value: GameResponse())
    
    //MARK: - Variables
    var idReceived: String?
    
    //MARK: - Getters
    func getTitle() -> String { return self.title }
    
    func getDisposadBag() -> DisposeBag {return self.bag}
    
    //MARK: - Setters
    func setId(id: String) {self.idReceived = id}
    
    //MARK: - LoadData
    func fetchData(success: @escaping () -> (), error: @escaping (String) -> ()) {
        GameRepository.getGame(id: idReceived ?? STRING_EMPTY, success: { (response) in
            self.gameResponse.accept(response)
            success()
        }) { (message) in
            error(message)
            }.disposed(by: bag)
    }
}
