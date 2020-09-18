//
//  UDFeedsAPI.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift
import PromiseKit


protocol UDFeedsAPI {
    func getFeeds() -> Promise<[Feed]>
    func addFeed(title: String, subTitle: String) -> Promise<Bool>
}

class UDFeedsAPIImpl: UDFeedsAPI {
    
    func getFeeds() -> Promise<[Feed]> {
        return Promise { seal in
            AF.request(UDFeedsAPIRouter.getFeeds).responseData { response in
                switch response.result {
                case .success(let feed):
                    do {
                        let jsonString = String(data: feed, encoding: .utf8)
                        let feedResponse = FeedResponse(JSONString: jsonString ?? "")
                        if let feeds = feedResponse?.feeds {
                            let realm = try Realm()
                            try realm.write {
                                for feed in feeds {
                                    if !realm.isInWriteTransaction {
                                        realm.beginWrite()
                                    }
                                    realm.add(feed, update: Realm.UpdatePolicy.modified)
                                }
                            }
                            if realm.isInWriteTransaction {
                                try! realm.commitWrite()
                            }
                            seal.fulfill(feeds)
                        }
                    } catch let error {
                        seal.reject(error)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
    
    func addFeed(title: String, subTitle: String) -> Promise<Bool> {
        return Promise { seal in
            let realm = try Realm()
            do{
                try realm.write {
                    let feed = Feed()
                    feed.title = title
                    feed.subTitle = subTitle
                    if !realm.isInWriteTransaction {
                        realm.beginWrite()
                    }
                    realm.add(feed, update: Realm.UpdatePolicy.modified)
                    seal.fulfill(true)
                }
                
            }catch {
                seal.reject(error)
            }
        }
    }
}
