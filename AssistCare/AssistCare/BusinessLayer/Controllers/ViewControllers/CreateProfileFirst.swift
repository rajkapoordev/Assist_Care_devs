//
//  CreateProfileFirst.swift
//  AssistCare
//
//  Created by LaNet on 1/19/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CreateProfileFirst: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    @IBOutlet var vWPicker: UIView!
    @IBOutlet var pickerView: UIPickerView!
    let education = ["Deploma","Engineering","MCA"]
    var isOpened:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func selectEducation(_ sender: Any) {
        
        if(isOpened == false){
            
            pickerView.reloadAllComponents()
            UIView.animate(withDuration: 0.6, animations:{self.vWPicker.frame = CGRect(x: self.vWPicker.frame.origin.x, y: (self.vWPicker.frame.origin.y-self.vWPicker.bounds.size.height), width: self.vWPicker.bounds.size.width, height: self.vWPicker.bounds.size.height)}, completion: { (bool) in
                self.isOpened = true
            })
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
        var data = ""
        data = education[row]
        
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
