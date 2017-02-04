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
    
    @IBOutlet var tblNotification: UITableView!
    @IBOutlet var vwNavigation: UIView!
    @IBOutlet var btnMore: UIButton!
    @IBOutlet var lbNavigation: UILabel!
    @IBOutlet var btnUser: UIButton!
    
    var transperentView = UIView()
    
    //alert click
    @IBAction func btnPopUpNo(_ sender: Any) {
        if (appDelegate().window?.subviews.contains(vwPopup))! {
            vwPopup.removeFromSuperview()
        }
        if (appDelegate().window?.subviews.contains(transperentView))! {
            transperentView.removeFromSuperview()
        }
    }
    
    @IBAction func btnPopUpYes(_ sender: Any) {
        if (appDelegate().window?.subviews.contains(vwPopup))! {
            vwPopup.removeFromSuperview()
        }
        if (appDelegate().window?.subviews.contains(transperentView))! {
            transperentView.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLayoutSubviews() {
        vwPopup.frame = CGRect(x: 20, y: (UIScreen.main.bounds.size.height/2)-100, width: UIScreen.main.bounds.size.width - 40, height: self.vwPopup.frame.height)
        imgPopUp.image = UIImage(named: "userprofile")
        imgPopUp.layer.cornerRadius = imgPopUp.bounds.size.width / 2
        imgPopUp.clipsToBounds = true
        lbPopUpName.text = "Maude Floyd"
        lbPopUpDate.text = "Wednesday,3/28/2016"
        lbPopUpTime.text = "9:00 am - 11:00 am"
        vwPopup.layer.cornerRadius = 5
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.bounds = btnPopUpNO.frame
        shapeLayer1.position = self.btnPopUpNO.center
        shapeLayer1.path = UIBezierPath(roundedRect: self.btnPopUpNO.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        btnPopUpNO.layer.mask = shapeLayer1
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.bounds = btnPopUpYes.frame
        shapeLayer2.position = self.btnPopUpYes.center
        shapeLayer2.path = UIBezierPath(roundedRect: self.btnPopUpYes.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        btnPopUpYes.layer.mask = shapeLayer2
    }
    
    func setInterface(){
        tblNotification.dataSource = self
        tblNotification.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.isHidden = false
        tblNotification.register(UINib(nibName: "CareGiverAgendaCell", bundle: nil), forCellReuseIdentifier: "CareGiverAgendaCell")
        
        vwNavigation.backgroundColor = AppColor.greenColor
        
        lbNavigation.text = "Notification"
        
        transperentView = UIView(frame: UIScreen.main.bounds)
        transperentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CareGiverAgendaCell", for: indexPath) as! CareGiverAgendaCell
        cell.btnMsg.isHidden = true
        cell.lbDate.isHidden = false
        cell.lbDate.text = "02/02/2017"
        cell.lblName.text = "Abc xyz"
        cell.lblTime.text = "detail text here"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CareGiverAgendaCell
        if !(appDelegate().window?.subviews.contains(transperentView))! {
            appDelegate().window?.addSubview(transperentView)
            appDelegate().window?.addSubview(vwPopup)
        }
        
        //let state = cell.lblTime.text
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
    
    
}
