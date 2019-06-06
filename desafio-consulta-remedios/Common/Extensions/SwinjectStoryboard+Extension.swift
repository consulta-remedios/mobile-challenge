//
//  SwinjectStoryboard+Extension.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Moya
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Container.loggingFunction = nil
        defaultContainer.register(MoyaProvider<GameService>.self) { _ in MoyaProvider<GameService>() }
        defaultContainer.register(GameRepositoryProtocol.self) { r in GameRepository(provider: r.resolve(MoyaProvider<GameService>.self)!) }
        defaultContainer.storyboardInitCompleted(GamesController.self) { resolver, controller in
            let presenter = GamesPresenter(view: controller.self, router: GamesPresenterRouter(viewController: controller.self))
            presenter.gamesRepository = resolver.resolve(GameRepositoryProtocol.self)
            controller.presenter = presenter
        }
        defaultContainer.storyboardInitCompleted(GameDetailsController.self) { resolver, controller in
            let presenter = GameDetailsPresenter(view: controller.self, router: GameDetailsPresenterRouter(viewController: controller.self))
            presenter.gamesRepository = resolver.resolve(GameRepositoryProtocol.self)
            controller.presenter = presenter
        }
    }
}
