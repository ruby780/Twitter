//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Ruben A Gonzalez on 3/13/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.af_setImage(withURL: URL(string: (User.current?.profileImageURLString)!)!)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.clipsToBounds = true
        bannerImageView.af_setImage(withURL: URL(string: (User.current?.bannerImageURLString)!)!)
        usernameLabel.text = User.current?.screenName
        nameLabel.text = User.current?.name
        let followers = NSMutableAttributedString(string: " followers")
        let followersCount = String(describing: User.current!.followerCount!)
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)]
        let followersCountandLabel = NSMutableAttributedString(string: followersCount, attributes:attrs)
        followersCountandLabel.append(followers)
        followersLabel.attributedText = followersCountandLabel
        
        let following = NSMutableAttributedString(string: " following")
        let friendsCount = String(describing: User.current!.friendsCount!)
        let friendsCountandLabel = NSMutableAttributedString(string: friendsCount, attributes: attrs)
        friendsCountandLabel.append(following)
        followingLabel.attributedText = friendsCountandLabel


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
