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
    
    init(planName:String , exercises : [Exercise]){
        self.planName = planName
        self.exercises = exercises
    }
    
    func addExerciseToMyPlanList(execercise:Exercise){
        exercises.append(execercise)
    }
    
    func planToJson() -> [String:Any] {
        
        var jsonObj = [String:Any]()
        jsonObj["planName"] = planName
        
        jsonObj["exercises"] = exercisesToJason(exercises: exercises)
        print(jsonObj)
        return jsonObj
        
    }
    
    func exercisesToJason(exercises:[Exercise])->[String:Any]
    {
        var map=[String:Any]()
        for  exec in exercises{
//            map=exec.toJson()
            map[exec.name] = exec.toJson()
        }
        return map
    }
    
}
