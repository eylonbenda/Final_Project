//
//  Exercise.swift
//  Final_Project
//
//  Created by admin on 28/12/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation


class Exercise {
    
    
    var name : String = ""
    var urlImage : String = ""
    var urlVideo : String = ""
    
    
    //convert execrcise obj to json obj
    func toJson() -> [String:Any] {
        
        var jsonObj = [String:Any]()
        jsonObj["name"] = name
        jsonObj["urlImage"] = urlImage
        jsonObj["urlvideo"] = urlVideo
        return jsonObj
        
    }
    
    

    
    
    
    
    
}
