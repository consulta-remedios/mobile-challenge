//
//  StoreService+Constants.swift
//  MobileChallenge
//
//  Created by Tiago Maia Lopes on 04/06/19.
//  Copyright © 2019 Tiago Maia Lopes. All rights reserved.
//

import Foundation

extension StoreService {

    /// The constants used to communicate to the server.
    enum API {
        static let scheme = "https"
        static let host = "game-checkout.herokuapp.com"
    }

    /// The endpoints of the api.
    enum Endpoints {
        static let games = "game"
    }

    // MARK: Imperatives

    /// Builds the base URL to make the requests to the API.
    /// - Returns: the base URL.
    func getBaseURL() -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host

        guard let URL = components.url else {
            preconditionFailure("The base store URL must be properly configured.")
        }

        return URL
    }
}
