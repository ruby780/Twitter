//
//  LikeAndRetweetTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Ruben A Gonzalez on 3/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class LikeAndRetweetTableViewCell: UITableViewCell {

    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            refreshData()
        }
    }
    
    func refreshData() {
        let retweets = NSMutableAttributedString(string: " Retweets")
        let retweetCount = String(describing: tweet.retweetCount)
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)]
        let retweetCountandLabel = NSMutableAttributedString(string:retweetCount, attributes:attrs)
        retweetCountandLabel.append(retweets)
        retweetLabel.attributedText = retweetCountandLabel
        
        let likes = NSMutableAttributedString(string: " Likes")
        let favoriteCount = String(describing: tweet.favoriteCount!)
        let likeCountandLabel = NSMutableAttributedString(string: favoriteCount, attributes: attrs)
        likeCountandLabel.append(likes)
        likeLabel.attributedText = likeCountandLabel
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
