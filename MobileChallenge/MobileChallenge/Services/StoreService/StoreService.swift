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

    func requestItems(
        usingCompletionHandler handler: @escaping ([Item]?, URLSessionTask.TaskError?
        ) -> Void) {

        let fetchTask = apiClient.makeConfiguredGETTask(
            forResourceAtUrl: getBaseURL().appendingPathComponent("game")
        ) { data, error in
            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let items = try decoder.decode(Array<Item>.self, from: data)
                    handler(items, nil)
                } catch {
                    handler(nil, .unexpectedDataContent)
                }
            } else {
                handler(nil, error!)
            }
        }

        fetchTask.resume()
    }

    func requestItemDetails(
        usingId identifier: String,
        andCompletionHandler handler: @escaping (Item?, URLSessionTask.TaskError?) -> Void
    ) {
        let detailsUrl = getBaseURL().appendingPathComponent(Endpoints.games)
            .appendingPathComponent(identifier)
        let fetchTask = apiClient.makeConfiguredGETTask(forResourceAtUrl: detailsUrl) { data, error in
            let decoder = JSONDecoder()

            if let data = data {
                do {
                    let item = try decoder.decode(Item.self, from: data)
                    handler(item, nil)
                } catch {
                    handler(nil, .unexpectedDataContent)
                }

            } else {
                handler(nil, error!)
            }
        }

        fetchTask.resume()
    }

    func finishPurchase(
        usingCompletionHandler handler: @escaping (Bool, URLSessionTask.TaskError?) -> Void
        ) {
        let finishPurchaseURL = getBaseURL().appendingPathComponent(Endpoints.endPurchase)
        let postTask = apiClient.makeConfiguredPOSTTask(
            forResourceAtUrl: finishPurchaseURL,
            parameters: nil,
            jsonBody: nil) { isSuccessful, error in
                handler(isSuccessful, error)
        }

        postTask.resume()
    }
}
