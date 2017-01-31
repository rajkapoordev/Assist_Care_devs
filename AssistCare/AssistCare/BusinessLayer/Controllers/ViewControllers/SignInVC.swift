//
//  SignInVC.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class SignInVC: UIViewController, UITextFieldDelegate, GIDSignInDelegate {
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var scrollViewMain: UIScrollView!
    @IBOutlet var btnSignInWithFB: UIButton!
    @IBOutlet weak var btnSignInWithGP: GIDSignInButton!
    
    @IBOutlet var lblInfoText: UILabel!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
        
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        //
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        scrollViewMain.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 490)
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        btnSignIn.shadow()
    }
    
    //Google sign in method
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(user.authentication)
        if (error) != nil {
            print()
        }
        else {
            //Perform navigation here
        }
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        
              let varificationVC = VerificationVC(nibName: "VerificationVC", bundle: nil)
        self.navigationController?.pushViewController(varificationVC, animated: true)

    }
    
    
}
