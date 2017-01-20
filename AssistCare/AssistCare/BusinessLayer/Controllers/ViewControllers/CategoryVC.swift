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
    
    @IBAction func btnSignUp(_ sender: Any) {
        let vc = SignUpVC(nibName: "SignUpVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnLogIn(_ sender: Any) {
        
    }
    
    @IBAction func btnPatient(_ sender: Any) {
        vwPatient.isHidden = false
        vwCareGiver.isHidden = true
        btnPatient.setTitleColor(UIColor(red: 70/255, green: 188/255, blue: 208/255, alpha: 1), for: .normal)
        btnCareGiver.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
    
    @IBAction func btnCareGiver(_ sender: Any) {
        vwPatient.isHidden = true
        vwCareGiver.isHidden = false
        btnCareGiver.setTitleColor(UIColor(red: 70/255, green: 188/255, blue: 208/255, alpha: 1), for: .normal)
        btnPatient.setTitleColor(UIColor(red: 109/255, green: 109/255, blue: 109/255, alpha: 1), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInterface()
    }

    func setInterface(){
        navigationController?.navigationBar.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
