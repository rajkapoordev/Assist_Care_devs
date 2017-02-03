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

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}
class NewAppoinmentVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIPickerViewDelegate,UIPickerViewDataSource, FSCalendarDataSource, FSCalendarDelegate,UIGestureRecognizerDelegate,UISearchBarDelegate{
    
    @IBOutlet var vWSearch: UIView!
    @IBOutlet var lblDay: UILabel!
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
    @IBOutlet var vwTime: UIView!
    @IBOutlet var vwClock: UIView!
    @IBOutlet var vwSelectedTime: UIView!
    @IBOutlet var btnPM: UIButton!
    @IBOutlet var btnAM: UIButton!
    @IBOutlet var btnSearch: UIButton!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    //Time in clock top view
    @IBOutlet var lblPopUpTopTime: UILabel!
    @IBOutlet var lblPopUpAmPm: UILabel!
    
    @IBOutlet var btnHour: UIButton!
    @IBOutlet var btnMinute: UIButton!
    
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
    
    var arrX = NSMutableArray()
    var arrY = NSMutableArray()
    var radius = CGFloat()
    var arrButton:Array<UIButton> = []
    
    var selectedTime = ""
    var meridiem = ""
    var selectedHour = 3
    var selectedMinute = 5
    var isHourSelected = true
    var isMinuteSelected = true
    
    var resultSearchController:UISearchController? = nil
    var selectedPin:MKPlacemark? = nil
    //Timer
    @IBAction func btnAM(_ sender: Any) {
        self.setMeridiemInClock(flag: 0)
    }
    
    @IBAction func btnPM(_ sender: Any) {
        self.setMeridiemInClock(flag: 1)
    }
    
    
    @IBAction func btnHour(_ sender: UIButton) {
        if isMinuteSelected {
            let arr: NSArray = [12,1,2,3,4,5,6,7,8,9,10,11]
            self.isHourSelected = true
            self.isMinuteSelected = false
            createClockForTimer(arr: arr)
        }
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        let searchVC = searchCareGiverOnMapVC(nibName: "searchCareGiverOnMapVC",bundle: nil)
        self.navigationController!.pushViewController(searchVC, animated: true)
    }
                
    @IBAction func btnMinute(_ sender: UIButton) {
        if isHourSelected {
            let arr: NSArray = [0,5,10,15,20,25,30,35,40,45,50,55]
            self.isMinuteSelected = true
            self.isHourSelected = false
            createClockForTimer(arr: arr)
        }
    }
    
    //Flag = 0 then AM else PM
    func setMeridiemInClock(flag: Int) {
        if (flag == 0) {
            self.lblPopUpAmPm.text = "AM"
            self.btnAM.layer.cornerRadius = self.btnAM.frame.width / 2
            self.btnAM.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1)
            self.btnAM.setTitleColor(UIColor.white, for: .normal)
            self.meridiem = "AM"
            
            self.btnPM.backgroundColor = UIColor.clear
            self.btnPM.setTitleColor(UIColor.black, for: .normal)
            
        }else {
            self.lblPopUpAmPm.text = "PM"
            self.btnPM.layer.cornerRadius = self.btnPM.frame.width / 2
            self.btnPM.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1)
            self.btnPM.setTitleColor(UIColor.white, for: .normal)
            self.meridiem = "PM"
            
            self.btnAM.backgroundColor = UIColor.clear
            self.btnAM.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    @IBAction func btnTimeCancel(_ sender: Any) {
        UIView.animate(withDuration: 0.8, animations:{self.vwTime.alpha = 0.0}, completion: { (bool) in
            self.viewGray.isHidden = true
        })
    }
    
    @IBAction func btnTimeOK(_ sender: Any) {
        self.selectedTime = String(selectedHour) + ":" + String(selectedMinute) + " " + meridiem
        btnTime.setTitle(self.selectedTime, for: .normal)
        UIView.animate(withDuration: 0.0, animations:{self.vwTime.alpha = 0.0}, completion: { (bool) in
            self.viewGray.isHidden = true
        })
    }
    
    @IBAction func btnTime(_ sender: Any) {
        btnHour.sendActions(for: .touchUpInside)
        self.view.window?.addSubview(vwTime)
        vwTime.isHidden = false
        self.callTime()
    }
    
    @IBAction func btnDate(_ sender: Any) {
        //     self.view.window?.addSubview(vwCalender)
        //     self.view.window?.clipsToBounds = true
        vwCalender.isHidden = false
        self.callCalender()
    }
    
    @IBAction func btnDateOk(_ sender: Any) {
        UIView.animate(withDuration: 0.0, animations:{self.vwCalender.alpha = 0.0}, completion: { (bool) in
            self.view.window?.addSubview(self.vwTime)
            self.vwTime.isHidden = false
            self.callTime()
            
            let arr: NSArray = [12,1,2,3,4,5,6,7,8,9,10,11]
            self.isHourSelected = true
            self.isMinuteSelected = false
            self.createClockForTimer(arr: arr)
            
            //self.viewGray.isHidden = true
        })
        
    }
    
    @IBAction func btnDateCancel(_ sender: Any) {
        // self.vwCalender.removeFromSuperview()
        UIView.animate(withDuration: 1.0, animations:{self.vwCalender.alpha = 0.0}, completion: { (bool) in
            self.viewGray.isHidden = true
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
        
        let locationManager = CLLocationManager()
        var resultSearchController:UISearchController? = nil
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        
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
    override func viewDidLayoutSubviews() {
        btnCancelAppoinment.frame = CGRect(x: 0, y: vwPopUp.frame.size.height - 45, width: vwPopUp.frame.size.width/2, height: 45)
        
        btnOkay.frame = CGRect(x: vwPopUp.frame.size.width/2, y: vwPopUp.frame.size.height - 45, width: vwPopUp.frame.size.width/2, height: 45)
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
        
        btnOkay.roundedBottomRightButton()
        btnCancelAppoinment.roundedBottomLeftButton()
        
    }
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "New Appoinment"
        
        vwMap.layer.shadowColor = UIColor.gray.cgColor
        vwMap.layer.shadowOffset = CGSize(width: 3, height: 3)
        vwMap.layer.shadowOpacity = 0.7
        //        vwMap.layer.shadowRadius = 1.0;
        
        scrollNewAppoinment.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 930)
        vwPopUp.layer.cornerRadius = 5.0
        vwCalender.layer.cornerRadius = 2.0
        
        
        lbPopUpName.text = "Anna Connonly"
        lbPopUpDate.text = "February 28th"
        lbPopUpTime.text = "9:00 am - 12:00 pm"
        lbPopUpServicesProvided.text = "Services Provided"
        
        btnPopUpMessage.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "chat"), scaledToSize: CGSize(width: btnPopUpMessage.bounds.size.width, height: btnPopUpMessage.bounds.size.width)), for: .normal)
        btnPopUpaddServices.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "addMedication"), scaledToSize: CGSize(width: btnPopUpaddServices.bounds.size.width, height: btnPopUpaddServices.bounds.size.width)), for: .normal)
        imgPopUpProfile.layer.cornerRadius = imgPopUpProfile.bounds.size.width/2
        btnDate.setImage(imageWithImage(#imageLiteral(resourceName: "timer"), scaledToSize: CGSize(width: btnDate.bounds.size.width, height: btnDate.bounds.size.height)), for: .normal)
        // btnDate.setBackgroundImage()
        btnDate.contentMode = .scaleAspectFit
        //set Timer or clock
        vwClock.layer.cornerRadius = vwClock.bounds.size.width/2
        vwClock.backgroundColor = UIColor(red: 230/255, green: 234/255, blue: 236/255, alpha: 1)
        //  createClock()
        vwSelectedTime.backgroundColor = UIColor(red: 54/255, green: 174/255, blue: 197/255, alpha: 1)
        lblPopUpAmPm.textColor = UIColor.white
        btnHour.setTitleColor(UIColor.white, for: .normal)
        btnMinute.setTitleColor(UIColor.white, for: .normal)
        btnHour.setTitle(String(selectedHour), for: .normal)
        let minute = (selectedMinute < 10) ? "0"+String(selectedMinute) : String(selectedMinute)
        btnMinute.setTitle(minute, for: .normal)
        lblPopUpTopTime.textColor = UIColor.white
        
        
        self.setMeridiemInClock(flag: 1)
        self.view.window?.isUserInteractionEnabled = true
        
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
        //mapView.delegate = self
        setCalenderInterface()
        
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
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
        btnSearch.frame = CGRect(x: self.btnSearch.frame.origin.x, y: self.collPrefferedServices.bounds.size.height + self.collPrefferedServices.frame.origin.y + 10, width: self.btnSearch.bounds.size.width, height: self.btnSearch.bounds.size.height)
        scrollNewAppoinment.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: self.btnSearch.bounds.size.height + self.btnSearch.frame.origin.y)
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
            
            for vw in headerView.subviews{
                if vw.isKind(of: UILabel.self){
                    if indexPath.section == 0{
                        (vw as! UILabel).text = "Your Prefered Services"
                    }else if indexPath.section == 1{
                        (vw as! UILabel).text = "Other Assist Services"
                    }
                }
            }
        default:
            assert(false, "Unexpected element kind")
        }
        return headerView
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CareServicesCell
        
        if selectedCell.isSelected == true {
            selectedCell.vWMark.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            selectedCell.vWMark.isHidden = false
            selectedCell.imgMark.isHidden = false
            callPopup()
        }else {
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
        if (self.duration.count > 0) {
            count = duration.count
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var data = ""
        if(self.duration.count > 0) {
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
    
    func callTime(){
        self.viewGray.isHidden = false
        UIView.animate(withDuration: 1.0, animations:{self.vwTime.alpha = 1.0}, completion: { (bool) in
            
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
        self.calendar.scope = .month
        
        let date = Date()
        let calendar1 = Calendar.current
        lbDate.text = String(calendar1.component(.day, from: date))
        let monthNumber  = calendar1.component(.month, from: date)
        lbMonth.text = DateFormatter().monthSymbols[monthNumber - 1]
        lbYear.text = String(calendar1.component(.year, from: date))
    }
    
    //Create clock
    func createClockForTimer(arr: NSArray) {
        vwClock.subviews.forEach({ $0.removeFromSuperview() })
        let clock = CALayer()
        var bounds = self.vwClock.layer.bounds
        bounds.origin.x = vwClock.layer.bounds.origin.x + 15
        bounds.origin.y = vwClock.layer.bounds.origin.y + 15
        bounds.size.height = self.vwClock.layer.bounds.size.height-30
        bounds.size.width = self.vwClock.layer.bounds.size.width-30
        clock.bounds = bounds;
        clock.cornerRadius = bounds.size.width / 2;
        clock.borderWidth = 1.0
        clock.borderColor = UIColor.black.cgColor
        var position = CGPoint(x: CGFloat(bounds.midX), y: CGFloat(bounds.midY))
        position = (self.vwClock.superview?.convert(position, from: self.vwClock))!
        clock.position = position
        
        radius = clock.bounds.size.width / 2 - 10
        var makeBtnSelected = UIButton();
        (arr as NSArray).enumerateObjects({ (aLabelString, index, stop) in
            let angle: CGFloat = (CGFloat(index)) * CGFloat(M_PI) * 2 / CGFloat(arr.count) - CGFloat(M_PI_2)
            let x: CGFloat = round(CGFloat(cosf(Float(angle))) * radius) + bounds.midX
            let y: CGFloat = round(CGFloat(sinf(Float(angle))) * radius) + bounds.midY
            let center = CGPoint(x: x, y: y)
            arrX.add(x)
            arrY.add(y)
            //Create a label.
            
            let btn = UIButton(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(35), height: CGFloat(35)))
            btn.layer.cornerRadius = btn.bounds.size.width / 2
            
            btn.tag = index
            btn.addTarget(self, action: #selector(self.ratingButtonTapped), for: .touchUpInside)
            //Set up it's font, color, position, center alignment, etc.
            
            btn.center = center
            btn.setTitle(String(describing: arr[btn.tag]), for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            //Finally, add the button to the clock view.
            self.vwClock.addSubview(btn)
            arrButton.insert(btn, at: index)
            
            //By defualt selected hour 3
            
            var selectedTag = 0;
            if isHourSelected {
                selectedTag = self.selectedHour
            }else{
                selectedTag = self.selectedMinute/5
            }
            if btn.tag == selectedTag {
                makeBtnSelected = btn
            }
        });
        makeBtnSelected.sendActions(for: .touchUpInside)
    }
    
    func ratingButtonTapped(_ button: UIButton) {
        let btn = button
        let Path = UIBezierPath()
        Path.move(to: CGPoint(x:arrX[btn.tag] as! CGFloat, y:arrY[btn.tag] as! CGFloat))
        Path.addLine(to: CGPoint(x: radius+30, y: radius+30))
        let layerShape = CAShapeLayer()
        layerShape.path = Path.cgPath
        layerShape.strokeColor = UIColor(red: 54/255, green: 174/255, blue: 197/255, alpha: 1).cgColor
        layerShape.lineWidth = 1
        layerShape.fillColor = UIColor.red.cgColor
        
        if(self.vwClock.layer.value(forKey: "abc") != nil){
            let layerA:CALayer = self.vwClock.layer.value(forKey: "abc") as! CALayer
            layerA.removeFromSuperlayer()
            self.vwClock.layer .addSublayer(layerShape)
            self.vwClock.layer.setValue(layerShape, forKey: "abc")
        }
        else{
            self.vwClock.layer .addSublayer(layerShape)
            self.vwClock.layer.setValue(layerShape, forKey: "abc")
        }
        
        //Here selected hours
        if isHourSelected {
            self.selectedHour = ((btn.tag == 0) ? 12 : (btn.tag))
            self.btnHour.setTitle(String(self.selectedHour), for: .normal)
        }else{
            self.selectedMinute = (btn.tag * 5)
            let minute = (selectedMinute < 10) ? "0"+String(selectedMinute) : String(selectedMinute)
            self.btnMinute.setTitle(minute, for: .normal)
        }
        
        for i in 0..<arrButton.count{
            if(arrButton[i].tag == btn.tag){
                arrButton[i].backgroundColor = UIColor(red: 54/255, green: 174/255, blue: 197/255, alpha: 1)
                arrButton[i].setTitleColor(UIColor.white, for: .normal)
            }else{
                arrButton[i].backgroundColor = UIColor.clear
                arrButton[i].setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
}




extension NewAppoinmentVC: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let _ = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
}


extension NewAppoinmentVC : CLLocationManagerDelegate {
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


