//
//  Plan.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class Plan{
    var planName: String?
    var exercises = [Exercise]()
    
    init(planName:String){
        
    }
    
    func addExerciseToMyPlanList(execercise:Exercise){
        exercises.append(execercise)
    }
    
    func planToJson() -> [String:Any] {
        
        var jsonObj = [String:Any]()
        jsonObj["planName"] = planName
        //jsonObj["myPlans"] = myPlan.tojson
        
        return jsonObj
        
    }
    
    
    
}
