//
//  desafio_consulta_remediosUITests.swift
//  desafio-consulta-remediosUITests
//
//  Created by Arthur Rocha on 03/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import XCTest

class desafio_consulta_remediosUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {}

    func testNavigateToGameDetails() {
        let app = XCUIApplication()
        app.collectionViews.cells["gameCell"].firstMatch.tap()
        app.navigationBars["navigationGameDetails"].buttons["closeButton"].tap()
    }
    
    func testNavigateToCart() {
        let app = XCUIApplication()
        app.navigationBars["navigationGames"].buttons["cartButton"].tap()
        app.buttons["BORA COMPRAR?"].tap()
    }
    
    func testNavigateToCartIntoGameDetails() {
        let app = XCUIApplication()
        app.collectionViews.cells["gameCell"].firstMatch.tap()
        app.navigationBars["navigationGameDetails"].buttons["cartButton"].tap()
        app.navigationBars["Carrinho de Compras"].children(matching: .button).element.tap()
    }
    
    func testTapReadMoreIntoGameDetails() {
        let app = XCUIApplication()
        app.collectionViews.cells["gameCell"].firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.collectionViews/*[[".scrollViews.collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.children(matching: .other).element.swipeUp()
        app/*@START_MENU_TOKEN@*/.staticTexts["descriptionGameDetail"]/*[[".scrollViews",".staticTexts[\"Lorem ipsum dolor sit amet, Super Mario Odyssey, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sagittis purus sit amet volutpat. Fringilla est ullamco\\nLeia mais\"]",".staticTexts[\"descriptionGameDetail\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.collectionViews/*[[".scrollViews.collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.children(matching: .other).element.swipeUp()
    }
    
    func testPageImagesIntoGameDetails() {
        let app = XCUIApplication()
        app.collectionViews.cells["gameCell"].firstMatch.tap()
        let element = app/*@START_MENU_TOKEN@*/.collectionViews/*[[".scrollViews.collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells.children(matching: .other).element
        element.swipeLeft()
        element.swipeLeft()
        element.swipeRight()
    }
    
    func testAddGameIntoShoppingCart() {
        let app = XCUIApplication()
        app.collectionViews.cells["gameCell"].firstMatch.tap()
        app.buttons["Adicionar ao Carrinho"].tap()
        app.scrollViews.otherElements.containing(.staticText, identifier:"Frete").element.swipeUp()
    }
    
    func testFinalizePurchase() {
        let app = XCUIApplication()
        app.collectionViews.cells["gameCell"].firstMatch.tap()
        app.buttons["Adicionar ao Carrinho"].tap()
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 1).swipeUp()
        scrollViewsQuery.otherElements.buttons["FINALIZAR COMPRA"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.buttons["Continuar comprando"].tap()
    }
}
