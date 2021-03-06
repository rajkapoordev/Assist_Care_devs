//
//  AppDelegate.swift
//  AssistCare
//
//  Created by LaNet on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import CoreData
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var fbToken:NSString = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GIDSignIn.sharedInstance().clientID = "327847630381-6dbe80qbvs1s4ollt9j75qt50p4aajeu.apps.googleusercontent.com"
        //For keyboard manager
        IQKeyboardManager.sharedManager().enable = true
        
        let vc = CategoryVC(nibName: "CategoryVC", bundle: nil)
      
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        self.window?.isUserInteractionEnabled = true
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        if (FBSDKAccessToken.current() != nil) {
            self.fbToken = FBSDKAccessToken.current()!.tokenString as NSString
            UserDefaults.standard.setValue(fbToken, forKey: "token")
        } else {
            //            if you are not logged
        }
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
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "AssistCare")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
}

