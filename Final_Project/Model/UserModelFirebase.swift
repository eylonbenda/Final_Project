//
//  UserModelFirebase.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Firebase

class UserModelFirebase  {
    
     let ref : DatabaseReference?
     var storageRef : StorageReference?
    
     init() {
        
        ref = Database.database().reference()
         storageRef = Storage.storage().reference()
    }
    
    
    
    func addNewUser(user : User){
        
        let myRef = ref?.child("Users").child(user.userName!)
        myRef?.setValue(user.userToJson())
        
        
    }
    
    
    func addTrainPlanToUser(user : User){
        
        let myRef = ref?.child("Users").child(user.userName!).child("myPlans")
        myRef?.setValue(user.convertMyPlanToJson())
    }
    
    
    func getUser(userName : String , callback : @escaping (User?) -> Void){
        
        
         let myRef = ref?.child("Users").child(userName)
        myRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let value = snapshot.value as? [String :  Any] {
                let user = User(fromJson: value)
                callback(user)
            } else {
                callback(nil)
            }
        })
        
        
        
    }
    
    func getAllUsers(callback : @escaping ([User]?)->Void){
        
        
        let myRef = ref?.child("Users")
        myRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let values = snapshot.value as? [String : [String : Any]] {
                
                var usersArr = [User]()
                for userJson in values{
                    
                    let user = User(fromJson: userJson.value)
                    usersArr.append(user)
                }
                
                callback(usersArr)
                
            } else {
                
                callback(nil)
            }
            
        })
        
        
    }
    
   
    
    

    
}
