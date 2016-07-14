//
//  profileViewController.swift
//  first-version
//
//  Created by user on 11.07.16.
//  Copyright © 2016 volka. All rights reserved.
//

import UIKit

class profileViewController: UIViewController  , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var profileTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func startChattingButtonPressed(sender: UIButton) {
        
        
        guard let image  = imageView.image else {
            return
            
        }
        guard profileTextField.text?.characters.count > 0 else {
            return
        }
        
        let fileName = "\(Backendless.sharedInstance().userService.currentUser.objectId)\(NSDate().timeIntervalSince1970).jpeg"
        let data = UIImageJPEGRepresentation(image, 0.5)
        Backendless.sharedInstance().fileService.upload(fileName, content: data, response: { (file: BackendlessFile!) in
            //
            self.saveUser(Backendless.sharedInstance().userService.currentUser, imageURl: file.fileURL, name: self.profileTextField.text!)
            
            
        }) {(Fault: Fault!) in
            //
            print("server fault:\(Fault)")
        }

    }
    
    @IBAction func tabGestureRecognized(sender: AnyObject) {
   
   
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    

        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.contentMode = .ScaleAspectFill
        self.imageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func saveUser(user: BackendlessUser , imageURl: String , name: String){
        user.setProperty("profile", object: imageURl)
        user.setProperty("name", object: name)
        
        
        let dataStore = Backendless.sharedInstance().data.of(BackendlessUser.ofClass())
        
        
        // save object asynchronously
        dataStore.save(
            user,
            response: { (result: AnyObject!) -> Void in
                let obj = result as! BackendlessUser
                print("Contact has been saved: \(obj.objectId)")
                self.performSegueWithIdentifier("SegueList", sender: nil)
            },
            error: { (fault: Fault!) -> Void in
                print("fServer reported an error: \(fault)")
        })
        
    }
}
