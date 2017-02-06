//
//  ReferealVC.swift
//  AssistCare
//
//  Created by LaNet on 1/20/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class ReferealVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var vwStatusBar: UIView!
    @IBOutlet var btnInvite: UIButton!
    @IBOutlet var btnHistory: UIButton!
    @IBOutlet var tabInvite: UIView!
    @IBOutlet var tabHistory: UIView!
    
    @IBOutlet var viewInvite: UIView!
    @IBOutlet var lblInfoInvite: UIView!
    @IBOutlet var lblInfoCode: UIView!
    @IBOutlet var lblReferralCode: UIView!
    @IBOutlet var btnInviteFriends: UIButton!
    
    @IBOutlet var viewHistory: UIView!
    
    @IBOutlet var lblInfoEarn: UILabel!
    @IBOutlet var lblEarnAmount: UILabel!
    @IBOutlet var viewTopEarn: UIView!
    @IBOutlet var tblHistory: UITableView!
   
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBAction func btnHistory(_ sender: UIButton) {
        activeHistory()
    }
    
    @IBAction func btnInvite(_ sender: UIButton) {
        activeInvite()
    }
    
    @IBAction func btnInviteFriends(_ sender: UIButton) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonHistoryCell", for: indexPath) as! PersonHistoryCell
            cell.setInterface()
            cell.lblName.text = "Test abc name"
            cell.lblEmailId.text = "abc@gmail.com"
            cell.lblEarnAmount.text = "$20"
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ManagePaymentCardMethodVC(nibName: "ManagePaymentCardMethodVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }

    func activeHistory() {
        viewInvite.isHidden = true
        tabInvite.isHidden = true
        viewHistory.isHidden = false
        tabHistory.isHidden = false
        btnInvite.setTitleColor(UIColor.gray, for: .normal)
        btnHistory.setTitleColor(AppColor.skyColor, for: .normal)
    }
    
    func activeInvite() {
        viewInvite.isHidden = false
        tabInvite.isHidden = false
        viewHistory.isHidden = true
        tabHistory.isHidden = true
        btnInvite.setTitleColor(AppColor.skyColor, for: .normal)
        btnHistory.setTitleColor(UIColor.gray, for: .normal)
    }
    
    func setShadow(globeButton: UIView, color: UIColor) {
        globeButton.backgroundColor = UIColor(red: 171, green: 178, blue: 186, alpha: 1.0)
        // Shadow and Radius
        globeButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        globeButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        globeButton.layer.shadowOpacity = 1.0
        globeButton.layer.shadowRadius = 0.0
        globeButton.layer.masksToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setInterface(){
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        self.navigationController?.navigationBar.isHidden = true
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
        activeInvite()
        //Register nib
        
        self.tblHistory.register(UINib(nibName: "PersonHistoryCell", bundle: nil), forCellReuseIdentifier: "PersonHistoryCell")
        self.tblHistory.dataSource = self
        self.tblHistory.delegate = self
        self.viewTopEarn.backgroundColor = AppColor.skyColor
        self.lblEarnAmount.textColor = UIColor.white
        self.lblInfoEarn.textColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    //Navigation back
    @IBAction func btnNavBack(_ sender: UIButton) {
        navigationController!.popViewController(animated: false)

    }
 
}
