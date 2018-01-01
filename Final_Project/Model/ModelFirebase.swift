//
//  ModelFirebase.swift
//  Final_Project
//
//  Created by admin on 31/12/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


class ModelFirebase {
    
    let ref : DatabaseReference?
    
    init() {
        FirebaseApp.configure()
        ref = Database.database().reference()
        
    }
    
    //TODO: add function addNewExercise(Exercsie)
    
    
    
    
}
