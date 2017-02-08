//
//  CareGiverBeginServices.swift
//  AssistCare
//
//  Created by LaNet on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import Foundation
class CareGiverBeginServices: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet var vwBottom: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var btnArrived: UIButton!
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
        scrollView.contentSize = CGSize(width: ScreenSize.SCREEN_WIDTH, height: self.vwBottom.frame.origin.y + self.vwBottom.bounds.size.height + 10)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        mapView.delegate = self
        imgProfile.setRounded()
        self.tabBarController?.tabBar.isHidden = false
        
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
            
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapAnnotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                
            }
            return view
        }
        return nil
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnArrivedClick(_ sender: UIButton) {
        let vc = CarePlanVC(nibName: "CarePlanVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
