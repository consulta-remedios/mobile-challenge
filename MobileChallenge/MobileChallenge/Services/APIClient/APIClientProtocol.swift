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

    // MARK: Initializers

    init(session: URLSession)

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
