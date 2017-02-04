//
//  BookingEditVC.swift
//  AssistCare
//
//  Created by Developer49 on 1/28/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class BookingEditVC: UIViewController {
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var vwUser: UIView!
    @IBOutlet var vwDays: UIView!

    @IBOutlet var btnDays: [UIButton]!
    @IBOutlet var vwBottom: UIView!
    @IBOutlet var scrollViewEditBooking: UIScrollView!
    
    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var swBook: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func bookingChanged(_ sender: Any) {
        if swBook.isOn{
            vwDays.isHidden = false
            vwBottom.frame = CGRect(x: 0, y: 240, width: vwBottom.frame.size.width, height: vwBottom.frame.size.height)
            scrollViewEditBooking.contentSize = CGSize(width:UIScreen.main.bounds.size.width, height: 400)

        }else if !(swBook.isOn){
            vwDays.isHidden = true
            vwBottom.frame = CGRect(x: 0, y: 180, width: vwBottom.frame.size.width, height: vwBottom.frame.size.height)
            scrollViewEditBooking.contentSize = CGSize(width:UIScreen.main.bounds.size.width, height: 340)

        }
    }
    @IBAction func btnDayClicked(_ sender: UIButton) {
        let tag = sender.tag
        
        if tag == 1{
            print("Monday")
        }else if tag == 2{
            print("Tuesday")
        }else if tag == 3{
            print("Wednesday")
        }else if tag == 4{
            print("Thursday")
        }else if tag == 5{
            print("Friday")
        }else if tag == 6{
            print("Saturday")
        }else if tag == 7{
            print("Sunday")
        }
    }
    override func viewDidLayoutSubviews() {
        scrollViewEditBooking.contentSize = CGSize(width:UIScreen.main.bounds.size.width, height: 400)
        for btn in btnDays{
            btn.layer.cornerRadius = btn.frame.size.width/2
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        vwUser.layer.shadowColor = UIColor.gray.cgColor
        vwUser.layer.shadowOffset = CGSize(width: 3, height: 3)
        vwUser.layer.shadowOpacity = 0.7
    }

    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Book"
        self.tabBarController?.tabBar.isHidden = true
        
        self.automaticallyAdjustsScrollViewInsets = false

    }

    @IBAction func btnChangeCard(_ sender: Any) {
        let paymentCardVc = PaymentCardDetailVC(nibName: "PaymentCardDetailVC", bundle: nil)
        self.navigationController?.pushViewController(paymentCardVc, animated: true)
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnContinue(_ sender: UIButton) {
        let displayVC = NumOfReservationVC(nibName: "NumOfReservationVC", bundle: nil)
        self.navigationController?.pushViewController(displayVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
