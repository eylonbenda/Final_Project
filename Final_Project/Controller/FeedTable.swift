//
//  FeedTable.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class FeedTable: UITableViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate , RecievePost {
    
   
    @IBOutlet var feedTable: UITableView!
    
    var users = [User]()
    
    var listPosts = [Post]()
    var post : Post?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        ModelNotification.postList.observe { (posts) in
            
            if posts != nil {
                
                self.listPosts = posts!
                self.feedTable.reloadData()
            }
        }
        
        Model.instance.getAllPostsAndObserve()
       

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
           
            
        } else {
            
            performSegue(withIdentifier: "goToAuth", sender: self)
            
        }
    }
    @IBAction func LogOutPress(_ sender: Any) {
        
        SVProgressHUD.show()
        
        do {
            try Auth.auth().signOut()
            print("sighned out!")
            //self.dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "goToAuth", sender: self)
            SVProgressHUD.dismiss()
            
        }
        catch {
            print("error login out")
            SVProgressHUD.dismiss()
        }
        
        
    }
    @IBAction func uploadPost(_ sender: Any) {
        
        performSegue(withIdentifier: "addPostSegue" , sender: self)
    }
    
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listPosts.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed_cell", for: indexPath) as! FeedTableViewCell
        
        let post = listPosts[indexPath.row]
        
        if post.urlImage != nil {
            
            cell.userName.text = post.author
            cell.postDes.text = post.description
            ModelFilesStore.getImage(name: post.description!, urlStr: post.urlImage!, callback: { (image) in
                cell.imageCell.image = image
            })
            
        }
        
        return cell
    }
    
   func getPost(newPost: Post) {
    
        listPosts.append(newPost)
        
        
    }
    
    func configureTableView(){
        
        feedTable.estimatedRowHeight = 140
        feedTable.rowHeight =  UITableViewAutomaticDimension
        
        
    }
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

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
