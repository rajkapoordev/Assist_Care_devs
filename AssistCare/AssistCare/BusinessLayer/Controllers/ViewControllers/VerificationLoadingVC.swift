//
//  VerificationLoading.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class VerificationLoadingVC: UIViewController {

    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var lbLoading: UILabel!
    @IBOutlet var imgLoading: UIImageView!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1) ){
            let defaults = UserDefaults.standard
            //        defaults.set(role, forKey: "UserRole")
            //        defaults.synchronize()
            
            let page = defaults.value(forKey: "UserRole") as! String
            if (page == "Patient")
            {
//          let vc = EditProfile(nibName: "EditProfile", bundle: nil)
            let vc = CreateProfileFirst(nibName: "EditProfile", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let vc = CreateProfileFirst(nibName: "CreateProfileFirst", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface() {
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        
        lbLoading.text = "Waiting for text message to automatically verify phone number"
        lbLoading.frame = CGRect(x: lbLoading.frame.origin.x, y: lbLoading.frame.origin.y, width: lbLoading.bounds.size.width, height: heightForView(lbLoading.text!, font: lbLoading.font, width: lbLoading.bounds.size.width))
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    func heightForView(_ text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
