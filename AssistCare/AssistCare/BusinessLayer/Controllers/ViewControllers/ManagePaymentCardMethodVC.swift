//
//  ManagePaymentMethodVC.swift
//  AssistCare
//
//  Created by LaNet on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class ManagePaymentCardMethodVC: UIViewController, UITextFieldDelegate {
 
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var txtPaymentType: UITextField!
    @IBOutlet var txtNameOfCard: UITextField!
    @IBOutlet var txtCardNumber:UITextField!
    @IBOutlet var txtCardExpDate: UITextField!
    @IBOutlet var txtCVC: UITextField!
    
    @IBOutlet var lblPaymentType: UILabel!
    @IBOutlet var lblNameOfCard: UILabel!
    @IBOutlet var lblCardNumber:UILabel!
    @IBOutlet var lblCardExpDate: UILabel!
    @IBOutlet var lblCVC: UILabel!
    
    @IBOutlet var lblInfoText: UILabel!
    @IBOutlet var btnCameraScan: UIButton!
    @IBOutlet var btnSave: UIButton!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //For setting interface design
    func setInterface() {
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        scrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 520)
        lblNavTitle.text = "Add Payment Method"
        self.tabBarController?.tabBar.isHidden = true
        
        txtPaymentType.setBottomBorder()
        txtNameOfCard.setBottomBorder()
        txtCardNumber.setBottomBorder()
        txtCardExpDate.setBottomBorder()
        txtCVC.setBottomBorder()
        shadow(button: btnSave)
        btnSave.isEnabled = true
        
        txtPaymentType.delegate = self
        txtNameOfCard.delegate = self
        txtCardNumber.delegate = self
        txtCardExpDate.delegate = self
        txtCVC.delegate = self
        
        lblPaymentType.isHidden = true
        lblNameOfCard.isHidden = true
        lblCardNumber.isHidden = true
        lblCardExpDate.isHidden = true
        lblCVC.isHidden = true
        
    }

    //Save payment method
    @IBAction func btnSave(_ sender: UIButton) {
        btnSave.backgroundColor = AppColor.skyColor
        let vc = PaymentCardDetailVC(nibName: "PaymentCardDetailVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == txtPaymentType) {
            lblPaymentType.isHidden = false
        }else if(textField == txtNameOfCard) {
            lblNameOfCard.isHidden = false
        }else if(textField == txtCardNumber) {
            lblCardNumber.isHidden = false
        }else if(textField == txtCardExpDate) {
            lblCardExpDate.isHidden = false
        }else {
            lblCVC.isHidden = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(!(textField.text?.isEmpty)!) {
            if (textField == txtPaymentType) {
                txtNameOfCard.becomeFirstResponder()
            }else if(textField == txtNameOfCard) {
                txtCardNumber.becomeFirstResponder()
            }else if(textField == txtCardNumber) {
                txtCardExpDate.becomeFirstResponder()
            }else if(textField == txtCardExpDate) {
                txtCVC.becomeFirstResponder()
            }else {
                textField.resignFirstResponder()
            }
        }else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //Here perfom validation
    func validateText(){
        
    }
    
    func shadow(button:UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
    }

    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
}
