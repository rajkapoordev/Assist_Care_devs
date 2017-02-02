//
//  PatientCalendarAppointmentVC.swift
//  AssistCare
//
//  Created by LaNet on 2/1/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
class PatientCalendarAppointmentVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var vWFirst: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var btnMessage: UIButton!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var vWSecond: UIView!
    
    @IBOutlet var lblAmount: UILabel!
    @IBOutlet var lblAddress: UILabel!
    
    @IBOutlet var lblGeneralCareDescription: UILabel!
    
    @IBOutlet var vWInner: UIView!
    @IBOutlet var btnCancelAppointment: UIButton!
    @IBOutlet var lblLanguage2: UILabel!
    @IBOutlet var lblLanguage1: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var cvcServices: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width:0, height: 5 + vWFirst.frame.height + vWSecond.frame.height + cvcServices.frame.height + 100)
         cvcServices.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")

      
        
        vWInner.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        vWInner.layer.shadowOffset = CGSize(width: 5, height: 5)
        vWInner.layer.shadowOpacity = 0.7;
        vWInner.layer.shadowRadius = 1.0;
        
        lblLanguage1.layer.cornerRadius = 10
        lblLanguage1.layer.masksToBounds = true
        lblLanguage2.layer.cornerRadius = 10
        lblLanguage2.layer.masksToBounds = true

//        vWInner.layer.shadowColor = UIColor.gray.cgColor
//        vWInner.layer.shadowOffset = CGSize(width: 3, height: 3)
//        vWInner.layer.shadowOpacity = 0.7
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnLikeClick(_ sender: UIButton) {
    }
    @IBAction func btnMessageClick(_ sender: UIButton) {
    }
    @IBAction func btnCancelAppointmentClick(_ sender: UIButton) {
    }
    @IBAction func btnBackClick(_ sender: UIButton) {
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
        
        cvcServices.frame = CGRect(x: cvcServices.frame.origin.x, y: cvcServices.frame.origin.y, width: cvcServices.frame.width, height: (CGFloat(size) *  CGFloat(ceil(3/3)) + (items * CGFloat(ceil(3/3)))))
        scrollView.contentSize = CGSize(width:0, height: 5 + vWFirst.frame.height + vWSecond.frame.height + cvcServices.frame.height + 100)
        vWSecond.frame = CGRect(x: vWSecond.frame.origin.x, y: (cvcServices.frame.origin.y + cvcServices.frame.height), width: vWSecond.frame.width, height: vWSecond.frame.height)
        
        return CGSize(width: size, height: size)
        
        
    }

    
    func DisplayPopUp()
    {
        let vwMain = UIView()
        vwMain.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)

       let DynamicView = UIView()
       DynamicView.frame = CGRect(x: (16 * screenSize.height )/736, y: (screenSize.width * 200)/414, width: (380 * screenSize.width)/414, height: 200 * (screenSize.height )/736)
        DynamicView.layer.cornerRadius = 3
        
        
        let lbTitle = UILabel()
        lbTitle.frame = CGRect(x: 10, y: DynamicView.frame.width - 20, width: 20, height: (50 * screenSize.height)/736)
        lbTitle.text = ""
        lbTitle.numberOfLines = 0
        lbTitle.textAlignment = .center
        lbTitle.backgroundColor = UIColor.clear
        lbTitle.font = UIFont(name: "Avenir", size: 18)
        lbTitle.textColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        
        let btnOK = UIButton()
        btnOK.frame = CGRect(x: 0, y: ((DynamicView.frame.height) - ((50 * screenSize.width)/414) ), width: DynamicView.frame.width/2, height: (50 * screenSize.width)/414)
        
        btnOK.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        btnOK.setTitle("", for: .normal)
        btnOK.addTarget(self, action: #selector(ok), for: .touchUpInside)
        btnOK.titleLabel?.font = UIFont(name: "Dense", size: 25)
        //        btnOK.vie
        btnOK.titleLabel!.lineBreakMode = .byWordWrapping;
        
        btnOK.titleLabel?.textColor = UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 1)
        btnOK.titleLabel!.textAlignment = .center
        btnOK.titleLabel!.numberOfLines = 1;
        btnOK.titleLabel!.adjustsFontSizeToFitWidth = true;
        btnOK.titleLabel!.lineBreakMode = .byClipping;
        btnOK.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    
    }
   
    func ok()
    {
    
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
