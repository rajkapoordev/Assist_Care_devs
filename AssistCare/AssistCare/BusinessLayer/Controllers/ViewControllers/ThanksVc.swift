//
//  ThanksVc.swift
//  AssistCare
//
//  Created by LaNet on 1/18/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class ThanksVc: UIViewController {
    
    @IBOutlet var btnOk: UIButton!
    @IBOutlet var lblMsg: UILabel!
    var msg:NSString!
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }
    
    func setInterface() {
        let defaults = UserDefaults.standard
        let page = defaults.value(forKey: "UserRole") as! String
        if !(page == "Patient"){
            msg = NSString(string:"THanks for submitting your application.We'll do our best to get back to you within 3 business days,so sit tight and we'll get back to you ASAP on the e-mail address or phone number you provided.")
        }
        else{
            
        msg = NSString(string: "We personally review everyone that signs up before allowing use of the app in order to ensure a safe experience.\n\nYou'll recieve a notification and be able to book an appointment within 24 hours.")
        }
    
        lblMsg.text = msg as String
        btnOk.shadow()
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func btnOkAction(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let page = defaults.value(forKey: "UserRole") as! String
        if !(page == "Patient"){
            let vc = CategoryVC(nibName: "CategoryVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: false)
        }else{
            let vc = TabBarVC(nibName: "TabBarVC", bundle: nil)
            let nav = UINavigationController(rootViewController: vc)
            nav.isNavigationBarHidden = true
            appDelegate().window?.rootViewController = nav
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
