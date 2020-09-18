//
//  Dependencies.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        //API
        defaultContainer.register(UDFeedsAPI.self) { _ in return UDFeedsAPIImpl() }.inObjectScope(.container)
        
        //Get Feeds
        defaultContainer.register(GetFeedInteractor.self) { r in
            return GetFeedInteractor(udFeedsAPI: r.resolve(UDFeedsAPI.self)!)
        }
        defaultContainer.register(GetFeedsPresenter.self) { (r, view: GetFeedsView) in
            return GetFeedsPresenter(view: view, interactor: r.resolve(GetFeedInteractor.self)!)
        }
        defaultContainer.storyboardInitCompleted(GetFeedsViewController.self) { r, c in
            let presenter = r.resolve(GetFeedsPresenter.self, argument: (c as GetFeedsView))
            c.presenter = presenter
        }
        
        //Add Feed
        defaultContainer.register(AddFeedInteractor.self) { r in
            return AddFeedInteractor(udFeedsAPI: r.resolve(UDFeedsAPI.self)!)
        }
        defaultContainer.register(AddFeedPresenter.self) { (r, view: AddFeedView) in
            return AddFeedPresenter(view: view, interactor: r.resolve(AddFeedInteractor.self)!)
        }
        defaultContainer.storyboardInitCompleted(AddFeedController.self) { r, c in
            let presenter = r.resolve(AddFeedPresenter.self, argument: (c as AddFeedView))
            c.presenter = presenter
        }
    }
}
