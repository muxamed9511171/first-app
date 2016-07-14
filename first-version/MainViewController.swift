//
//  MainViewController.swift
//  first-version
//
//  Created by user on 11.07.16.
//  Copyright © 2016 volka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var introLabel: UILabel!

    @IBOutlet weak var instructOutlet: UIButton!
    @IBOutlet weak var aboutOutlet: UIButton!
    @IBOutlet weak var kazOutlet: UIButton!
    @IBOutlet weak var russOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "background.png")
        self.view.insertSubview(backgroundImage, atIndex: 0)
       
        
        instructOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
         aboutOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
         kazOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
         russOutlet.backgroundColor = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
    
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    
    
    
}
