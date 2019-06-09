//
//  SimulatedNetworkTests.swift
//  desafio-consulta-remediosTests
//
//  Created by Arthur Rocha on 08/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import XCTest
import Moya
import Swinject

@testable import desafio_consulta_remedios

class SimulatedNetworkTests: XCTestCase {
    
    private let container = Container()

    override func setUp() {
        container.register(MoyaProvider<GameService>.self) { _ in MoyaProvider<GameService>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub) }
        container.register(GameRepository.self) { resolver  in
            let provider = resolver.resolve(MoyaProvider<GameService>.self)!
            return GameRepository(provider: provider)
        }
    }

    override func tearDown() {
        container.removeAll()
    }
    
    func testExistGames() {
        let repository = container.resolve(GameRepository.self)!
        repository.fetchAll { (response, _) in
            XCTAssertNotNil(response)
        }
    }
    
    func testExistGame() {
        let repository = container.resolve(GameRepository.self)!
        repository.fetchId(id: 123) { (response, _) in
            XCTAssertNotNil(response)
        }
    }
    
    func testPurchaseConfirmedSuccessfully() {
        let repository = container.resolve(GameRepository.self)!
        repository.purchase { (response, _) in
            XCTAssertTrue(response)
        }
    }
}

func customEndpointClosure(_ target: GameService) -> Endpoint {
    return Endpoint(url: URL(target: target).absoluteString,
                    sampleResponseClosure: { .networkResponse(200, target.testSampleData) },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers)
}

extension GameService {
    var testSampleData: Data {
        switch self {
        case .getGames:
            let url = Bundle(for: SimulatedNetworkTests.self).url(forResource: "games", withExtension: "json")!
            return try! Data(contentsOf: url)
        case .getGameDetail( _):
            let url = Bundle(for: SimulatedNetworkTests.self).url(forResource: "game", withExtension: "json")!
            return try! Data(contentsOf: url)
        default:
            return Data()
        }
    }
}
