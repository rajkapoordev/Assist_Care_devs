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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        txtEnterNum.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillHide"), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
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
        navigationController?.navigationBar.tintColor = UIColor.white
        txtEnterNum.setBottomBorder()
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
