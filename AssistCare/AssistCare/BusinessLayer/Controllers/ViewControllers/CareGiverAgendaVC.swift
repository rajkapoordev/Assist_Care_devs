//
//  CareGiverAgendaVC.swift
//  AssistCare
//
//  Created by LaNet on 1/30/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreLocation

class CareGiverAgendaVC: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource {
    var locationManager = CLLocationManager()

    
    @IBOutlet var lbUpcomingBooking: UILabel!
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblName: MKMapView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var tblView: UITableView!
    @IBOutlet var vWDetail: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        mapView.delegate = self
        self.tabBarController?.tabBar.isHidden = true
        imgProfile.setRounded()
        lbUpcomingBooking.backgroundColor = AppColor.grayColor
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
            
        } else {
            print("Location services are not enabled");
        }
        mapView.delegate = self

    }
    
    @IBAction func btnMyWayClick(_ sender: UIButton) {
        let vc = CareGiverBeginServices(nibName: "CareGiverBeginServices", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 21.17, longitudeDelta: 72.83))
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
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
                //view.rightCalloutAccessoryView = UIButton.buttonWithType(.detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors " + error.localizedDescription)
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tblView.frame = CGRect(x: tblView.frame.origin.x, y: tblView.frame.origin.y, width: tblView.frame.width, height: (65 * 10))
        scrollView.contentSize = CGSize(width: 0, height: (mapView.frame.height + tblView.frame.height + (vWDetail.frame.height * 2)))
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "CareGiverAgendaCell", bundle: nil), forCellReuseIdentifier: "CareGiverAgendaCell")
     let cell = tableView.dequeueReusableCell(withIdentifier: "CareGiverAgendaCell", for: indexPath) as! CareGiverAgendaCell
        return cell
        

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
