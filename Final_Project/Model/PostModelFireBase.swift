//
//  PostModelFireBase.swift
//  Final_Project
//
//  Created by Eylon Ben David on 25/02/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Firebase


class PostModelFireBase {
    
    
    let ref : DatabaseReference?
    
    init() {
        
        ref = Database.database().reference()
        
    }
    
    
    func addPost(newPost : Post){
        
        let myRef = ref?.child("Posts").child(newPost.postID)
        myRef?.setValue(newPost.postTojson())
        
    }
    
    func getAllPostsAndObserve(lastUpdateDate: Date? ,callback : @escaping ([Post]?)->Void){
            
            let handler = {(snapshot:DataSnapshot) in
                
                if let values = snapshot.value as? [String : [String : Any]] {
                    var postArr = [Post]()
                    for postJson in values{
                        let post = Post(fromJson: postJson.value)
                        postArr.append(post)
                    }
                    callback(postArr)
                } else {
                    callback(nil)
                }
            }
            
            let myRef = ref?.child("Posts")
            
            if (lastUpdateDate != nil){
                print("q starting at:\(lastUpdateDate!) \(lastUpdateDate!.toFirebase())")
                let fbQuery = myRef?.queryOrdered(byChild:"lastUpdate").queryStarting(atValue:lastUpdateDate!.toFirebase())
                fbQuery?.observe(.value, with: handler)
            }else{
                myRef?.observe(.value, with: handler)
            }
        
    
    }
    
    
}