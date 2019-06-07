//
//  APIClient.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 03/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

/// The client used to make the configured tasks from the passed url session.
struct APIClient: APIClientProtocol {

    // MARK: Properties

    var session: URLSession

    var headers: [(key: String, value: String)]

    // MARK: Initializers

    init(session: URLSession, headers: [(key: String, value: String)]) {
        self.session = session
        self.headers = headers
    }

    // MARK: Imperatives

    func makeConfiguredGETTask(
        forResourceAtUrl URL: URL,
        withCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void
        ) -> URLSessionDataTask {
        return session.dataTask(with: makeBaseRequest(URL: URL)) { data, response, error in
            guard error == nil, data != nil else {
                handler(nil, .connection)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                handler(nil, .connection)
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                handler(nil, .serverResponse(statusCode: httpResponse.statusCode))
                return
            }

            handler(data!, nil)
        }
    }

    // TODO: Add post task factory method.

    /// Builds a configured URLRequest with the provided HTTP headers.
    /// - Parameter url: the url of the resource.
    private func makeBaseRequest(URL: URL) -> URLRequest {
        var request = URLRequest(url: URL)

        headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }
}
