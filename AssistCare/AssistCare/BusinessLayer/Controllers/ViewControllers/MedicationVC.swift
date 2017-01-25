//
//  MedicationVC.swift
//  AssistCare
//
//  Created by developer91 on 1/17/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit


class MedicationVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{

    @IBOutlet var btnAdd: UIView!
    @IBOutlet var btnDone: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var vwOption: UIView!
    @IBOutlet var btnSun: UIButton!
    @IBOutlet var btnSat: UIButton!
    @IBOutlet var btnFri: UIButton!
    @IBOutlet var btnThur: UIButton!
    @IBOutlet var btnWed: UIButton!
    @IBOutlet var btnTue: UIButton!
    @IBOutlet var btnMon: UIButton!
    @IBOutlet var vwSubTime: UIView!
    @IBOutlet var btnFood: UIButton!
    @IBOutlet var btnTime: UIButton!
    @IBOutlet var txtMedicationName: UITextField!
    @IBOutlet var lbAddMedication: UILabel!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    let time = ["Morning","Afternoon","Night"]
    let food = ["with Meal","With Breakfast","Before Meal","After Breakfast"]
    var selectedData:String!
    var tempButton:UIButton!
    var isOpened:Bool = false
 
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        txtMedicationName.delegate = self
        self.tempButton = btnTime
        self.setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Medication"
        
        txtMedicationName.setBottomBorder()
        btnMon.backgroundColor = getGrayColor()
        btnTue.backgroundColor = getGrayColor()
        btnWed.backgroundColor = getGrayColor()
        btnThur.backgroundColor = getGrayColor()
        btnFri.backgroundColor = getGrayColor()
        btnSat.backgroundColor = getGrayColor()
        btnSun.backgroundColor = getGrayColor()
        
        btnMon.layer.cornerRadius = btnMon.bounds.size.width/2
        btnTue.layer.cornerRadius = btnTue.bounds.size.width/2
        btnWed.layer.cornerRadius = btnWed.bounds.size.width/2
        btnThur.layer.cornerRadius = btnThur.bounds.size.width/2
        btnFri.layer.cornerRadius = btnFri.bounds.size.width/2
        btnSat.layer.cornerRadius = btnSat.bounds.size.width/2
        btnSun.layer.cornerRadius = btnSun.bounds.size.width/2
        btnFood.setTitle(food[0], for: .normal)
        btnTime.setTitle(time[0], for: .normal)
        btnMon.isHighlighted = false
        btnFood.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        btnFood.titleLabel?.lineBreakMode = .byWordWrapping
        
        btnAdd.layer.cornerRadius = 2.0
        view.backgroundColor = getBackgroundColor()
        txtMedicationName.backgroundColor = getBackgroundColor()
    }
    
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnTime(_ sender: Any) {
        if(isOpened == false){
        self.tempButton = self.btnTime
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.8, animations:{self.vwOption.frame = CGRect(x: self.vwOption.frame.origin.x, y: (self.vwOption.frame.origin.y-self.vwOption.bounds.size.height), width: self.vwOption.bounds.size.width, height: self.vwOption.bounds.size.height)}, completion: { (bool) in
            self.isOpened = true
        })
        }else{
            closePickerView()
            self.isOpened = false
        }
    }

    @IBAction func btnFood(_ sender: Any) {
        if(isOpened == false){
        self.tempButton = self.btnFood
        pickerView.reloadAllComponents()
        UIView.animate(withDuration: 0.6, animations:{self.vwOption.frame = CGRect(x: self.vwOption.frame.origin.x, y: (self.vwOption.frame.origin.y-self.vwOption.bounds.size.height), width: self.vwOption.bounds.size.width, height: self.vwOption.bounds.size.height)}, completion: { (bool) in
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
    
    
    @IBAction func btnAdd(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnMon(_ sender: Any) {
        if(btnMon.backgroundColor == getGrayColor() ){
            btnMon.backgroundColor = getGreenColor()
            btnMon.setTitleColor(UIColor.white, for: .normal)
        }else{
        
            btnMon.backgroundColor = getGrayColor()
            btnMon.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnTue(_ sender: Any) {
        if(btnTue.backgroundColor == getGrayColor() ){
            btnTue.backgroundColor = getGreenColor()
            btnTue.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnTue.backgroundColor = getGrayColor()
            btnTue.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnWed(_ sender: Any) {
        if(btnWed.backgroundColor == getGrayColor() ){
            btnWed.backgroundColor = getGreenColor()
            btnWed.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnWed.backgroundColor = getGrayColor()
            btnWed.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnThur(_ sender: Any) {
        if(btnThur.backgroundColor == getGrayColor() ){
            btnThur.backgroundColor = getGreenColor()
            btnThur.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnThur.backgroundColor = getGrayColor()
            btnThur.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnFri(_ sender: Any) {
        if(btnFri.backgroundColor == getGrayColor() ){
            btnFri.backgroundColor = getGreenColor()
            btnFri.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnFri.backgroundColor = getGrayColor()
            btnFri.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnSat(_ sender: Any) {
        if(btnSat.backgroundColor == getGrayColor() ){
            btnSat.backgroundColor = getGreenColor()
            btnSat.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSat.backgroundColor = getGrayColor()
            btnSat.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btnSun(_ sender: Any) {
        if(btnSun.backgroundColor == getGrayColor() ){
            btnSun.backgroundColor = getGreenColor()
            btnSun.setTitleColor(UIColor.white, for: .normal)
        }else{
            
            btnSun.backgroundColor = getGrayColor()
            btnSun.setTitleColor(UIColor(red: 108/255, green: 108/255, blue: 108/255, alpha: 1), for: .normal)
        }
    }
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        if(self.tempButton.tag == 0){
            count = time.count
        }else{
            count = food.count
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var data = ""
        if(self.tempButton.tag == 0){
            data = time[row]
        }else{
            data = food[row]
        }
        return data
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var data = ""
        if(self.tempButton.tag == 0){
            data = time[row]
        }else{
            data = food[row]
        }
        self.selectedData = data
        self.changeData(button: self.tempButton)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func changeData(button:UIButton){
        button.setTitle(self.selectedData, for: .normal)
    }
    
    func closePickerView(){
        UIView.animate(withDuration: 0.6, animations:{self.vwOption.frame = CGRect(x: self.vwOption.frame.origin.x, y: (self.vwOption.frame.origin.y+self.vwOption.bounds.size.height), width: self.vwOption.bounds.size.width, height: self.vwOption.bounds.size.height)}, completion: { (bool) in
        })

    }
}