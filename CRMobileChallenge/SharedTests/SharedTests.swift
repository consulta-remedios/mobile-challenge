//
//  SharedTests.swift
//  SharedTests
//
//  Created by Adriano Souza Costa on 14/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import XCTest

@testable import Shared

class SharedTests: XCTestCase {

    func testeRepresentacaoMonetariaDeUmValorDoubleDeveSerCorretaDeAcordoComRegiao() {
        let value: Double = 250
        let locale = Locale(identifier: "pt_br")
        let description = value.currencyDescription(with: locale)
        
        XCTAssertEqual(description, "R$ 250,00")
    }

}
