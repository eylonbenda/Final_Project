//
//  ProfileViewController.swift
//  Final_Project
//
//  Created by admin on 04/01/2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    var image : UIImage?
 
    var currentUser : User?
    var userModel : UserModelFirebase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       userModel = UserModelFirebase()
        let uid = Auth.auth().currentUser?.uid
        
        userModel?.getUser(uid: uid!, callback: { (user) in
            
            self.currentUser = user
            self.userName.text = user?.userName
            if user?.urlImage != nil {
                
                ModelFilesStore.getImage(name:(user?.userName)!, urlStr: (user?.urlImage)!, callback: { (profileImage) in
                    self.profileImage.image = profileImage
                })
                
            }
            
        })
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeImage(_ sender: Any) {
        
        if  UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else if  UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        self.profileImage.image = image
        self.dismiss(animated: true, completion: nil)
        
        
        //save to local and remote DB image-profile
        ModelFilesStore.saveImage(image: image!, name: (currentUser?.userName)!) { (url) in
            //update user in firebase
            print(url!)
            self.currentUser?.urlImage = url
            self.userModel?.updateUserImage(user: self.currentUser!)
        }
        
        
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
