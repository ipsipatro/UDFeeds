//
//  Feed.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Feed: Object, Mappable {
    @objc dynamic var title = ""
    @objc dynamic var subTitle = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        subTitle <- map["subTitle"]
    }
}
