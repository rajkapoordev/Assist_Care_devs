//
//  CategoryVC.swift
//  Assist Care On Demand
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var vwPatient: UIView!
    @IBOutlet var vwCareGiver: UIView!
    @IBOutlet var vwButton: UIView!
    @IBOutlet var btnLogIn: UIButton!
    @IBOutlet var btn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnCareGiver: UIButton!
    @IBOutlet var btnPatient: UIButton!
    
    @IBAction func btnSignUp(_ sender: Any) {
        let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func btnLogIn(_ sender: Any) {
        let signInVC = SignInVC(nibName: "SignInVC", bundle: nil)
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @IBAction func btnPatient(_ sender: Any) {
        setUserRole(role: patient)
        vwPatient.isHidden = false
        vwCareGiver.isHidden = true
        btnPatient.setTitleColor(AppColor.skyColor, for: .normal)
        btnCareGiver.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
    
    @IBAction func btnCareGiver(_ sender: Any) {
        setUserRole(role: careGiver)
        vwPatient.isHidden = true
        vwCareGiver.isHidden = false
        btnCareGiver.setTitleColor(AppColor.skyColor, for: .normal)
        btnPatient.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserRole(role: patient)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }
    
    func setInterface(){
        navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        btnSignUp.backgroundColor = AppColor.skyColor
        vwCareGiver.backgroundColor = AppColor.skyColor
        vwPatient.backgroundColor = AppColor.skyColor
        btnPatient.setTitleColor(AppColor.skyColor, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setUserRole(role: String) {
        let defaults = UserDefaults.standard
        defaults.set(role, forKey: "UserRole")
        defaults.synchronize()
    }
    
}
