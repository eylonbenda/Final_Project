//
//  Users.swift
//  Final_Project
//
//  Created by admin on 03/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//
import Foundation


class User {
    
    var userName : String?
    var fullName :String?
    var email : String?
    var age: Int?
    var hight : Float?
    var wight : Float?
    var niv : String?
    var myPlans = [Plan]()
    
    
    
    init(email: String){
        self.email=email
    }
    
    //convert execrcise obj to json obj
    func userToJson() -> [String:Any] {
        
        var jsonObj = [String:Any]()
        jsonObj["userName"] = userName
        jsonObj["fullName"] = fullName
        jsonObj["email"] = email
        jsonObj["hight"] = hight
        jsonObj["wight"] = wight
        
        //jsonObj["myPlans"] = myPlan.tojson
        return jsonObj
        
    }
    
    
}
