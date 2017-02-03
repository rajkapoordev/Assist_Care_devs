//
//  SignUpVC.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKShareKit

class SignUpVC: UIViewController, UITextFieldDelegate, GIDSignInDelegate , FBSDKLoginButtonDelegate{
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet var scrollSignUp: UIScrollView!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    //  @IBOutlet var btnGoogle: UIButton!
    @IBOutlet var btnFacebook: FBSDKLoginButton!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    var imageView : UIImageView!
    var label : UILabel!
    var imagePost : UIImage!
    var imageViewPost : UIImageView!
    var postButtonMsg : UIButton!
    var postButtonPhoto : UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        
        self.setInterface()
        //Google sign in
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        //
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    override func viewWillLayoutSubviews() {
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
        btnSignUp.shadow()
        btnFacebook.shadow()
        scrollSignUp.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 490)

    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setUpViewsWhenUserLoggedIn() {
        imageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width/2 - 50, y: 70, width: 100, height: 100))
        imageView.bounds.origin = CGPoint(x: UIScreen.main.bounds.width/2 - imageView.frame.size.width/2, y: UIScreen.main.bounds.height/2 - imageView.frame.size.height/2)
        imageView.image = UIImage(named: "face.png")
        view.addSubview(imageView)
        
        label = UILabel(frame: CGRect(x: imageView.frame.origin.x, y: imageView.frame.height/2 + imageView.frame.origin.y + 30, width: 200, height: 30))
        label.bounds.origin = CGPoint(x: UIScreen.main.bounds.width/2 - label.frame.size.width/2, y: imageView.frame.origin.y + imageView.frame.size.height + 30)
        label.text = "Not Logged In"
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
        
        postButtonMsg = UIButton(frame: CGRect(x: imageView.frame.origin.x, y: label.frame.height/2 + label.frame.origin.y + 30, width: 300, height: 30))
        postButtonMsg.bounds.origin = CGPoint(x: UIScreen.main.bounds.width/2 - postButtonMsg.frame.size.width/2, y: label.frame.origin.y + label.frame.size.height + 30)
        postButtonMsg.setTitle("Post a Message", for: UIControlState.normal)
        postButtonMsg.setTitleColor(UIColor.blue, for: UIControlState.normal)
        postButtonMsg.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)
        //        postButtonMsg.addTarget(self, action: Selector("btnPostMsg:"), for: UIControlEvents.touchUpInside)
        postButtonMsg.addTarget(self, action: #selector(btnPostMsg(_:)), for: .touchUpInside)
        
        view.addSubview(postButtonMsg)
        
        postButtonPhoto = UIButton(frame: CGRect(x: imageView.frame.origin.x, y: postButtonMsg.frame.height/2 + postButtonMsg.frame.origin.y + 30, width: 300, height: 30))
        postButtonPhoto.bounds.origin = CGPoint(x: UIScreen.main.bounds.width/2 - postButtonPhoto.frame.size.width/2, y: postButtonMsg.frame.origin.y + postButtonMsg.frame.size.height + 30)
        postButtonPhoto.setTitle("Post a Photo", for: UIControlState.normal)
        postButtonPhoto.setTitleColor(UIColor.blue, for: UIControlState.normal)
        postButtonPhoto.setTitleColor(UIColor.cyan, for: UIControlState.highlighted)
        postButtonPhoto.addTarget(self, action: Selector("btnPostPhoto:"), for: UIControlEvents.touchUpInside)
        view.addSubview(postButtonPhoto)
        
    }
    
    func setUpViewsWhenUserNotLoggedIn() {
        
        imagePost = UIImage(named: "face_hover.png")
        imageViewPost = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width/2 - 50, y: 70, width: 100, height: 100))
        imageViewPost.bounds.origin = CGPoint(x: UIScreen.main.bounds.width/2 - imageViewPost.frame.size.width/2, y: UIScreen.main.bounds.height/2 - imageViewPost.frame.size.height/2)
        imageViewPost.image = imagePost
        imageViewPost.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(imageViewPost)
        
        let loginButton = FBSDKLoginButton()
        loginButton.frame = CGRect(x: imageViewPost.frame.origin.x, y: imageViewPost.frame.origin.y + imageViewPost.frame.size.height + 30, width: loginButton.frame.size.width, height: loginButton.frame.size.height)
        //        loginButton.bounds.origin = CGPoint(x: imageViewPost.frame.origin.x, y: imageViewPost.frame.origin.y + imageViewPost.frame.size.height + 30)
        loginButton.readPermissions = ["public_profile"]
        loginButton.delegate = self
        loginButton.publishPermissions = ["publish_actions"]
        view.addSubview(loginButton)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("loginButtonDidLogOut")
        imageView.image = UIImage(named: "face.png")
        label.text = "Not Logged In"
        buttonEnable(enable: false)
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //let vc = NextPage(nibName: "NextPage", bundle: nil)
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getFacebookUserInfo() {
        if (FBSDKAccessToken.current() != nil) || (UserDefaults.standard.value(forKey: "token") as? NSString) != nil
        {
            
            //            buttonEnable(enable: true)
            //print permissions, such as public_profile
            //print(FBSDKAccessToken.current().permissions)
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            graphRequest?.start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    guard let data = result as? [String:Any] else { return }
                    let FBid = data["id"]
                    self.label.text = data["name"] as! String?
                    let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
                    self.imageView.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
                }
            })
        } else {
            buttonEnable(enable: false)
        }
    }
    
    func buttonEnable(enable: Bool) {
        if enable {
            postButtonMsg.alpha = 1
            postButtonMsg.isEnabled = true
            postButtonPhoto.alpha = 1
            postButtonPhoto.isEnabled = true
            imageViewPost.alpha = 1
        } else {
            postButtonMsg.alpha = 0.3
            postButtonMsg.isEnabled = false
            postButtonPhoto.alpha = 0.3
            postButtonPhoto.isEnabled = false
            imageViewPost.alpha = 0.3
        }
    }
    
    func btnPostMsg(_ sender: UIButton) {
        
        if FBSDKAccessToken.current().hasGranted("publish_actions") {
            
            FBSDKGraphRequest.init(graphPath: "me/feed", parameters: ["message" : "Posted with FBSDK Graph API."], httpMethod: "POST").start(completionHandler: { (connection, result, error) -> Void in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    self.alertShow(typeStr: "Message")
                }
            })
        } else {
            print("require publish_actions permissions")
        }
    }
    
    func btnPostPhoto(sender: UIButton) {
        if FBSDKAccessToken.current().hasGranted("publish_actions") {
            let content = FBSDKSharePhotoContent()
            content.photos = [FBSDKSharePhoto(image: imagePost, userGenerated: true)]
            FBSDKShareAPI.share(with: content, delegate: nil)
        } else {
            print("require publish_actions permissions")
        }
    }
    
    func alertShow(typeStr: String) {
        let alertController = UIAlertController(title: "", message: typeStr+" Posted!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    

}


