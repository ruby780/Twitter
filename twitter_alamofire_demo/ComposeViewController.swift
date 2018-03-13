//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Ruben A Gonzalez on 3/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//
protocol ComposeViewControllerDelegate : class {
    func did(post: Tweet)
}

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {

    weak var delegate: ComposeViewControllerDelegate?
    
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTextView.delegate = self
        tweetButton.layer.cornerRadius = 5
        profileImageView.af_setImage(withURL: URL(string: (User.current?.profileImageURLString)!)!)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // Update Character Count Label
        characterCountLabel.text = String(describing: newText.characters.count)
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }
    
    @IBAction func cancelTweet(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareTweet(_ sender: Any) {
        let tweet = tweetTextView.text ?? ""
        
        APIManager.shared.composeTweet(with: tweet) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
        
        dismiss(animated: true, completion: nil)
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
