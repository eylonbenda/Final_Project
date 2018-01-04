//
//  UserModelFirebase.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Firebase

class UserModelFirebase : ModelFireBase {
    
    
    override init() {
        
        super.init()
        
        
    }
    
    
    
    func addNewUser(user : User){
        
        let myRef = ref?.child("Users").child(user.email!)
        myRef?.setValue(user.userToJson())
        
        
        
        
    }
    
    
    
    
    
    
    
}
