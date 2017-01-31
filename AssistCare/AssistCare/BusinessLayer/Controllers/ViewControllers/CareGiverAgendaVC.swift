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

    @IBOutlet var tblView: UITableView!
    @IBOutlet var vWDetail: UIView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let initialLocation = CLLocation(latitude: 21.17, longitude: 72.83)
        
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius * 2.0, regionRadius * 2.0)
            
            mapView.setRegion(coordinateRegion, animated: true)
            centerMapOnLocation(location: initialLocation)
            
            let artwork = MapAnnotation(title: "King David Kalakaua",
                                        locationName: "Waikiki Gateway Park",
                                        discipline: "Sculpture",
                                        coordinate: CLLocationCoordinate2D(latitude: 21.17, longitude: 72.83))
            
            mapView.addAnnotation(artwork)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 21.17, longitude: 72.83)
            mapView.addAnnotation(annotation)
            
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
        


        // Do any additional setup after loading the view.
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "OtherCertificateCell", bundle: nil), forCellReuseIdentifier: "OtherCertificateCell")
     var cell = tableView.dequeueReusableCell(withIdentifier: "OtherCertificateCell", for: indexPath) as! OtherCertificateCell
        return cell
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
