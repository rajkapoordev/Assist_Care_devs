//
//  PatientCalendarAppointmentVC.swift
//  AssistCare
//
//  Created by LaNet on 2/1/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PatientCalendarAppointmentVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DialogDelegate,MKMapViewDelegate,CLLocationManagerDelegate  {

    
    @IBOutlet var vwStatusBar: UIView!
    let locationManager = CLLocationManager()
    var selectedPin:MKPlacemark? = nil
    @IBOutlet var vWFirst: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var btnMessage: UIButton!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var vWSecond: UIView!
    
    @IBOutlet var lblAmount: UILabel!
    @IBOutlet var lblAddress: UILabel!
    
    @IBOutlet var lblGeneralCareDescription: UILabel!
    var dialog:CustomDialogClass = CustomDialogClass()
    @IBOutlet var vWInner: UIView!
    @IBOutlet var btnCancelAppointment: UIButton!
    @IBOutlet var lblLanguage2: UILabel!
    @IBOutlet var lblLanguage1: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var cvcServices: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        scrollView.contentSize = CGSize(width:0, height: 5 + vWFirst.frame.height + vWSecond.frame.height + cvcServices.frame.height + 100)
         cvcServices.register(UINib(nibName:"CareServicesCell",bundle: nil) , forCellWithReuseIdentifier: "CareServicesCell")

        vWInner.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        vWInner.layer.shadowOffset = CGSize(width: 5, height: 5)
        vWInner.layer.shadowOpacity = 0.7;
        vWInner.layer.shadowRadius = 1.0;
        lblLanguage1.layer.cornerRadius = 10
        lblLanguage1.layer.masksToBounds = true
        lblLanguage2.layer.cornerRadius = 10
        lblLanguage2.layer.masksToBounds = true
        dialog.delegate = self
        dialog.view.frame = self.view.frame
        
        mapView.delegate = self
        
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
                    
                    var span = MKCoordinateSpan()
                    span.latitudeDelta = 0.8
                    span.longitudeDelta = 0.8
                    
                    let latitude = locationManager.location?.coordinate.latitude
                    let longitude = locationManager.location?.coordinate.longitude
                    let coordinate = CLLocationCoordinate2DMake(21.17, 20.12)
                    let mapRegion = MKCoordinateRegion(center: coordinate, span: span)
                    mapView.setRegion(mapRegion, animated: true)
                    //Create a pin annotation
                    let pointAnnotation = CustomPointAnnotation()
                    pointAnnotation.coordinate = coordinate
                    pointAnnotation.title = "Title"
                    pointAnnotation.subtitle = "SubTitle"
                    let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: "care")
                    mapView.setRegion(mapRegion, animated: true)
                    mapView.addAnnotation(pinAnnotationView.annotation!)
        
                } else {
                    print("Location services are not enabled");
                }
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
    
    
    func tapPinInMap(sender: UITapGestureRecognizer) {
        let selectedPin = (sender.view)!.tag
        print(selectedPin)
    }
    
    @IBAction func btnLikeClick(_ sender: UIButton) {
    }
    
    @IBAction func btnMessageClick(_ sender: UIButton) {
    }
    
    @IBAction func btnCancelAppointmentClick(_ sender: UIButton) {
        dialog.displayAlert(strTitle : "Cancel All Recurring?",  strMsg: "Do You want to cancel all recurring booking or just the one for 2/28?", btnOkText: "ALL RECURRING", btnCancelText: "JUST ONE",type: "")
    }
    
    @IBAction func btnBackClick(_ sender: UIButton) {
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath) as! CareServicesCell
        cell.vWServices.frame.size = CGSize(width: cell.frame.width , height: cell.frame.width )
        cell.vWMark.frame = cell.vWServices.frame
        cell.imgMark.frame = cell.vWServices.frame
        cell.vWMark.setRounded()
        cell.imgMark.setRounded()
        cell.vWServices.setRounded()
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let numOfColumnsInRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numOfColumnsInRow))
        let items = (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        
        cvcServices.frame = CGRect(x: cvcServices.frame.origin.x, y: cvcServices.frame.origin.y, width: cvcServices.frame.width, height: (CGFloat(size) *  CGFloat(ceil(3/3)) + (items * CGFloat(ceil(3/3)))))
        scrollView.contentSize = CGSize(width:0, height: 5 + vWFirst.frame.height + vWSecond.frame.height + cvcServices.frame.height + 100)
        vWSecond.frame = CGRect(x: vWSecond.frame.origin.x, y: (cvcServices.frame.origin.y + cvcServices.frame.height), width: vWSecond.frame.width, height: vWSecond.frame.height)
        
        return CGSize(width: size, height: size)
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 21.17, longitudeDelta: 72.83))
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
    }


    func cancelClick() {
        
    }
   
    func okClick() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

