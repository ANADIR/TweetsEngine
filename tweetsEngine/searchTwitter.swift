//
//  searchTwitter.swift
//  tweetsEngine
//
//  Created by Amit on 30/12/2016.
//  Copyright © 2016 mobi-Wiz. All rights reserved.
//

import UIKit
import Accounts
import Social
import CoreData



class searchTwitter {
    
    var TweetsArray: NSMutableArray = []
    
    func checkAuthentication() -> Void {
        let twitterOAuth = TwitterOAuthClass.sharedInstance
        twitterOAuth.authenticate { () in
        }
    }
    
    func searchFunc(searchString:String) -> Void {
        let twitterOAuth = TwitterOAuthClass.sharedInstance
        if(twitterOAuth.isAuthenticated) {
            twitterOAuth.searchTweets(searchString: searchString, completionBlock: { (tweetsArray) in
                self.TweetsArray = tweetsArray as NSMutableArray
            })
        }
    }

}
