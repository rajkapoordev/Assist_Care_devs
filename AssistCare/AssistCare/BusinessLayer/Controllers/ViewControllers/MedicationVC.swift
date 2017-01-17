//
//  MedicationVC.swift
//  AssistCare
//
//  Created by developer91 on 1/17/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit


class MedicationVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

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
    let time = ["Morning","Afternoon","Night"]
    let food = ["with Meal","With Breakfast","Before Meal","After Breakfast"]
    
    @IBAction func btnTime(_ sender: Any) {
        UIView.animate(withDuration: 0.8, animations:{self.vwOption.frame = CGRect(x: self.vwOption.frame.origin.x, y: (self.vwOption.frame.origin.y-self.vwOption.bounds.size.height), width: self.vwOption.bounds.size.width, height: self.vwOption.bounds.size.height)}, completion: { (bool) in
        })
    }

    
    @IBAction func btnFood(_ sender: Any) {
        UIView.animate(withDuration: 0.8, animations:{self.vwOption.frame = CGRect(x: self.vwOption.frame.origin.x, y: (self.vwOption.frame.origin.y-self.vwOption.bounds.size.height), width: self.vwOption.bounds.size.width, height: self.vwOption.bounds.size.height)}, completion: { (bool) in
        })
    }
    
    @IBAction func btnDone(_ sender: Any) {
        UIView.animate(withDuration: 0.8, animations:{self.vwOption.frame = CGRect(x: self.vwOption.frame.origin.x, y: (self.vwOption.frame.origin.y+self.vwOption.bounds.size.height), width: self.vwOption.bounds.size.width, height: self.vwOption.bounds.size.height)}, completion: { (bool) in
        })
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        let backButton = UIBarButtonItem(
            title: "Medication",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = getFontColor()
        txtMedicationName.setBottomBorder()
        btnMon.layer.cornerRadius = btnMon.bounds.size.width/2
        btnTue.layer.cornerRadius = btnTue.bounds.size.width/2
        btnWed.layer.cornerRadius = btnWed.bounds.size.width/2
        btnThur.layer.cornerRadius = btnThur.bounds.size.width/2
        btnFri.layer.cornerRadius = btnFri.bounds.size.width/2
        btnSat.layer.cornerRadius = btnSat.bounds.size.width/2
        btnSun.layer.cornerRadius = btnSun.bounds.size.width/2
        btnFood.setTitle(food[0], for: .normal)
        btnTime.setTitle(time[0], for: .normal)
        view.backgroundColor = getBackgroundColor()
        txtMedicationName.backgroundColor = getBackgroundColor()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return food.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return food[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}
