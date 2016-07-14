//
//  AppDelegate.swift
//  first-version
//
//  Created by user on 11.07.16.
//  Copyright © 2016 volka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let APP_ID = "014E41C9-BD89-50A3-FF7A-DC0673451C00"
    let SECRET_KEY = "B26EC7EF-C287-358F-FFF3-03D5EAEF5400"
    let VERSION_NUM = "v1"
    
    var backendless = Backendless.sharedInstance()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        
        
        if backendless.userService.currentUser == nil {
            //login LoginVC
            self.goToViewController("LoginVC")
            
        } else {
            //enter : FriendsNC
            self.goToViewController("FriendsNC")
        }
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func goToViewController (storyboardID: String){
        let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier(storyboardID)
        self.window?.rootViewController = vc
    }
        
        
        
        
        
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

