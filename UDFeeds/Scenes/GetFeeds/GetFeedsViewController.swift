//
//  GetFeedsViewController.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 14/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import UIKit

class GetFeedsViewController: UIViewController {
    
    @IBOutlet weak var addContentButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: GetFeedsPresenter?
    var feeds: [Feed]?
    
    // MARK: overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    
    // MARK: IBActions
    @IBAction func retryButtonTapped(_ sender: Any) {
        presenter?.retryButtonTapped()
    }
    
    // MARK: private functions
    fileprivate func setup() {
        errorView.isHidden = true
        let textFieldCell = UINib(nibName: "FeedTableViewCell",
                                  bundle: nil)
        tableView.register(textFieldCell,
                           forCellReuseIdentifier: "FeedTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
    }
}
extension GetFeedsViewController: GetFeedsView {
    
    func updateFeeds(feeds: [Feed]) {
        self.feeds = feeds
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func toggleErrorLayout(showFlag: Bool) {
        errorView.isHidden = !showFlag
        tableView.isHidden = showFlag
    }
    
    func toggleActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        }else {
            activityIndicator.stopAnimating()
        }
    }
}

extension GetFeedsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        let feed = feeds?[indexPath.row]
        cell.titleLabel?.text = feed?.title
        cell.subTitleLabel?.text = feed?.subTitle
        return cell
    }
}

