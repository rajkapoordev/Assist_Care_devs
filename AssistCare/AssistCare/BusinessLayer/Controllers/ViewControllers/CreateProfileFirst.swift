//
//  CreateProfileFirst.swift
//  AssistCare
//
//  Created by LaNet on 1/19/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileFirst: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()
    
    @IBOutlet var vwStatusBar: UIView!
    
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
    let education = ["Deploma","Engineering","MCA"]
    var isOpened:Bool = false
    var isFrom = false
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        
        pickerView.dataSource = self
        vWSchedule.isHidden = true
        vWTimePicker.isHidden = true
        
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
    
  
    @IBAction func btnBackClick(_ sender: UIButton) {
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
    
    
    @IBAction func btnSelectProfileImg(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func btnAddScheduleClick(_ sender: Any) {
        
        lblTimeDisplay.text = (btnFromTime.titleLabel?.text)! + "/" + (btnToTime.titleLabel?.text)!
        vWSchedule.isHidden = true
        
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
    
    
    }
    
    @IBAction func btnNextClick(_ sender: Any) {
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
    
    @IBAction func btnMonClick(_ sender: Any) {
        if(btnMon.backgroundColor == AppColor.grayColor ){
            btnMon.backgroundColor = AppColor.skyColor
            btnMon.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnMon.backgroundColor = AppColor.grayColor
            btnMon.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnTuesClick(_ sender: Any) {
        if(btnTues.backgroundColor == AppColor.grayColor ){
            btnTues.backgroundColor = AppColor.skyColor
            btnTues.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnTues.backgroundColor = AppColor.grayColor
            btnTues.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }

    }
    

    @IBAction func btnWedClick(_ sender: Any) {
        if(btnWed.backgroundColor == AppColor.grayColor ){
            btnWed.backgroundColor = AppColor.skyColor
            btnWed.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnWed.backgroundColor = AppColor.grayColor
            btnWed.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnThurClick(_ sender: Any) {
        if(btnThur.backgroundColor == AppColor.grayColor ){
            btnThur.backgroundColor = AppColor.skyColor
            btnThur.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnThur.backgroundColor = AppColor.grayColor
            btnThur.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }

    }
    
    
    @IBAction func btnFriClick(_ sender: Any) {
        if(btnFri.backgroundColor == AppColor.grayColor ){
            btnFri.backgroundColor = AppColor.skyColor
            btnFri.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnFri.backgroundColor = AppColor.grayColor
            btnFri.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    
    @IBAction func btnSatClick(_ sender: Any) {
        if(btnSat.backgroundColor == AppColor.grayColor ){
            btnSat.backgroundColor = AppColor.skyColor
            btnSat.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSat.backgroundColor = AppColor.grayColor
            btnSat.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnSunClick(_ sender: Any) {
        if(btnSun.backgroundColor == AppColor.grayColor ){
            btnSun.backgroundColor = AppColor.skyColor
            btnSun.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSun.backgroundColor = AppColor.grayColor
            btnSun.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnFromTimeClick(_ sender: Any) {
        
        self.vWTimePicker.alpha = 0
        self.vWTimePicker.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.vWTimePicker.alpha = 1
        }
        

       
        isFrom = false
        
        
        
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
    
    @IBAction func btnToTimeClick(_ sender: Any) {
        
        self.vWTimePicker.alpha = 0
         self.vWTimePicker.isHidden = false
        UIView.animate(withDuration: 0.3) {
             self.vWTimePicker.alpha = 1
        }

        isFrom = true
    }
    
    @IBAction func btnCancelClick(_ sender: Any) {
        
        self.vWTimePicker.alpha = 0
        self.vWTimePicker.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.vWTimePicker.alpha = 1
        }
//        timePicker.isHidden = true
//        vWDone.isHidden = true
     
    }
    @IBAction func btnDoneClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
     //    timePicker.isHidden = true
       //  vWDone.isHidden = true
        
        self.vWTimePicker.alpha = 0
        self.vWTimePicker.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.vWTimePicker.alpha = 1
        }


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
    
   
    @IBAction func selectEducation(_ sender: Any) {
        
        if(isOpened == false){
            vWPicker.isHidden = false
            
            pickerView.reloadAllComponents()
            self.pickerView.alpha = 0
            self.pickerView.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.pickerView.alpha = 1
            }
//            UIView.animate(withDuration: 0.6, animations:{self.vWPicker.frame = CGRect(x: self.vWPicker.frame.origin.x, y: (self.vWPicker.frame.origin.y-self.vWPicker.bounds.size.height), width: self.vWPicker.bounds.size.width, height: self.vWPicker.bounds.size.height)}, completion: { (bool) in
//                self.isOpened = true
//            })
        }else{
            closePickerView()
            self.isOpened = false
        }
    }
    
    func closePickerView(){
        UIView.animate(withDuration: 0.6, animations:{self.vWPicker.frame = CGRect(x: self.vWPicker.frame.origin.x, y: (self.vWPicker.frame.origin.y+self.vWPicker.bounds.size.height), width: self.vWPicker.bounds.size.width, height: self.vWPicker.bounds.size.height)}, completion: { (bool) in
        })
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
