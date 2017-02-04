//
//  CareGiverMessageVC.swift
//  AssistCare
//
//  Created by LaNet on 2/3/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CareGiverMessageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Navigation Bar
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var tblMessages: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMessages.dataSource = self
        tblMessages.delegate = self
        tblMessages.register(UINib(nibName: "CareGiverAgendaCell", bundle: nil), forCellReuseIdentifier: "CareGiverAgendaCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    func setInterface(){
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: TAB_ORANGE_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = false
        lblNavTitle.text = "Messages"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CareGiverAgendaCell", for: indexPath) as! CareGiverAgendaCell
        cell.btnMsg.isHidden = true
        cell.lbDate.isHidden = false
        cell.lbDate.text = "45 min"
        cell.lblName.text = "Abc xyz"
        cell.lblTime.text = "detail text here"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
