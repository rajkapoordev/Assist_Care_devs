//
//  CreateProfileFirst.swift
//  AssistCare
//
//  Created by LaNet on 1/19/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileFirst: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet var imgAdd: UIImageView!
    @IBOutlet var imgSchedule: UIImageView!
    @IBOutlet var btnAddSchedule: UIButton!
    @IBOutlet var imageTime: UIImageView!
    @IBOutlet var imgRecurring: UIImageView!
    @IBOutlet var btnEducation: UIButton!
    @IBOutlet var btnLocation: UIButton!
    @IBOutlet var imgLocation: UIImageView!
    @IBOutlet var imgEducation: UIImageView!
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var btnNext: UIButton!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var vWEducation: UIView!
    @IBOutlet var vWLocation: UIView!
    @IBOutlet var lblTimeDisplay: UILabel!
    @IBOutlet var lblDayDisplay: UILabel!
    @IBOutlet var vWSchedule: UIView!
    @IBOutlet var btnMon: UIButton!
    @IBOutlet var btnTues: UIButton!
    @IBOutlet var btnWed: UIButton!
    @IBOutlet var btnThur: UIButton!
    @IBOutlet var btnFri: UIButton!
    @IBOutlet var btnSat: UIButton!
    @IBOutlet var btnSun: UIButton!
    @IBOutlet var vWDone: UIView!
    @IBOutlet var timePicker: UIDatePicker!
    @IBOutlet var btnFromTime: UIButton!
    @IBOutlet var vWPicker: UIView!
    @IBOutlet var btnToTime: UIButton!
    @IBOutlet var txtFname: UITextField!
    @IBOutlet var txtLname: UITextField!
    @IBOutlet var txtEducation: UITextField!
    @IBOutlet var txtAddress: UITextField!
    @IBOutlet var txtDateOfBirth: UITextField!
    @IBOutlet var vWTimePicker: UIView!
    @IBOutlet var pickerView: UIPickerView!
    
    let education = ["Diploma","Engineering","MCA"]
    let imagePicker = UIImagePickerController()
    var isOpened:Bool = false
    var isFrom:Bool = false
    var isTo:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        
        pickerView.dataSource = self
        
        txtFname.delegate = self
        txtLname.delegate = self
        txtEducation.delegate = self
        txtAddress.delegate = self
        txtDateOfBirth.delegate = self
        imgProfile.setRounded()
         setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtFname
        {
            txtLname.becomeFirstResponder()
            return true
        }
        else if textField == txtLname
        {
            txtDateOfBirth.becomeFirstResponder()
        }
        else if textField == txtDateOfBirth
        {
            txtDateOfBirth.resignFirstResponder()
        }
        else
        {
           scrollView.setContentOffset(CGPoint(x: 0.0, y: 0), animated: true)
           // keyboardWillHide()
            textField.resignFirstResponder()
        }
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtAddress {
                    scrollView.setContentOffset(CGPoint(x: 0.0, y: ScreenSize.SCREEN_WIDTH/3), animated: true)
        }
        return true
    }
    
    func setInterface()
    {
        self.navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        txtFname.setBottomBorder()
        txtLname.setBottomBorder()
        txtDateOfBirth.setBottomBorder()
        vWLocation.setBottomBorderView()
        vWEducation.setBottomBorderView()
        btnMon.backgroundColor = AppColor.grayColor
        btnTues.backgroundColor = AppColor.grayColor
        btnWed.backgroundColor = AppColor.grayColor
        btnThur.backgroundColor = AppColor.grayColor
        btnFri.backgroundColor = AppColor.grayColor
        btnSat.backgroundColor = AppColor.grayColor
        btnSun.backgroundColor = AppColor.grayColor
        
        btnMon.layer.cornerRadius = btnMon.bounds.size.width/2
        btnTues.layer.cornerRadius = btnTues.bounds.size.width/2
        btnWed.layer.cornerRadius = btnWed.bounds.size.width/2
        btnThur.layer.cornerRadius = btnThur.bounds.size.width/2
        btnFri.layer.cornerRadius = btnFri.bounds.size.width/2
        btnSat.layer.cornerRadius = btnSat.bounds.size.width/2
        btnSun.layer.cornerRadius = btnSun.bounds.size.width/2
        btnNext.backgroundColor = AppColor.backColor
        btnNext.shadow()
        btnLocation.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "location"), scaledToSize: CGSize(width: btnLocation.bounds.size.width, height: btnLocation.bounds.size.height)), for: .normal)
        btnAddSchedule.backgroundColor = AppColor.skyColor
        imgRecurring.image = imageWithImage(#imageLiteral(resourceName: "payment"), scaledToSize: CGSize(width: imgRecurring.bounds.size.width - 10, height: imgRecurring.bounds.size.height - 10))
        imageTime.image = imageWithImage(#imageLiteral(resourceName: "timer"), scaledToSize: CGSize(width: imageTime.bounds.size.width - 10, height: imageTime.bounds.size.height - 10))
        imgAdd.image = imageWithImage(#imageLiteral(resourceName: "addMedication"), scaledToSize: CGSize(width: imgAdd.bounds.size.width - 10, height: imgAdd.bounds.size.height - 10))
        imgSchedule.image = imageWithImage(#imageLiteral(resourceName: "timer"), scaledToSize: CGSize(width: imgSchedule.bounds.size.width - 10, height: imgSchedule.bounds.size.height - 10))
    }
    
    func setTime(btn:UIButton)
    {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        print(dateFormatter.string(from: timePicker.date))
        if isFrom
        {
            btnToTime.setTitle(dateFormatter.string(from: timePicker.date), for: .normal)
        }
        else
        {
            btnFromTime.setTitle(dateFormatter.string(from: timePicker.date), for: .normal)
            
        }
        
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        count = education.count
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var data = ""
        data = education[row]
        return data
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtEducation.text = education[row]
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgProfile.contentMode = .scaleAspectFill
            imgProfile.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func closePickerView(pickerView:UIView){
        UIView.animate(withDuration: 0.6, animations:{pickerView.frame = CGRect(x: pickerView.frame.origin.x, y: (pickerView.frame.origin.y+pickerView.bounds.size.height), width: pickerView.bounds.size.width, height: pickerView.bounds.size.height)}, completion: { (bool) in
        })
    }
    
    @IBAction func btnAddScheduleClick(_ sender: Any) {
        
        lblTimeDisplay.text = (btnFromTime.titleLabel?.text)! + "/" + (btnToTime.titleLabel?.text)!
        vWSchedule.isHidden = true
    }

    
    @IBAction func btnLocation(_ sender: Any) {
        
        
    }
    
    @IBAction func btnSelectProfileImg(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    
    @IBAction func btnBackClick(_ sender: UIButton) {
       self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextClick(_ sender: UIButton) {
        let vc = CreateProfileSecond(nibName: "CreateProfileSecond", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    @IBAction func btnSelectedCourseClick(_ sender: Any) {
        txtAddress.becomeFirstResponder()
        scrollView.setContentOffset(CGPoint(x: 0.0, y: ScreenSize.SCREEN_WIDTH/3), animated: true)
        vWPicker.isHidden = true
    }

    @IBAction func btnSelectScheduleClick(_ sender: Any) {
        self.vWSchedule.alpha = 0
        self.vWSchedule.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.vWSchedule.alpha = 1
        }
      
    }
    
    @IBAction func btnMonClick(_ sender: UIButton) {
        if(btnMon.backgroundColor == AppColor.grayColor ){
            btnMon.backgroundColor = AppColor.greenStatusBar
            btnMon.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnMon.backgroundColor = AppColor.grayColor
            btnMon.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnTuesClick(_ sender: UIButton) {
        if(btnTues.backgroundColor == AppColor.grayColor ){
            btnTues.backgroundColor = AppColor.greenStatusBar
            btnTues.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnTues.backgroundColor = AppColor.grayColor
            btnTues.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }

    }
    

    @IBAction func btnWedClick(_ sender: UIButton) {
        if(btnWed.backgroundColor == AppColor.grayColor ){
            btnWed.backgroundColor = AppColor.greenStatusBar
            btnWed.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnWed.backgroundColor = AppColor.grayColor
            btnWed.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnThurClick(_ sender: UIButton) {
        if(btnThur.backgroundColor == AppColor.grayColor ){
            btnThur.backgroundColor = AppColor.greenStatusBar
            btnThur.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnThur.backgroundColor = AppColor.grayColor
            btnThur.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }

    }
    
    
    @IBAction func btnFriClick(_ sender: UIButton) {
        if(btnFri.backgroundColor == AppColor.grayColor ){
            btnFri.backgroundColor = AppColor.greenStatusBar
            btnFri.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnFri.backgroundColor = AppColor.grayColor
            btnFri.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    
    @IBAction func btnSatClick(_ sender: UIButton) {
        if(btnSat.backgroundColor == AppColor.grayColor ){
            btnSat.backgroundColor = AppColor.greenStatusBar
            btnSat.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSat.backgroundColor = AppColor.grayColor
            btnSat.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnSunClick(_ sender: UIButton) {
        if(btnSun.backgroundColor == AppColor.grayColor ){
            btnSun.backgroundColor = AppColor.greenStatusBar
            btnSun.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSun.backgroundColor = AppColor.grayColor
            btnSun.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnFromTimeClick(_ sender: Any) {

        
        if(isFrom == false){
            //self.tempButton = self.btnFood
            pickerView.reloadAllComponents()
            UIView.animate(withDuration: 0.6, animations:{self.vWTimePicker.frame = CGRect(x: self.vWTimePicker.frame.origin.x, y: (self.vWTimePicker.frame.origin.y-self.vWTimePicker.bounds.size.height), width: self.vWTimePicker.bounds.size.width, height: self.vWTimePicker.bounds.size.height)}, completion: { (bool) in
                self.isFrom = true
            })
        }else{
            closePickerView(pickerView: vWTimePicker)
            self.isFrom = false
        }
        
    }
    
    
    @IBAction func btnToTimeClick(_ sender: Any) {
        
        if(isTo == false){
            //self.tempButton = self.btnFood
            pickerView.reloadAllComponents()
            UIView.animate(withDuration: 0.6, animations:{self.vWTimePicker.frame = CGRect(x: self.vWTimePicker.frame.origin.x, y: (self.vWTimePicker.frame.origin.y-self.vWTimePicker.bounds.size.height), width: self.vWTimePicker.bounds.size.width, height: self.vWTimePicker.bounds.size.height)}, completion: { (bool) in
                self.isTo = true
            })
        }else{
            closePickerView(pickerView: vWTimePicker)
            self.isTo = false
        }
    }
    
    @IBAction func btnCancelClick(_ sender: Any) {
        closePickerView(pickerView: vWTimePicker)
        self.isFrom = false
        self.isTo = false
    }
    
    @IBAction func btnDoneClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
     //    timePicker.isHidden = true
       //  vWDone.isHidden = true
        
        closePickerView(pickerView: vWTimePicker)
        


        print(dateFormatter.string(from: timePicker.date))
        if isFrom
        {
            btnFromTime.setTitle(dateFormatter.string(from: timePicker.date), for: .normal)
        }
        else
        {
            btnToTime.setTitle(dateFormatter.string(from: timePicker.date), for: .normal)
            
        }
        self.isFrom = false
        self.isTo = false

    }
    
   
    @IBAction func selectEducation(_ sender: Any) {
        if(isOpened == false){
            //self.tempButton = self.btnFood
            pickerView.reloadAllComponents()
            UIView.animate(withDuration: 0.6, animations:{self.vWPicker.frame = CGRect(x: self.vWPicker.frame.origin.x, y: (self.vWPicker.frame.origin.y-self.vWPicker.bounds.size.height), width: self.vWPicker.bounds.size.width, height: self.vWPicker.bounds.size.height)}, completion: { (bool) in
                self.isOpened = true
            })
        }else{
            closePickerView(pickerView: vWPicker)
            self.isOpened = false
        }
    }
    
    @IBAction func btnMon(_ sender: UIButton) {
        if(btnMon.backgroundColor == AppColor.grayColor ){
            btnMon.backgroundColor = AppColor.skyColor
            btnMon.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnMon.backgroundColor = AppColor.grayColor
            btnMon.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnTue(_ sender: UIButton) {
        if(btnTues.backgroundColor == AppColor.grayColor ){
            btnTues.backgroundColor = AppColor.skyColor
            btnTues.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnTues.backgroundColor = AppColor.grayColor
            btnTues.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnWed(_ sender: UIButton) {
        if(btnWed.backgroundColor == AppColor.grayColor ){
            btnWed.backgroundColor = AppColor.skyColor
            btnWed.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnWed.backgroundColor = AppColor.grayColor
            btnWed.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnThur(_ sender: UIButton) {
        if(btnThur.backgroundColor == AppColor.grayColor ){
            btnThur.backgroundColor = AppColor.skyColor
            btnThur.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnThur.backgroundColor = AppColor.grayColor
            btnThur.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnFri(_ sender: UIButton) {
        if(btnFri.backgroundColor == AppColor.grayColor ){
            btnFri.backgroundColor = AppColor.skyColor
            btnFri.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnFri.backgroundColor = AppColor.grayColor
            btnFri.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnSat(_ sender: UIButton) {
        if(btnSat.backgroundColor == AppColor.grayColor ){
            btnSat.backgroundColor = AppColor.skyColor
            btnSat.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSat.backgroundColor = AppColor.grayColor
            btnSat.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnSun(_ sender: UIButton) {
        if(btnSun.backgroundColor == AppColor.grayColor ){
            btnSun.backgroundColor = AppColor.skyColor
            btnSun.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSun.backgroundColor = AppColor.grayColor
            btnSun.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }

    

}
