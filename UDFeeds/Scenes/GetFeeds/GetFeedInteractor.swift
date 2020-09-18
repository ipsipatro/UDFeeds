//
//  GetFeedInteractor.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 15/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation

import Foundation
import PromiseKit

class GetFeedInteractor {
    fileprivate var udFeedsAPI: UDFeedsAPI
    
    init(udFeedsAPI : UDFeedsAPI) {
        self.udFeedsAPI = udFeedsAPI
    }
    
    func getFeeds() -> Promise<[Feed]> {
        return udFeedsAPI.getFeeds()
    }
}
