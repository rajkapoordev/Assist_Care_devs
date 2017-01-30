//
//  CreateProfileFour.swift
//  AssistCare
//
//  Created by LaNet on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileFour: UIViewController,UITextFieldDelegate {

    @IBOutlet var txtAccountEmail: UITextField!
    
    @IBOutlet var txtBSB: UITextField!
    
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var btnPrevious: UIButton!
    @IBOutlet var lblAgreement: UILabel!
    @IBOutlet var txtPromoCode: UITextField!
    @IBOutlet var txtFileNumber: UITextField!
    @IBOutlet var txtAccountName: UITextField!
    @IBOutlet var txtAccountNumber: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDeledate()
        
        scrollView.contentSize = CGSize(width: 0, height: scrollView.frame.size.height)

        // Do any additional setup after loading the view.
    }
    func setUI()
    {
        txtBSB.setBottomBorder()
        txtPromoCode.setBottomBorder()
        txtFileNumber.setBottomBorder()
        txtAccountName.setBottomBorder()
        txtAccountEmail.setBottomBorder()
        txtAccountNumber.setBottomBorder()
        btnSubmit.shadow()
        btnPrevious.shadow()
    
    }
    func setDeledate()
    {
        txtBSB.delegate = self
        txtPromoCode.delegate = self
        txtFileNumber.delegate = self
        txtAccountName.delegate = self
        txtAccountEmail.delegate = self
        txtAccountNumber.delegate = self
    
    }
    
    @IBAction func btnPreviousClick(_ sender: Any) {
    }
    
    
    @IBAction func btnBackClick(_ sender: UIButton) {
         navigationController?.popViewController(animated: false)
      
    }
    @IBAction func btnSubmitClick(_ sender: Any) {
        let vc = TermAndConditionVC(nibName: "TermAndConditionVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
