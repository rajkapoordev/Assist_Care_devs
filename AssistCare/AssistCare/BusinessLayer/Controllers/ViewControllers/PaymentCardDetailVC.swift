//
//  PaymentDetailVC.swift
//  AssistCare
//
//  Created by LaNet on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PaymentCardDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblPaymentCardDetail: UITableView!
    
    @IBOutlet var vwStatusBar: UIView!
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    @IBOutlet var btnNavaddNewCard: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setInterface() {
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
        self.view.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1.0)
        //register nib
        tblPaymentCardDetail.register(UINib(nibName: "PaymentCardDetailCell", bundle:nil), forCellReuseIdentifier: "PaymentCardDetailCell")
        tblPaymentCardDetail.dataSource = self
        tblPaymentCardDetail.delegate = self
        tblPaymentCardDetail.tableFooterView = UIView()
        self.tblPaymentCardDetail.separatorStyle = .none
        tblPaymentCardDetail.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1.0)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCardDetailCell", for: indexPath) as! PaymentCardDetailCell
        cell.vwBottomBorder.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1.0)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let managePaymentVC = ManagePaymentCardMethodVC(nibName: "ManagePaymentCardMethodVC", bundle: nil)
//        self.navigationController?.pushViewController(managePaymentVC, animated: true)
        let cell = tblPaymentCardDetail.cellForRow(at: indexPath) as! PaymentCardDetailCell
        cell.imgSelected.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tblPaymentCardDetail.cellForRow(at: indexPath) as! PaymentCardDetailCell
        cell.imgSelected.isHidden = true
    }
    
    func addNewPaymentDetail() {
        let managePaymentVC = ManagePaymentCardMethodVC(nibName: "ManagePaymentCardMethodVC", bundle: nil)
        self.navigationController?.pushViewController(managePaymentVC, animated: true)
    }
    
    
    @IBAction func btnNavAddNewCard(_ sender: UIButton) {
        let managePaymentVC = ManagePaymentCardMethodVC(nibName: "ManagePaymentCardMethodVC", bundle: nil)
        self.navigationController?.pushViewController(managePaymentVC, animated: true)
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
       navigationController!.popViewController(animated: false)
    }
    
}
