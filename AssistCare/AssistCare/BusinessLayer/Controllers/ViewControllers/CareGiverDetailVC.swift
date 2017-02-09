//
//  CareGiverDetailVC.swift
//  AssistCare
//
//  Created by developer91 on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit

class CareGiverDetailVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var vwStatusBar: UIView!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var scrollViewMain: UIScrollView!
    
    @IBOutlet var imgTimer: UIImageView!
    @IBOutlet var btnSelectedDayTime: UIButton!
    @IBOutlet var btnHour: UIButton!
    
    @IBOutlet var vwFirstScroll: UIView!
    
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var imgCareGiver: UIButton!
    @IBOutlet var lblCareGiverName: UILabel!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var btnChat: UIButton!
    @IBOutlet var lblFbProfileInfo: UILabel!
    
    @IBOutlet var lblReviewInfo: UILabel!

    @IBOutlet var imgFbIcon: UIImageView!
    @IBOutlet var btnViewFbFriends: UIButton!
    @IBOutlet var imgCareGiverFB: UIImageView!
    
    @IBOutlet var vwInScroll: UIView!
    @IBOutlet var cvcCareServices: UICollectionView!
    
    @IBOutlet var lblOwnVehicle: UILabel!
    @IBOutlet var lblEnglish: UILabel!
    @IBOutlet var lblSpenish: UILabel!
    @IBOutlet var lblDetails: UILabel!
    
    @IBOutlet var btnBook: UIButton!
    @IBOutlet var btnViewReview: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        cvcCareServices.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")
        cvcCareServices.delegate = self
        cvcCareServices.dataSource = self
        setInterface()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface() {
        self.tabBarController?.tabBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        scrollViewMain.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: btnBook.bounds.size.height + btnBook.frame.origin.y + 5)
        imgProfile.setRounded()
        imgCareGiverFB.setRounded()
        imgFbIcon.setRounded()
        btnBook.backgroundColor = AppColor.skyColor
        
        lblOwnVehicle.backgroundColor = AppColor.skyColor
        lblEnglish.backgroundColor = AppColor.skyColor
        lblSpenish.backgroundColor = AppColor.skyColor
        lblOwnVehicle.setRadius()
        lblSpenish.setRadius()
        lblEnglish.setRadius()
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
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
        let noOfCell: Int = 6
        cvcCareServices.frame = CGRect(x: cvcCareServices.frame.origin.x, y: cvcCareServices.frame.origin.y, width: cvcCareServices.frame.width, height: (CGFloat(size) *  CGFloat(ceil(Double(noOfCell)/3)) + (items * CGFloat(ceil(Double(noOfCell)/3)))))
        
        let scroll = vwFirstScroll.frame.height + vwInScroll.frame.height + collectionView.frame.height
        scrollViewMain.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: scroll)
        
        vwInScroll.frame = CGRect(x: 0, y: cvcCareServices.frame.origin.y +  cvcCareServices.frame.height, width: ScreenSize.SCREEN_WIDTH, height: self.vwInScroll.frame.height)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        if selectedCell.isSelected == true {
            selectedCell.vWMark.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            selectedCell.vWMark.isHidden = false
            selectedCell.imgMark.isHidden = false
        }else {
            selectedCell.vWMark.isHidden = true
            selectedCell.imgMark.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        selectedCell.vWMark.isHidden = true
        selectedCell.imgMark.isHidden = true
    }
    
    @IBAction func btnFacebookFriends(_ sender: UIButton) {
        let fbFriendsVC = FriendsBookedVC(nibName: "FriendsBookedVC", bundle: nil)
        self.navigationController?.pushViewController(fbFriendsVC, animated: false)
    }
    
    @IBAction func btnBook(_ sender: UIButton) {
        let bookInstructionVC = BookInstructionVC(nibName: "BookInstructionVC", bundle: nil)
        self.navigationController?.pushViewController(bookInstructionVC, animated: true)
    }
    
    @IBAction func btnViewReview(_ sender: Any) {
        let displayReviewVC = DisplayReviewVC(nibName: "DisplayReviewVC", bundle: nil)
        self.navigationController?.pushViewController(displayReviewVC,animated: true)
    }
    
    @IBAction func btnViewProfile(_ sender: UIButton) {
        let careProfileVC = CareGiverProfileDetailVC(nibName: "CareGiverProfileDetailVC", bundle: nil)
        self.navigationController?.pushViewController(careProfileVC, animated: true)
    }
    
}
