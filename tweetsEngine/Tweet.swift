//
//  Tweet.swift
//  tweetsEngine
//
//  Created by Amit on 30/12/2016.
//  Copyright © 2016 mobi-Wiz. All rights reserved.
//

import UIKit
import ObjectMapper

class Tweet: Mappable {
    
    var created_at: NSString?
    var text: NSString?
    
    required init?(map: Map) {
        
    }
    
    init(date: String, textTweet: String) {
        self.created_at = date as NSString?
        self.text = textTweet as NSString?
    }
    
    // Mappable
    
    func mapping(map: Map) {
        created_at   <- map["created_at"]
        text  <- map["text"]
    }
    
    // MARK: NSCoding
    
    required convenience init?(coder decoder: NSCoder) {
        guard let created_at = decoder.decodeObject(forKey: "created_at") as? String,
            let text = decoder.decodeObject(forKey: "text") as? String
            else { return nil }
        
        self.init(
            date: created_at,
            textTweet: text
        )
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encode(self.created_at, forKey: "created_at")
        coder.encode(self.text, forKey: "text")
    }
    
}
