//
//  CategoryVC.swift
//  Assist Care On Demand
//
//  Created by developer91 on 1/16/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {

    @IBOutlet var vwPatient: UIView!
    @IBOutlet var vwCareGiver: UIView!
    @IBOutlet var vwButton: UIView!
    @IBOutlet var btnLogIn: UIButton!
    @IBOutlet var btn: UIButton!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnCareGiver: UIButton!
    @IBOutlet var btnPatient: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setInterface(){
        navigationController?.navigationBar.isHidden = true
        btnSignUp.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        btnSignUp.shadow()
        btnLogIn.shadow()
        vwPatient.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        vwCareGiver.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
    }

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
        btnPatient.setTitleColor(UIColor(red: 70/255, green: 188/255, blue: 208/255, alpha: 1), for: .normal)
        btnCareGiver.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
    
    @IBAction func btnCareGiver(_ sender: Any) {
        setUserRole(role: careGiver)
        vwPatient.isHidden = true
        vwCareGiver.isHidden = false
        btnCareGiver.setTitleColor(UIColor(red: 70/255, green: 188/255, blue: 208/255, alpha: 1), for: .normal)
        btnPatient.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
    
    func setUserRole(role: String) {
        let defaults = UserDefaults.standard
        defaults.set(role, forKey: "UserRole")
        defaults.synchronize()
    }
    
}
