//
//  AppointmentVC.swift
//  AssistCare
//
//  Created by LaNet on 1/18/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import Foundation
class AppointmentVC: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet var btnHomeTab: UITabBarItem!
    @IBOutlet var btnMsgTab: UITabBarItem!
    @IBOutlet var btnCalTab: UITabBarItem!
    @IBOutlet var btnNotifyTab: UITabBarItem!
    
    @IBOutlet var topLeftBarButton: UIButton!
    @IBOutlet var topRightBarButton: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var tabBar: UITabBar!
    var locationManager = CLLocationManager()

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
            
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            self.mapView.showsUserLocation = true

        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnPlusAction(_ sender: Any) {
    }
    
    @IBAction func btnTopLeftBarAction(_ sender: Any) {
    }
    
  
    @IBAction func btnTopRightBarAction(_ sender: Any) {
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 21.17, longitudeDelta: 72.83))
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let userLocation: CLLocation = locations[0]
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        
//        let latDelta: CLLocationDegrees = 0.05
//        let longDelta: CLLocationDegrees = 0.05
//        
//        let span = MKCoordinateSpanMake(latDelta, longDelta)
//        
//        let location = CLLocationCoordinate2DMake(latitude, longitude)
//        let region = MKCoordinateRegionMake(location, span)
//        
//        self.mapView.setRegion(region, animated: true)
//        
//        self.locationManager.stopUpdatingLocation() 
//    }
//    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
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

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
