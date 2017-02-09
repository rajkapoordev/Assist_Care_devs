//
//  SignInVC.swift
//  AssistCare
//
//  Created by LaNet on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class SignInVC: UIViewController, UITextFieldDelegate, GIDSignInDelegate {
    
    @IBOutlet var vwStatusBar: UIView!
    
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
         GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        //
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        self.navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        scrollViewMain.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 490)
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        btnSignIn.backgroundColor = AppColor.backColor
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
        let defaults = UserDefaults.standard
        let page = defaults.value(forKey: "UserRole") as! String

       // if !(page == "Patient"){
            let vc = TabBarVC(nibName: "TabBarVC", bundle: nil)
            let nav = UINavigationController(rootViewController: vc)
            nav.isNavigationBarHidden = true
            appDelegate().window?.rootViewController = nav
       /* }else{
        let varificationVC = VerificationVC(nibName: "VerificationVC", bundle: nil)
        self.navigationController?.pushViewController(varificationVC, animated: true)
        }*/

    }
    
    
}
