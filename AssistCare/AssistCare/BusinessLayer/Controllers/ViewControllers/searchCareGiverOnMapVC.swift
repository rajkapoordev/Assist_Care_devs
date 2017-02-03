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
        self.tabBarController?.tabBar.isHidden = true
        
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
        navigationController!.popViewController(animated: false)
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
        //Span for zoom map or clear map path
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.8
        span.longitudeDelta = 0.8
        
        let coordinate1 = CLLocationCoordinate2DMake(28.889281, 75.836042)
        let mapRegion1 = MKCoordinateRegion(center: coordinate1, span: span)
        mapView.setRegion(mapRegion1, animated: true)
        //Create a pin annotation
        let pointAnnotation1 = CustomPointAnnotation()
        pointAnnotation1.coordinate = coordinate1
        pointAnnotation1.title = "care1"
        pointAnnotation1.subtitle = "Care1 here"
        let pinAnnotationView1 = MKPinAnnotationView(annotation: pointAnnotation1, reuseIdentifier: "care")
        mapView.setRegion(mapRegion1, animated: true)
        mapView.addAnnotation(pinAnnotationView1.annotation!)
        
        let coordinate = CLLocationCoordinate2DMake(30.889281, 75.836042)
        let mapRegion = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(mapRegion, animated: true)
        let pointAnnotation2 = CustomPointAnnotation()
        pointAnnotation2.coordinate = coordinate
        pointAnnotation2.title = "care2"
        pointAnnotation2.subtitle = "Care2 here"
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
                let guester = UITapGestureRecognizer(target: self, action: #selector(self.tapPinInMap))
                //Here set Id of care service
                pinView?.tag = 2
                pinView?.gestureRecognizers = [guester]
            }
            else {
                //Update the annotation reference if re-using a view...
                pinView?.annotation = annotation
            }
            
            return pinView
        }
        return nil
    }
    
    //Which pin is selected
    func tapPinInMap(sender: UITapGestureRecognizer) {
        let selectedPin = (sender.view)!.tag
        print(selectedPin)
        let careGiverDetailVC = CareGiverDetailVC(nibName: "CareGiverDetailVC", bundle: nil)
        self.navigationController!.pushViewController(careGiverDetailVC, animated: true)
        
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
