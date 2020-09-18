//
//  AddFeedPresenter.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import Foundation

protocol AddFeedView: class {
    func showAlert(title: String, message: String)
    func resetFields()
    func toggleUploadButton(enableFlag: Bool)
    func toggleLoadingIndicator(show: Bool)
}

class AddFeedPresenter {
    var view: AddFeedView?
    var interactor: AddFeedInteractor?
    var titleText: String?
    var subTitleText: String?
    
    init(view: AddFeedView, interactor: AddFeedInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.resetFields()
        view?.toggleUploadButton(enableFlag: false)
    }
    
    func titleTextFieldUpdated(title: String) {
        titleText = title
        toggleUploadButton()
    }
    
    func subTitleTextUpdated(subTitle: String) {
        subTitleText = subTitle
        toggleUploadButton()
    }
    
    func toggleUploadButton() {
        if(!(titleText?.isEmpty ?? true) && !(subTitleText?.isEmpty ?? true)) {
            view?.toggleUploadButton(enableFlag: true)
        }else {
            view?.toggleUploadButton(enableFlag: false)
        }
    }
    
    func uploadButtonTapped(title: String, subTitle: String) {
        view?.toggleLoadingIndicator(show: true)
        interactor?.addFeed(title: title, subTitle: subTitle).done { [weak self] (success) in
            guard let weakSelf = self else { return }
            weakSelf.view?.showAlert(title: "Success!", message: "Uploaded feed successfully")

        }.catch { [weak self] (error) in
            guard let weakSelf = self else { return }
            weakSelf.view?.showAlert(title: "Alert", message: "An error occured while uploading \(error.localizedDescription)")

        }.finally { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view?.toggleLoadingIndicator(show: false)
            weakSelf.view?.resetFields()
            weakSelf.view?.toggleUploadButton(enableFlag: false)
        }
    }
}
