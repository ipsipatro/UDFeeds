//
//  AddFeedInteractor.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import PromiseKit

class AddFeedInteractor {
    fileprivate var udFeedsAPI: UDFeedsAPI
    
    init(udFeedsAPI : UDFeedsAPI) {
        self.udFeedsAPI = udFeedsAPI
    }
    
    func addFeed(title: String, subTitle: String) -> Promise<Bool> {
        return udFeedsAPI.addFeed(title: title, subTitle: subTitle)
    }
}
