//
//  FeedTable.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase

class FeedTable: UITableViewController {
    
   
    var model : UserModelFirebase?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        model = UserModelFirebase()
        
        
        model?.getUser(userName: "bendaa", callback: { (user) in
            print(user?.email)
        })
        model?.getAllUsers(callback: { (users) in
          
            for userr in users!{
                print(userr.email!)
                }
        })
//        model?.getUser(email: "lala", callback: { (user) in
//
//            if user != nil{
//                print(user?.email! , user?.fullName! )
//                for plan in (user?.myPlans)!{
//                    if plan != nil {
//                        for exe in plan.exercises{
//                            print(exe.name)
//                        }
//
//                    }
//                }
//            }
//
//        })
       
        
//        var sqlmodel = ModelSQLite()
//
//        sqlmodel.addNewExercise(exercise: Exercise(name: "pull-up", urlImage: "blalv.png", urlVideo: "youtube.com", execDescription: "good"))
//        var exercises = [Exercise]()
//        exercises = sqlmodel.getAllExercises()
//        for exe in exercises{
//            print(exe.name , exe.urlImage)
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
        } else {
            
            performSegue(withIdentifier: "goToAuth", sender: self)
            
        }
    }
    @IBAction func LogOutPress(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("sighned out!")
            //self.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "goToAuth", sender: self)
            
        }
        catch {
            print("error login out")
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
