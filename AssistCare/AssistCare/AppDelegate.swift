//
//  AppDelegate.swift
//  AssistCare
//
//  Created by LaNet on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GIDSignIn.sharedInstance().clientID = "327847630381-6dbe80qbvs1s4ollt9j75qt50p4aajeu.apps.googleusercontent.com"
        
        UINavigationBar.appearance().barTintColor = getAppColor()
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]

       let vc = ThanksVc(nibName: "ThanksVc", bundle: nil)
//        let vc = DisplayReviewVC(nibName: "DisplayReviewVC", bundle: nil)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        self.window?.isUserInteractionEnabled = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    
}

