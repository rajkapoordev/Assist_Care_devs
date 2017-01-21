//
//  SignUpVC.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController,UITextFieldDelegate{

    @IBOutlet var scrollSignUp: UIScrollView!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var btnGoogle: UIButton!
    @IBOutlet var btnFacebook: UIButton!
    
    @IBAction func btnFacebook(_ sender: Any) {
        
    }
    
    @IBAction func btnGoogle(_ sender: Any) {
        
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let vc = VerificationVC(nibName: "VerificationVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        self.setInterface()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillHide"), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setInterface(){
        let backButton = UIBarButtonItem(
            title: "Sign Up",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = getFontColor()
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        btnSignUp.layer.cornerRadius = 2.0
        btnGoogle.layer.cornerRadius = 1.0
        btnFacebook.layer.cornerRadius = 1.0
        shadow(button: btnSignUp)
    }
    
    func keyboardWillAppear(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
            scrollSignUp.setContentOffset(CGPoint(x: 0.0, y: btnGoogle.frame.origin.y), animated: true)
        }
        
    }
    
    func keyboardWillHide() {
        scrollSignUp.setContentOffset(CGPoint(x: 0.0, y: -65), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func shadow(button:UIButton){
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
    }
    
}


