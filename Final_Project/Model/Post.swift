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
    var user : User?
    var lastUpdate : Date?
    
    
    init(urlImage : String , description : String) {
        
        self.urlImage = urlImage
        self.description = description
    }
    
    init(fromJson : [String : Any]) {
        
        self.urlImage = fromJson["urlImage"] as? String
        self.description = fromJson["description"] as? String
        if let date = fromJson["lastUpdate"] as? Double{
            self.lastUpdate = Date.fromFirebase(date)
        }
        
        
    }
    
    
    func postTojson() -> [String:Any]{
        
        var postObj = [String : Any]()
        postObj["urlImage"] = self.urlImage
        postObj["description"] = self.description
        postObj["lastUpdate"] = ServerValue.timestamp()
        //TODO:  ADD USER VALUE
        return postObj
        
    }
    
    
    
    
    
    
    
    
    
    
}
