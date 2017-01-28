//
//  searchCareGiverOnMapVC.swift
//  AssistCare
//
//  Created by developer91 on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class searchCareGiverOnMapVC: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet var btnNavigate: UIButton!
    @IBOutlet var vwDetail: UIView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var btnMealPreparation: UIButton!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    //    let googleMapAPIKey = "AIzaSyCblEAKCQQZE9EFFlkTlwB8BVA4Ize8t5M"
    //    let kBgQueue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
    
    var currentCentre = CLLocationCoordinate2D()
    var currenDist:CLLocationDistance = 0
    let locationManager = CLLocationManager()
    
    @IBOutlet var btnMedicalPrompt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        self.setMapView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Search Care Giver"
        
        vwDetail.backgroundColor = UIColor.white
        btnMealPreparation.backgroundColor = UIColor(red: 17/255, green: 157/255, blue: 180/255, alpha: 1)
        btnMedicalPrompt.backgroundColor = UIColor(red: 25/255, green: 150/255, blue: 130/255, alpha: 1)
        btnMealPreparation.setTitle("Meal Preparation", for: .normal)
        btnMedicalPrompt.setTitle("Medical Prompt", for: .normal)
        btnMealPreparation.tintColor = UIColor.white
        btnMedicalPrompt.tintColor = UIColor.white
        btnNavigate.backgroundColor = UIColor(red: 62/255, green: 186/255, blue: 207/255, alpha: 1)
        btnNavigate.layer.cornerRadius = btnNavigate.bounds.size.width/2
        
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
    }
    
    func setMapView() {
        
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
        
        //Set all anotations here accept user location
        let pointAnnotation1 = CustomPointAnnotation()
        pointAnnotation1.pinCustomImageName = "placeholder.png"
        pointAnnotation1.coordinate = CLLocationCoordinate2DMake(26.889281, 75.836042)
        pointAnnotation1.title = "other place"
        pointAnnotation1.subtitle = "Care here"
        let pinAnnotationView1 = MKPinAnnotationView(annotation: pointAnnotation1, reuseIdentifier: "care")
        mapView.addAnnotation(pinAnnotationView1.annotation!)
        
        let pointAnnotation2 = CustomPointAnnotation()
        pointAnnotation2.pinCustomImageName = "placeholder.png"
        pointAnnotation2.coordinate = CLLocationCoordinate2DMake(30.889281, 75.836042)
        pointAnnotation2.title = "other place"
        pointAnnotation2.subtitle = "Care here"
        let pinAnnotationView2 = MKPinAnnotationView(annotation: pointAnnotation2, reuseIdentifier: "care")
        mapView.addAnnotation(pinAnnotationView2.annotation!)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        if annotation is CustomPointAnnotation {
            let identifier = "care"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if pinView == nil {
                //Create a plain MKAnnotationView if using a custom image...
                pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                pinView!.canShowCallout = true
                pinView?.image = UIImage(named: "placeholder.png")
            }
            else {
                //Update the annotation reference if re-using a view...
                pinView?.annotation = annotation
            }
            
            return pinView
        }
        return nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("ERROR:\(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coord
        mapView.addAnnotation(pointAnnotation)
        
        print("longitude:\(coord.longitude)")
        print("latitude:\(coord.latitude)")
        
        // locationManager.stopUpdatingLocation()
    }
    
    @IBAction func btnNavigate(_ sender: Any) {
        let vc = NewAppoinmentVC(nibName: "NewAppoinmentVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        //self.navigationController!.popToViewController(vc, animated: true)
    }
    
    @IBAction func btnMealPreparation(_ sender: Any) {
        
    }
    
    @IBAction func btnMedicalPrompt(_ sender: Any) {
        if (btnMedicalPrompt.backgroundColor == UIColor(red: 25/255, green: 150/255, blue: 130/255, alpha: 1)) {
            btnMedicalPrompt.backgroundColor = UIColor(red: 18/255, green: 219/255, blue: 212/255, alpha: 1)
        }else {
            btnMedicalPrompt.backgroundColor = UIColor(red: 25/255, green: 150/255, blue: 130/255, alpha: 1)
        }
    }
    
}

class CustomPointAnnotation: MKPointAnnotation {
    var pinCustomImageName:String!
}
