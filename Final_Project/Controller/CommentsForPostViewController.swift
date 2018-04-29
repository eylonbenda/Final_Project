//
//  CommentsForPostViewController.swift
//  Final_Project
//
//  Created by admin on 27/04/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class CommentsForPostViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var input: UITextField!
    var commmentsList = [Comment]()
    var currentUser : User?
    var post : Post?
    
    @IBOutlet weak var commentsTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commmentsList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsForPostCell", for: indexPath) as! CommentsForPostCell
        let comment = post?.comments[indexPath.row]
        cell.userName.text = comment?.author
        cell.commentContent.text = comment?.content
        
        
        return cell
        
    }
    
    @IBAction func addComment(_ sender: Any) {
        
        let comment = Comment(content: input.text!, author: (currentUser?.userName)!)
        post?.comments.append(comment)
        Model.instance.addCommentToPost(post: post!)
        commentsTable.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commentsTable.estimatedRowHeight = 65.0
        commentsTable.rowHeight =  UITableViewAutomaticDimension
        
        Model.instance.getPostById(post: post!) { (post) in
            if post != nil {
            self.post = post
            self.commentsTable.reloadData()
        }
    }
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
