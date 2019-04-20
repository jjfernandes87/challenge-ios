//
//  LodjinhaUITests.swift
//  LodjinhaUITests
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import XCTest

class LodjinhaUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLaunchApp() {
        let tabBarsQuery = XCUIApplication().tabBars
        XCTAssertTrue(tabBarsQuery.buttons["Sobre"].exists, "did not show content")
        XCTAssertTrue(tabBarsQuery.buttons["Home"].exists, "did not show content")
    }
    
    func testLoadHomeContent() {
        let app = XCUIApplication()
        app.launch()
        
        _ = self.expectation(for: NSPredicate(format: "self.exists == true"),
                             evaluatedWith: app.staticTexts["Categorias"],
                             handler: nil)
        self.waitForExpectations(timeout: 10.0, handler: nil)
        
        XCTAssertTrue(app.staticTexts["Categorias"].exists, "did not show content")
        XCTAssertTrue(app.staticTexts["Mais vendidos"].exists, "did not show content")
        snapshot("1Home")
    }
    
    func testLoadAboutContent() {
        let app = XCUIApplication()
        app.launch()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Sobre"].tap()
        
        XCTAssertTrue(app.staticTexts["Julio Fernandes Junior"].exists, "did not show content")
        XCTAssertTrue(app.staticTexts["12 de abril de 2019"].exists, "did not show content")
        snapshot("2About")
    }
    
    func testCategoryDetailContent() {
        let app = XCUIApplication()
        app.launch()
        self.tapGameCategory(app)
        
        XCTAssertTrue(app.navigationBars["Games"].exists, "did not show content")
        XCTAssertTrue(app.staticTexts["Games - Game Horizon Zero Down"].exists, "did not show content")
        XCTAssertTrue(app.staticTexts["Games - NBA2K17"].exists, "did not show content")
        snapshot("3Category")
    }
    
    func testProductDetailByCategory() {
        let app = XCUIApplication()
        app.launch()
        self.tapGameCategory(app)
        
        app.staticTexts["Games - Game Horizon Zero Down"].tap()
        
        XCTAssertTrue(app.navigationBars["Game Horizon Zero Down"].exists, "did not show content")
    }
    
    func testProductDetail() {
        let app = XCUIApplication()
        app.launch()
        
        _ = self.expectation(for: NSPredicate(format: "self.exists == true"),
                             evaluatedWith: app.staticTexts["Categorias"],
                             handler: nil)
        self.waitForExpectations(timeout: 10.0, handler: nil)
        
        app.staticTexts["Games - Fifa 17"].tap()
        
        XCTAssertTrue(app.navigationBars["Fifa 17"].exists, "did not show content")
        snapshot("4ProductDetail")
    }

}

// MARK: - Helper
extension LodjinhaUITests {
    private func tapGameCategory(_ app: XCUIApplication) {
        _ = self.expectation(for: NSPredicate(format: "self.exists == true"),
                             evaluatedWith: app.staticTexts["Categorias"],
                             handler: nil)
        self.waitForExpectations(timeout: 10.0, handler: nil)
        
        app.staticTexts["Games"].tap()
        
        _ = self.expectation(for: NSPredicate(format: "self.exists == true"),
                             evaluatedWith: app.staticTexts["Games - NBA2K17"],
                             handler: nil)
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}

