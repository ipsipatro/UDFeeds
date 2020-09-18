//
//  FeedTableViewCell.swift
//  UDFeeds
//
//  Created by Ipsi Patro on 15/09/2020.
//  Copyright © 2020 Ipsi Patro. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView?.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        backgroundView?.layer.cornerRadius = 3.0
        cellBackgroundView.layer.masksToBounds = false
        cellBackgroundView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        cellBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellBackgroundView.layer.shadowOpacity = 0.8
    }

}


