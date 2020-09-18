//
//  GetFeedsTest.swift
//  UDFeedsTests
//
//  Created by Ipsi Patro on 16/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import XCTest
@testable import UDFeeds


class GetFeedsTest: XCTestCase {
    var getFeedsPresenter: GetFeedsPresenter?
    var getFeedsViewMock: GetFeedsViewMock?
    var getFeedInteractor: GetFeedInteractor?
    var udFeedsAPIMock = UDFeedsAPIMock()
    
    override func setUp() {
        super.setUp()
        getFeedsViewMock = GetFeedsViewMock()
        getFeedInteractor = GetFeedInteractor(udFeedsAPI: udFeedsAPIMock)
        getFeedsPresenter = GetFeedsPresenter(view: getFeedsViewMock!, interactor: getFeedInteractor!)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUpdatFeeds() {
        getFeedsPresenter?.updateFeeds(feeds: [])
        XCTAssertTrue(getFeedsViewMock!.updateFeedsFlag)
    }
    
    func testGetFeeds() {
        let waitExpectation = expectation(description: "")
        _ = udFeedsAPIMock.getFeeds().ensure {
            waitExpectation.fulfill()
        }
        getFeedsPresenter?.getFeeds()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertTrue(self.getFeedsViewMock!.updateFeedsFlag)
        }
    }
    
    func testRetryButtonTapped() {
        let waitExpectation = expectation(description: "")
        _ = udFeedsAPIMock.getFeeds().ensure {
            waitExpectation.fulfill()
        }
        getFeedsPresenter?.retryButtonTapped()
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertTrue(self.getFeedsViewMock!.updateFeedsFlag)
        }
    }
}
