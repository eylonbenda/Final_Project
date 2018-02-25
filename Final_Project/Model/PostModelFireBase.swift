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
        
        let myRef = ref?.child("Posts")
        myRef?.setValue(newPost.postTojson())
        
    }
    
    func getAllPostsAndObserve(){
        
        
        
        
    }
    
    
}
