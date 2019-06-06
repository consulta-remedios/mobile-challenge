//
//  GamesPresenter.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

class GamesPresenter {
    
    private(set) weak var view: GamesPresenterView?
    private(set) var router: GamesPresenterRouter
    
    var gamesRepository: GameRepositoryProtocol?
    
    var games: [Game] = []
    
    init(view: GamesPresenterView, router: GamesPresenterRouter) {
        self.view = view
        self.router = router
    }
    
    func present() { fetchAll() }
    
    private func fetchAll() {
        view?.startLoading(text: "Loading...", backgroundColor: .white)
        gamesRepository?.fetchAll(response: { [weak self] (response, message) in
            self?.view?.stopLoading()
            self?.view?.hideMessage()
            guard let games = response else {
                self?.view?.showMessage(icon: .notFound, text: message, sizeIcon: 100, backgroundColor: .white, isButton: true, titleButton: "RELOAD")
                return
            }
            self?.games = games
            self?.view?.reloadData()
        })
    }
    
    func configure(for row: Int, _ cell: GameCellPresenterView) {
        cell.displayView(name: games[row].name)
        cell.displayView(platform: games[row].platform)
        cell.displayView(price: games[row].price.formattedCurrency())
        cell.displayView(image: games[row].image)
    }
    
    func onDidSelect(for row: Int) {
        router.onDetails(game: games[row])
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }
}
