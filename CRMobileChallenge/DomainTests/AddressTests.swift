//
//  AddressTests.swift
//  DomainTests
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import XCTest

@testable import Domain

class AddressTests: XCTestCase {
    
    func testeDescricaoDoEnderecoDeveConterTodosComponentes() {
        let address = Address(
            postalCode: "36025-590",
            street: "Rua Imaculada conceição",
            number: 110,
            neighborhood: "Dom Bosco",
            city: "Juiz de Fora",
            state: "Minas Gerais")
        
        XCTAssertEqual(address.description, "36025-590 - Rua Imaculada conceição, 110 - Dom Bosco - Juiz de Fora - Minas Gerais")
    }
    
}
