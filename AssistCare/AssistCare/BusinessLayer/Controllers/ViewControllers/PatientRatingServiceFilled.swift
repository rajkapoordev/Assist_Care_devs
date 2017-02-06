//
//  PatientRatingServiceFilled.swift
//  AssistCare
//
//  Created by LaNet on 2/3/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PatientRatingServiceFilled: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextViewDelegate {

    
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var lbSaveFavourite: UILabel!
    @IBOutlet var lbCredit: UILabel!
    @IBOutlet var lbLike: UILabel!
    @IBOutlet var lbShareTime: UILabel!
    @IBOutlet var lbShareName: UILabel!
    @IBOutlet var imgShareProfile: UIImageView!
    @IBOutlet var btnLater: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var vwShareCredit: UIView!
    @IBOutlet var vwShareLike: UIView!
    @IBOutlet var vwShareProfile: UIView!
    @IBOutlet var vwSubShare: UIView!
    @IBOutlet var vwShare: UIView!
    @IBOutlet var vwSubInstruction: UIView!
    @IBOutlet var vwInstruction: UIView!
    @IBOutlet var imgInfoProfile: UIImageView!
    @IBOutlet var txtvwInfo: UITextView!
    @IBOutlet var lbinfoTitle: UILabel!
    @IBOutlet var vwInformation: UIView!
    @IBOutlet var btnSkip: UIButton!
    @IBOutlet var vwProfile: UIView!
    @IBOutlet var lbTime: UILabel!
    @IBOutlet var lbName: UILabel!
    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var vwMainPopUp: UIView!
    @IBOutlet var cvcServices: UICollectionView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblTime: UIView!
    
    let border = UIView()
    var flag = false

    override func viewDidLoad() {
        super.viewDidLoad()
        cvcServices.register(UINib(nibName:"CareServicesCell",bundle : nil), forCellWithReuseIdentifier: "CareServicesCell")
        self.view.backgroundColor = UIColor.clear
        setInterface()

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        self.vwMainPopUp.layer.cornerRadius = 5;
        let transperentView = UIView(frame: UIScreen.main.bounds)
        transperentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.35)
        
        if !self.view.subviews.contains(transperentView) {
            self.view.addSubview(transperentView)
            self.view.addSubview(vwMainPopUp)
            
            vwMainPopUp.layer.shadowColor = UIColor.gray.cgColor
            vwMainPopUp.layer.shadowOpacity = 2
            vwMainPopUp.layer.shadowOffset = CGSize.zero
            vwMainPopUp.layer.shadowRadius = 5
            
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.btnContinue.frame
            rectShape.position = self.btnContinue.center
            rectShape.path = UIBezierPath(roundedRect: self.btnContinue.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
            self.btnContinue.layer.backgroundColor = AppColor.skyColor.cgColor
            self.btnContinue.layer.mask = rectShape
            imgProfile.setRounded()
        }
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath) as! CareServicesCell
        cell.vWServices.frame.size = CGSize(width: cell.frame.width , height: cell.frame.width )
        cell.vWMark.frame = cell.vWServices.frame
        cell.imgMark.frame = cell.vWServices.frame
        cell.vWMark.setRounded()
        cell.imgMark.setRounded()
        cell.vWServices.setRounded()
        
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfColumnsInRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numOfColumnsInRow))
        let items = (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        
               
        return CGSize(width: size, height: size)
        
        
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        border.frame = CGRect(x: txtvwInfo.frame.origin.x, y: txtvwInfo.frame.origin.y+txtvwInfo.frame.height-2, width: textView.frame.width, height: 2)
        border.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        txtvwInfo.superview!.insertSubview(border, aboveSubview: textView)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if txtvwInfo.subviews.contains(border){
            border.removeFromSuperview()
        }
        let height = heightForView(text: txtvwInfo.text, font: txtvwInfo.font!, width: txtvwInfo.frame.size.width)
        txtvwInfo.frame = CGRect(x: txtvwInfo.frame.origin.x, y: txtvwInfo.frame.origin.y, width: txtvwInfo.frame.size.width, height: height+10)
        
        border.frame = CGRect(x: txtvwInfo.frame.origin.x, y: txtvwInfo.frame.origin.y+txtvwInfo.frame.height-2, width: textView.frame.width, height: 2)
        border.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        txtvwInfo.superview!.insertSubview(border, aboveSubview: textView)
        
    }

    func setUpvwInstruction(){
        vwSubInstruction.layer.cornerRadius = 5
        vwProfile.layer.cornerRadius = 5
        vwInformation.layer.cornerRadius = 5
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.btnContinue.frame
        rectShape.position = self.btnContinue.center
        rectShape.path = UIBezierPath(roundedRect: self.btnSkip.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        self.btnSkip.layer.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0).cgColor
        self.btnSkip.layer.mask = rectShape
        self.txtvwInfo.delegate = self
        self.txtvwInfo.becomeFirstResponder()
        lbName.text = "Anna Connenlly"
        lbTime.text = "9:00 am - 12:00 am"
        imgInfoProfile.setRounded()
    }
    
    func setUpvwShare(){
        vwShare.layer.cornerRadius = 5
        vwShareProfile.layer.cornerRadius = 5
        vwShareCredit.layer.cornerRadius = 5
        btnLater.roundedBottomLeftButton()
        btnLater.roundedBottomRightButton()
        lbShareName.text = "Anna Connenlly"
        lbShareTime.text = "9:00 am - 12:00 am"
        imgShareProfile.setRounded()
        btnLater.backgroundColor = AppColor.grayColor
        btnShare.backgroundColor = AppColor.skyColor
        lbSaveFavourite.textColor = AppColor.grayColor
        btnLike.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "Like"), scaledToSize: CGSize(width: self.btnLike.bounds.size.width, height: self.btnLike.bounds.size.height)), for: .normal)
    }

    @IBAction func btnContinueClick(_ sender: UIButton) {
        self.setUpvwInstruction()
        self.vwMainPopUp.removeFromSuperview()
        self.view.addSubview(vwInstruction)
    }

    
    @IBAction func btnSkip(_ sender: UIButton) {
        self.setUpvwShare()
        self.vwInstruction.removeFromSuperview()
        self.view.addSubview(vwShare)
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnLater(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnLike(_ sender: UIButton) {
        if(flag == false){
             btnLike.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "LikeFilled"), scaledToSize: CGSize(width: self.btnLike.bounds.size.width, height: self.btnLike.bounds.size.height)), for: .normal)
            flag = true
        }else{
            btnLike.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "Like"), scaledToSize: CGSize(width: self.btnLike.bounds.size.width, height: self.btnLike.bounds.size.height)), for: .normal)
            flag = false
        }
    }
}
