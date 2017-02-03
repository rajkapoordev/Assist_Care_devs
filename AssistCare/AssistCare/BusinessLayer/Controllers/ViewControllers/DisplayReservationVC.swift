//
//  DisplayReservationVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/30/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class DisplayReservationVC: UIViewController {
    @IBOutlet var lbDate: UILabel!
    @IBOutlet var btnOk: UIButton!

    @IBOutlet var vwUserDetails: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
