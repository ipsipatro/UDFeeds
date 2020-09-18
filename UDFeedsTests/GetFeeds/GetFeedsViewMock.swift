//
//  GetFeedsViewMock.swift
//  UDFeedsTests
//
//  Created by Ipsi Patro on 16/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
@testable import UDFeeds


class GetFeedsViewMock: GetFeedsView {
    var updateFeedsFlag = false
    
    func updateFeeds(feeds: [Feed]) {
        updateFeedsFlag = true
    }
    
    func showAlert(title: String, message: String) {
        
    }
    
    func toggleErrorLayout(showFlag: Bool) {
        
    }
    
    func toggleActivityIndicator(show: Bool) {
        
    }
    
    
}
