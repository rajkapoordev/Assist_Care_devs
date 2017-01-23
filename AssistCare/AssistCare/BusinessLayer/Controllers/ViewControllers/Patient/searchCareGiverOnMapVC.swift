//
//  searchCareGiverOnMapVC.swift
//  AssistCare
//
//  Created by developer91 on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit

class searchCareGiverOnMapVC: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet var btnNavigate: UIButton!
    @IBOutlet var vwDetail: UIView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var btnMealPreparation: UIButton!
    
    
    
    @IBAction func btnNavigate(_ sender: Any) {
        let vc = NewAppoinmentVC(nibName: "NewAppoinmentVC", bundle: nil)
        self.navigationController?.popToViewController(vc, animated: true)
    }
    @IBAction func btnMealPreparation(_ sender: Any) {
        
    }
    
    @IBAction func btnMedicalPrompt(_ sender: Any) {
        if(btnMedicalPrompt.backgroundColor == UIColor(red: 25/255, green: 150/255, blue: 130/255, alpha: 1))
        {
            btnMedicalPrompt.backgroundColor = UIColor(red: 18/255, green: 219/255, blue: 212/255, alpha: 1)
        }else{
            btnMedicalPrompt.backgroundColor = UIColor(red: 25/255, green: 150/255, blue: 130/255, alpha: 1)
        }
        
    }
    
    let googleMapAPIKey = "AIzaSyCblEAKCQQZE9EFFlkTlwB8BVA4Ize8t5M"
    let kBgQueue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
    var currentCentre = CLLocationCoordinate2D()
    var currenDist:CLLocationDistance = 0
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var btnMedicalPrompt: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        let backButton = UIBarButtonItem(
            title: "Search Care Giver",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = UIColor.white

        btnMealPreparation.backgroundColor = UIColor(red: 17/255, green: 157/255, blue: 180/255, alpha: 1)
        btnMedicalPrompt.backgroundColor = UIColor(red: 25/255, green: 150/255, blue: 130/255, alpha: 1)
        btnMealPreparation.setTitle("Meal Preparation", for: .normal)
        btnMedicalPrompt.setTitle("Medical Prompt", for: .normal)
        btnMealPreparation.tintColor = UIColor.white
        btnMedicalPrompt.tintColor = UIColor.white
        btnNavigate.backgroundColor = UIColor(red: 62/255, green: 186/255, blue: 207/255, alpha: 1)
        btnNavigate.layer.cornerRadius = btnNavigate.bounds.size.width/2
        
        self.mapView.showsUserLocation = true
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            mapView.mapType = .standard
            
        } else {
            print("Location services are not enabled");
        }
        mapView.delegate = self

    }
    
}
