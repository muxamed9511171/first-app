//
//  VideoViewController.swift
//  first-version
//
//  Created by user on 11.07.16.
//  Copyright © 2016 volka. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
     var list: List!

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       print(list.state!)
        
        videoTitleLabel.text = list.title
        themeLabel.text = list.subtitle
        countLabel.text = "500"
        
        let YoutubeVideoLink:String = "https://www.youtube.com/embed/"+list.state!
        let width = 400
        let height = 188
        let frame = 0
        let Code:NSString = "<iframe width=\(width) height=\(height) src=\(YoutubeVideoLink) frameborder=\(frame) allowfullscreen></iframe>";
        self.webView.loadHTMLString(Code as String, baseURL: nil)
        
        

       
        
        
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
