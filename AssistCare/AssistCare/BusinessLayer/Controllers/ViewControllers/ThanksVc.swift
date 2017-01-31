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
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }
    
    func setInterface() {
        
        let msg = NSString(string: "We personally review everyone that signs up before allowing use of the app in order to ensure a safe experience.\n\nYou'll recieve a notification and be able to book an appointment within 24 hours.")
        lblMsg.text = msg as String
        btnOk.shadow()
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func btnOkAction(_ sender: Any) {
//        let vc = TabBarVC(nibName: "TabBarVC", bundle: nil)
//        let nav = UINavigationController(rootViewController: vc)
//        nav.isNavigationBarHidden = true
//        appDelegate().window?.rootViewController = nav
        let vc = AppointmentVC(nibName: "AppointmentVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
