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
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var btnSkipForNow: UIButton!
    @IBOutlet var txtCVC: UITextField!
    @IBOutlet var txtCardNumber: UITextField!
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtCardName: UITextField!
    @IBOutlet var txtPromoCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            scrollView.setContentOffset(CGPoint(x: 0.0, y: screenSize.width/2), animated: true)
      
//            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: .UIKeyboardWillShow, object: nil)
//            NotificationCenter.default.addObserver(self, selector: #selector(PaymentDetailsVc.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
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
            keyboardWillHide()
            textField.resignFirstResponder()
        }
        return true
    }

    func keyboardWillAppear(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
           scrollView.setContentOffset(CGPoint(x: 0.0, y: screenSize.width/2), animated: true)
        }
        
    }

    func keyboardWillHide() {
        scrollView.setContentOffset(CGPoint(x: 0.0, y: 0), animated: true)
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
        let vc = ThanksVc(nibName: "ThanksVc", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @IBAction func btnSkipAction(_ sender: Any) {
        
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
