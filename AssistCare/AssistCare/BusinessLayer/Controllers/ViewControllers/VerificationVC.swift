//
//  VerificationVC.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class VerificationVC: UIViewController ,UITextFieldDelegate{

    @IBOutlet var txtEnterNum: UITextField!
    
    @IBOutlet var vwStatusBar: UIView!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var btnNext: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }
    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        txtEnterNum.setBottomBorder()
        txtEnterNum.delegate = self
        btnNext.shadow()
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        let vc = VerificationLoadingVC(nibName: "VerificationLoadingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
