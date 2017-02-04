//
//  PaymentDetailsVc.swift
//  AssistCare
//
//  Created by LaNet on 1/18/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PaymentDetailsVc: UIViewController,UITextFieldDelegate {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var vwStatusBar: UIView!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var btnSkipForNow: UIButton!
    @IBOutlet var txtCVC: UITextField!
    @IBOutlet var txtCardNumber: UITextField!
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtCardName: UITextField!
    @IBOutlet var txtPromoCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Edit Profile"
        self.tabBarController?.tabBar.isHidden = true
        
        self.automaticallyAdjustsScrollViewInsets = false
        scrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 503)
        txtCVC.delegate = self
        txtDate.delegate = self
        txtCardName.delegate = self
        txtPromoCode.delegate = self
        txtCardNumber.delegate = self
        
        txtCVC.setBottomBorder()
        txtCardNumber.setBottomBorder()
        txtPromoCode.setBottomBorder()
        txtDate.setBottomBorder()
        txtCardName.setBottomBorder()
        btnSkipForNow.shadow()
        btnSave.shadow()
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: false)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtPromoCode
        {
            txtCardName.becomeFirstResponder()
            return true
        }
        else if textField == txtCardName
        {
            txtCardNumber.becomeFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0.0, y: ScreenSize.SCREEN_WIDTH/2), animated: true)
        }
        else if textField == txtCardNumber
        {
            txtDate.becomeFirstResponder()
        }
        else if textField == txtDate
        {
            txtCVC.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
        let vc = ThanksVc(nibName: "ThanksVc", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @IBAction func btnSkipAction(_ sender: Any) {
        
    }

}
