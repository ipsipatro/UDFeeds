//
//  AddFeedViewMock.swift
//  UDFeedsTests
//
//  Created by Ipsi Patro on 16/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
@testable import UDFeeds

class AddFeedViewMock: AddFeedView {
    var fieldsResetFlag = false
    var isUploadButtonEnabled = false
    
    func showAlert(title: String, message: String) {
    }
    
    func resetFields() {
        fieldsResetFlag = true
    }
    
    func toggleUploadButton(enableFlag: Bool) {
        isUploadButtonEnabled = enableFlag
    }
    
    func toggleLoadingIndicator(show: Bool) {
    }
}
