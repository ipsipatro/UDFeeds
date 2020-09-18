//
//  GetFeedsUITest.swift
//  UDFeedsUITests
//
//  Created by Ipsi Patro on 17/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import XCTest

class GetFeedsUITest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testNavigationBarExist() {
        XCTAssert(app.navigationBars["UDFeeds"].exists)
    }
    
    func testAddContentButtonFunctionality() {
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["   Add Content"].staticTexts["   Add Content"]/*[[".buttons[\"   Add Content\"].staticTexts[\"   Add Content\"]",".staticTexts[\"   Add Content\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["Add Feed"].exists)
    }
    
}
