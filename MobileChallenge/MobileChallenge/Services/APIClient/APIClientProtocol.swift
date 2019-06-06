//
//  APIClientProtocol.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 03/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

/// The client used to make the configured tasks from the passed url session.
protocol APIClientProtocol {

    // MARK: Properties

    /// The URLSession used to create the tasks.
    var session: URLSession { get }

    /// The header values that should go in every session tasks.
    var headers: [(key: String, value: String)] { get set }

    // MARK: Initializers

    /// Given a session and any headers that might go into the data tasks, builds an APIClient.
    init(session: URLSession, headers: [(key: String, value: String)])

    // MARK: Imperatives

    /// Makes a configured GET task for the specified resource.
    /// - Parameters:
    ///     - url: the url of the file to be retrieved.
    ///     - handler: the handler called when the task finishes.
    /// - Returns: the configure GET task.
    func makeConfiguredGETTask(
        forResourceAtUrl url: URL,
        withCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void
        ) -> URLSessionDataTask

    // TODO: Add the factory method for post tasks.
}

extension URLSessionTask {

    // MARK: Error type

    enum TaskError: Error {
        case connection
        case serverResponse(statusCode: Int?)
        case unexpectedDataContent
    }
}
