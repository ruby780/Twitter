//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Ruben A Gonzalez on 3/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TweetDetailCell") as? DetailTableViewCell
            cell!.tweet = self.tweet
            return cell!
        }
            
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LikeAndRetweetCell") as? LikeAndRetweetTableViewCell
            cell!.tweet = self.tweet
            return cell!
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonsCell") as? ButtonsinDetailTableViewCell
            cell!.tweet = self.tweet
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
