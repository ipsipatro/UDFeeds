//
//  AddFeedTest.swift
//  UDFeedsTests
//
//  Created by Ipsi Patro on 16/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import XCTest
@testable import UDFeeds

class AddFeedTest: XCTestCase {
    var addFeedsPresenter: AddFeedPresenter?
    var addFeedsViewMock: AddFeedViewMock?
    var addFeedInteractor: AddFeedInteractor?
    var udFeedsAPIMock = UDFeedsAPIMock()
    
    override func setUp() {
        super.setUp()
        addFeedsViewMock = AddFeedViewMock()
        addFeedInteractor = AddFeedInteractor(udFeedsAPI: udFeedsAPIMock)
        addFeedsPresenter = AddFeedPresenter(view: addFeedsViewMock!, interactor: addFeedInteractor!)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewDidLoad() {
        addFeedsPresenter?.viewDidLoad()
        XCTAssertTrue(addFeedsViewMock!.fieldsResetFlag)
        XCTAssertFalse(addFeedsViewMock!.isUploadButtonEnabled)
    }
    
    func testToggleUploadButton() {
        addFeedsPresenter?.titleText = ""
        addFeedsPresenter?.subTitleText = "test"
        addFeedsPresenter?.toggleUploadButton()
        XCTAssertFalse(addFeedsViewMock!.isUploadButtonEnabled)
        
        addFeedsPresenter?.titleText = "test"
        addFeedsPresenter?.subTitleText = "test"
        addFeedsPresenter?.toggleUploadButton()
        XCTAssertTrue(addFeedsViewMock!.isUploadButtonEnabled)
    }
}

