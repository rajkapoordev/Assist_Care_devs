//
//  FriendsBookedVC.swift
//  AssistCare
//
//  Created by LaNet on 1/25/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class FriendsBookedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var vwMainPopUp: UIView!
    @IBOutlet var lblTopTitle: UILabel!
    @IBOutlet var tblFriends: UITableView!
    @IBOutlet var btnOk: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        self.vwMainPopUp.layer.cornerRadius = 5;
        let transperentView = UIView(frame: UIScreen.main.bounds)
        transperentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.35)
        
        if !self.view.subviews.contains(transperentView) {
            self.view.addSubview(transperentView)
            self.view.addSubview(vwMainPopUp)
            
            vwMainPopUp.layer.shadowColor = UIColor.gray.cgColor
            vwMainPopUp.layer.shadowOpacity = 2
            vwMainPopUp.layer.shadowOffset = CGSize.zero
            vwMainPopUp.layer.shadowRadius = 5
            
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.btnOk.frame
            rectShape.position = self.btnOk.center
            rectShape.path = UIBezierPath(roundedRect: self.btnOk.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
            self.btnOk.layer.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0).cgColor
            self.btnOk.layer.mask = rectShape
        }
        
        tblFriends.register(UINib(nibName: "FriendBookedCell", bundle:nil), forCellReuseIdentifier: "FriendBookedCell")
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.tableFooterView = UIView()
        self.tblFriends.separatorStyle = .none
    }
    
    @IBAction func btnOk(_ sender: UIButton) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendBookedCell", for: indexPath) as! FriendBookedCell
        cell.imgFriend.backgroundColor = UIColor.blue
        cell.setCellInterface()
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let managePaymentVC = ManagePaymentCardMethodVC(nibName: "ManagePaymentCardMethodVC", bundle: nil)
        self.navigationController?.pushViewController(managePaymentVC, animated: true)
    }
    
}
