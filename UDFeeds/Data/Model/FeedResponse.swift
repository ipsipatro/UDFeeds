//
//  FeedResponse.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 15/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import ObjectMapper

class FeedResponse: Mappable {
    
    var feeds: [Feed]
    
    required init?(map: Map) {
        feeds = []
    }
    
    func mapping(map: Map) {
        feeds <- map["feeds"]
    }
}
