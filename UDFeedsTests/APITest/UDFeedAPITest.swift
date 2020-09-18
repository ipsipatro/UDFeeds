//
//  UDFeedAPITest.swift
//  UDFeedsTests
//
//  Created by Ipsi Patro on 17/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import XCTest
@testable import UDFeeds

class UDFeedAPIImplTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetFeeds() {
        let e = expectation(description: "Error")
        
        let udFeedsAPIImpl = UDFeedsAPIImpl()
        _ = udFeedsAPIImpl.getFeeds().done { (feeds) in
            XCTAssertNotNil(feeds, "Expected non-nil string")
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}

