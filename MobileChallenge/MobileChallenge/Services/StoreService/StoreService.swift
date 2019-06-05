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

    /// The base url for all store requests.
    // TODO: Move this to a constants file.
    let baseUrl = URL(string: "https://game-checkout.herokuapp.com/")!

    // MARK: Imperatives

    func requestItems(_ completionHandler: @escaping (Data?, URLSessionTask.TaskError?) -> Void) {
        guard let gamesUrl = URL(string: "/game", relativeTo: baseUrl) else {
            preconditionFailure("The URL must be properly configured.")
        }

        // Configure the data task.
        let fetchTask = apiClient.makeConfiguredGETTask(forResourceAtUrl: gamesUrl) { data, error in
            print(data)
            print(error)

            if let data = data {
                let jsonText = String(data: data, encoding: .utf8)
                print(jsonText ?? "None returned.")
            }


            // Get the results.
            completionHandler(data, nil)
        }

        fetchTask.resume()
    }

    func requestItemDetails(usingId id: String, andCompletionHandler handler: @escaping (Date?, URLSessionTask.TaskError?) -> Void) {
        let detailsUrl = baseUrl.appendingPathComponent("game").appendingPathComponent(id)

        // Configure the data task.
        let fetchTask = apiClient.makeConfiguredGETTask(forResourceAtUrl: detailsUrl) { data, error in
            print(data)
            print(error)

            if let data = data {
                let jsonText = String(data: data, encoding: .utf8)
                print(jsonText ?? "None returned.")
            }
            // Get the results.
            // Call the callback.
        }

        fetchTask.resume()
    }
}
