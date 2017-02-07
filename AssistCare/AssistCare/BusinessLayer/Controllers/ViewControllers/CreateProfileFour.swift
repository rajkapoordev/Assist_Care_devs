//
//  CreateProfileFour.swift
//  AssistCare
//
//  Created by LaNet on 1/27/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileFour: UIViewController,UITextFieldDelegate {

    @IBOutlet var vwButton: UIView!
    @IBOutlet var vwStatusBar: UIView!
    
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!

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
        
        scrollView.contentSize = CGSize(width: 0, height: vwButton.bounds.size.height + vwButton.frame.origin.y + 10)

        // Do any additional setup after loading the view.
    }
    func setUI()
    {
        
        self.navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        txtBSB.setBottomBorder()
        txtPromoCode.setBottomBorder()
        txtFileNumber.setBottomBorder()
        txtAccountName.setBottomBorder()
        txtAccountEmail.setBottomBorder()
        txtAccountNumber.setBottomBorder()
        btnSubmit.shadow()
        btnPrevious.shadow()
        btnPrevious.backgroundColor = AppColor.darkBlueColor
        btnSubmit.backgroundColor = AppColor.skyColor
    }
    
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
         navigationController!.popViewController(animated: false)
      
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
