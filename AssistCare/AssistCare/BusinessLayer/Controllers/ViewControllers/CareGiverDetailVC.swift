//
//  CareGiverDetailVC.swift
//  AssistCare
//
//  Created by developer91 on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit

class CareGiverDetailVC: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        scrollViewMain.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: 780)
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
}
