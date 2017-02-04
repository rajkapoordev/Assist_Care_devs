//
//  BookInstructionVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class BookInstructionVC: UIViewController,UITextViewDelegate {

    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var vwUser: UIView!

    @IBOutlet var txvInstructions: UITextView!
    @IBOutlet var lbInstruction: UILabel!
    @IBOutlet var lbAnyInstructions: UILabel!
    
    let border = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        txvInstructions.delegate = self
        txvInstructions.becomeFirstResponder()
        setInterface()
    }
    override func viewDidAppear(_ animated: Bool) {
        vwUser.layer.shadowColor = UIColor.gray.cgColor
        vwUser.layer.shadowOffset = CGSize(width: 3, height: 3)
        vwUser.layer.shadowOpacity = 0.7
    }

    func setInterface() {
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Book"
        self.tabBarController?.tabBar.isHidden = true
        
        lbAnyInstructions.text = "Any Instructions for USER?"
    
        txvInstructions.text = "Instructions"
        txvInstructions.textColor = UIColor.gray
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray {
            textView.text = nil
            textView.textColor = UIColor.black
        }

        lbInstruction.isHidden = false
        border.frame = CGRect(x: txvInstructions.frame.origin.x, y: txvInstructions.frame.origin.y+txvInstructions.frame.height-2, width: textView.frame.width, height: 2)
        border.backgroundColor = AppColor.skyColor
        txvInstructions.superview!.insertSubview(border, aboveSubview: textView)

    }

    func textViewDidChange(_ textView: UITextView) {
        if txvInstructions.subviews.contains(border){
            border.removeFromSuperview()
        }
        let height = heightForView(text: txvInstructions.text, font: txvInstructions.font!, width: txvInstructions.frame.size.width)
        txvInstructions.frame = CGRect(x: txvInstructions.frame.origin.x, y: txvInstructions.frame.origin.y, width: txvInstructions.frame.size.width, height: height+10)
        
        border.frame = CGRect(x: txvInstructions.frame.origin.x, y: txvInstructions.frame.origin.y+txvInstructions.frame.height-2, width: textView.frame.width, height: 2)
        border.backgroundColor = AppColor.skyColor
        txvInstructions.superview!.insertSubview(border, aboveSubview: textView)
    }
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func btnContinue(_ sender: UIButton) {
        let bookingEdit = BookingEditVC(nibName: "BookingEditVC", bundle: nil)
        self.navigationController?.pushViewController(bookingEdit, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
