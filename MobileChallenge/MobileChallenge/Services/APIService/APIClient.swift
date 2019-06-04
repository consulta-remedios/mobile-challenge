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

    // MARK: Initializers

    init(session: URLSession) {
        self.session = session
    }

    // MARK: Imperatives

    func makeConfiguredGETTask(
        forResourceAtUrl url: URL,
        withCompletionHandler handler: @escaping (Data?, URLSessionTask.TaskError?) -> Void
        ) -> URLSessionDataTask {

        var request = URLRequest(url: url)
        request.addValue("QceNFo1gHd09MJDzyswNqzStlxYGBzUG", forHTTPHeaderField: "Token")

        return session.dataTask(with: request) { data, response, error in
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
}
