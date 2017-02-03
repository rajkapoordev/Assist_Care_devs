//
//  CareGiverCalenderAppoinment.swift
//  AssistCare
//
//  Created by developer91 on 2/2/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit

class CareGiverCalenderAppoinmentVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet var btnCancelAppoinment: UIButton!
    @IBOutlet var lbGeneralCareInfo: UILabel!
    @IBOutlet var lbGeneralCare: UILabel!
    @IBOutlet var imgLanguage: UIImageView!
    @IBOutlet var btnEnglish: UIButton!
    @IBOutlet var btnSpanish: UIButton!
    @IBOutlet var collServiceProvided: UICollectionView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var vwServicesProvided: UIView!
    @IBOutlet var vwAddress: UIView!
    @IBOutlet var vwCharged: UIView!
    @IBOutlet var vwDetail: UIView!
    @IBOutlet var vwNavigation: UIView!
    @IBOutlet var scrollData: UIScrollView!
    @IBOutlet var vwPopUp: UIView!
    @IBOutlet var vwGray: UIView!
    var isFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setInterface(){
        collServiceProvided.delegate = self
        collServiceProvided.dataSource = self
        collServiceProvided.register(UINib(nibName: "CareServicesCell", bundle: nil), forCellWithReuseIdentifier: "CareServicesCell")
        scrollData.contentSize = CGSize(width: screenSize.width, height: btnCancelAppoinment.bounds.size.height + btnCancelAppoinment.frame.origin.y + 20)
        btnEnglish.layer.cornerRadius = btnEnglish.bounds.size.height / 2
        btnSpanish.layer.cornerRadius = btnEnglish.bounds.size.height / 2
        btnCancelAppoinment.layer.borderWidth = 1.0
        btnCancelAppoinment.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1).cgColor
        btnCancelAppoinment.shadow()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        vwGray.addGestureRecognizer(tap)
        
        if(self.isFlag == true){
            
        }else{
            self.vwGray.isHidden = false
            self.vwPopUp.isHidden = false
            UIView.animate(withDuration: 0.5, animations:{self.vwPopUp.alpha = 1.0}, completion: { (bool) in
                
            })
        }
        
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
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.vwGray.isHidden = true
        UIView.animate(withDuration: 0.5, animations:{self.vwPopUp.alpha = 0.0}, completion: { (bool) in
            
        })
    }

}
