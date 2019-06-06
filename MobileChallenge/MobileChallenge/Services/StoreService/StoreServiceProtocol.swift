//
//  StoreServiceProtocol.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 03/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

/// Service in charge of handling the external operations related to the store
/// (e.g fetch items, fetch the details of an item, etc).
protocol StoreServiceProtocol {

    // MARK: Properties

    /// The APIClient used to fetch the data from the server.
    var apiClient: APIClientProtocol { get set }

    // MARK: Imperatives

    /// Fetches the items from the store, and, in case of success, head the results to the callback closure.
    /// - Parameter completionHandler: the handler called when the request finishes.
    func requestItems(usingCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void)

    /// Fetches the details of an specific item by passing its id.
    /// - Parameter completionHandler: the handler called when the request finishes.
    func requestItemDetails(usingId id: String, andCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void)
}
