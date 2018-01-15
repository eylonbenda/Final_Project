//
//  Model.swift
//  Final_Project
//
//  Created by Eylon Ben David on 15.1.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation




class Model {
    
    
   	static let instance = Model()
    
    private lazy var usermodelFirebase = UserModelFirebase()
    private lazy var userModelSql = ModelSQLite()
    
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
    
//    func getAllUsersAndObserve(callback : @escaping ([User]?)->Void){
//
//        // get last update date from SQL
//        let lastUpdateDate = LastUpdateTable.getLastUpdateDate(database: modelSql?.database, table: Student.ST_TABLE)
//
//        // get all updated records from firebase
//        ModelFirebase.getAllStudentsAndObserve(lastUpdateDate, callback: { (students) in
//            //update the local db
//            print("got \(students.count) new records from FB")
//            var lastUpdate:Date?
//            for st in students{
//                st.addStudentToLocalDb(database: self.modelSql?.database)
//                if lastUpdate == nil{
//                    lastUpdate = st.lastUpdate
//                }else{
//                    if lastUpdate!.compare(st.lastUpdate!) == ComparisonResult.orderedAscending{
//                        lastUpdate = st.lastUpdate
//                    }
//                }
//            }
//
//            //upadte the last update table
//            if (lastUpdate != nil){
//                LastUpdateTable.setLastUpdate(database: self.modelSql!.database, table: Student.ST_TABLE, lastUpdate: lastUpdate!)
//            }
//
//            //get the complete list from local DB
//            let totalList = Student.getAllStudentsFromLocalDb(database: self.modelSql?.database)
//            print("\(totalList)")
//
//            ModelNotification.StudentList.post(data: totalList)
//        })
//
//    }
    
    func updateUserImage(user : User  ){
        usermodelFirebase.updateUserImage(user: user)
    }
    
    
}
