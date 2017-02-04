//
//  PatientRatingServiceFilled.swift
//  AssistCare
//
//  Created by LaNet on 2/3/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PatientRatingServiceFilled: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

   
    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var vwMainPopUp: UIView!
    @IBOutlet var cvcServices: UICollectionView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var lblName: UILabel!
    
    @IBOutlet var lblTime: UIView!
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

    
    @IBAction func btnContinueClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


}
