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
    var age: String?
    var hight : String?
    var wight : String?
    var myPlans = [Plan]()
    
    
    
    init(email: String , userName : String , fullName : String , hight : String , wight : String){
        self.email=email
        self.userName = userName
        self.fullName = fullName
        self.hight = hight
        self.wight = wight
    }
    
    //convert execrcise obj to json obj
    func userToJson() -> [String:Any] {
        
        var jsonObj = [String:Any]()
        jsonObj["userName"] = userName
        jsonObj["fullName"] = fullName
        jsonObj["email"] = email
        jsonObj["hight"] = hight
        jsonObj["wight"] = wight
        
//        jsonObj["myPlans"] = myPlanToJson(myPlans: myPlans)
        print("check")
        return jsonObj
        
    }
    
    func convertMyPlanToJson() -> [String:Any]{
        
        var json = [String:Any]()
        json["myPlans"] = myPlanToJson(myPlans: myPlans)
        return json
        
    }
    
    func myPlanToJson(myPlans:[Plan])->[String:Any]
    {
        var map=[String:Any]()
        for  plan in myPlans{
            map[plan.planName!] = plan.planToJson()
        }
        return map
    }
    
    
}
