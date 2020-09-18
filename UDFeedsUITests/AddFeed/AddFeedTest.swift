//
//  AddFeedTest.swift
//  UDFeedsUITests
//
//  Created by Ipsi Patro on 17/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import XCTest

class AddFeedTest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        XCUIApplication().buttons["   Add Content"].staticTexts["   Add Content"].tap()
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNavigationBarExist() {
        XCTAssert(app.navigationBars["Add Feed"].exists)
    }
    
    func testTitleTextFieldExist() {
        XCTAssert( app.textFields["Title"].exists, "test text field doesn't exist" )
    }
    
    func testTextViewExists() {
        XCTAssert( app.textViews["Body Text"].exists, "test text view doesn't exist" )
    }
    
    func testAddContentFunctionality() {
        app.textFields["Title"].tap()
        
        let textField = app.textFields["Title"]
        textField.tap()
        textField.typeText("Hello!")
        app.textViews["Body Text"].tap()
        let textViews = app.textViews["Body Text"]
        textViews.tap()
        textViews.typeText("Hello!")
        
        app.buttons["Upload"].tap()
        XCTAssertEqual(app.alerts.element.label, "Success!")
        
    }
}

