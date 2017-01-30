//
//  TermAndConditionVC.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class TermAndConditionVC: UIViewController {

    @IBOutlet var btnDisAgree: UIButton!
  
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnAgree: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAgree.shadow()
        btnDisAgree.shadow()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnBackClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)

    }
    @IBAction func btnDisagreeClick(_ sender: UIButton) {
    }
    
    
    @IBAction func btnAgree(_ sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
