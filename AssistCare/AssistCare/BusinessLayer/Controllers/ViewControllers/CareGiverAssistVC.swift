//
//  CareGiverAssistVC.swift
//  AssistCare
//
//  Created by developer91 on 2/6/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit

class CareGiverAssistVC: UIViewController {

    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var lbNavigation: UILabel!
    @IBOutlet var vwNavigationBar: UIView!
    @IBOutlet var vwStatusBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavigationBar.backgroundColor = AppColor.redColor
        lbNavigation.text = "Assist"
    }
    
}
