//
//  FeedTableViewCell.swift
//  Final_Project
//
//  Created by admin on 14/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var postDes: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var commentContent: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    @IBAction func addComment(_ sender: Any) {
        var cmtContent = commentContent.text!
        var comment = Comment(content: cmtContent, author: userName.text!)
        
        
    }
    
}
