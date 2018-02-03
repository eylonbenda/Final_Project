//
//  Model.swift
//  Final_Project
//
//  Created by Eylon Ben David on 15.1.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class ModelNotificationBase<T> {
    
    var name:String?
    
    init(name:String){
        self.name = name
    }
    
    func observe(callback:@escaping (T?)->Void)->Any{
        return NotificationCenter.default.addObserver(forName: NSNotification.Name(name!), object: nil, queue: nil) { (data) in
            if let data = data.userInfo?["data"] as? T {
                callback(data)
            }
        }
    }
    
    func post(data:T){
        NotificationCenter.default.post(name: NSNotification.Name(name!), object: self, userInfo: ["data":data])
    }
}

class ModelNotification {
    
    static let userList = ModelNotificationBase<[User]>(name: "UserListNotification")
    static let user = ModelNotificationBase<User>(name: "UserNotification")
    
    
    static func removeObserver(observer:Any){
        NotificationCenter.default.removeObserver(observer)
    
    }

}


class Model {
    
    
   	static let instance = Model()
    
    private lazy var usermodelFirebase = UserModelFirebase()
    private lazy var modelSql = ModelSQLite()
    
    private init(){
        
    }
    
    
    func addUser(user : User){
        
        usermodelFirebase.addNewUser(user: user)
        
    }
    
    func getUser(uid : String , callback : @escaping (User?) -> Void){
        
        usermodelFirebase.getUser(uid: uid, callback: callback)
    }
    
    func getAllUsers(callback : @escaping ([User]?)->Void){
        
        usermodelFirebase.getAllUsers(callback: callback)
    }
    
    func getAllUsersAndObserve(){

        // get last update date from SQL
        let lastUpdateDate = LastUpdateTable.getLastUpdateDate(database: modelSql?.database, table: "USERS")
        if lastUpdateDate != nil{
            print(lastUpdateDate!)
        }

        // get all updated records from firebase
        usermodelFirebase.getAllUsersAndObserve(lastUpdateDate: lastUpdateDate, callback: { (users) in
            //update the local db
            print("got \(users!.count) new records from FB")
            var lastUpdate:Date?
            for user in users!{
                user.addNewUser(database: self.modelSql?.database)
                print(user.uid ,user.lastUpdate)
                if lastUpdate == nil{
                    lastUpdate = user.lastUpdate
                }else{
                    if lastUpdate!.compare(user.lastUpdate!) == ComparisonResult.orderedAscending{
                        lastUpdate = user.lastUpdate
                    }
                }
            }

            //upadte the last update table
            if (lastUpdate != nil){
                LastUpdateTable.setLastUpdate(database: self.modelSql!.database, table: "USERS", lastUpdate: lastUpdate!)
            }

            //get the complete list from local DB
            let totalList = User.getAllUsers(database: self.modelSql?.database)
            print("\(totalList)")
            
            ModelNotification.userList.post(data: totalList)
        })

    }
    
    func updateUserImage(user : User  ){
        usermodelFirebase.updateUserImage(user: user)
        
    }
    
    
    
}
