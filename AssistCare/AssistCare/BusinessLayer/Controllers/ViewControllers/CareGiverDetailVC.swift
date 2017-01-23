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
   
    @IBOutlet var btnViewFacebook: UIButton!
    @IBOutlet var imgFacebook: UIImageView!
    @IBOutlet var lbFacebook: UILabel!
    @IBOutlet var btnViewReview: UIButton!
    @IBOutlet var imgRating: UIImageView!
    @IBOutlet var lbReview: UILabel!
    @IBOutlet var btnViewProfile: UIButton!
    @IBOutlet var btnChat: UIButton!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var lbCareGiverName: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var vwDetail: UIView!
    
    
    @IBAction func btnLike(_ sender: Any) {
        
    }
    
    @IBAction func btnChat(_ sender: Any) {
        
    }
    
    @IBAction func btnViewProfile(_ sender: Any) {
        
    }
    
    @IBAction func btnReview(_ sender: Any) {
        
    }
    
    @IBAction func btnViewFacebook(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setInterface(){
        let backButton = UIBarButtonItem(
            title: "Anna Connolly",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = UIColor.white

        imgProfile.layer.cornerRadius = imgProfile.bounds.size.width/2
        imgFacebook.layer.cornerRadius = imgFacebook.bounds.size.width/2
        lbCareGiverName.text = "Anna Connolly"
        lbReview.text = "15 Reviews,23 Services"
        lbFacebook.text = "NIcole Walker and 12 other frirnds have booked Anna Connolly"
        btnChat.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "chat"), scaledToSize: CGSize(width: btnChat.bounds.size.width, height: btnChat.bounds.size.height)), for: .normal)
        btnLike.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "Like"), scaledToSize: CGSize(width: btnLike.bounds.size.width, height: btnLike.bounds.size.height)), for: .normal)
        
    }
}
