//
//  SignUpVC.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet var scrollSignUp: UIScrollView!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    //  @IBOutlet var btnGoogle: UIButton!
    @IBOutlet var btnFacebook: UIButton!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        self.setInterface()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignUpVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        //Google sign in
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        //
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        btnSignUp.layer.cornerRadius = 2.0
        //       btnGoogle.layer.cornerRadius = 1.0
        btnFacebook.layer.cornerRadius = 2.0
        btnSignUp.shadow()
        scrollSignUp.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 490)

    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnFacebook(_ sender: Any) {
        
    }
    
    //  @IBAction func btnGoogle(_ sender: Any) {
    //
    //   }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let defaults = UserDefaults.standard
//        defaults.set(role, forKey: "UserRole")
//        defaults.synchronize()
//        let page = defaults.value(forKey: "UserRole") as! String
//        if (page == "Patient")
//        {
        
        let loginVC = VerificationVC(nibName: "VerificationVC", bundle: nil)
        self.navigationController?.pushViewController(loginVC, animated: true)
        //}
    }
    
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(user.authentication)
        if (error) != nil {
            print()
        }
        else {
            //Perform navigation here
        }
    }
    
    func keyboardWillAppear(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
            //       scrollSignUp.setContentOffset(CGPoint(x: 0.0, y: btnGoogle.frame.origin.y), animated: true)
        }
        
    }
    
    func keyboardWillHide() {
        scrollSignUp.setContentOffset(CGPoint(x: 0.0, y: -65), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


