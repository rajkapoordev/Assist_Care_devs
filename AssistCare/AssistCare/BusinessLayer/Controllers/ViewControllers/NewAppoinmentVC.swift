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

class NewAppoinmentVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MKMapViewDelegate, CLLocationManagerDelegate,UIPickerViewDelegate,UIPickerViewDataSource, FSCalendarDataSource, FSCalendarDelegate,UIGestureRecognizerDelegate{
    
    @IBOutlet var lbMonth: UILabel!
    @IBOutlet var lbDate: UILabel!
    @IBOutlet var lbYear: UILabel!
    @IBOutlet var vwSelectedDate: UIView!
    @IBOutlet var vwCalender: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var btnDuration: UIButton!
    @IBOutlet var btnTime: UIButton!
    @IBOutlet var btnDate: UIButton!
    @IBOutlet var btnDateOk: UIButton!
    @IBOutlet var btnDateCancel: UIButton!
    
    @IBOutlet var viewGray: UIView!
    @IBOutlet var btnPopUpaddServices: UIButton!
    @IBOutlet var btnPopUpMessage: UIButton!
    @IBOutlet var lbPopUpServicesProvided: UILabel!
    @IBOutlet var lbPopUpTime: UILabel!
    @IBOutlet var lbPopUpDate: UILabel!
    @IBOutlet var lbPopUpName: UILabel!
    @IBOutlet var imgPopUpProfile: UIImageView!
    @IBOutlet var btnOkay: UIButton!
    @IBOutlet var btnCancelAppoinment: UIButton!
    @IBOutlet var vwPopUp: UIView!
    @IBOutlet var vwDuration: UIView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var vwMap: UIView!
    @IBOutlet var collAssistServices: UICollectionView!
    @IBOutlet var collPrefferedServices: UICollectionView!
    @IBOutlet var scrollNewAppoinment: UIScrollView!
    
    
    let duration = ["1 hour","2 hour","3 hour","4 hour"]
    let googleMapAPIKey = "AIzaSyCblEAKCQQZE9EFFlkTlwB8BVA4Ize8t5M"
    let kBgQueue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
    var currentCentre = CLLocationCoordinate2D()
    var currenDist:CLLocationDistance = 0
    let locationManager = CLLocationManager()
    var selectedData:String!
    var tempButton:UIButton!
    var isOpened:Bool = false
    var selectedDate = Date()
    
    @IBAction func btnTime(_ sender: Any) {
        
    }
    
    @IBAction func btnDate(_ sender: Any) {
        vwCalender.isHidden = false
        self.callCalender()
    }
    
    @IBAction func btnDateOk(_ sender: Any) {
        self.viewGray.isHidden = true
        
        UIView.animate(withDuration: 1.0, animations:{self.vwCalender.alpha = 0.0}, completion: { (bool) in
            
        })
    }
    
    @IBAction func btnDateCancel(_ sender: Any) {
        self.viewGray.isHidden = true
        
        UIView.animate(withDuration: 1.0, animations:{self.vwCalender.alpha = 0.0}, completion: { (bool) in
            
        })
    }
    
    @IBAction func btnDuration(_ sender: Any) {
        if(isOpened == false){
            
            self.tempButton = self.btnDuration
            pickerView.reloadAllComponents()
            UIView.animate(withDuration: 0.8, animations:{self.vwDuration.frame = CGRect(x: self.vwDuration.frame.origin.x, y: (self.vwDuration.frame.origin.y-self.vwDuration.bounds.size.height), width: self.vwDuration.bounds.size.width, height: self.vwDuration.bounds.size.height)}, completion: { (bool) in
                self.isOpened = true
            })
        }else{
            closePickerView()
            self.isOpened = false
        }
    }
    
    @IBAction func btnDone(_ sender: Any) {
        closePickerView()
        self.isOpened = false
    }
    
    @IBAction func btnCancelAppoinment(_ sender: Any) {
        self.viewGray.isHidden = true
        
        UIView.animate(withDuration: 1.0, animations:{self.vwPopUp.alpha = 0.0}, completion: { (bool) in
            
        })
    }
    
    @IBAction func btnOkay(_ sender: Any) {
        
    }
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
        }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.collPrefferedServices.delegate = self
        self.collPrefferedServices.dataSource = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.collPrefferedServices.register(UINib(nibName: "CareServicesCell", bundle: nil), forCellWithReuseIdentifier: "CareServicesCell")
        
        self.collPrefferedServices.register(UINib(nibName: "AppoinmentHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "AppoinmentHeaderCell")
        self.setInterface()
        
    }
    
    deinit {
        print("\(#function)")
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
        navigationController?.navigationBar.tintColor = UIColor.white
        scrollNewAppoinment.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 700)
        vwPopUp.layer.cornerRadius = 5.0
        vwCalender.layer.cornerRadius = 2.0
        btnCancelAppoinment.setTitle("CANCEL APPOINMENT", for: .normal)
        btnOkay.setTitle("OKAY", for: .normal)
        btnCancelAppoinment.backgroundColor = getRedColor()
        btnOkay.backgroundColor = getGreenColor()
        btnCancelAppoinment.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        btnCancelAppoinment.titleLabel?.lineBreakMode = .byWordWrapping
        btnOkay.tintColor = UIColor.white
        btnCancelAppoinment.titleLabel?.textAlignment = .center
        btnOkay.titleLabel?.textAlignment = .center
        btnCancelAppoinment.tintColor = UIColor.white
        
        lbPopUpName.text = "Anna Connonly"
        lbPopUpDate.text = "February 28th"
        lbPopUpTime.text = "9:00 am - 12:00 pm"
        lbPopUpServicesProvided.text = "Services Provided"
        
        btnPopUpMessage.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "chat"), scaledToSize: CGSize(width: btnPopUpMessage.bounds.size.width, height: btnPopUpMessage.bounds.size.width)), for: .normal)
        btnPopUpaddServices.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "addMedication"), scaledToSize: CGSize(width: btnPopUpaddServices.bounds.size.width, height: btnPopUpaddServices.bounds.size.width)), for: .normal)
        imgPopUpProfile.layer.cornerRadius = imgPopUpProfile.bounds.size.width/2
        btnOkay.roundedBottomRightButton()
        btnCancelAppoinment.roundedBottomLeftButton()
        btnDate.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "timer"), scaledToSize: CGSize(width: btnDate.bounds.size.width, height: btnDate.bounds.size.height)), for: .normal)
        
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
        setCalenderInterface()
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        if(self.duration != nil){
            count = duration.count
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var data = ""
        if(self.duration != nil){
            data = self.duration[row]
        }
        return data
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var data = ""
        data = self.duration[row]
        self.selectedData = data
        self.changeData(button: self.tempButton)
    }
    
    
    func callPopup(){
        self.viewGray.isHidden = false
        UIView.animate(withDuration: 1.0, animations:{self.vwPopUp.alpha = 1.0}, completion: { (bool) in
            
        })
    }
    
    func callCalender(){
        self.viewGray.isHidden = false
        UIView.animate(withDuration: 1.0, animations:{self.vwCalender.alpha = 1.0}, completion: { (bool) in
            
        })
    }
    
    func changeData(button:UIButton){
        button.setTitle(self.selectedData, for: .normal)
    }
    
    func closePickerView(){
        UIView.animate(withDuration: 0.6, animations:{self.vwDuration.frame = CGRect(x: self.vwDuration.frame.origin.x, y: (self.vwDuration.frame.origin.y+self.vwDuration.bounds.size.height), width: self.vwDuration.bounds.size.width, height: self.vwDuration.bounds.size.height)}, completion: { (bool) in
        })
        
    }
    
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendar.bounds.size.height = bounds.height
        self.view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //selectedDate = date
        let calendar1 = Calendar.current
        lbDate.text = String(calendar1.component(.day, from: date))
        let monthNumber  = calendar1.component(.month, from: date)
        lbMonth.text = DateFormatter().monthSymbols[monthNumber - 1]
        lbYear.text = String(calendar1.component(.year, from: date))
        print("did select date \(self.dateFormatter.string(from: date))")
        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected dates is \(selectedDates)")
        self.selectedData = selectedDates[0]
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("\(self.dateFormatter.string(from: calendar.currentPage))")
    }
    
    func setCalenderInterface(){
        
        self.calendar.select(Date())
        //view.addGestureRecognizer(self.scopeGesture)
        //self.tableView.panGestureRecognizer.require(toFail: self.scopeGesture)
        self.calendar.scope = .month
        
        let date = Date()
        let calendar1 = Calendar.current
        lbDate.text = String(calendar1.component(.day, from: date))
        let monthNumber  = calendar1.component(.month, from: date)
        lbMonth.text = DateFormatter().monthSymbols[monthNumber - 1]
        lbYear.text = String(calendar1.component(.year, from: date))
    }
}
