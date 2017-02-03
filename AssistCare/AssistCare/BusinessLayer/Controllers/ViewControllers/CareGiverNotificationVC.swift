//
//  CareGiverNotification.swift
//  AssistCare
//
//  Created by developer91 on 2/1/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CareGiverNotificationVC: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet var btnPopUpYes: UIButton!
    @IBOutlet var btnPopUpNO: UIButton!
    @IBOutlet var lbPopUpTime: UILabel!
    @IBOutlet var lbPopUpDate: UILabel!
    @IBOutlet var lbPopUpName: UILabel!
    @IBOutlet var imgPopUp: UIImageView!
    @IBOutlet var vwPopup: UIView!
    @IBOutlet var vwGray: UIView!
    @IBOutlet var tblNotification: UITableView!
    @IBOutlet var vwNavigation: UIView!
    @IBOutlet var btnMore: UIButton!
    @IBOutlet var lbNavigation: UILabel!
    @IBOutlet var btnUser: UIButton!
    
    @IBAction func btnPopUpNo(_ sender: Any) {
        
    }
    
    @IBAction func btnPopUpYes(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func setInterface(){
        tblNotification.dataSource = self
        tblNotification.delegate = self
        tblNotification.register(UINib(nibName: "CareGiverAgendaCell", bundle: nil), forCellReuseIdentifier: "CareGiverAgendaCell")
        vwNavigation.backgroundColor = UIColor(red: 68/255, green: 184/255, blue: 167/255, alpha: 1)
        btnMore.setImage(imageWithImage(#imageLiteral(resourceName: "Gift Card"), scaledToSize: CGSize(width: btnMore.bounds.size.width, height: btnMore.bounds.size.height)), for: .normal)
       
        btnUser.setImage(imageWithImage(#imageLiteral(resourceName: "user"), scaledToSize: CGSize(width: btnUser.bounds.size.width, height: btnUser.bounds.size.height)), for: .normal)
        lbNavigation.text = "Notification"
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        vwGray.addGestureRecognizer(tap)
        imgPopUp.layer.cornerRadius = imgPopUp.bounds.size.width / 2
        imgPopUp.image = UIImage(named: "userprofile")
        lbPopUpName.text = "Maude Floyd"
        lbPopUpDate.text = "Wednesday,3/28/2016"
        lbPopUpTime.text = "9:00 am - 11:00 am"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CareGiverAgendaCell", for: indexPath) as! CareGiverAgendaCell
        cell.btnMsg.isHidden = true
        cell.lbDate.isHidden = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CareGiverAgendaCell
        let state = cell.lblTime.text
        
        self.callViewPopUp()
       
        ////////// Use it after all label set ////////////////////
        
        /* if(state == "Appoinment Accepted"){
           let vc = CareGiverCalenderAppoinmentVC(nibName: "CareGiverCalenderAppoinmentVC", bundle: nil)
            vc.isFlag = true
            self.navigationController?.pushViewController(vc, animated: true)
        }else if(state == "Appoinment Cancelled"){
            self.callViewPopUp()
        }else {
            let vc = CareGiverCalenderAppoinmentVC(nibName: "CareGiverCalenderAppoinmentVC", bundle: nil)
            vc.isFlag = false
            self.navigationController?.pushViewController(vc, animated: true)
        }*/
        
    }
    
    func callViewPopUp(){
        self.vwGray.isHidden = false
        UIView.animate(withDuration: 0.5, animations:{self.vwPopup.alpha = 1.0}, completion: { (bool) in
            
        })
    }
    
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.vwGray.isHidden = true
        UIView.animate(withDuration: 0.5, animations:{self.vwPopup.alpha = 0.0}, completion: { (bool) in
            
        })
    }
}
