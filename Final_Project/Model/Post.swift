//
//  Post.swift
//  Final_Project
//
//  Created by Eylon Ben David on 25/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Firebase


class Post {
    
    var urlImage : String?
    var description : String?
    var author : String?
    var lastUpdate : Date?
    var postID = NSUUID().uuidString
    
    
    init(urlImage : String , description : String? , author : String? ) {
        
        self.urlImage = urlImage
        self.description = description
        self.author = author
    }
    
    init(fromJson : [String : Any]) {
        
        self.postID = fromJson["postID"] as! String
        self.urlImage = fromJson["urlImage"] as? String
        self.description = fromJson["description"] as? String
        self.author = fromJson["author"] as? String
        if let date = fromJson["lastUpdate"] as? Double{
            self.lastUpdate = Date.fromFirebase(date)
        }
        
        
    }
    
    
    func postTojson() -> [String:Any]{
        
        var postObj = [String : Any]()
        postObj["urlImage"] = self.urlImage
        postObj["description"] = self.description
        postObj["author"] = self.author
        postObj["postID"] = self.postID
        postObj["lastUpdate"] = ServerValue.timestamp()
        //TODO:  ADD USER VALUE
        return postObj
        
    }
    
    
    
    
    
    
    
    
    
    
}
