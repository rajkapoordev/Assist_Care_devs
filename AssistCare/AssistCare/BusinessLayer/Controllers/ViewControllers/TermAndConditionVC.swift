//
//  TermAndConditionVC.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class TermAndConditionVC: UIViewController {

    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var btnDisAgree: UIButton!
  
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnAgree: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAgree.shadow()
        btnDisAgree.shadow()

    }
    
    
    @IBAction func btnBackClick(_ sender: UIButton) {
        navigationController!.popViewController(animated: false)

    }
    @IBAction func btnDisagreeClick(_ sender: UIButton) {
        let vc = EditProfileCareGiver(nibName: "EditProfileCareGiver", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btnAgree(_ sender: UIButton) {
        let vc = ThanksVc(nibName: "ThanksVc", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
