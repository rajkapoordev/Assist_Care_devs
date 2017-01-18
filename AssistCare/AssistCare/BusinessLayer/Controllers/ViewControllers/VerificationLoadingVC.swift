//
//  VerificationLoading.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class VerificationLoadingVC: UIViewController {

    @IBOutlet var lbLoading: UILabel!
    @IBOutlet var imgLoading: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1) ){
//          let vc = EditProfile(nibName: "EditProfile", bundle: nil)
            let vc = SetupServicesVC(nibName: "SetupServicesVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        lbLoading.text = "Waiting for text message to automatically verify phone number"
        lbLoading.frame = CGRect(x: lbLoading.frame.origin.x, y: lbLoading.frame.origin.y, width: lbLoading.bounds.size.width, height: heightForView(lbLoading.text!, font: lbLoading.font, width: lbLoading.bounds.size.width))
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
