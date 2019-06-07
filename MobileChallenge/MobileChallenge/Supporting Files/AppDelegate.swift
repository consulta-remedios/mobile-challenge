//
//  AppDelegate.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 03/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Parameters

    var window: UIWindow?

    // MARK: Life  Cycle

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        // Inject the StoreService into the main games controller.
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            preconditionFailure("The root vc should be a navigation controller.")
        }

        guard let gamesController = navigationController.topViewController as? GamesCollectionViewController else {
            preconditionFailure("The navigation's root vc should be the games controller.")
        }

        let apiClient = APIClient(session: .shared, headers: [
            (key: "Token", value: "QceNFo1gHd09MJDzyswNqzStlxYGBzUG")
            ])
        let service = StoreService(apiClient: apiClient)

        gamesController.storeService = service

        return true
    }
}
