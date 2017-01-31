//
//  SetupServicesVC.swift
//  AssistCare
//
//  Created by developer91 on 1/17/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class SetupServicesVC: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var tblMedication: UITableView!
    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var btnAddMedication: UIButton!
    @IBOutlet var lbSMealPrompt: UILabel!
    @IBOutlet var lbSMedicationPrompt: UILabel!
    @IBOutlet var lbMedicationPrompt: UILabel!
    @IBOutlet var txtInstruction: UITextField!
    @IBOutlet var lbMealPreparation: UILabel!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBAction func btnAddMedication(_ sender: Any) {
        let vc = MedicationVC(nibName: "MedicationVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        let vc = PaymentDetailsVc(nibName: "PaymentDetailsVc", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtInstruction.delegate = self
        tblMedication.delegate = self
        tblMedication.dataSource = self
        tblMedication.register(UINib(nibName: "cellMedication", bundle: nil), forCellReuseIdentifier: "cellMedication")
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
        lblNavTitle.text = "SetUp Services"
        self.view.backgroundColor = getBackgroundColor()
        btnContinue.shadow()
        txtInstruction.setBottomBorder()
        txtInstruction.backgroundColor = getBackgroundColor()
        btnContinue.isHidden = false
        btnAddMedication.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "addMedication"), scaledToSize: CGSize(width: btnAddMedication.bounds.size.width, height: btnAddMedication.bounds.size.height)), for: .normal)
        btnContinue.backgroundColor = UIColor(red: 62/255, green: 186/255, blue: 207/255, alpha: 1)
        btnContinue.layer.cornerRadius = 2.0
        tblMedication.backgroundColor = getBackgroundColor()
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMedication", for: indexPath) as! cellMedication
        cell.lbMedicationName.text = "Medication Name"
        cell.lbMedicationTime.text = "In the morning,after food"
        return cell
    }
    
}
