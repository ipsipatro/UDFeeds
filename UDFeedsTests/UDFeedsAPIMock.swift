//
//  UDFeedsAPIMock.swift
//  UDFeedsTests
//
//  Created by Ipsi Patro on 16/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import PromiseKit
@testable import UDFeeds

class UDFeedsAPIMock: UDFeedsAPI {
    func getFeeds() -> Promise<[Feed]> {
        return Promise { seal in
            seal.fulfill([])
        }
    }
    
    func addFeed(title: String, subTitle: String) -> Promise<Bool> {
        return Promise { seal in
            seal.fulfill(true)
        }
    }
    
}

