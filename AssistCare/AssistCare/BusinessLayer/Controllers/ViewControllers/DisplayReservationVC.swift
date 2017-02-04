//
//  DisplayReservationVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/30/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class DisplayReservationVC: UIViewController {
    
    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var lbDate: UILabel!
    @IBOutlet var btnOk: UIButton!

    @IBOutlet var vwUserDetails: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        vwStatusBar.backgroundColor = AppColor.skyStatusBar
   }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.btnOk.shadowWithBorder()
//        self.vwUserDetails.shadowWithBorder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnOkClicked(_ sender: Any) {
    }

}
