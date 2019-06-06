//
//  StoreService.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 03/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

struct StoreService: StoreServiceProtocol {

    // MARK: Properties

    var apiClient: APIClientProtocol

    // MARK: Imperatives

    func requestItems(usingCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void) {

        let fetchTask = apiClient.makeConfiguredGETTask(forResourceAtUrl: getBaseURL().appendingPathComponent("game")) { data, error in

            if let data = data {
                handler(data, nil)
            } else {
                handler(nil, error!)
            }
        }

        fetchTask.resume()
    }

    func requestItemDetails(usingId id: String, andCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void) {
        let detailsUrl = getBaseURL().appendingPathComponent("game").appendingPathComponent(id)
        let fetchTask = apiClient.makeConfiguredGETTask(forResourceAtUrl: detailsUrl) { data, error in

            if let data = data {
                handler(data, nil)
            } else {
                handler(nil, error!)
            }
        }

        fetchTask.resume()
    }
}
