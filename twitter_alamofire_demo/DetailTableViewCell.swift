//
//  DetailTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Ruben A Gonzalez on 3/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            tweetLabel.text = tweet.text
            profileImageView.af_setImage(withURL: URL(string: tweet.user.profileImageURLString!)!)
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
            profileImageView.clipsToBounds = true
            nameLabel.text = tweet.user.name
            usernameLabel.text = "@\(String(describing: tweet.user.screenName!))"
            dateLabel.text = tweet.createdAtString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
