//
//  ModelFirebase.swift
//  Final_Project
//
//  Created by admin on 03/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Firebase

class ModelFireBase {
    
    let ref : DatabaseReference?
    
    init() {
        
        ref = Database.database().reference()
    }
    
    
}
