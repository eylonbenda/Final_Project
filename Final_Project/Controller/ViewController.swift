//
//  ViewController.swift
//  Final_Project
//
//  Created by admin on 24/12/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if Auth.auth().currentUser != nil {
//            performSegue(withIdentifier: "goToMainView", sender: self)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func registerPress(_ sender: Any) {
        
        performSegue(withIdentifier: "goToRegister", sender: self)
        
        
        
    }
    
    @IBAction func loginPress(_ sender: Any) {
        
        
        performSegue(withIdentifier: "goToLogin", sender: self)
        
    }
}

