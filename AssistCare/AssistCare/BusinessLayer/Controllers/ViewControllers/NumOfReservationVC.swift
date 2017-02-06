//
//  NumOfReservationVC.swift
//  AssistCare
//
//  Created by developer91 on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class NumOfReservationVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var btnOK: UIButton!
    @IBOutlet var tblReservation: UITableView!
    
    @IBAction func btnOK(_ sender: UIButton) {
        let homeVC = AppointmentVC(nibName: "AppointmentVC", bundle: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
        // Do any additional setup after loading the view.
    }

    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.skyStatusBar
        self.tblReservation.delegate = self
        self.tblReservation.dataSource = self
        self.tabBarController?.tabBar.isHidden = true
        self.tblReservation.estimatedSectionHeaderHeight = 50
        self.tblReservation.register(UINib(nibName: "ReservationCell", bundle: nil), forCellReuseIdentifier: "ReservationCell")
        btnOK.layer.cornerRadius = 2.0
        btnOK.shadow()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath) as! ReservationCell
        cell.viewCell.layer.cornerRadius = 2.0
        cell.lbDay.text = "Tue"
        cell.lbDate.text = "4"
        cell.lbMonth.text = "Mar"
        cell.imgCareGiver.layer.cornerRadius = cell.imgCareGiver.bounds.size.width/2
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 50)
        vw.backgroundColor = UIColor(red: 55/255, green: 186/255, blue: 208/255, alpha: 1)
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        label.font = label.font.withSize(14)
        label.text = "The following reservation has been received:"
        let height = heightForView(text: label.text!, font: label.font, width: ScreenSize.SCREEN_WIDTH)
        label.frame = (frame: CGRect(x: 10, y: 40 - height, width: ScreenSize.SCREEN_WIDTH - 20, height: height))
        label.textAlignment = .justified
        vw.addSubview(label)

        return vw
    }
    
    func tableView( _ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.white
        label.font = label.font.withSize(14)
        label.text = "We will notify you as soon as Anna connonlly has accepted your booking.To update tis or any other bookings you may have,please visit Booking section of the app."
        let height = heightForView(text: label.text!, font: label.font, width: ScreenSize.SCREEN_WIDTH)
        label.frame = (frame: CGRect(x: 10, y: 5, width: ScreenSize.SCREEN_WIDTH - 20, height: height))
        label.textAlignment = .justified
        vw.addSubview(label)
        return vw
    }
    
    func tableView( _ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
}
