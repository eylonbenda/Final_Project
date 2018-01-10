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
            
            if let values = snapshot.value as? [String :  Any] {
                
                let user = User(fromJson: values)
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
    
    func saveImageToFirebase(image:UIImage, name:(String),callback:@escaping (String?)->Void){
        let filesRef = storageRef?.child(name)
        if let data = UIImageJPEGRepresentation(image, 0.8) {
            filesRef?.putData(data, metadata: nil){ (metadata,error) in
                
                if (error != nil) {
                    callback(nil)
                } else {
                    let downloadURL = metadata!.downloadURL()
                    callback(downloadURL?.absoluteString)
                }
                
            }
        }
    }
    
    func getImageFromFirebase(url:String,callback:@escaping (UIImage?)->Void){
            let ref = storageRef?.child(url)
            ref?.getData(maxSize: 10000000) { (data, error) in
            if (error == nil && data != nil){
                let image = UIImage(data: data!)
                callback(image)
            }else{
                callback(nil)
            }
        }
        
    }
    
    

    
}
