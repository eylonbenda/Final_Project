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
        
        jsonObj["myPlans"] = myPlanToJson(myPlans: myPlans)
        print("check")
        return jsonObj
        
    }
    
    func myPlanToJson(myPlans:[Plan])->[String:Any]
    {
        var map=[String:Any]()
        for  plan in myPlans{
            map = plan.planToJson()
        }
        return map
    }
    
    
}
