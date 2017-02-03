//
//  CustomDialogClass.swift
//  AssistCare
//
//  Created by LaNet on 2/2/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

@objc protocol DialogDelegate{
    @objc optional func okClick()
    @objc optional func cancelClick()
    @objc optional func remove()
}

class CustomDialogClass: UIViewController{

    var delegate:DialogDelegate?
    
    
    var sharedInstance:CustomDialogClass {
        struct Singleton {
            static let instance = CustomDialogClass()
        }
        return Singleton.instance
    }
    
    func  displayAlert(strTitle : String ,strMsg : String,btnOkText : String,btnCancelText: String,type:String )
    {
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let vwMain = UIView()
        vwMain.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenSize.height)
        
        let DynamicView = UIView()
        DynamicView.frame = CGRect(x: (16 * screenHeight )/736, y: (screenWidth * 200)/414, width: (380 * screenWidth)/414, height: 200 * (screenHeight )/736)
        DynamicView.layer.cornerRadius = 3
        
        let lbTitle = UILabel()
        lbTitle.frame = CGRect(x: 10, y: 10, width: DynamicView.frame.width - 20, height: (30 * screenHeight)/736)//(150 * screenHeight)/736)
         lbTitle.textColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        lbTitle.text = strTitle
        lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        lbTitle.textAlignment = .left
        
        let lbDescription = UILabel()
        lbDescription.frame = CGRect(x: 10, y: lbTitle.frame.height + 20, width: DynamicView.frame.width - 20, height: strMsg.height(constraintedWidth: DynamicView.frame.width - 20, font: UIFont.systemFont(ofSize: 12)))//(150 * screenHeight)/736)
        lbDescription.text = strMsg
        lbDescription.numberOfLines = 0
        lbDescription.textAlignment = .left
        lbDescription.sizeToFit()
        lbDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
        lbDescription.textColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        
         let btnOK = UIButton()
         let btnCancel = UIButton()
        btnOK.frame = CGRect(x: 0, y: (lbDescription.frame.height + lbDescription.frame.origin.y + 20), width: DynamicView.frame.width/2, height: (50 * screenWidth)/414)
        
        btnOK.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        btnOK.setTitle(btnOkText, for: .normal)
        btnOK.addTarget(self, action: #selector(Ok), for: .touchUpInside)
        btnOK.titleLabel?.font = UIFont(name: "Dense", size: 25)
        btnOK.titleLabel!.lineBreakMode = .byWordWrapping;
        
        btnOK.titleLabel?.textColor = UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1)
        btnOK.titleLabel!.textAlignment = .center
        btnOK.titleLabel!.numberOfLines = 1;
        btnOK.titleLabel!.adjustsFontSizeToFitWidth = true;
        btnOK.titleLabel!.lineBreakMode = .byClipping;
        btnOK.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
       

        if type == "two"
        {
            
            btnCancel.frame = CGRect(x:(btnOK.frame.width - 2 ), y:(lbDescription.frame.height + lbDescription.frame.origin.y + 20),width: (DynamicView.frame.width/2) + 2, height: (50 * screenWidth)/414)
            btnCancel.backgroundColor = UIColor(red: 0/255, green: 110/255, blue: 177/255, alpha: 1)
            
            btnCancel.layer.borderColor = UIColor.black.cgColor
            btnCancel.setTitle(btnCancelText, for: .normal)
            btnCancel.addTarget(self, action: #selector(cancel), for: .touchUpInside)
            btnCancel.titleLabel?.font = UIFont(name: "Dense", size: 25)
            btnCancel.titleLabel?.textColor = UIColor(red: 252/255, green: 250/255, blue: 251/255, alpha: 1)
            btnCancel.titleLabel!.lineBreakMode = .byWordWrapping;
            btnCancel.titleLabel!.textAlignment = .center
            btnCancel.titleLabel!.numberOfLines = 1;
            btnCancel.titleLabel!.adjustsFontSizeToFitWidth = true;
            btnCancel.titleLabel!.lineBreakMode = .byClipping;
            btnCancel.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
            DynamicView.addSubview(btnCancel)
        }
        else
        {
           btnOK.frame = CGRect(x: 0, y: (lbDescription.frame.height + lbDescription.frame.origin.y + 20), width: DynamicView.frame.width, height: (50 * screenWidth)/414)
            
            
            
        }
         DynamicView.addSubview(btnOK)
         DynamicView.addSubview(lbTitle)
        
        
        DynamicView.backgroundColor=UIColor.white
        vwMain.backgroundColor = UIColor.init(colorLiteralRed: 50/255, green: 50/255, blue: 50/255, alpha: 0.70)
        DynamicView.addSubview(lbDescription)
        vwMain.addSubview(DynamicView)
        // self.view.backgroundColor = UIColor.orangeColor()
        DynamicView.frame = CGRect(x: (16 * screenHeight )/736, y: (screenWidth * 200)/414, width: (380 * screenWidth)/414, height: (btnOK.frame.origin.y + btnOK.frame.height))
        
        DynamicView.center = CGPoint(x: vwMain.frame.size.width  / 2, y: vwMain.frame.size.height / 2)
        
        
        self.view.addSubview(vwMain)
        vwMain.tag = 456321
        appDelegate().window?.addSubview(vwMain)

        
        }
    
    
    func removeView()
    {
        appDelegate().window?.viewWithTag(456321)?.removeFromSuperview()
    }
    func cancel()
    {
        delegate?.cancelClick!()
        appDelegate().window?.viewWithTag(456321)?.removeFromSuperview()
        //  delegate?.cancelClick!()
        
    }
    
    func Ok()
    {
        delegate?.okClick!()
        appDelegate().window?.viewWithTag(456321)?.removeFromSuperview()
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

//extension String {
//    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
//        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
//        label.numberOfLines = 0
//        label.text = self
//        label.sizeToFit()
//        
//        return label.frame.height
//    }
//}
