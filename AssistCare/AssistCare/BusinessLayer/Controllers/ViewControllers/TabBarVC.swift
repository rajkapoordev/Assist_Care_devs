//
//  TabBarVC.swift
//  AssistCare
//
//  Created by LaNet on 1/19/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class TabBarVC:UITabBarController,UITabBarControllerDelegate {
    
    var selectedVC: Int = Int()
    var myVC1:UIViewController!
    var myVC2 = CalenderGraphVC()
    var myVC3 = CareGiverNotificationVC()
    var myVC4 = CareGiverMessageVC()
    let heightOfTabBar : CGFloat = 50
    var page:String!
    
    var navigationVC1 = UINavigationController()
    var navigationVC2 = UINavigationController()
    var navigationVC3 = UINavigationController()
    var navigationVC4 = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        //        defaults.set(role, forKey: "UserRole")
        //        defaults.synchronize()
        
        page = defaults.value(forKey: "UserRole") as! String
        if (page == "Patient"){
            myVC1 = AppointmentVC()
        }else{
            myVC1 = CareGiverAgendaVC()
        }
        setupTabBar()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    class var sharedInstance:TabBarVC {
        struct Singleton {
            static let instance = TabBarVC()
        }
        return Singleton.instance
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTabBar()
    {
        self.tabBar.tintColor = UIColor.white
        if (page == "Patient"){
            self.myVC1 = AppointmentVC(nibName: "AppointmentVC", bundle: nil)
        }else{
            self.myVC1 = CareGiverAgendaVC(nibName: "CareGiverAgendaVC", bundle: nil)
        }
        
        self.myVC2 = CalenderGraphVC(nibName: "CalenderGraphVC", bundle: nil)
        self.myVC3 = CareGiverNotificationVC(nibName:"CareGiverNotificationVC", bundle: nil)
        self.myVC4 = CareGiverMessageVC(nibName:"CareGiverMessageVC", bundle: nil)
        
        self.navigationVC1 = UINavigationController(rootViewController: myVC1)
        self.navigationVC2 = UINavigationController(rootViewController: myVC2)
        self.navigationVC3 = UINavigationController(rootViewController: myVC3)
        self.navigationVC4 = UINavigationController(rootViewController: myVC4)
        
        self.navigationVC1.isNavigationBarHidden = true
        self.navigationVC2.isNavigationBarHidden = true
        self.navigationVC4.isNavigationBarHidden = true
        self.navigationVC3.isNavigationBarHidden = true
        
        self.myVC1.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "home_tab.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),tag: 0)
        self.myVC1.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        
        self.myVC2.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "calendar_tab.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            ,            tag: 1)
        self.myVC2.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        
        self.myVC3.tabBarItem = UITabBarItem(
            title: "",
            image:  UIImage(named: "bell_tab.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            tag:2)
        self.myVC3.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        self.myVC4.tabBarItem = UITabBarItem(
            title: "",
            image:  UIImage(named: "chat_tab.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            tag:3)
        self.myVC4.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        
        //  let tabBarItemSize = CGSize(width: tabBar.frame.width / 4, height: heightOfTabBar)
        // tabBar.selectionIndicatorImage = imageWithColor(color: getGrayColor(), size: tabBarItemSize)
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = AppColor.redColor
        //UIColor(red: 0.0/255.0, gree: 176.0/255.0, blue:171.0/255.0, alpha: 1.0)
        let arrControllers = [self.navigationVC1,self.navigationVC2,self.navigationVC3,self.navigationVC4]
        //self.tabBar.backgroundColor = UIColor(red: 0.0/255.0, green: 176.0/255.0, blue:171.0/255.0, alpha: 1.0)
        self.viewControllers = arrControllers
        delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame: CGRect = self.tabBar.frame
        tabFrame.size.height = heightOfTabBar
        tabFrame.origin.y = ScreenSize.SCREEN_HEIGHT - heightOfTabBar
        self.tabBar.frame = tabFrame
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect : CGRect = CGRect(x: 0, y: 0, width: size.width, height: heightOfTabBar)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        self.myVC1.tabBarItem.title = ""
        self.myVC2.tabBarItem.title = ""
        self.myVC3.tabBarItem.title = ""
        self.myVC4.tabBarItem.title = ""
        if (item.tag == 0) {
            item.title = "Home"
            self.tabBar.barTintColor = AppColor.redColor
        }else if (item.tag == 1) {
            item.title = "Calender"
            self.tabBar.barTintColor = AppColor.skyColor
        }
        else if (item.tag == 2) {
            item.title = "Notifications"
            self.tabBar.barTintColor = AppColor.greenColor
        }else {
            item.title = "Messages"
            self.tabBar.barTintColor = AppColor.orangeColor
        }
    }
    
}
