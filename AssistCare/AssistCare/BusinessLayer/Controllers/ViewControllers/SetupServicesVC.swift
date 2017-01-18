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
    
    @IBAction func btnAddMedication(_ sender: Any) {
        let vc = MedicationVC(nibName: "MedicationVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        
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
    
    func setInterface(){
        self.view.backgroundColor = getBackgroundColor()
        let backButton = UIBarButtonItem(
            title: "SetUp Services",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );

        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = getFontColor()
        txtInstruction.setBottomBorder()
        txtInstruction.backgroundColor = getBackgroundColor()
        btnContinue.isHidden = false
        btnAddMedication.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "addMedication"), scaledToSize: CGSize(width: btnAddMedication.bounds.size.width, height: btnAddMedication.bounds.size.height)), for: .normal)
        btnContinue.backgroundColor = UIColor(red: 62/255, green: 186/255, blue: 207/255, alpha: 1)
        tblMedication.backgroundColor = getBackgroundColor()
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
