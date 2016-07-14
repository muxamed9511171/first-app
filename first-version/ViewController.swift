//
//  ViewController.swift
//  first-version
//
//  Created by user on 11.07.16.
//  Copyright © 2016 volka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forgotOutlet: UIButton!
    @IBOutlet weak var registerOutlet: UIButton!
    @IBOutlet weak var loginOutlet: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        loginOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
        
        registerOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
        forgotOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)

        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func registerUserAsync(email: String , password: String) {
        
        let user = BackendlessUser()
        user.email = email
        user.password = password
        
        Backendless.sharedInstance().userService.registering(user,
                            response: { (registeredUser : BackendlessUser!) -> () in
        print("User has been registered (ASYNC): \(registeredUser)")
             self.loginUserAsync(email, password: password)
            },    error: { ( fault : Fault!) -> () in
                                                                print("Server reported an error: \(fault)")
            }
        )
    }
    
    func loginUserAsync(email: String , password: String) {
        Backendless.sharedInstance().userService.setStayLoggedIn( true )
        Backendless.sharedInstance().userService.login(
            email, password:password,
            response: { ( user : BackendlessUser!) -> () in
                print("User has been logged in (ASYNC): \(user)")
                self.performSegueWithIdentifier("SegueProfile", sender: nil)
            },
            error: { ( fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
            }
        )
    }
    
    
    func userPasswordRecoveryAsync(email: String ) {
        
        Backendless.sharedInstance().userService.restorePassword( email,
       response:{ ( result : AnyObject!) -> () in
            print("Check your email address! result = \(result)")
        },
        error: { ( fault : Fault!) -> () in
            print("Server reported an error: \(fault)")
           }
        )
    }

    
    
    

    @IBAction func signInPressed(sender: UIButton) {
        guard let email = emailTextField.text where emailTextField.text!.characters.count > 0 else {
            return
            
        }
        guard let password = passwordTextField.text where passwordTextField.text?.characters.count > 0 else {
            return
            
        }
        self.loginUserAsync(email, password: password)
        
    }
    
    @IBAction func signUpButtonPressed(sender: UIButton) {
        guard let email = emailTextField.text where emailTextField.text!.characters.count > 0 else {
            return
            
        }
        guard let password = passwordTextField.text where passwordTextField.text?.characters.count > 0 else {
            return
            
        }
        
        self.registerUserAsync(email, password: password)
        
    }
    
    
    
    
    
    
    @IBAction func forgotPasswordPressed(sender: UIButton) {
        guard let email = emailTextField.text where emailTextField.text!.characters.count > 0 else {
            return
            
        }
        self.userPasswordRecoveryAsync(email)
       // forgotPasswordPressed(email)
        
        
    }
    
}

