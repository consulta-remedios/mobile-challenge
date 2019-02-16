//
//  CreditCardTests.swift
//  DomainTests
//
//  Created by Adriano Souza Costa on 15/02/19.
//  Copyright © 2019 Adriano Souza Costa. All rights reserved.
//

import XCTest

@testable import Domain

class CreditCardTests: XCTestCase {
    
    func testeCartaoDeveSerValidoComNumeracaoCorretaVisa() {
        let card = CreditCard(number: "4111111111111111", flag: .visa)
        XCTAssertTrue(card.isValid)
    }
    
    func testeCartaoDeveSerInvalidoComNumeracaoAleatoriaVisa() {
        let card = CreditCard(number: "5111111111111111", flag: .visa)
        XCTAssertFalse(card.isValid)
    }
    
    func testeCartaoDeveSerValidoComNumeracaoCorretaMasterCard() {
        let card = CreditCard(number: "5538383883833838", flag: .masterCard)
        XCTAssertTrue(card.isValid)
    }
    
    func testeCartaoDeveSerInvalidoComNumeracaoAleatoriaMasterCard() {
        let card = CreditCard(number: "4538383883833838", flag: .masterCard)
        XCTAssertFalse(card.isValid)
    }
    
    func testeObsfuscacaoDoCartaoDeveExibirSomenteOsPrimeirosEUltimosQuatroDigitosVisa() {
        let card = CreditCard(number: "4111111111111111", flag: .visa)
        XCTAssertEqual(card.ofuscatedNumber, "4111********1111")
    }
    
    func testeObsfuscacaoDoCartaoDeveExibirSomenteOsPrimeirosEUltimosQuatroDigitosMasterCard() {
        let card = CreditCard(number: "5538383883833838", flag: .masterCard)
        XCTAssertEqual(card.ofuscatedNumber, "5538********3838")
    }
    
}
