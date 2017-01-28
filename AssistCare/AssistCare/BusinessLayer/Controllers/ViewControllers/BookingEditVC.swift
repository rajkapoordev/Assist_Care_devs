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

    @IBOutlet var vwBottom: UIView!
    @IBOutlet var scrollViewEditBooking: UIScrollView!
    
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
    override func viewDidLayoutSubviews() {
        scrollViewEditBooking.contentSize = CGSize(width:UIScreen.main.bounds.size.width, height: 400)
    }

    override func viewDidAppear(_ animated: Bool) {
        vwUser.layer.shadowColor = UIColor.gray.cgColor
        vwUser.layer.shadowOffset = CGSize(width: 3, height: 3)
        vwUser.layer.shadowOpacity = 0.7
    }

    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = appUIColorFromRGB(rgbValue: RED_COLOR, alpha: 1.0)
        lblNavTitle.textColor = UIColor.white
        lblNavTitle.text = "Book"
        
        self.automaticallyAdjustsScrollViewInsets = false

    }

    @IBAction func btnBackClicked(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
