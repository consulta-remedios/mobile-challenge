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
//        let apiClient = APIClient(session: .shared, headers: [
//            (key: "Token", value: "QceNFo1gHd09MJDzyswNqzStlxYGBzUG")
//            ])
//        let service = StoreService(apiClient: apiClient)
//        service.requestItems { items, error in
//            service.requestItemDetails(usingId: "\(items!.first!.identifier)", andCompletionHandler: { item, error in
//                print(item)
//            })
//        }

        return true
    }
}
