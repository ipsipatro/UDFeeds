//
//  GetFeedsPresenter.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 15/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import RealmSwift

protocol GetFeedsView {
    func updateFeeds(feeds: [Feed])
    func toggleErrorLayout(showFlag: Bool)
    func toggleActivityIndicator(show: Bool)
}

class GetFeedsPresenter {
    var view: GetFeedsView?
    var interactor: GetFeedInteractor?
    let realm = try! Realm()
    
    init(view: GetFeedsView, interactor: GetFeedInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.toggleErrorLayout(showFlag: (Array(self.realm.objects(Feed.self)).count == 0))
        getFeeds()
    }
    
    func viewWillAppear() {
        let feeds = Array(self.realm.objects(Feed.self))
        view?.updateFeeds(feeds: feeds)
    }
    
    func retryButtonTapped() {
        getFeeds()
    }
    
    func updateFeeds(feeds: [Feed]) {
        view?.updateFeeds(feeds: feeds)
    }
        
    func getFeeds() {
        let feeds = Array(self.realm.objects(Feed.self))
        updateFeeds(feeds: feeds)
        view?.toggleActivityIndicator(show: feeds.count == 0)
        interactor?.getFeeds().done({[weak self] (feeds) in
            guard let weakSelf = self else { return }
            weakSelf.view?.updateFeeds(feeds: Array(weakSelf.realm.objects(Feed.self)))
        }).catch {(error) in
            print(error)
        }.finally { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view?.toggleActivityIndicator(show: false)
            weakSelf.view?.toggleErrorLayout(showFlag: (Array(weakSelf.realm.objects(Feed.self)).count == 0))
        }
    }
}
