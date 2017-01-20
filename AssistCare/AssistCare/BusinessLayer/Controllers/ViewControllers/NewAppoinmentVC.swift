//
//  NewAppoinmentVC.swift
//  AssistCare
//
//  Created by developer91 on 1/18/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NewAppoinmentVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MKMapViewDelegate, CLLocationManagerDelegate{

    
    @IBOutlet var btnOkay: UIButton!
    @IBOutlet var btnCancelAppoinment: UIButton!
    @IBOutlet var vwPopUp: UIView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var vwMap: UIView!
    @IBOutlet var collAssistServices: UICollectionView!
    @IBOutlet var collPrefferedServices: UICollectionView!
    @IBOutlet var scrollNewAppoinment: UIScrollView!
    let googleMapAPIKey = "AIzaSyCblEAKCQQZE9EFFlkTlwB8BVA4Ize8t5M"
    let kBgQueue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
    var currentCentre = CLLocationCoordinate2D()
    var currenDist:CLLocationDistance = 0
    let locationManager = CLLocationManager()
    
    
    @IBAction func btnCancelAppoinment(_ sender: Any) {
        
    }
    
    @IBAction func btnOkay(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {

        super.viewDidLoad()
        self.collPrefferedServices.delegate = self
        self.collPrefferedServices.dataSource = self
        
        self.collPrefferedServices.register(UINib(nibName: "CareServicesCell", bundle: nil), forCellWithReuseIdentifier: "CareServicesCell")

        self.collPrefferedServices.register(UINib(nibName: "AppoinmentHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "AppoinmentHeaderCell")
        self.setInterface()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setInterface(){
        let backButton = UIBarButtonItem(
            title: "New Appoinment",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        scrollNewAppoinment.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 1000)
        vwPopUp.layer.cornerRadius = 3.0
        btnCancelAppoinment.setTitle("Cancel Appoinment", for: .normal)
        btnOkay.setTitle("Okay", for: .normal)
        btnCancelAppoinment.backgroundColor = getRedColor()
        btnOkay.backgroundColor = getGreenColor()
        btnCancelAppoinment.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        btnCancelAppoinment.titleLabel?.lineBreakMode = .byWordWrapping
        btnOkay.tintColor = UIColor.white
        btnCancelAppoinment.tintColor = UIColor.white
    
        
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

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareServicesCell", for: indexPath) as! CareServicesCell
        cell.vWServices.frame.size = CGSize(width: cell.frame.width , height: cell.frame.width )
        cell.vWMark.frame = cell.vWServices.frame
        cell.imgMark.frame = cell.vWServices.frame
        cell.vWMark.setRounded()
        cell.imgMark.setRounded()
        cell.vWServices.setRounded()
        
        collPrefferedServices.frame = CGRect(x: self.collPrefferedServices.frame.origin.x, y: self.collPrefferedServices.frame.origin.y, width: self.collPrefferedServices.bounds.size.width, height: collPrefferedServices.contentSize.height)

        
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
        flowLayout.headerReferenceSize = CGSize(width: 320, height: 50)

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numOfColumnsInRow))
        let items = (flowLayout.minimumInteritemSpacing * CGFloat(numOfColumnsInRow - 1))
        
        return CGSize(width: size, height: size)
    }
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat(60.0))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        var headerView = UICollectionReusableView()
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AppoinmentHeaderCell", for: indexPath) as! AppoinmentHeaderCell
                    default:
            assert(false, "Unexpected element kind")
        }
        return headerView
   
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        
        if selectedCell.isSelected == true
        {
            selectedCell.vWMark.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            selectedCell.vWMark.isHidden = false
            selectedCell.imgMark.isHidden = false
            callPopup()
        }
        else
        {
            selectedCell.vWMark.isHidden = true
            selectedCell.imgMark.isHidden = true
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        
        
        selectedCell.vWMark.isHidden = true
        selectedCell.imgMark.isHidden = true
        
    }
    
    func callPopup(){
        UIView.animate(withDuration: 1.0, animations:{self.vwPopUp.alpha = 1.0}, completion: { (bool) in
            
        })
    }
        
}
