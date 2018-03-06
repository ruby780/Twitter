//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            refreshData()
        }
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if tweet.retweeted == true {
            tweet.retweeted = false
            tweet.retweetCount -= 1
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully runretweeted the following Tweet: \n\(tweet.text)")
                }
            }
        } else {
            tweet.retweeted = true
            tweet.retweetCount += 1
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
        refreshData()
    }
    
    @IBAction func didTapLike(_ sender: Any) {
        if tweet.favorited == true {
            tweet.favorited = false
            tweet.favoriteCount! -= 1
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }
        } else {
            tweet.favorited = true
            tweet.favoriteCount! += 1
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        refreshData()
    }
    
    func refreshData() {
        tweetTextLabel.text = tweet.text
        profileImageView.af_setImage(withURL: URL(string: tweet.user.profileImageURLString!)!)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        nameLabel.text = tweet.user.name
        usernameLabel.text = "@\(String(describing: tweet.user.screenName!))"
        dateLabel.text = tweet.createdAtString
        
        // Set the retweet button
        if tweet.retweeted == true {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            retweetButton.setTitleColor(.green, for: .normal)
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
            retweetButton.setTitleColor(.lightGray , for: .normal)
        }
        retweetButton.setTitle(String(describing: tweet.retweetCount), for: .normal)
        
        // Set the like button
        if tweet.favorited == true {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
            likeButton.setTitleColor(.red, for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: .normal)
            likeButton.setTitleColor(.lightGray , for: .normal)
        }
        likeButton.setTitle(String(describing: tweet.favoriteCount!), for: .normal)
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
