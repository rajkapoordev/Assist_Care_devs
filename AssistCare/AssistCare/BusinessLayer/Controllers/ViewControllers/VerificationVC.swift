//
//  VerificationVC.swift
//  AssistCare
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class VerificationVC: UIViewController ,UITextFieldDelegate{

    @IBOutlet var scrollEnterNum: UIScrollView!
    @IBOutlet var txtEnterNum: UITextField!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        txtEnterNum.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(VerificationVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }
    
    func setInterface(){
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        txtEnterNum.setBottomBorder()
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    func keyboardWillAppear(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
            scrollEnterNum.setContentOffset(CGPoint(x: 0.0, y: txtEnterNum.frame.origin.y-90), animated: true)
        }
        
    }
    
    func keyboardWillHide() {
        scrollEnterNum.setContentOffset(CGPoint(x: 0.0, y: -65), animated: true)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let vc = VerificationLoadingVC(nibName: "VerificationLoadingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        return true
    }
}
