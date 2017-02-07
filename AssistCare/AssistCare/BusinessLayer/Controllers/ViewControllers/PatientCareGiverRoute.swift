//
//  PatientCareGiverRoute.swift
//  AssistCare
//
//  Created by LaNet on 2/2/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

import CoreLocation
class PatientCareGiverRoute: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,MKMapViewDelegate{
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var btnSkip: UIButton!
    @IBOutlet var tblView: UITableView!
    @IBOutlet var vWTop: UIView!
    @IBOutlet var mapView: MKMapView!
    
    
    
    @IBAction func btnSkip(_ sender: Any) {
        
    }
    
    var header = NSMutableArray()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName:"MedicationPrompt",bundle : nil), forCellReuseIdentifier: "MedicationPrompt")
        scrollView.contentSize = CGSize(width: 0, height: (vWTop.frame.height + tblView.frame.height))
        setInterface()
        let vc = PatientRatingServiceFilled(nibName: "PatientRatingServiceFilled", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    func setInterface(){
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
        
        self.tabBarController?.tabBar.isHidden = true
        

    }
    
    /*func callWentWrongPopUp(){
        
        let transperentView = UIView(frame: UIScreen.main.bounds)
        transperentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.35)
        
        if !self.view.subviews.contains(transperentView) {
            self.view.addSubview(transperentView)
            self.view.addSubview(vwPopupWentWrong)
            
            vwPopupWentWrong.layer.shadowColor = UIColor.gray.cgColor
            vwPopupWentWrong.layer.shadowOpacity = 2
            vwPopupWentWrong.layer.shadowOffset = CGSize.zero
            vwPopupWentWrong.layer.shadowRadius = 5
            
            /*let rectShape = CAShapeLayer()
            rectShape.bounds = self.btnOk.frame
            rectShape.position = self.btnOk.center
            rectShape.path = UIBezierPath(roundedRect: self.btnOk.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
            self.btnOk.layer.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0).cgColor
            self.btnOk.layer.mask = rectShap*/
        }
    }*/

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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapAnnotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                
            }
            return view
        }
        return nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors " + error.localizedDescription)
    }
    
    override func viewDidLayoutSubviews() {
       // vwPopupWentWrong.frame = CGRect(x: 20, y: (screenSize.height/2) - (self.vwPopupWentWrong.bounds.size.height / 2), width: screenSize.width - 40, height: self.vwPopupWentWrong.bounds.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        tableView.frame = CGRect(x: tblView.frame.origin.x, y: tblView.frame.origin.y, width: tblView.frame.width, height: (101 * 10))
        scrollView.contentSize = CGSize(width: 0, height: (vWTop.frame.height + tblView.frame.height))
        //tblView.contentSize = CGSize(width: tblView.frame.width, height: 57 * 10 )
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationPrompt", for: indexPath) as! MedicationPrompt
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PatientRatingServiceFilled(nibName: "PatientRatingServiceFilled", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
//        let next:PatientRatingServiceFilled = PatientRatingServiceFilled()
        self.present(vc, animated: true, completion: nil)
        
    }

}
