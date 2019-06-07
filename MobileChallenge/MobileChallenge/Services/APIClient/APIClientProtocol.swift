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
        forResourceAtUrl URL: URL,
        withCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void
        ) -> URLSessionDataTask

    /// Makes a configured POST task for the specified resource.
    /// - Parameters:
    ///     - path: The URL of the desired resource.
    ///     - parameters: The parameters to be sent with the request.
    ///     - jsonBody: The json data parameters to be sent with the request.
    ///     - completionHandler: The completion handler called when the task finishes loading.
    /// - Returns: The configured data task associated with the passed arguments.
    func makeConfiguredPOSTTask(
        forResourceAtUrl URL: URL,
        parameters: [String: String]?,
        jsonBody: Data?,
        andCompletionHandler handler: @escaping (Bool, URLSessionTask.TaskError?) -> Void
        ) -> URLSessionDataTask
}

extension URLSessionTask {

    // MARK: Error type

    enum TaskError: Error {
        case connection
        case serverResponse(statusCode: Int?)
        case unexpectedDataContent
    }
}
