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
import CoreLocation


class AppointmentVC: UIViewController,MKMapViewDelegate,UISearchBarDelegate {

    let locationManager = CLLocationManager()
    var resultSearchController:UISearchController? = nil
    var selectedPin:MKPlacemark? = nil

    @IBOutlet var btnHomeTab: UITabBarItem!
    @IBOutlet var btnMsgTab: UITabBarItem!
    @IBOutlet var btnCalTab: UITabBarItem!
    @IBOutlet var btnNotifyTab: UITabBarItem!
    
    @IBOutlet var topLeftBarButton: UIButton!
    @IBOutlet var topRightBarButton: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var tabBar: UITabBar!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self

        btnPlus.setRounded()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        // locationManager.requestLocation()
        let locationSearchTable = SearchResultVC(nibName: "SearchResultVC", bundle: nil)
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        //vWSearch.addSubview(searchBar)
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
        
        
        
        
        
        
        
        
        

        
//        self.mapView.showsUserLocation = true
//        if (CLLocationManager.locationServicesEnabled()) {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.distanceFilter = kCLDistanceFilterNone
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.requestAlwaysAuthorization()
//            locationManager.startMonitoringSignificantLocationChanges()
//            locationManager.startUpdatingLocation()
//            mapView.showsUserLocation = true
//            mapView.mapType = .standard
//            
//        } else {
//            print("Location services are not enabled");
//        }
       // mapView.delegate = self


        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        let vc = CategoryVC(nibName: "CategoryVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)    }
    
    
    @IBAction func btnPlusAction(_ sender: Any) {
        let vc = searchCareGiverOnMapVC(nibName: "searchCareGiverOnMapVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension AppointmentVC: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
}


extension AppointmentVC : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: \(error)")
    }
}


