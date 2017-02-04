//
//  BookingVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class BookingVC: UIViewController {

    @IBOutlet var btnBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var scrollViewBooking: UIScrollView!
    @IBOutlet var btnAllRecurring: UIButton!
    @IBOutlet var btnJustOne: UIButton!

    @IBOutlet var vwPopUp: UIView!
    @IBOutlet var btnCancelAppointments: UIButton!
    @IBOutlet var collectionViewBooking: UICollectionView!
    
    var transperentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        scrollViewBooking.contentSize = CGSize(width:UIScreen.main.bounds.size.width, height: 630 + self.collectionViewBooking.bounds.size.height)
        
        vwPopUp.frame = CGRect(x: 20, y: (UIScreen.main.bounds.size.height/2)-100, width: UIScreen.main.bounds.size.width - 40, height: 200)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.btnCancelAppointments.shadowWithBorder()
        vwPopUp.layer.cornerRadius = 7
        btnJustOne.roundedBottomRightButton()
        btnAllRecurring.roundedBottomLeftButton()

    }
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Booking"
        self.tabBarController?.tabBar.isHidden = true
        
        self.automaticallyAdjustsScrollViewInsets = false
    }

    @IBAction func btnAllRecurringClicked(_ sender: Any) {
        if self.view.subviews.contains(vwPopUp){
            vwPopUp.removeFromSuperview()
        }
        if self.view.subviews.contains(transperentView){
            transperentView.removeFromSuperview()
        }
    }
    @IBAction func btnJustOneClicked(_ sender: Any) {
        if self.view.subviews.contains(vwPopUp){
            vwPopUp.removeFromSuperview()
        }
        if self.view.subviews.contains(transperentView){
            transperentView.removeFromSuperview()
        }
    }
    @IBAction func btnCancelAppointmentClicked(_ sender: Any) {
        transperentView = UIView(frame: UIScreen.main.bounds)
        transperentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        
        if !self.view.subviews.contains(transperentView) {
            self.view.addSubview(transperentView)
        }

        view.addSubview(vwPopUp)
    }
    @IBAction func btnBackClicked(_ sender: UIButton) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
