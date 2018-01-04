//
//  ExerciseViewController.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    @IBOutlet weak var execriseName: UILabel!
    @IBOutlet weak var viewYouTube: UIWebView!
    @IBOutlet weak var exDesc: UILabel!
    
    
    var exercise : Exercise?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let exe = exercise {
        execriseName.text = exe.name
        exDesc.text = exe.execDescription
        let youtubeurl = exe.urlVideo
        print(youtubeurl)
        viewYouTube.allowsInlineMediaPlayback = true
        viewYouTube.loadHTMLString("<iframe width=\"\(viewYouTube.frame.width)\" height=\"\(viewYouTube.frame.height)\" src=\"\(youtubeurl)? &playsline=1\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
    
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
